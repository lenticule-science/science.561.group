from __future__ import annotations

from typing import TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap
from .stabilization_depth import stabilization_depth


A = TypeVar("A", bound=HeytingAlgebra)


def is_persistent(step: MonotoneEndomap[A], x: A, max_steps: int) -> bool:
    """Iterative persistence Persist_S(x) up to a bound.

    True when some stabilisation depth is found within ``max_steps``.
    """

    return stabilization_depth(step, x, max_steps) is not None


__all__ = ["is_persistent", "A"]

