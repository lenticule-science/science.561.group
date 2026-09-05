from __future__ import annotations

from typing import TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap
from .eventual_limit import eventual_limit


A = TypeVar("A", bound=HeytingAlgebra)


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


__all__ = ["eventual_equivalent", "A"]

