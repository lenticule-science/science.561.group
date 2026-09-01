"""
Relational Structure layer (Python).

This module encodes the order-theoretic core of the Treatise:
recognitions organised as a bounded distributive lattice with Heyting
implication and a designated Reflex endomap.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Generic, Protocol, TypeVar, runtime_checkable


T = TypeVar("T", covariant=True)


@runtime_checkable
class Preorder(Protocol):
    """A preorder / partial-order interface."""

    def leq(self, other: "Preorder") -> bool:
        """Return True when self is at most as recognising as other."""
        ...

    def geq(self, other: "Preorder") -> bool:
        return other.leq(self)  # type: ignore[arg-type]


class HeytingAlgebra(Preorder, ABC):
    """Heyting algebra structure on a type.

    Types implementing this class model the recognitions and operations
    (R, ≤, ∧, ∨, ⇒, ⊥, ⊤) from the Treatise.
    """

    @classmethod
    @abstractmethod
    def bottom(cls) -> "HeytingAlgebra":
        """Least recognition ⊥."""

    @classmethod
    @abstractmethod
    def top(cls) -> "HeytingAlgebra":
        """Greatest recognition ⊤."""

    @abstractmethod
    def meet(self, other: "HeytingAlgebra") -> "HeytingAlgebra":
        """Conjunction x ∧ y."""

    @abstractmethod
    def join(self, other: "HeytingAlgebra") -> "HeytingAlgebra":
        """Disjunction x ∨ y."""

    @abstractmethod
    def imp(self, other: "HeytingAlgebra") -> "HeytingAlgebra":
        """Heyting implication x ⇒ y."""

    # Derived operation: Heyting negation ¬x := (x ⇒ ⊥).
    def neg(self) -> "HeytingAlgebra":
        """Relative negation with respect to ⊥."""
        bottom = type(self).bottom()
        return self.imp(bottom)


A_co = TypeVar("A_co", bound=HeytingAlgebra, covariant=True)


class MonotoneEndomap(Protocol[A_co]):
    """Monotone endomap on a Heyting algebra.

    This is the shape shared by Reflex, nuclei, flows, and disciplines
    in the Treatise. Specific refinements can add further laws.
    """

    def __call__(self, x: A_co) -> A_co:
        ...

    def preserves_order(self, x: A_co, y: A_co) -> bool:
        """Check the intended monotonicity law on a pair."""
        if x.leq(y):  # type: ignore[arg-type]
            return self(x).leq(self(y))  # type: ignore[arg-type]
        return True


@dataclass(frozen=True)
class RelationalStructure(Generic[A_co, T]):
    """A RelationalStructure packages a carrier and a Reflex endomap."""

    reflex: MonotoneEndomap[A_co]


@dataclass(frozen=True)
class BoolHA(HeytingAlgebra):
    """Concrete Heyting algebra carried by Python booleans.

    False is ⊥, True is ⊤. This is useful for examples and tests.
    """

    value: bool

    def __repr__(self) -> str:  # pragma: no cover - cosmetic
        return f"BoolHA({self.value})"

    # Preorder
    def leq(self, other: "BoolHA") -> bool:
        # x ≤ y iff (¬x) ∨ y
        return (not self.value) or other.value

    # Heyting algebra operations
    @classmethod
    def bottom(cls) -> "BoolHA":
        return cls(False)

    @classmethod
    def top(cls) -> "BoolHA":
        return cls(True)

    def meet(self, other: "BoolHA") -> "BoolHA":
        return BoolHA(self.value and other.value)

    def join(self, other: "BoolHA") -> "BoolHA":
        return BoolHA(self.value or other.value)

    def imp(self, other: "BoolHA") -> "BoolHA":
        return BoolHA((not self.value) or other.value)


class IdentityReflex(MonotoneEndomap[BoolHA]):
    """Trivial Reflex endomap on BoolHA (identity)."""

    def __call__(self, x: BoolHA) -> BoolHA:
        return x


def bool_relational_structure() -> RelationalStructure[BoolHA, IdentityReflex]:
    """Convenience constructor for the Boolean RelationalStructure."""
    return RelationalStructure(reflex=IdentityReflex())


def bool_ha_elements() -> list[BoolHA]:
    """All elements of the Boolean Heyting algebra."""
    return [BoolHA.bottom(), BoolHA.top()]


@dataclass(frozen=True)
class ThreeHA(HeytingAlgebra):
    """Three-element Heyting algebra 0 < 1 < 2.

    This is a simple non-Boolean Heyting algebra useful for tests of
    implication and residuation beyond the Boolean case.
    """

    value: int

    def __post_init__(self) -> None:
        if self.value not in (0, 1, 2):
            raise ValueError("ThreeHA value must be 0, 1, or 2")

    def __repr__(self) -> str:  # pragma: no cover - cosmetic
        return f"ThreeHA({self.value})"

    # Preorder
    def leq(self, other: "ThreeHA") -> bool:
        return self.value <= other.value

    # Heyting algebra operations on a finite chain.
    @classmethod
    def bottom(cls) -> "ThreeHA":
        return cls(0)

    @classmethod
    def top(cls) -> "ThreeHA":
        return cls(2)

    def meet(self, other: "ThreeHA") -> "ThreeHA":
        return ThreeHA(min(self.value, other.value))

    def join(self, other: "ThreeHA") -> "ThreeHA":
        return ThreeHA(max(self.value, other.value))

    def imp(self, other: "ThreeHA") -> "ThreeHA":
        # On a finite chain, a ⇒ b = top when a ≤ b, otherwise b.
        if self.value <= other.value:
            return ThreeHA.top()
        return other


def three_ha_elements() -> list[ThreeHA]:
    """All elements of the ThreeHA carrier."""
    return [ThreeHA(0), ThreeHA(1), ThreeHA(2)]


class ThreeReflex(MonotoneEndomap[ThreeHA]):
    """Reflex endomap on ThreeHA, acting like the ThreeStepFlow."""

    def __call__(self, x: ThreeHA) -> ThreeHA:
        if x.value == 0:
            return ThreeHA(1)
        return x


def three_relational_structure() -> RelationalStructure[ThreeHA, ThreeReflex]:
    """Convenience constructor for the ThreeHA RelationalStructure."""
    return RelationalStructure(reflex=ThreeReflex())
