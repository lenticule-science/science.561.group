from __future__ import annotations

from typing import Optional, TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


def eventual_limit(
    step: MonotoneEndomap[A],
    x: A,
    max_steps: int,
) -> Optional[A]:
    """Eventual fixed-point limit of the S-sequence, if it stabilises."""

    current = x
    for _ in range(max_steps):
        nxt = step(current)
        if nxt == current:
            return current
        current = nxt
    return None


__all__ = ["eventual_limit", "A"]

