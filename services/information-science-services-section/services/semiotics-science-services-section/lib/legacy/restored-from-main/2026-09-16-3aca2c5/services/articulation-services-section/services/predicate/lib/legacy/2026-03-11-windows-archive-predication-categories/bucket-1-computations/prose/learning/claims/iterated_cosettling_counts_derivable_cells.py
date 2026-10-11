"""Verification module for `theorems/iterated-cosettling-counts-derivable-cells.md`.

The theorem claims: for a strict-regime closure operator T with seed-derived
target w, the iterated cosettling has size $|T^{*-1}(w)| = 2^{|w| - |\\mathrm{seed}|}$.

The markdown's "Empirical verification" section tabulates 7 benchmark closure
systems matching this formula exactly. This module loads the benchmark data
from `tools/cosettling-enumerator/data.json` (preserved as ground truth) and
re-runs the enumeration via the new `ClosureRuleSystem` primitive, asserting
the iterated-cosettling size matches the closed form on every benchmark.

Also verifies the related sketch theorem `single-step-cosettling-via-closure-cover-hypergraph.md`
empirical data: the single-step cosettling sizes match the data.json values
across the 7 benchmarks.
"""

from __future__ import annotations

import json
from pathlib import Path

from ..link import verifies
from ..primitives import ClosureRuleSystem, Rule


_BENCHMARKS_PATH = Path(__file__).parent.parent / "data" / "cosettling_benchmarks.json"


def _load_benchmarks() -> list[dict]:
    return json.loads(_BENCHMARKS_PATH.read_text(encoding="utf-8"))


def _benchmark_to_system(benchmark: dict) -> ClosureRuleSystem:
    rules = tuple(
        Rule(antecedents=tuple(antec), consequents=tuple(conseq))
        for antec, conseq in benchmark["rules"]
    )
    return ClosureRuleSystem(rules=rules)


@verifies(
    "theorems/iterated-cosettling-counts-derivable-cells.md",
    claim="iterated cosettling size = 2^(|w| - |seed|) on all 7 benchmark closure systems",
)
def test_iterated_cosettling_closed_form() -> None:
    """For each of the 7 benchmark closure systems, verify
    |T^{*-1}(w)| = 2^(|w| - |seed|) — the theorem's closed form.
    """
    benchmarks = _load_benchmarks()
    assert len(benchmarks) == 7, f"expected 7 benchmarks, got {len(benchmarks)}"

    for bench in benchmarks:
        system = _benchmark_to_system(bench)
        target = frozenset(bench["target"])
        seed = frozenset(bench["seed"])
        expected_size = 2 ** (len(target) - len(seed))

        iterated = system.iterated_cosettling(target)
        assert len(iterated) == expected_size, (
            f"benchmark {bench['name']}: |T*^{{-1}}(w)| = {len(iterated)}, "
            f"expected 2^({len(target)} - {len(seed)}) = {expected_size}"
        )

        # Also verify the recorded value in data.json
        assert len(iterated) == bench["iterated_cosettling_size"], (
            f"benchmark {bench['name']}: enumeration disagrees with stored value"
        )


@verifies(
    "theorems/single-step-cosettling-via-closure-cover-hypergraph.md",
    claim="single-step cosettling sizes match the empirical table on 7 benchmarks (closure-cover hypergraph framework)",
)
def test_single_step_cosettling_table() -> None:
    """For each benchmark, verify |T^{-1}(w)| matches the value tabulated in
    the closure-cover-hypergraph theorem's empirical-data section.
    """
    benchmarks = _load_benchmarks()
    for bench in benchmarks:
        system = _benchmark_to_system(bench)
        target = frozenset(bench["target"])

        single_step = system.cosettling(target)
        expected = bench["T_inverse_size"]
        assert len(single_step) == expected, (
            f"benchmark {bench['name']}: |T^{{-1}}(w)| = {len(single_step)}, "
            f"expected {expected}"
        )


@verifies(
    "theorems/iterated-cosettling-counts-derivable-cells.md",
    claim="iterated cosettling = interval [seed, target] in the subset lattice",
)
def test_iterated_cosettling_is_interval() -> None:
    """The theorem additionally claims T^{*-1}(w) = {v : seed ⊆ v ⊆ w}
    (any subset between seed and target). Verify on each benchmark."""
    benchmarks = _load_benchmarks()
    for bench in benchmarks:
        system = _benchmark_to_system(bench)
        target = frozenset(bench["target"])
        seed = frozenset(bench["seed"])

        iterated = system.iterated_cosettling(target)
        # Every element should contain seed and be contained in target
        for v in iterated:
            assert seed.issubset(v), f"{bench['name']}: {v} doesn't contain seed {seed}"
            assert v.issubset(target), f"{bench['name']}: {v} not in target {target}"

        # The set should equal {v : seed ⊆ v ⊆ target} via interval
        from itertools import combinations
        derivable_cells = sorted(target - seed, key=str)
        expected_count = 0
        for r in range(len(derivable_cells) + 1):
            for combo in combinations(derivable_cells, r):
                v = seed | frozenset(combo)
                assert v in iterated, (
                    f"{bench['name']}: interval element {v} missing from T*^(-1)"
                )
                expected_count += 1
        assert len(iterated) == expected_count
