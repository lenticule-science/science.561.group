"""
Nucleus abstraction for Relational Geometry.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from typing import TypeVar

from relationing.structure import HeytingAlgebra, MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


class Nucleus(MonotoneEndomap[A], ABC):
    """Nucleus-like operator on recognitions."""

    @abstractmethod
    def __call__(self, x: A) -> A:
        ...

    def is_idempotent(self, x: A) -> bool:
        once = self(x)
        twice = self(once)
        return twice.leq(once) and once.leq(twice)

    def is_closure_like(self, x: A) -> bool:
        return x.leq(self(x))

    def is_interior_like(self, x: A) -> bool:
        return self(x).leq(x)


__all__ = ["Nucleus"]

