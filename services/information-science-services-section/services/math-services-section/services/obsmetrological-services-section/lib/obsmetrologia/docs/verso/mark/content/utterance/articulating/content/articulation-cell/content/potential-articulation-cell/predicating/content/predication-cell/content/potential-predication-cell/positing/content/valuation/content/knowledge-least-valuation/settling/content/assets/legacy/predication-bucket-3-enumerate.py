#!/usr/bin/env python3
"""
Cosettling enumerator for strict-regime closure-rule systems.

For a strict-regime closure operator T defined by a finite rule set R and a
closure-stable target state w, computes:

  - T^{-1}(w): single-step pre-images.
  - T^{*-1}(w): iterated pre-images (all v with T^k(v) = w for some k).
  - Forward trajectory v_0, v_1, ..., v_kappa starting from a given seed.
  - Off-trajectory pre-images: elements of T^{*-1}(w) not on the forward trajectory.

Supports binary cells (a cell is either present, value t, or absent, value bot).
This is sufficient for the theorem's strict-regime claims; multi-valued cells
would require a different enumeration strategy.

Usage:

  python3 enumerate.py --benchmark theorem-3-stage
  python3 enumerate.py --benchmark parallel-firing
  python3 enumerate.py --benchmark all
"""
from __future__ import annotations

import argparse
import json
import sys
from itertools import combinations
from typing import Iterable


# Type alias: a state is a frozenset of cell labels (strings).
State = frozenset

# A rule is (antecedent_cells, consequent_cells): if all antecedents are present
# in state, the rule produces the consequents.
Rule = tuple[tuple[str, ...], tuple[str, ...]]


def apply_T(state: State, rules: list[Rule]) -> State:
    """One closure step: fire every rule whose antecedent is satisfied. Inflation
    is automatic — cells in state are kept."""
    new_state = set(state)
    for antecedents, consequents in rules:
        if all(c in state for c in antecedents):
            new_state.update(consequents)
    return frozenset(new_state)


def forward_trajectory(seed: Iterable[str], rules: list[Rule], max_steps: int = 100) -> list[State]:
    """Forward trajectory from seed until closure-stable."""
    traj: list[State] = [frozenset(seed)]
    for _ in range(max_steps):
        nxt = apply_T(traj[-1], rules)
        if nxt == traj[-1]:
            return traj
        traj.append(nxt)
    raise RuntimeError(f"Trajectory did not stabilize within {max_steps} steps.")


def cosettling(target: Iterable[str], rules: list[Rule]) -> list[State]:
    """T^{-1}(target): all v subseteq target with T(v) = target."""
    target_fs = frozenset(target)
    cells = sorted(target_fs)
    preimages: list[State] = []
    # 2^|target| subsets — exponential but tractable for small targets.
    for r in range(len(cells) + 1):
        for subset in combinations(cells, r):
            v = frozenset(subset)
            if apply_T(v, rules) == target_fs:
                preimages.append(v)
    return preimages


def iterated_cosettling(target: Iterable[str], rules: list[Rule], max_iter: int = 50) -> set[State]:
    """T^{*-1}(target): all v with T^k(v) = target for some k >= 0."""
    seen: set[State] = {frozenset(target)}
    frontier: set[State] = {frozenset(target)}
    for _ in range(max_iter):
        new_frontier: set[State] = set()
        for w in frontier:
            for v in cosettling(w, rules):
                if v not in seen:
                    seen.add(v)
                    new_frontier.add(v)
        if not new_frontier:
            return seen
        frontier = new_frontier
    raise RuntimeError(f"Iterated cosettling did not stabilize within {max_iter} iterations.")


def analyze(name: str, seed: Iterable[str], rules: list[Rule]) -> dict:
    """Run full analysis on a benchmark."""
    seed_fs = frozenset(seed)
    traj = forward_trajectory(seed_fs, rules)
    target = traj[-1]
    pre = cosettling(target, rules)
    iter_pre = iterated_cosettling(target, rules)

    on_trajectory = set(traj)
    off_trajectory = iter_pre - on_trajectory

    return {
        "name": name,
        "seed": sorted(seed_fs),
        "rules": [(list(a), list(c)) for a, c in rules],
        "forward_trajectory": [sorted(s) for s in traj],
        "kappa": len(traj) - 1,
        "target": sorted(target),
        "T_inverse": [sorted(p) for p in sorted(pre, key=lambda x: (len(x), sorted(x)))],
        "T_inverse_size": len(pre),
        "T_inverse_trajectory_count": sum(1 for p in pre if p in on_trajectory),
        "T_inverse_off_trajectory_count": sum(1 for p in pre if p not in on_trajectory),
        "iterated_cosettling_size": len(iter_pre),
        "off_trajectory_states": sorted([sorted(s) for s in off_trajectory]),
    }


# Benchmarks.

BENCHMARKS: dict[str, tuple[list[str], list[Rule]]] = {
    # The example from backward-closure-recovers-forward-trajectory.md:
    # R1: (0,0)=t -> (1,1)=t
    # R2: (1,1)=t -> (2,2)=t
    "theorem-3-stage": (
        ["c00"],
        [
            (("c00",), ("c11",)),
            (("c11",), ("c22",)),
        ],
    ),

    # Two parallel last-step firings: both fire from the same antecedent.
    # R1: a -> b
    # R2: a -> c
    # Forward: {a} -> {a,b,c}.
    # Off-trajectory candidates: {a, b}, {a, c} both close to {a,b,c}.
    "parallel-firing-2": (
        ["a"],
        [
            (("a",), ("b",)),
            (("a",), ("c",)),
        ],
    ),

    # Three parallel firings.
    "parallel-firing-3": (
        ["a"],
        [
            (("a",), ("b",)),
            (("a",), ("c",)),
            (("a",), ("d",)),
        ],
    ),

    # Diamond rule structure: two paths to the same final cell.
    # R1: a -> b
    # R2: a -> c
    # R3: b -> d
    # R4: c -> d
    # Forward: {a} -> {a,b,c} -> {a,b,c,d}.
    "diamond": (
        ["a"],
        [
            (("a",), ("b",)),
            (("a",), ("c",)),
            (("b",), ("d",)),
            (("c",), ("d",)),
        ],
    ),

    # Multi-antecedent rule: requires multiple cells to fire.
    # R1: a -> b
    # R2: a -> c
    # R3: b, c -> d   (needs both)
    "conjunctive-firing": (
        ["a"],
        [
            (("a",), ("b",)),
            (("a",), ("c",)),
            (("b", "c"), ("d",)),
        ],
    ),

    # Linear chain of length 5 (no branching).
    "linear-chain-5": (
        ["c0"],
        [
            (("c0",), ("c1",)),
            (("c1",), ("c2",)),
            (("c2",), ("c3",)),
            (("c3",), ("c4",)),
        ],
    ),

    # Wide-then-narrow: first step fans out, last step needs them all.
    "fan-out-fan-in": (
        ["a"],
        [
            (("a",), ("b1",)),
            (("a",), ("b2",)),
            (("a",), ("b3",)),
            (("b1", "b2", "b3"), ("z",)),
        ],
    ),
}


def main():
    p = argparse.ArgumentParser(description="Cosettling enumerator.")
    p.add_argument("--benchmark", default="all", help="Benchmark name or 'all'.")
    p.add_argument("--json", action="store_true", help="Output JSON.")
    args = p.parse_args()

    names = list(BENCHMARKS) if args.benchmark == "all" else [args.benchmark]

    results = []
    for name in names:
        if name not in BENCHMARKS:
            print(f"Unknown benchmark: {name}", file=sys.stderr)
            sys.exit(1)
        seed, rules = BENCHMARKS[name]
        results.append(analyze(name, seed, rules))

    if args.json:
        print(json.dumps(results, indent=2))
        return

    for r in results:
        print(f"=== {r['name']} ===")
        print(f"seed: {r['seed']}")
        print(f"trajectory length kappa: {r['kappa']}")
        print(f"target: {r['target']}")
        print(f"|T^{{-1}}(target)| = {r['T_inverse_size']}")
        print(f"  on-trajectory:  {r['T_inverse_trajectory_count']}")
        print(f"  off-trajectory: {r['T_inverse_off_trajectory_count']}")
        print(f"|T^{{*-1}}(target)| = {r['iterated_cosettling_size']}  (forward trajectory has {r['kappa'] + 1} states)")
        if r["off_trajectory_states"]:
            print(f"off-trajectory pre-images:")
            for s in r["off_trajectory_states"]:
                print(f"  {s}")
        else:
            print(f"off-trajectory pre-images: none")
        print(f"T^{{-1}}(target) members:")
        for p in r["T_inverse"]:
            on = "*" if p in [list(t) for t in r["forward_trajectory"]] else " "
            print(f"  {on} {p}")
        print()


if __name__ == "__main__":
    main()
