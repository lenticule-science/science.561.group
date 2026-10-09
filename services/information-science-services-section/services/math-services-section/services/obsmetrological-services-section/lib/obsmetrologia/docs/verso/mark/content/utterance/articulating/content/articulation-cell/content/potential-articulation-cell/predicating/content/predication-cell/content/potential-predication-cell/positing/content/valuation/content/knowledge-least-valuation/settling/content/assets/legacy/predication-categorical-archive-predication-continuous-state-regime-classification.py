"""Verification module for `theorems/continuous-state-regime-classification.md`.

The theorem extends the four-regime dichotomy to continuous-state settings.
For Lawvere-quantale-enriched data ([0, ∞]-valued), the strict regime claim is
κ ≤ n-1 (Bellman-Ford bound) for shortest-path-style settlings.

Migrated from `tools/lawvere-quantale-settling/compute.py`.
"""

from __future__ import annotations

import math

from ..link import verifies


INF = math.inf


def _bellman_ford_step(
    v: dict[tuple[int, int], float], n: int, edges: list[tuple[int, int, float]]
) -> dict[tuple[int, int], float]:
    """One step of Lawvere-quantale settling (shortest-path relaxation)."""
    new_v = dict(v)
    for s, o, w in edges:
        for q in range(n):
            new_path = v[(s, s)] + w  # placeholder; the actual relaxation is below
        # Min-plus relaxation: v(s, o) = min(v(s, o), v(s, k) + v(k, o)) for all k
    # Cleaner: just do the min-plus closure step
    new_v = {}
    for s in range(n):
        for o in range(n):
            best = v[(s, o)]
            for k in range(n):
                candidate = v[(s, k)] + v[(k, o)]
                if candidate < best:
                    best = candidate
            new_v[(s, o)] = best
    return new_v


def _make_initial(n: int, edges: list[tuple[int, int, float]]) -> dict[tuple[int, int], float]:
    v = {}
    for s in range(n):
        for o in range(n):
            v[(s, o)] = 0.0 if s == o else INF
    for s, o, w in edges:
        v[(s, o)] = min(v[(s, o)], w)
    return v


@verifies(
    "theorems/continuous-state-regime-classification.md",
    claim="Lawvere-quantale shortest-path settling on a 4-node graph stabilizes in κ ≤ n-1 = 3 steps (Bellman-Ford bound)",
)
def test_lawvere_quantale_bellman_ford_bound() -> None:
    """4-node directed graph with positive edge weights. The min-plus closure
    should stabilize within n-1 = 3 iterations."""
    n = 4
    edges = [
        (0, 1, 1.0),
        (1, 2, 2.0),
        (2, 3, 1.0),
        (0, 3, 10.0),  # alternative direct edge, longer than 0→1→2→3 = 4
    ]
    v = _make_initial(n, edges)
    kappa = 0
    for k in range(10):
        v_new = _bellman_ford_step(v, n, edges)
        if v_new == v:
            break
        v = v_new
        kappa = k + 1

    assert kappa <= n - 1, f"settling took κ = {kappa} > n-1 = {n - 1} steps (violates Bellman-Ford)"

    # Verify the shortest path 0→3 is 4 (via 0→1→2→3), not 10 (direct)
    assert v[(0, 3)] == 4.0, f"expected shortest 0→3 = 4, got {v[(0, 3)]}"
