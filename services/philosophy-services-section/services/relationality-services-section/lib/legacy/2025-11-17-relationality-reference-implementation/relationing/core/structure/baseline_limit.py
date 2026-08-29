from __future__ import annotations

from typing import Optional, TypeVar, cast

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap
from .eventual_limit import eventual_limit


A = TypeVar("A", bound=HeytingAlgebra)


def baseline_limit(
    step: MonotoneEndomap[A],
    x: A,
    max_steps: int,
) -> Optional[A]:
    """Baseline limit x↘ relative to ⊥, when it exists.

    Returns the common eventual limit of Sⁿ(x) and Sⁿ(⊥) if both
    sequences stabilise to the same value within ``max_steps``;
    otherwise returns None.
    """

    bottom = cast(A, type(x).bottom())
    limit_bottom = eventual_limit(step, bottom, max_steps)
    limit_x = eventual_limit(step, x, max_steps)
    if limit_bottom is None or limit_x is None:
        return None
    return limit_x if limit_x == limit_bottom else None


__all__ = ["baseline_limit", "A"]

