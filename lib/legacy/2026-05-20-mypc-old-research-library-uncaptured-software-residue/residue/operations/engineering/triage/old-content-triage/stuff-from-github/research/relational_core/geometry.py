"""
Relational Geometry layer (Python).

Abstractions for nuclei, flows, disciplines, and regimes, following the
Relational Geometry section of the Treatise.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Generic, TypeVar

from .structure import HeytingAlgebra, MonotoneEndomap


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


class Filter(Discipline[A], ABC):
    """Filter as in the Treatise: a Discipline whose fixed points
    define a stable profile (regime) and that is intended to commute
    with nuclei and flow."""

    # This class does not add behaviour over `Discipline` yet; it
    # serves as a semantic marker for filters in examples.
