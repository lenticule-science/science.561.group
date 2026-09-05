from __future__ import annotations

from typing import TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap
from .baseline_limit import baseline_limit


A = TypeVar("A", bound=HeytingAlgebra)


def baseline_converges(
    step: MonotoneEndomap[A],
    x: A,
    max_steps: int,
) -> bool:
    """Whether x collapses to the ⊥-baseline under S."""

    return baseline_limit(step, x, max_steps) is not None


__all__ = ["baseline_converges", "A"]

