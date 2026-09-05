"""
Abstract Regime interface for Relational Geometry.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from typing import Generic, TypeVar

from relationing.core.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


class Regime(Generic[A], ABC):
    """Fixed-point set of a Discipline."""

    @abstractmethod
    def is_stable(self, x: A) -> bool:
        ...


__all__ = ["Regime"]

