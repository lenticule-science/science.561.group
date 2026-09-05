from __future__ import annotations

from typing import TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


def iterate_step(step: MonotoneEndomap[A], x: A, n: int) -> A:
    """n-fold iterate Sⁿ(x) of a Reflex step endomap S."""

    result = x
    for _ in range(max(n, 0)):
        result = step(result)
    return result


__all__ = ["iterate_step", "A"]

