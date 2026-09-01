"""
Regimes for Relational Geometry.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, TypeVar

from relationing.core.structure import HeytingAlgebra, MonotoneEndomap

from .regime_base import Regime


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass
class FixedPointRegime(Generic[A], Regime[A]):
    """Regime given by the fixed points of a monotone endomap."""

    endomap: MonotoneEndomap[A]

    def is_stable(self, x: A) -> bool:
        return self.endomap(x).leq(x) and x.leq(self.endomap(x))


__all__ = ["Regime", "FixedPointRegime"]
