"""
Disciplines and Filters for Relational Geometry.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from typing import Generic, TypeVar

from relationing.structure import HeytingAlgebra, MonotoneEndomap
from relationing.geometry.nucleus import Nucleus
from relationing.geometry.flow import Flow


A = TypeVar("A", bound=HeytingAlgebra)


class Discipline(Generic[A], ABC):
    """Unary endomap commuting with nuclei and flow."""

    @abstractmethod
    def __call__(self, x: A) -> A:
        ...

    def commutes_with_nucleus(self, nu: Nucleus[A], x: A) -> bool:
        left = self(nu(x))
        right = nu(self(x))
        return left.leq(right) and right.leq(left)

    def commutes_with_flow(self, flow: Flow[A], x: A) -> bool:
        left = self(flow(x))
        right = flow(self(x))
        return left.leq(right) and right.leq(left)

    def commutes_with_reflex(self, reflex: MonotoneEndomap[A], x: A) -> bool:
        """Intended commutativity with a Reflex endomap ρ: D(ρ(x)) = ρ(D(x))."""
        left = self(reflex(x))
        right = reflex(self(x))
        return left.leq(right) and right.leq(left)


class Filter(Discipline[A], ABC):
    """Filter as in the Treatise.

    A Discipline whose fixed points define a stable profile (regime)
    and that is intended to commute with nuclei and flow.
    """

    # This class does not add behaviour over `Discipline` yet; it
    # serves as a semantic marker for filters in examples.


__all__ = ["Discipline", "Filter"]

