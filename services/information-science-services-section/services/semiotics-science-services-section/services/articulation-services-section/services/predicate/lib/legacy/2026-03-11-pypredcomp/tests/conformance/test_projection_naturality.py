"""Per-stratum projection naturality square — the §1 algebraic gate.

Per ``specs/kernel/projection-naturality.md`` §1 the substrate must
honour the naturality square

    π_s ∘ μ  =  μ ∘ π_s

where ``μ`` is the append-merge of two cell-histories
(``concatenate, sort by (ord, id), knowledge-join values per
predicate``) and ``π_s`` is :func:`project_stratum` (or
:func:`project_stratum_at_or_below`).

Existing fixtures in ``test_stratum_e3.py`` cover §3 gates 1 (post-
respond materialisation) and 2 (discard+rebuild byte-identity). They
do not assert the naturality square directly. This file does — three
focused tests, one per stratum, plus the cumulative variant and the
empty-history identity.

Authoring the test at the cell-history layer (raw :class:`Cell` lists,
:func:`project_stratum`) rather than at the respond/storage layer
keeps the algebraic claim visible: the square is a property of
``sorted-merge ∘ filter`` and the commutative-associative knowledge-
join, independent of whichever respond round produced the cells.
"""

from __future__ import annotations

from substrate.algebra import BilatticeValue, knowledge_join
from substrate.projection import (
    PROJECTED_STRATA,
    project_stratum,
    project_stratum_at_or_below,
)
from storage.cell import Cell


# -----------------------------------------------------------------------------
# Helpers — the merge operator μ on cell histories
# -----------------------------------------------------------------------------


def _merge(h1: list[Cell], h2: list[Cell]) -> list[Cell]:
    """``μ(H₁, H₂) = sort(H₁ ++ H₂, by=(ord, id))``.

    This is the merge operator used inside
    :func:`substrate.projection._collect_history_cells` — the spec's
    ``μ`` is exactly this concatenate-then-sort over the cell layer.
    """
    out = list(h1) + list(h2)
    out.sort(key=lambda c: (c.ord, c.id or ""))
    return out


def _h1() -> list[Cell]:
    """Two-cell history covering the asserted and saturated strata."""
    return [
        Cell(
            s="x", p="ready", o="x",
            v=BilatticeValue.TRUE, ord=0, stratum="asserted",
        ).with_id(),
        Cell(
            s="x", p="finished", o="x",
            v=BilatticeValue.TRUE, ord=1, stratum="saturated",
            derived_from=["a" * 64], derived_via="rule:r1",
        ).with_id(),
    ]


def _h2() -> list[Cell]:
    """Two-cell history covering the saturated and settled strata,
    deliberately interleaved with ``_h1`` in (ord, id) order."""
    return [
        Cell(
            s="x", p="finished", o="x",
            v=BilatticeValue.FALSE, ord=2, stratum="saturated",
            derived_from=["b" * 64], derived_via="rule:r2",
        ).with_id(),
        Cell(
            s="x", p="state", o="x",
            v=BilatticeValue.TRUE, ord=3, stratum="settled",
            derived_from=["c" * 64], derived_via="\u2299-stabilize",
        ).with_id(),
    ]


# -----------------------------------------------------------------------------
# Naturality square — exact-match project_stratum
# -----------------------------------------------------------------------------


def test_naturality_square_exact_match_per_stratum():
    """``π_s(μ(H₁, H₂)) = μ(π_s(H₁), π_s(H₂))`` for every named
    stratum, asserted at the snapshot-id level (id is SHA-256 of the
    canonical bytes, so id-equality is byte-equality)."""
    h1, h2 = _h1(), _h2()
    for s in PROJECTED_STRATA:
        # LHS: project after merge.
        lhs = project_stratum(cells=_merge(h1, h2), entity_slug="x", stratum=s)
        # RHS: project each side, merge the projections.
        rhs_cells = _merge(
            project_stratum(cells=h1, entity_slug="x", stratum=s).cells,
            project_stratum(cells=h2, entity_slug="x", stratum=s).cells,
        )
        rhs = project_stratum(cells=rhs_cells, entity_slug="x", stratum=s)
        assert lhs.id == rhs.id, (
            f"naturality square broken at stratum={s!r}: "
            f"π∘μ.id={lhs.id} ≠ μ∘π.id={rhs.id}"
        )
        assert lhs.cells == rhs.cells, (
            f"cell list disagreement at stratum={s!r}"
        )
        assert lhs.predicates == rhs.predicates, (
            f"predicates dict disagreement at stratum={s!r}"
        )


def test_naturality_square_predicates_are_knowledge_join():
    """The naturality square's predicates equation reduces to the
    knowledge-join of values across both histories at the chosen
    stratum. Pin that the saturated projection of μ(H₁, H₂) joins
    ``finished=True`` (from H₁) with ``finished=False`` (from H₂)
    to ``finished=Both``."""
    merged = _merge(_h1(), _h2())
    sat = project_stratum(cells=merged, entity_slug="x", stratum="saturated")
    # H₁ contributes True; H₂ contributes False; ⊙(True, False) = Both.
    expected = knowledge_join(BilatticeValue.TRUE, BilatticeValue.FALSE)
    assert sat.predicates["finished"] == expected
    assert sat.predicates["finished"] == BilatticeValue.BOTH


# -----------------------------------------------------------------------------
# Naturality square — cumulative project_stratum_at_or_below
# -----------------------------------------------------------------------------


def test_naturality_square_cumulative_per_stratum():
    """The square also commutes for the cumulative operator (per
    ``projection-naturality.md`` §1: monotone visibility filter is
    set-membership on stratum, which is monotone over ``μ``)."""
    h1, h2 = _h1(), _h2()
    for s in PROJECTED_STRATA:
        lhs = project_stratum_at_or_below(
            cells=_merge(h1, h2), entity_slug="x", stratum=s,
        )
        rhs_cells = _merge(
            project_stratum_at_or_below(cells=h1, entity_slug="x", stratum=s).cells,
            project_stratum_at_or_below(cells=h2, entity_slug="x", stratum=s).cells,
        )
        rhs = project_stratum_at_or_below(cells=rhs_cells, entity_slug="x", stratum=s)
        assert lhs.id == rhs.id, (
            f"cumulative naturality square broken at stratum={s!r}"
        )


# -----------------------------------------------------------------------------
# Identity edges of the square (degenerate cases)
# -----------------------------------------------------------------------------


def test_naturality_identity_on_empty_left():
    """``μ(∅, H) = H`` and ``π_s(∅) = ∅``, so the square reduces to
    ``π_s(H) = μ(∅, π_s(H)) = π_s(H)``. Verifies the identity edge."""
    h2 = _h2()
    for s in PROJECTED_STRATA:
        lhs = project_stratum(cells=_merge([], h2), entity_slug="x", stratum=s)
        rhs = project_stratum(cells=h2, entity_slug="x", stratum=s)
        assert lhs.id == rhs.id


def test_naturality_identity_on_empty_right():
    """Symmetric: ``μ(H, ∅) = H``."""
    h1 = _h1()
    for s in PROJECTED_STRATA:
        lhs = project_stratum(cells=_merge(h1, []), entity_slug="x", stratum=s)
        rhs = project_stratum(cells=h1, entity_slug="x", stratum=s)
        assert lhs.id == rhs.id


def test_naturality_both_empty_yields_trivial_projection():
    """``μ(∅, ∅) = ∅`` and ``π_s(∅) = ∅`` for every stratum."""
    for s in PROJECTED_STRATA:
        snap = project_stratum(cells=_merge([], []), entity_slug="x", stratum=s)
        assert snap.cells == []
        assert snap.predicates == {}


# -----------------------------------------------------------------------------
# Composition / order independence (per the §1 commuting square)
# -----------------------------------------------------------------------------


def test_merge_is_commutative_under_projection():
    """``μ`` is concatenate-then-sort, so ``μ(H₁, H₂) = μ(H₂, H₁)``
    and the projections are byte-identical."""
    h1, h2 = _h1(), _h2()
    for s in PROJECTED_STRATA:
        a = project_stratum(cells=_merge(h1, h2), entity_slug="x", stratum=s)
        b = project_stratum(cells=_merge(h2, h1), entity_slug="x", stratum=s)
        assert a.id == b.id
