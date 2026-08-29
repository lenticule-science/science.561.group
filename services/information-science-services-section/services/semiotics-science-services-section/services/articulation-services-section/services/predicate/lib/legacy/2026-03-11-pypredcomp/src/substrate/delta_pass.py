"""Δ-pass — bilattice settlement under the Δ-nucleus.

Per ``specs/kernel/sigma-delta-passes.md`` §3.Δ and
``specs/kernel/stratified-facts.md`` §2:

* The σ-pass (in :mod:`substrate.closure_engine`) fires closure rules to a
  saturation fixed point and emits cells at stratum ``"saturated"``.
* The Δ-pass (this module) takes the post-σ fiber predicates plus the set
  of cells whose value moved this respond round, runs per-cell bilattice
  stabilization (:func:`stabilize_value`), and returns the list of cells
  whose stabilized value differs from their post-σ value. Those cells are
  emitted at stratum ``"settled"`` by ``respond.py``'s Phase 3.

Two engineering invariants this module enforces:

1. **Bounded settlement** — per-cell stabilization completes in at most
   ``delta_fuel`` substeps. The four-valued bilattice's bounded property
   guarantees this; non-convergence surfaces ``PCR_BILATTICE_DIVERGED``.
2. **Wavefront ordering** — the Δ-pass worklist is a priority queue keyed
   by *wavefront ordinal*: the structural transitive-closure distance
   (in closure-rule premise→conclusion hops) from the cells whose value
   moved during σ-pass. Ties break lexicographically over the predicate
   slug. This is the predicated-computing wavefront's locality property
   surfaced as a runtime ordering, per
   ``library/.../predicated-computing/concepts/wavefront.md``.

The per-cell stabilization is implemented as :func:`substrate.algebra.post_close`
— the four-valued bilattice's closure operator under ``⊙`` (lifts ``None``
to ``Both``; identity on settled values). Per
``specs/kernel/closure-engine-internals.md`` §3.5 + §3.Δ, the operator is
"iterate ⊙ then ⇒ on the cell's value to a fixed point"; ``post_close``
is the bilattice's self-stabilization closure under that scheme and
converges in one substep on every value (None→Both; others fixed).
"""

from __future__ import annotations

from typing import Iterable

from pydantic import BaseModel, ConfigDict, Field

from substrate.algebra import (
    BilatticeValue,
    knowledge_leq,
    post_close,
)
from substrate.closure_engine import RuleRecord
from substrate.error_codes import (
    PCC_MONOTONICITY_FAIL,
    PCR_BILATTICE_DIVERGED,
    SubstrateError,
)


DELTA_FUEL: int = 4
"""Per-cell substep budget. Per ``sigma-delta-passes.md`` §3.Δ step 4:
the four-valued bilattice's bounded settlement property converges in
≤ 2 substeps; doubled for headroom."""


# ---------------------------------------------------------------------------
# Records
# ---------------------------------------------------------------------------


class DeltaEmit(BaseModel):
    """Δ-pass settlement that produced a new ``"settled"`` cell.

    One per predicate whose stabilized value differs from its post-σ
    value. Carries the bookkeeping the cell-emitter needs to build the
    cell atom (witness chain + via tag) and the bookkeeping the
    repair log needs to record the stabilization (predicate +
    pre/post values + wavefront ordinal + substep count).
    """

    model_config = ConfigDict(extra="forbid")
    kind: str = Field(default="delta_emit")
    predicate: str
    pre_value: str
    post_value: str
    via: str
    """One of ``"⊙-stabilize"`` or ``"⇒-stabilize"`` per
    ``stratified-facts.md`` §4."""
    substeps: int
    wavefront_ordinal: int


class DeltaNoMovement(BaseModel):
    """Δ-pass examined a cell and found it already at fixed point.

    No ``"settled"`` cell is emitted; this record is purely for the
    repair log's chronological discipline (per ``sigma-delta-passes.md``
    §5: ``PCR_DELTA_NO_MOVEMENT``).
    """

    model_config = ConfigDict(extra="forbid")
    kind: str = Field(default="delta_no_movement")
    predicate: str
    value: str
    wavefront_ordinal: int


class DeltaResult(BaseModel):
    """Aggregate of one Δ-pass invocation.

    ``entries`` is a chronological list of per-cell outcomes — one
    :class:`DeltaEmit` or :class:`DeltaNoMovement` per worklist visit,
    in worklist order ``(wavefront ordinal, predicate slug)``. Per
    ``sigma-delta-passes.md`` §5: repair-log entries appear in
    chronological order so log readers can reconstruct the actual
    Δ-pass execution sequence.

    Convenience accessors :attr:`emissions` and :attr:`no_movement`
    project the chronological list to typed sub-views without losing
    ordering: ``[e for e in entries if e.kind == ...]``.
    """

    model_config = ConfigDict(extra="forbid")
    entries: list[DeltaEmit | DeltaNoMovement] = Field(default_factory=list)
    final_predicates: dict[str, BilatticeValue]

    @property
    def emissions(self) -> list[DeltaEmit]:
        """Δ-stabilizations that produced settled cells, worklist-ordered."""
        return [e for e in self.entries if isinstance(e, DeltaEmit)]

    @property
    def no_movement(self) -> list[DeltaNoMovement]:
        """Δ-pass cells already at fixed point, worklist-ordered."""
        return [e for e in self.entries if isinstance(e, DeltaNoMovement)]


# ---------------------------------------------------------------------------
# Per-cell stabilization
# ---------------------------------------------------------------------------


def stabilize_value(
    v: BilatticeValue,
    *,
    delta_fuel: int = DELTA_FUEL,
) -> tuple[BilatticeValue, int, str]:
    """Iterate the bilattice closure operator on ``v`` to a fixed point.

    Returns ``(final_value, substeps_used, via_tag)``.

    The four-valued Belnap 2⊗2 bilattice's bounded-settlement property
    guarantees convergence within :data:`DELTA_FUEL` substeps; on this
    bilattice the closure operator is :func:`substrate.algebra.post_close`
    (idempotent in 1 substep: ``NONE → BOTH``; identity on settled
    values). The ``via`` tag is ``"⊙-stabilize"`` whenever the operator
    moved the value; on a no-movement step the tag is also
    ``"⊙-stabilize"`` and the caller suppresses emission.

    Raises :class:`SubstrateError` with code
    :data:`substrate.error_codes.PCR_BILATTICE_DIVERGED` if the
    iteration fails to reach a fixed point within ``delta_fuel``.
    """
    if delta_fuel < 1:
        raise SubstrateError(
            PCR_BILATTICE_DIVERGED,
            f"delta_fuel must be >= 1; got {delta_fuel!r}",
            value=v.value,
        )
    cur = v
    for substep in range(1, delta_fuel + 1):
        nxt = post_close(cur)
        if nxt == cur:
            return cur, substep, "⊙-stabilize"
        cur = nxt
    raise SubstrateError(
        PCR_BILATTICE_DIVERGED,
        f"per-cell stabilization exceeded delta_fuel={delta_fuel} "
        f"without reaching a fixed point",
        delta_fuel=delta_fuel,
        last_value=cur.value,
    )


# ---------------------------------------------------------------------------
# Wavefront ordinal computation
# ---------------------------------------------------------------------------


def compute_wavefront_ordinals(
    *,
    rules: Iterable[RuleRecord],
    seed_predicates: Iterable[str],
) -> dict[str, int]:
    """Assign each predicate a wavefront ordinal via BFS through the
    closure-rule premise → conclusion graph from the seed set.

    Per ``library/.../predicated-computing/concepts/wavefront.md``: the
    wavefront's reach is "the structural transitive closure of 'depends
    on a recently-changed cell'." A predicate ``q`` has wavefront
    ordinal ``k`` iff the shortest closure-rule chain from any seed
    predicate ``p`` (with ordinal 0) to ``q`` is ``k`` rule-hops.

    The graph is directed: an edge from each premise predicate to each
    conclusion predicate of every rule. Predicates not reachable from
    any seed are absent from the returned dict; callers should treat
    them as having ordinal ``+∞`` (deprioritize / drop).

    Determinism: BFS layers are processed in lexicographic order.
    """
    # Build adjacency: pred -> set of preds it can directly influence
    # (i.e., for each rule, every premise predicate has an edge to
    # every conclusion predicate of the same rule).
    adj: dict[str, set[str]] = {}
    for rule in rules:
        premises = list(rule.premise.keys())
        conclusions = list(rule.conclusion.keys())
        for p in premises:
            adj.setdefault(p, set()).update(conclusions)

    seeds_sorted = sorted(set(seed_predicates))
    ordinals: dict[str, int] = {p: 0 for p in seeds_sorted}
    frontier = list(seeds_sorted)
    while frontier:
        next_frontier: list[str] = []
        for p in frontier:
            for c in sorted(adj.get(p, ())):
                if c not in ordinals:
                    ordinals[c] = ordinals[p] + 1
                    next_frontier.append(c)
        frontier = sorted(next_frontier)
    return ordinals


# ---------------------------------------------------------------------------
# Δ-pass entry point
# ---------------------------------------------------------------------------


def run_delta_pass(
    *,
    predicates: dict[str, BilatticeValue],
    moved_predicates: Iterable[str],
    rules: Iterable[RuleRecord],
    delta_fuel: int = DELTA_FUEL,
) -> DeltaResult:
    """Run the Δ-pass to its fixed point.

    Per ``sigma-delta-passes.md`` §3.Δ:

    1. Build a worklist of every predicate whose cell value moved this
       respond round (``moved_predicates``). These are the Δ-pass's
       seed cells.
    2. Order the worklist by wavefront ordinal (cells closer to the
       initial movement settle first); ties break lex on predicate
       slug to preserve byte-identity.
    3. For each cell, run :func:`stabilize_value`. If the stabilized
       value differs from the post-σ value, record a :class:`DeltaEmit`
       (which the caller turns into a ``"settled"`` cell atom);
       otherwise record a :class:`DeltaNoMovement`.
    4. Settling-monotonicity is checked per emission: the post-Δ value
       MUST be ≥ the pre-Δ value in the knowledge ordering. Violation
       raises ``PCC_MONOTONICITY_FAIL`` (the bilattice closure operator
       is monotone, so a violation indicates a bug, not a runtime
       condition).

    The returned :attr:`DeltaResult.final_predicates` is the post-Δ
    fiber predicate map (the σ map with Δ-emit values overlaid).
    Predicates not in ``moved_predicates`` are left untouched.
    """
    seed_set = set(moved_predicates)
    ordinals = compute_wavefront_ordinals(rules=rules, seed_predicates=seed_set)

    # Worklist: every predicate reachable from a seed via the closure-rule
    # premise→conclusion graph (i.e. has a finite wavefront ordinal) AND
    # exists in the fiber's current predicate map. Per
    # ``sigma-delta-passes.md`` §3.Δ: "when a Δ-stabilization changes a
    # cell's value, every cell that has a closure-rule path of length k
    # to it gets wavefront ordinal ≤ k." This expands the worklist
    # beyond the seed set so downstream cells (carried over from prior
    # responds at value NONE, for example) are stabilized in true
    # wavefront order rather than skipped. Sort by (wavefront ordinal,
    # predicate slug) for determinism / gate-9 byte-identity.
    worklist = sorted(
        (p for p in ordinals if p in predicates),
        key=lambda p: (ordinals[p], p),
    )

    final: dict[str, BilatticeValue] = dict(predicates)
    entries: list[DeltaEmit | DeltaNoMovement] = []

    for predicate in worklist:
        pre = final[predicate]
        post, substeps, via = stabilize_value(pre, delta_fuel=delta_fuel)
        ordinal = ordinals.get(predicate, 0)
        if post == pre:
            entries.append(
                DeltaNoMovement(
                    predicate=predicate,
                    value=pre.value,
                    wavefront_ordinal=ordinal,
                )
            )
            continue
        # Settling-monotonicity: closure operator must not lower a value.
        if not knowledge_leq(pre, post):
            raise SubstrateError(
                PCC_MONOTONICITY_FAIL,
                f"Δ-stabilization of predicate {predicate!r} would lower "
                f"in knowledge order: {pre.value!r} -> {post.value!r}",
                predicate=predicate,
                pre=pre.value,
                post=post.value,
            )
        entries.append(
            DeltaEmit(
                predicate=predicate,
                pre_value=pre.value,
                post_value=post.value,
                via=via,
                substeps=substeps,
                wavefront_ordinal=ordinal,
            )
        )
        final[predicate] = post

    return DeltaResult(entries=entries, final_predicates=final)
