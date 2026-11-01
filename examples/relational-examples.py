#!/usr/bin/env python3
"""Reproduce the explicit finite examples in the relational physics articles.

These small enumerations are educational comparisons, not implementations of
the native Obsmetrologia generators or replacements for Metrologic. There is
no spacetime sampling, general causal solver, thermal measurement or empirical
dataset. Run with Python's standard library: python3 examples/relational-examples.py
"""

from collections import defaultdict
from fractions import Fraction
from itertools import product
from math import log2
import json


def check_strict_order(events, precedes):
    assert all(a in events and b in events and a != b for a, b in precedes)
    assert all((a, d) in precedes for a, b in precedes
               for c, d in precedes if b == c)


def interval_sequencing(precedes):
    intervals = sorted(precedes)
    return tuple((p, q) for p in intervals for q in intervals
                 if p[1] == q[0] or (p[1], q[0]) in precedes)


def strict_transport(source, target, mapping):
    return all((mapping[a], mapping[b]) in target for a, b in source)


def fibers(states, readout):
    result = defaultdict(list)
    for state in states:
        result[readout(state)].append(state)
    return dict(result)


def reconstructible(groups, target):
    return all(len({target(state) for state in group}) == 1
               for group in groups.values())


def entropy(probabilities):
    assert sum(probabilities) == 1
    assert all(p >= 0 for p in probabilities)
    return -sum(float(p) * log2(p) for p in probabilities if p)


def readout_distribution(distribution, readout):
    result = defaultdict(Fraction)
    for state, weight in distribution.items():
        result[readout(state)] += weight
    return dict(result)


def main():
    source_events = ("a", "b", "c", "d")
    source_order = frozenset((("a", "b"), ("c", "d")))
    target_events = ("u", "v", "w")
    target_order = frozenset((("u", "v"), ("v", "w"), ("u", "w")))
    mapping = {"a": "u", "b": "v", "c": "v", "d": "w"}
    check_strict_order(source_events, source_order)
    check_strict_order(target_events, target_order)
    assert strict_transport(source_order, target_order, mapping)
    source_sequencing = interval_sequencing(source_order)
    target_sequencing = interval_sequencing(target_order)
    assert source_sequencing == ()
    assert target_sequencing == ((("u", "v"), ("v", "w")),)
    assert mapping["b"] == mapping["c"] and ("b", "c") not in source_order
    # Identity transport and preservation of the one target sequencing edge.
    assert strict_transport(target_order, target_order, {x: x for x in target_events})
    assert all(a != b for a, b in target_sequencing)
    # The two-point-chain collapse preserves non-strict order, but it cannot
    # take the strict interval (a,b) to a strict interval in a singleton.
    collapsed = {"a": "u", "b": "u"}
    assert not strict_transport(frozenset((("a", "b"),)), frozenset(), collapsed)

    # Both supplied orders list all transitive pairs, not only Hasse links.
    dimension_examples = {
        "three_chain_plus_isolate": frozenset(((0, 1), (1, 2), (0, 2))),
        "four_event_star": frozenset(((0, 1), (0, 2), (0, 3))),
    }
    dimensions = {}
    for name, order in dimension_examples.items():
        check_strict_order(tuple(range(4)), order)
        n, r = 4, len(order)
        fraction = Fraction(2 * r, n * (n - 1))
        assert fraction == Fraction(1, 2)
        # Independent structural witnesses make the equal statistic's lost
        # distinctions explicit, without fitting a physical dimension.
        participates = {x for pair in order for x in pair}
        has_three_chain = any((a, b) in order and (b, c) in order
                              for a, b, c in product(range(4), repeat=3))
        dimensions[name] = {"N": n, "R": r, "ordering_fraction": str(fraction),
                            "has_isolated_event": len(participates) != n,
                            "has_three_event_chain": has_three_chain}
    assert dimensions["three_chain_plus_isolate"]["has_isolated_event"]
    assert not dimensions["four_event_star"]["has_isolated_event"]
    assert dimensions["three_chain_plus_isolate"]["has_three_event_chain"]
    assert not dimensions["four_event_star"]["has_three_event_chain"]

    states = tuple(product((0, 1), repeat=2))
    parity = lambda state: state[0] ^ state[1]
    richer = lambda state: (state[0], parity(state))
    parity_fibers = fibers(states, parity)
    richer_fibers = fibers(states, richer)
    assert parity_fibers == {0: [(0, 0), (1, 1)], 1: [(0, 1), (1, 0)]}
    assert all(len(group) == 1 for group in richer_fibers.values())
    assert reconstructible(parity_fibers, parity)
    assert not reconstructible(parity_fibers, lambda state: state[0])
    assert not reconstructible(parity_fibers, lambda state: state[1])
    assert not reconstructible(parity_fibers, lambda state: state)
    assert reconstructible(richer_fibers, lambda state: state)
    assert all((a, a ^ p) == state for state in states for a, p in [richer(state)])

    distributions = {
        "uniform_four_interiors": {state: Fraction(1, 4) for state in states},
        "uniform_00_and_01": {(0, 0): Fraction(1, 2), (0, 1): Fraction(1, 2)},
    }
    entropies = {}
    for name, distribution in distributions.items():
        readout = readout_distribution(distribution, parity)
        h_source = entropy(tuple(distribution.values()))
        h_boundary = entropy(tuple(readout.values()))
        entropies[name] = {"source_entropy_bits": h_source,
                           "boundary_entropy_bits": h_boundary,
                           "conditional_entropy_bits": h_source - h_boundary}
    assert entropies["uniform_four_interiors"]["conditional_entropy_bits"] == 1
    assert entropies["uniform_00_and_01"]["conditional_entropy_bits"] == 0

    print(json.dumps({
        "scope": "Explicit finite teaching examples; no native generation or empirical physics claim.",
        "causal_transport": {"source_events": source_events,
                             "source_strict_pairs": sorted(source_order),
                             "target_events": target_events,
                             "target_strict_pairs": sorted(target_order),
                             "map": mapping,
                             "strict_pairs_preserved": True,
                             "source_interval_sequencing": source_sequencing,
                             "target_interval_sequencing": target_sequencing,
                             "lost_distinction": ["b", "c"],
                             "two_point_collapse_refused": True},
        "same_ordering_fraction_different_orders": dimensions,
        "boundary": {"states": states,
                     "parity_fibers": parity_fibers,
                     "parity_reconstructs_full_state": False,
                     "A_and_parity_reconstruct_full_state": True,
                     "probability_examples": entropies},
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
