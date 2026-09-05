from __future__ import annotations

from typing import Optional, TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap
from .iterate_sequence import iterate_sequence


A = TypeVar("A", bound=HeytingAlgebra)


def stabilization_depth(
    step: MonotoneEndomap[A],
    x: A,
    max_steps: int,
) -> Optional[int]:
    """Least n such that Sⁿ(x) stabilises (Sⁿ⁺¹(x) = Sⁿ(x)), if any.

    Returns None when no stabilisation is observed within ``max_steps``.
    """

    seq = iterate_sequence(step, x, max_steps)
    for i in range(len(seq) - 1):
        if seq[i + 1] == seq[i]:
            return i
    return None


__all__ = ["stabilization_depth", "A"]

