"""
Regimes for Relational Geometry.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Generic, TypeVar

from relationing.structure import HeytingAlgebra, MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


class Regime(Generic[A], ABC):
    """Fixed-point set of a Discipline."""

    @abstractmethod
    def is_stable(self, x: A) -> bool:
        ...


@dataclass
class FixedPointRegime(Generic[A], Regime[A]):
    """Regime given by the fixed points of a monotone endomap."""

    endomap: MonotoneEndomap[A]

    def is_stable(self, x: A) -> bool:
        return self.endomap(x).leq(x) and x.leq(self.endomap(x))


__all__ = ["Regime", "FixedPointRegime"]

