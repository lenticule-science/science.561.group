"""Lawvere-Laplacian L^1 fixed points on connected graphs over commutative unital quantales.

Computes the unsigned-weighted-meet Lawvere-Laplacian L^1 = δ^0 ∘ (δ^0)^* on a
constant V-sheaf over a connected graph G = (V_G, E_G), where:

- δ^0 is the unsigned-weighted-meet coboundary
    (δ^0 x)(e_{ij}) := x_i ∧_V x_j
- (δ^0)^* is the V-Cat right-adjoint
    ((δ^0)^* y)(v) := /\_V {y(e) : e incident to v}

Result: for any connected graph G with at least one edge, and any commutative
unital quantale V, the fixed-point set Fix(L^1) ⊂ C^1 = V^|E_G| equals the set
of constant edge-cochains, with |Fix(L^1)| = |V|.

The argument is V-uniform — uses only idempotence and antisymmetry of ∧_V.

Note on what this does and does not capture: The unsigned-weighted-meet
operator on undirected edges has no orientation, so independent cycles cannot
be distinguished. The fixed-point set tracks "globally consistent" content
(constants) only, not per-cycle content. For a graph with first Betti number
b_1 ≥ 2, this gives |V| fixed points where classical signed cellular
cohomology gives |V|^{b_1}. The divergence is structural to the unsigned
operator, not a defect.

Self-contained: this module is independent of any other corpus tooling.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import product
from typing import Callable

import pytest


# ---------------------------------------------------------------------------
# Quantale
# ---------------------------------------------------------------------------


INF = float("inf")


@dataclass(frozen=True)
class Quantale:
    """A commutative unital quantale parameterized for finite enumeration."""

    name: str
    bot: float
    top: float
    meet: Callable[[float, float], float]
    join: Callable[[float, float], float]
    sample_points: tuple[float, ...]


BOOLEAN = Quantale(
    name="Boolean",
    bot=0.0,
    top=1.0,
    meet=lambda a, b: min(a, b),
    join=lambda a, b: max(a, b),
    sample_points=(0.0, 1.0),
)


LUKASIEWICZ = Quantale(
    name="Lukasiewicz",
    bot=0.0,
    top=1.0,
    meet=lambda a, b: min(a, b),
    join=lambda a, b: max(a, b),
    sample_points=(0.0, 0.25, 0.5, 0.75, 1.0),
)


LAWVERE = Quantale(
    name="Lawvere",
    bot=INF,
    top=0.0,
    meet=lambda a, b: max(a, b),
    join=lambda a, b: (
        INF if a == INF and b == INF
        else (a if b == INF else (b if a == INF else min(a, b)))
    ),
    sample_points=(0.0, 0.5, 1.0, 2.0, INF),
)


ALL_QUANTALES = (BOOLEAN, LUKASIEWICZ, LAWVERE)


def _round(t: tuple[float, ...], Q: Quantale) -> tuple[float, ...]:
    """Round non-INF entries to 6 digits for set-membership stability."""
    if Q.name == "Boolean":
        return tuple(int(v) for v in t)
    return tuple(INF if v == INF else round(v, 6) for v in t)


# ---------------------------------------------------------------------------
# Lawvere-Laplacian L^1 = δ^0 ∘ (δ^0)^* on connected graphs
# ---------------------------------------------------------------------------


def laplacian_fixed_points(
    verts: tuple[int, ...],
    edges: tuple[tuple[int, int], ...],
    Q: Quantale,
) -> set[tuple[float, ...]]:
    """Compute the L^1 fixed-point set for a constant V-sheaf on graph (verts, edges).

    L^1 = δ^0 ∘ (δ^0)^* where:
      - δ^0(x)(e_{ij}) = x_i ∧_V x_j (unsigned weighted-meet over edge endpoints).
      - (δ^0)^*(y)(v) = ∧_V {y(e) : e incident to v} (V-meet over incident edges).

    Returns the set of edge-cochains y ∈ V^|edges| with L^1(y) = y.
    """
    incidence: dict[int, list[int]] = {v: [] for v in verts}
    for ei, (i, j) in enumerate(edges):
        incidence[i].append(ei)
        incidence[j].append(ei)

    def cobnd(x: tuple[float, ...]) -> tuple[float, ...]:
        return tuple(Q.meet(x[i], x[j]) for (i, j) in edges)

    def vcat_radj(y: tuple[float, ...]) -> tuple[float, ...]:
        out = []
        for v in verts:
            r = Q.top
            for ei in incidence[v]:
                r = Q.meet(r, y[ei])
            out.append(r)
        return tuple(out)

    fix: set[tuple[float, ...]] = set()
    for y in product(Q.sample_points, repeat=len(edges)):
        ly = _round(cobnd(vcat_radj(y)), Q)
        y_round = _round(y, Q)
        if ly == y_round:
            fix.add(y_round)
    return fix


def first_betti_number(verts: tuple[int, ...], edges: tuple[tuple[int, int], ...]) -> int:
    """First Betti number of the connected graph (assumes connectedness)."""
    return len(edges) - len(verts) + 1


# ---------------------------------------------------------------------------
# Tests (pytest-discoverable)
# ---------------------------------------------------------------------------


CANONICAL_GRAPHS: tuple[tuple[str, tuple[int, ...], tuple[tuple[int, int], ...], int], ...] = (
    ("3-cycle", (0, 1, 2), ((0, 1), (1, 2), (0, 2)), 1),
    ("4-cycle", (0, 1, 2, 3), ((0, 1), (1, 2), (2, 3), (0, 3)), 1),
    ("theta-like", (0, 1, 2, 3), ((0, 1), (1, 2), (0, 2), (0, 3), (1, 3)), 2),
    ("bow-tie", (0, 1, 2, 3, 4), ((0, 1), (1, 2), (0, 2), (2, 3), (3, 4), (2, 4)), 2),
    ("K_4", (0, 1, 2, 3), ((0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)), 3),
)


def test_constants_are_fixed_points() -> None:
    """For any connected graph and any V, every constant cochain is a fixed point."""
    for name, verts, edges, _b1 in CANONICAL_GRAPHS:
        for Q in ALL_QUANTALES:
            fix = laplacian_fixed_points(verts, edges, Q)
            for c in Q.sample_points:
                constant = _round((c,) * len(edges), Q)
                assert constant in fix, (
                    f"{name} on {Q.name}: constant cochain {constant} should be in Fix(L^1)"
                )


def test_fixed_points_are_exactly_constants() -> None:
    """For any connected graph and any V, |Fix(L^1)| = |V|.

    Equivalently, the only fixed points are the constant cochains.
    """
    for name, verts, edges, b1 in CANONICAL_GRAPHS:
        for Q in ALL_QUANTALES:
            fix = laplacian_fixed_points(verts, edges, Q)
            n_v = len(Q.sample_points)
            assert len(fix) == n_v, (
                f"{name} (b_1={b1}) on {Q.name}: expected |Fix|={n_v}, got {len(fix)}"
            )


def test_classical_match_only_at_b1_one() -> None:
    """|Fix(L^1)| matches classical |V|^{b_1} iff b_1 ≤ 1.

    For b_1 = 0 (tree): classical is rank 0; Fix gives |V|.
    For b_1 = 1 (single cycle): both give |V|.
    For b_1 ≥ 2: classical gives |V|^{b_1}; Fix gives |V|.
    """
    for name, verts, edges, b1 in CANONICAL_GRAPHS:
        for Q in ALL_QUANTALES:
            fix = laplacian_fixed_points(verts, edges, Q)
            n_v = len(Q.sample_points)
            classical = n_v ** b1
            if b1 == 1:
                assert len(fix) == classical, (
                    f"{name} on {Q.name}: b_1=1 case should have Fix matching classical"
                )
            elif b1 >= 2:
                assert len(fix) != classical, (
                    f"{name} on {Q.name}: b_1=2 case should have Fix < classical, "
                    f"got |Fix|={len(fix)} = classical={classical}"
                )


@pytest.mark.parametrize("name,verts,edges,b1", CANONICAL_GRAPHS)
def test_per_graph_quantitative(name, verts, edges, b1) -> None:
    """Quantitative report per graph and quantale."""
    print()
    print(f"{name} (|V|={len(verts)}, |E|={len(edges)}, b_1={b1}):")
    for Q in ALL_QUANTALES:
        fix = laplacian_fixed_points(verts, edges, Q)
        n_v = len(Q.sample_points)
        classical = n_v ** b1
        match = "match" if len(fix) == classical else f"≠ classical={classical}"
        print(f"  {Q.name:<12}  |Fix|={len(fix):>3}  |V|={n_v}  {match}")


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
