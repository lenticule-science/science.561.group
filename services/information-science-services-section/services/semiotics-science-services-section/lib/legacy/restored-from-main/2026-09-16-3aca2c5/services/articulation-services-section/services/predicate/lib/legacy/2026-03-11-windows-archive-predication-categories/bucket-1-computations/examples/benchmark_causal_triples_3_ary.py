"""Verification module for `examples/benchmark-causal-triples-3-ary.md`.

3-ary causal triples on alphabet Σ = {0, 1, 2} with mechanism composition mod 3.
Demonstrates the arity-collapse vs arity-amplification dichotomy of the
higher-arity cohomological rank theorem in the strict-regime cell-count setting.

The 3-ary cells are (s, o, m) ∈ Σ^3 (27 total). The closure rule:
  if v(s, o, m_1) = t and v(o, q, m_2) = t,
  then v(s, q, (m_1 + m_2) mod 3) = t.

Migrated from `tools/n-ary-settling/causal_triples.py`.
"""

from __future__ import annotations

from itertools import product

from ..link import verifies


ALPHABET_SIZE = 3


def _make_initial(seed_triples: list[tuple[int, int, int]]) -> dict[tuple[int, int, int], bool]:
    return {
        (s, o, m): (s, o, m) in seed_triples
        for s, o, m in product(range(ALPHABET_SIZE), repeat=3)
    }


def _closure_step_3ary(
    v: dict[tuple[int, int, int], bool],
) -> tuple[dict[tuple[int, int, int], bool], list[tuple[int, int, int]]]:
    new_v = dict(v)
    fired = []
    for s, o, m1 in product(range(ALPHABET_SIZE), repeat=3):
        if not v[(s, o, m1)]:
            continue
        for q, m2 in product(range(ALPHABET_SIZE), repeat=2):
            if not v[(o, q, m2)]:
                continue
            m_new = (m1 + m2) % ALPHABET_SIZE
            if not new_v[(s, q, m_new)]:
                new_v[(s, q, m_new)] = True
                fired.append((s, q, m_new))
    return new_v, fired


def _settle_3ary(
    seeds: list[tuple[int, int, int]],
) -> tuple[dict[tuple[int, int, int], bool], int]:
    cur = _make_initial(seeds)
    for k in range(50):
        nxt, fired = _closure_step_3ary(cur)
        if not fired:
            return nxt, k
        cur = nxt
    raise RuntimeError("3-ary settling did not converge in 50 iterations")


def _binary_projection(seeds: list[tuple[int, int, int]]) -> set[tuple[int, int]]:
    """Binary transitive closure of {(s, o) : (s, o, _) in seeds}."""
    pairs = {(s, o) for s, o, _ in seeds}
    while True:
        new_pairs = set(pairs)
        for s, o in pairs:
            for o2, q in pairs:
                if o == o2:
                    new_pairs.add((s, q))
        if new_pairs == pairs:
            return pairs
        pairs = new_pairs


def _cells_reached(final: dict[tuple[int, int, int], bool]) -> int:
    return sum(1 for x in final.values() if x)


def _mechanism_diverse_pairs(final: dict[tuple[int, int, int], bool]) -> int:
    """Count (s, o) pairs where multiple m values fire."""
    by_pair: dict[tuple[int, int], set[int]] = {}
    for (s, o, m), present in final.items():
        if present:
            by_pair.setdefault((s, o), set()).add(m)
    return sum(1 for ms in by_pair.values() if len(ms) > 1)


@verifies(
    "examples/benchmark-causal-triples-3-ary.md",
    claim="Arity-collapse: shared-mechanism seeds give 3-ary cells reached = binary cells reached",
)
def test_arity_collapse_shared_mechanism() -> None:
    """Cases 1, 2, 3, 5: seeds sharing a single mechanism. The 3-ary closure
    just runs the binary transitive closure within that mechanism class —
    arity-collapse, no extra content."""
    cases = [
        [(0, 1, 1)],  # Case 1
        [(0, 1, 1), (1, 2, 1)],  # Case 2
        [(0, 1, 1), (1, 2, 1), (2, 0, 1)],  # Case 3
        [(s, o, 0) for s, o in product(range(3), repeat=2) if s != o],  # Case 5
    ]
    for seeds in cases:
        final, _ = _settle_3ary(seeds)
        binary_pairs = _binary_projection(seeds)
        n_3ary = _cells_reached(final)
        n_binary = len(binary_pairs)
        # Arity-collapse: all 3-ary cells share the seed's mechanism
        # so cell count = binary pair count
        assert n_3ary == n_binary, (
            f"shared-mechanism seeds {seeds}: expected arity-collapse "
            f"(3-ary cells = binary cells), got 3-ary={n_3ary}, binary={n_binary}"
        )


@verifies(
    "examples/benchmark-causal-triples-3-ary.md",
    claim="Arity-amplification: multi-mechanism seeds give strictly more 3-ary cells than binary projection",
)
def test_arity_amplification_multi_mechanism() -> None:
    """Case 4: seeds (0,1,0), (0,1,1), (1,2,1). The closure produces
    (0,2,1) and (0,2,2) — two distinct mechanisms for the (0,2) pair —
    so the 3-ary cell count exceeds the binary pair count.
    """
    seeds = [(0, 1, 0), (0, 1, 1), (1, 2, 1)]
    final, _ = _settle_3ary(seeds)
    binary_pairs = _binary_projection(seeds)
    n_3ary = _cells_reached(final)
    n_binary = len(binary_pairs)
    assert n_3ary > n_binary, (
        f"multi-mechanism seeds: expected arity-amplification (3-ary > binary), "
        f"got 3-ary={n_3ary}, binary={n_binary}"
    )
    # Markdown specifically: 3-ary reaches 5 cells, binary reaches 3
    assert n_3ary == 5, f"expected 5 3-ary cells reached, got {n_3ary}"
    assert n_binary == 3, f"expected 3 binary cells reached, got {n_binary}"

    # Mechanism-diverse pairs: at least one (s, o) has multiple m's
    diverse = _mechanism_diverse_pairs(final)
    assert diverse > 0, "expected mechanism-diverse pairs in arity-amplification case"


@verifies(
    "examples/benchmark-causal-triples-3-ary.md",
    claim="All 5 cases have closure ordinal κ ≤ 2 (strict regime)",
)
def test_strict_regime_closure_ordinal() -> None:
    """The benchmark notes all 5 cases terminate in ≤ 2 closure steps —
    strict regime, H^1 = 0 trivially at the cohomological level."""
    cases = [
        [(0, 1, 1)],
        [(0, 1, 1), (1, 2, 1)],
        [(0, 1, 1), (1, 2, 1), (2, 0, 1)],
        [(0, 1, 0), (0, 1, 1), (1, 2, 1)],
        [(s, o, 0) for s, o in product(range(3), repeat=2) if s != o],
    ]
    for seeds in cases:
        _, kappa = _settle_3ary(seeds)
        assert kappa <= 2, f"seeds {seeds}: expected κ ≤ 2, got {kappa}"
