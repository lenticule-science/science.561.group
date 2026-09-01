from __future__ import annotations

from typing import TypeVar

from relationing.structure.heyting_algebra import HeytingAlgebra
from relationing.structure.monotone_endomap import MonotoneEndomap


A_co = TypeVar("A_co", bound=HeytingAlgebra)


class ReflexStep(MonotoneEndomap[A_co]):
    """Reflex step endomap on recognitions.

    This is a thin wrapper around an underlying monotone endomap,
    used to emphasise the "step" reading from the Structure section.
    """

    def __init__(self, inner: MonotoneEndomap[A_co]) -> None:
        self._inner = inner

    def __call__(self, x: A_co) -> A_co:
        return self._inner(x)


__all__ = ["ReflexStep"]
