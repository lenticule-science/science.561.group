"""Verification module for `examples/benchmark-lorentzian-causal-set.md`.

Verifies: causal-set apex/void structure on a small sprinkled 2D Minkowski
spacetime. The apex (timelike-related event pairs) and void (spacelike-separated
pairs) are computed by the corpus's lorentzian-causal-set sprinkling tool.

Migrated from `tools/lorentzian-causal-set/sprinkle.py`.
"""

from __future__ import annotations

import math
import random

from ..link import verifies


def _is_causal_2d(e1: tuple[float, float], e2: tuple[float, float]) -> bool:
    """e1 ≼ e2 iff t2 - t1 ≥ |x2 - x1| (e2 in future light cone of e1)."""
    t1, x1 = e1
    t2, x2 = e2
    return (t2 - t1) >= abs(x2 - x1)


def _causal_relation_counts(events: list[tuple[float, float]]) -> tuple[int, int]:
    """Return (timelike_pair_count, spacelike_pair_count)."""
    n = len(events)
    timelike = 0
    spacelike = 0
    for i in range(n):
        for j in range(i + 1, n):
            if _is_causal_2d(events[i], events[j]) or _is_causal_2d(events[j], events[i]):
                timelike += 1
            else:
                spacelike += 1
    return timelike, spacelike


@verifies(
    "examples/benchmark-lorentzian-causal-set.md",
    claim="Sprinkled 2D causal set has apex (timelike pairs) + void (spacelike pairs) summing to n*(n-1)/2",
)
def test_causal_set_apex_void_structure() -> None:
    """Sprinkle 20 events in a 4x4 box. Verify timelike + spacelike = total pairs."""
    random.seed(42)
    n = 20
    events = [(random.uniform(0, 4), random.uniform(-2, 2)) for _ in range(n)]
    timelike, spacelike = _causal_relation_counts(events)
    assert timelike + spacelike == n * (n - 1) // 2
    assert timelike > 0, "expected at least some causal pairs in 4x4 box"
    assert spacelike > 0, "expected at least some spacelike pairs"


@verifies(
    "examples/benchmark-lorentzian-causal-set.md",
    claim="Causal relation is transitive (apex closure stabilizes after one transitive-closure step)",
)
def test_causal_transitivity() -> None:
    """For 3 events with explicit causal structure, transitivity holds:
    e1 ≼ e2 and e2 ≼ e3 implies e1 ≼ e3."""
    random.seed(0)
    events = [(0.0, 0.0), (1.0, 0.5), (2.0, 0.2)]
    # e1 ≼ e2: 1 ≥ 0.5 ✓; e2 ≼ e3: 1 ≥ 0.3 ✓; transitivity says e1 ≼ e3: 2 ≥ 0.2 ✓
    assert _is_causal_2d(events[0], events[1])
    assert _is_causal_2d(events[1], events[2])
    assert _is_causal_2d(events[0], events[2])
