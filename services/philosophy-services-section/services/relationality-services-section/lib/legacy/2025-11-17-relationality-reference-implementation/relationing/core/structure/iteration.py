"""
Iteration and asymptotics for monotone endomaps.

Implements the Structure-section notions for a Reflex step endomap S:
- iterates Sⁿ(x);
- stabilisation depth and persistence Persist_S(x);
- baseline convergence relative to ⊥ and baseline limits x↘; and
- eventual equivalence x ≡_S y on recognitions.

These helpers are defined for arbitrary `MonotoneEndomap` values and
HeytingAlgebra elements, with simple bounded searches suitable for
small finite carriers.
"""

from __future__ import annotations

from typing import Optional, Sequence, TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


def iterate_step(step: MonotoneEndomap[A], x: A, n: int) -> A:
    """n-fold iterate Sⁿ(x) of a Reflex step endomap S."""

    result = x
    for _ in range(max(n, 0)):
        result = step(result)
    return result


def iterate_sequence(step: MonotoneEndomap[A], x: A, max_steps: int) -> list[A]:
    """Sequence [x, S(x), S²(x), …] up to stabilisation or max_steps."""

    if max_steps < 0:
        raise ValueError("max_steps must be non-negative")
    seq: list[A] = [x]
    current = x
    for _ in range(max_steps):
        nxt = step(current)
        seq.append(nxt)
        if nxt == current:
            break
        current = nxt
    return seq


def stabilization_depth(step: MonotoneEndomap[A], x: A, max_steps: int) -> Optional[int]:
    """Least n such that Sⁿ(x) stabilises (Sⁿ⁺¹(x) = Sⁿ(x)), if any.

    Returns None when no stabilisation is observed within `max_steps`.
    """

    seq = iterate_sequence(step, x, max_steps)
    for i in range(len(seq) - 1):
        if seq[i + 1] == seq[i]:
            return i
    return None


def is_persistent(step: MonotoneEndomap[A], x: A, max_steps: int) -> bool:
    """Iterative persistence Persist_S(x) up to a bound.

    True when some stabilisation depth is found within `max_steps`.
    """

    return stabilization_depth(step, x, max_steps) is not None


def eventual_limit(step: MonotoneEndomap[A], x: A, max_steps: int) -> Optional[A]:
    """Eventual fixed-point limit of the S-sequence, if it stabilises."""

    current = x
    for _ in range(max_steps):
        nxt = step(current)
        if nxt == current:
            return current
        current = nxt
    return None


def baseline_limit(step: MonotoneEndomap[A], x: A, max_steps: int) -> Optional[A]:
    """Baseline limit x↘ relative to ⊥, when it exists.

    Returns the common eventual limit of Sⁿ(x) and Sⁿ(⊥) if both
    sequences stabilise to the same value within `max_steps`;
    otherwise returns None.
    """

    bottom = type(x).bottom()  # type: ignore[call-arg]
    limit_bottom = eventual_limit(step, bottom, max_steps)
    limit_x = eventual_limit(step, x, max_steps)
    if limit_bottom is None or limit_x is None:
        return None
    return limit_x if limit_x == limit_bottom else None


def baseline_converges(step: MonotoneEndomap[A], x: A, max_steps: int) -> bool:
    """Whether x collapses to the ⊥-baseline under S."""

    return baseline_limit(step, x, max_steps) is not None


def eventual_equivalent(
    step: MonotoneEndomap[A],
    x: A,
    y: A,
    max_steps: int,
) -> bool:
    """Eventual equivalence x ≡_S y via their stabilised limits."""

    limit_x = eventual_limit(step, x, max_steps)
    limit_y = eventual_limit(step, y, max_steps)
    return limit_x is not None and limit_x == limit_y


def eventual_equivalence_classes(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> list[set[A]]:
    """Equivalence classes of ≡_S over a finite carrier.

    Two recognitions are equivalent when their eventual limits under S
    (when they exist within `max_steps`) coincide. Elements that do
    not stabilise within the bound are placed in singleton classes.
    """

    classes: dict[A, set[A]] = {}
    unstable: set[A] = set()
    for x in carrier:
        limit = eventual_limit(step, x, max_steps)
        if limit is None:
            unstable.add(x)
            continue
        bucket = classes.setdefault(limit, set())
        bucket.add(x)
    result = list(classes.values())
    for x in unstable:
        result.append({x})
    return result


__all__ = [
    "iterate_step",
    "iterate_sequence",
    "stabilization_depth",
    "is_persistent",
    "eventual_limit",
    "baseline_limit",
    "baseline_converges",
    "eventual_equivalent",
    "eventual_equivalence_classes",
]
