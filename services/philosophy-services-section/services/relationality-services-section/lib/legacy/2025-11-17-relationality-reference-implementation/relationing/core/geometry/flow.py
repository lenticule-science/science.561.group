"""
Flow abstraction for Relational Geometry.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from typing import TypeVar

from relationing.core.structure import HeytingAlgebra, MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


class Flow(MonotoneEndomap[A], ABC):
    """Relational Flow endomap."""

    @abstractmethod
    def __call__(self, x: A) -> A:
        ...

    def is_lax_idempotent(self, x: A) -> bool:
        fx = self(x)
        ffx = self(fx)
        return ffx.leq(fx)

    def is_inflationary(self, x: A) -> bool:
        return x.leq(self(x))

    def is_deflationary(self, x: A) -> bool:
        return self(x).leq(x)
__all__ = ["Flow"]
