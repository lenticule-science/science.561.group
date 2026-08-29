"""
Relational morphisms and finite substructures.

This module adds algebraic structure on top of HeytingAlgebra values,
following the Treatise's RelationalMorphism and Substructure concepts.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Iterable, Protocol, Sequence, Set, TypeVar

from relationing.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)
B = TypeVar("B", bound=HeytingAlgebra)


class RelationalMorphism(Protocol[A, B]):
    """A map between Heyting algebras intended to preserve structure."""

    def __call__(self, x: A) -> B:
        ...

    def preserves_bounds(self, bottom_a: A, top_a: A) -> bool:
        """Check that ⊥, ⊤ are preserved."""
        return self(bottom_a).leq(type(self(bottom_a)).bottom()) and self(top_a).geq(type(self(top_a)).top())  # type: ignore[attr-defined]

    def preserves_meet(self, x: A, y: A) -> bool:
        """Check f(x ∧ y) = f(x) ∧ f(y)."""
        fx = self(x)
        fy = self(y)
        lhs = self(x.meet(y))  # type: ignore[arg-type]
        rhs = fx.meet(fy)  # type: ignore[arg-type]
        return lhs.leq(rhs) and rhs.leq(lhs)

    def preserves_join(self, x: A, y: A) -> bool:
        """Check f(x ∨ y) = f(x) ∨ f(y)."""
        fx = self(x)
        fy = self(y)
        lhs = self(x.join(y))  # type: ignore[arg-type]
        rhs = fx.join(fy)  # type: ignore[arg-type]
        return lhs.leq(rhs) and rhs.leq(lhs)

    def preserves_imp_inequality(self, x: A, y: A) -> bool:
        """Check f(x ⇒ y) ≤ f(x) ⇒ f(y)."""
        lhs = self(x.imp(y))  # type: ignore[arg-type]
        rhs = self(x).imp(self(y))  # type: ignore[arg-type]
        return lhs.leq(rhs)


class IdentityMorphism(Generic[A]):
    """Identity map on a Heyting algebra."""

    def __call__(self, x: A) -> A:
        return x

    # The following helper methods mirror the RelationalMorphism
    # protocol so that tests can use them uniformly.
    def preserves_meet(self, x: A, y: A) -> bool:
        return True

    def preserves_join(self, x: A, y: A) -> bool:
        return True

    def preserves_imp_inequality(self, x: A, y: A) -> bool:
        return True


@dataclass(frozen=True)
class FiniteSubstructure(Generic[A]):
    """A finite Heyting-closed substructure of a carrier."""

    elements: Set[A]

    def is_closed_under_operations(self) -> bool:
        """Naively check closure under ∧, ∨, ⇒ within `elements`."""
        elems: Sequence[A] = list(self.elements)
        if not elems:
            return True
        # All finite meets/joins/implications stay inside the subset.
        for x in elems:
            for y in elems:
                if x.meet(y) not in self.elements:
                    return False
                if x.join(y) not in self.elements:
                    return False
                if x.imp(y) not in self.elements:
                    return False
        # ⊥ and ⊤ must be present.
        bottom = type(elems[0]).bottom()
        top = type(elems[0]).top()
        return bottom in self.elements and top in self.elements

    @classmethod
    def from_elements(cls, elements: Iterable[A]) -> "FiniteSubstructure[A]":
        return cls(set(elements))
