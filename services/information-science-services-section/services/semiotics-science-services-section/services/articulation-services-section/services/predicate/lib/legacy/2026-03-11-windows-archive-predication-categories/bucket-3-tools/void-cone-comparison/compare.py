#!/usr/bin/env python3
"""
Cross-instance void-cone comparison.

Tests the value-agnostic-void-cone theorem (theorems/value-agnostic-void-cone.md)
empirically: takes a single directed graph, runs the void-cone computation in
four value categories — bilattice (Boolean), stochastic ([0,1]), Lawvere
quantale ([0, infinity]), Lorentzian (Boolean) — and verifies that all four
agree on:

  - V_infinity (the cells permanently void).
  - The firing set L_ns (cells that left the void at each step).
  - The total number of firings (rank of H^1 / gr(Void)).

Disagreement indicates the unification claimed by the theorem is incomplete.

Usage:

  python3 compare.py --graph default
  python3 compare.py --graph all
"""
from __future__ import annotations

import argparse
import math
import sys
from itertools import product

INF = math.inf


def bilattice_settling(n: int, edges: list[tuple[int, int]]) -> tuple[dict, list[set]]:
    """Bilattice (Boolean) closure: v(s, o) = True iff path s ->* o.
    Closure step: v(s, o) | exists z: v(s, z) and edge(z, o).
    Returns (final_state, void_cone) where void_cone[t] = set of (s, o) with v_t(s, o) = False."""
    v = {(s, o): (s == o) for s, o in product(range(n), repeat=2)}
    # Seed: direct edges.
    for s, o in edges:
        v[(s, o)] = True

    void_cone: list[set] = []
    while True:
        void_cone.append({c for c, val in v.items() if not val})
        new_v = dict(v)
        for s, z, o in product(range(n), repeat=3):
            if v[(s, z)] and v[(z, o)]:
                new_v[(s, o)] = True
        if new_v == v:
            break
        v = new_v
    void_cone.append({c for c, val in v.items() if not val})
    return v, void_cone


def stochastic_settling(n: int, edges: list[tuple[int, int]]) -> tuple[dict, list[set]]:
    """Stochastic closure: v(s, o) = max prob of reaching o from s in <= k steps.
    Closure step: v(s, o) := max(v(s, o), max_z P(s, z) * v(z, o)).
    Initial: identity. P deterministic on edges (1.0).
    Returns (final, void_cone) — void = cells with v(s, o) = 0."""
    P = {(s, o): 0.0 for s, o in product(range(n), repeat=2)}
    for s, o in edges:
        P[(s, o)] = 1.0
    v = {(s, o): (1.0 if s == o else 0.0) for s, o in product(range(n), repeat=2)}
    # Inject direct edges as immediate transitions.
    for s, o in edges:
        v[(s, o)] = max(v[(s, o)], 1.0)

    void_cone: list[set] = []
    while True:
        void_cone.append({c for c, val in v.items() if val == 0.0})
        new_v = dict(v)
        for s, o in product(range(n), repeat=2):
            best = v[(s, o)]
            for z in range(n):
                if P[(s, z)] > 0 and v[(z, o)] > 0:
                    best = max(best, P[(s, z)] * v[(z, o)])
            new_v[(s, o)] = best
        if new_v == v:
            break
        v = new_v
    void_cone.append({c for c, val in v.items() if val == 0.0})
    return v, void_cone


def lawvere_settling(n: int, edges: list[tuple[int, int]]) -> tuple[dict, list[set]]:
    """Lawvere-quantale closure: v(s, o) = shortest path distance.
    Closure step: v(s, o) := min(v(s, o), min_z v(s, z) + v(z, o)) (Bellman-Ford).
    Initial: 0 on diagonal, 1 on direct edges (treating them as unit-cost), inf elsewhere.
    Void = cells with v = inf."""
    v = {(s, o): (0.0 if s == o else INF) for s, o in product(range(n), repeat=2)}
    for s, o in edges:
        v[(s, o)] = min(v[(s, o)], 1.0)

    void_cone: list[set] = []
    while True:
        void_cone.append({c for c, val in v.items() if val == INF})
        new_v = dict(v)
        for s, o in product(range(n), repeat=2):
            best = v[(s, o)]
            for z in range(n):
                cand = v[(s, z)] + v[(z, o)]
                if cand < best:
                    best = cand
            new_v[(s, o)] = best
        if new_v == v:
            break
        v = new_v
    void_cone.append({c for c, val in v.items() if val == INF})
    return v, void_cone


def lorentzian_settling(n: int, edges: list[tuple[int, int]]) -> tuple[dict, list[set]]:
    """Lorentzian (Boolean) causal-set closure. Same algorithm as bilattice in
    this graph-flavored test (transitive closure of edge relation)."""
    return bilattice_settling(n, edges)


def void_cone_to_firings(void_cone: list[set]) -> list[tuple[int, frozenset]]:
    """Extract firing events: pairs (step, removed_cells) where removed_cells = V_{t-1} \\ V_t."""
    firings = []
    for t in range(1, len(void_cone)):
        removed = void_cone[t - 1] - void_cone[t]
        if removed:
            firings.append((t, frozenset(removed)))
    return firings


def compare(name: str, n: int, edges: list[tuple[int, int]]) -> dict:
    """Run all four settlings on the same graph; report agreement."""
    bilat_v, bilat_vc = bilattice_settling(n, edges)
    stoch_v, stoch_vc = stochastic_settling(n, edges)
    lawv_v, lawv_vc = lawvere_settling(n, edges)
    lorz_v, lorz_vc = lorentzian_settling(n, edges)

    bilat_void = bilat_vc[-1]
    stoch_void = stoch_vc[-1]
    lawv_void = lawv_vc[-1]
    lorz_void = lorz_vc[-1]

    # All four void sets should agree.
    void_agreement = (bilat_void == stoch_void == lawv_void == lorz_void)

    bilat_firings = void_cone_to_firings(bilat_vc)
    stoch_firings = void_cone_to_firings(stoch_vc)
    lawv_firings = void_cone_to_firings(lawv_vc)
    lorz_firings = void_cone_to_firings(lorz_vc)

    # Firings should agree as cell sets (the timing/ordinal index might differ).
    bilat_fired_cells = set().union(*[c for _, c in bilat_firings]) if bilat_firings else set()
    stoch_fired_cells = set().union(*[c for _, c in stoch_firings]) if stoch_firings else set()
    lawv_fired_cells = set().union(*[c for _, c in lawv_firings]) if lawv_firings else set()
    lorz_fired_cells = set().union(*[c for _, c in lorz_firings]) if lorz_firings else set()

    fired_agreement = (bilat_fired_cells == stoch_fired_cells == lawv_fired_cells == lorz_fired_cells)

    return {
        "name": name,
        "n_vertices": n,
        "edges": edges,
        "void_agreement": void_agreement,
        "fired_agreement": fired_agreement,
        "bilattice_void_size": len(bilat_void),
        "stochastic_void_size": len(stoch_void),
        "lawvere_void_size": len(lawv_void),
        "lorentzian_void_size": len(lorz_void),
        "bilattice_firings": [(t, sorted(c)) for t, c in bilat_firings],
        "stochastic_firings": [(t, sorted(c)) for t, c in stoch_firings],
        "lawvere_firings": [(t, sorted(c)) for t, c in lawv_firings],
        "lorentzian_firings": [(t, sorted(c)) for t, c in lorz_firings],
        "fired_cells": sorted(bilat_fired_cells),
        "void_cells": sorted(bilat_void),
        "total_firings": len(bilat_fired_cells),
    }


# Test graphs.
GRAPHS: dict[str, tuple[int, list[tuple[int, int]]]] = {
    # Default 4-vertex graph: a -> b -> c, a -> d. b, c, d have no incoming except from a or b.
    # Reachability: a reaches all; b reaches c; c reaches nothing new; d reaches nothing.
    # Permanently-void pairs: (b, a), (b, d), (c, a), (c, b), (c, d), (d, a), (d, b), (d, c) = 8.
    "default": (4, [(0, 1), (1, 2), (0, 3)]),
    # Disconnected components: {0, 1, 2} and {3, 4}.
    "disconnected": (5, [(0, 1), (1, 2), (3, 4)]),
    # Diamond shape: 0 -> 1 -> 3, 0 -> 2 -> 3.
    "diamond": (4, [(0, 1), (0, 2), (1, 3), (2, 3)]),
    # Cycle: 0 -> 1 -> 2 -> 0.
    "cycle": (3, [(0, 1), (1, 2), (2, 0)]),
    # Linear chain: 0 -> 1 -> 2 -> 3 -> 4.
    "chain": (5, [(0, 1), (1, 2), (2, 3), (3, 4)]),
}


def main():
    p = argparse.ArgumentParser(description="Cross-instance void-cone comparison.")
    p.add_argument("--graph", default="default", help="Graph name or 'all'.")
    p.add_argument("--verbose", action="store_true")
    args = p.parse_args()

    names = list(GRAPHS) if args.graph == "all" else [args.graph]

    overall_agreement = True
    for name in names:
        if name not in GRAPHS:
            print(f"Unknown graph: {name}", file=sys.stderr)
            sys.exit(1)
        n, edges = GRAPHS[name]
        result = compare(name, n, edges)

        print(f"=== {name} (n={n}, |edges|={len(edges)}) ===")
        print(f"void agreement: {result['void_agreement']}")
        print(f"fired-cells agreement: {result['fired_agreement']}")
        print(f"|V_infinity| = {result['bilattice_void_size']} (across all 4 instances)")
        print(f"total firings = {result['total_firings']}")

        if args.verbose:
            print(f"V_infinity cells: {result['void_cells']}")
            print(f"fired cells: {result['fired_cells']}")
            print(f"bilattice firing schedule: {result['bilattice_firings']}")
            print(f"stochastic firing schedule: {result['stochastic_firings']}")
            print(f"lawvere firing schedule: {result['lawvere_firings']}")

        if not (result['void_agreement'] and result['fired_agreement']):
            overall_agreement = False
            print("DISAGREEMENT — value-agnostic claim fails on this graph!")
        print()

    if overall_agreement:
        print("All graphs verified: void-cones agree across the four value categories.")
    else:
        print("WARNING: at least one graph showed disagreement.")
        sys.exit(2)


if __name__ == "__main__":
    main()
