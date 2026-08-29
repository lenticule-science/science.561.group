from __future__ import annotations

from typing import Generic, Protocol, TypeVar, cast

from relationing.core.structure import HeytingAlgebra


A_contra = TypeVar("A_contra", bound=HeytingAlgebra, contravariant=True)
B_co = TypeVar("B_co", bound=HeytingAlgebra, covariant=True)
A = TypeVar("A", bound=HeytingAlgebra)


class RelationalMorphism(Protocol[A_contra, B_co]):
    """A map between Heyting algebras intended to preserve structure."""

    def __call__(self, x: A_contra) -> B_co:
        ...

    def preserves_bounds(self, bottom_a: A_contra, top_a: A_contra) -> bool:
        """Check that ⊥, ⊤ are preserved."""
        bottom_b = type(self(bottom_a)).bottom()
        top_b = type(self(top_a)).top()
        return self(bottom_a).leq(bottom_b) and self(top_a).geq(top_b)

    def preserves_meet(self, x: A_contra, y: A_contra) -> bool:
        """Check f(x ∧ y) = f(x) ∧ f(y)."""
        fx = self(x)
        fy = self(y)
        lhs = self(cast(A_contra, x.meet(y)))
        rhs = fx.meet(fy)
        return lhs.leq(rhs) and rhs.leq(lhs)

    def preserves_join(self, x: A_contra, y: A_contra) -> bool:
        """Check f(x ∨ y) = f(x) ∨ f(y)."""
        fx = self(x)
        fy = self(y)
        lhs = self(cast(A_contra, x.join(y)))
        rhs = fx.join(fy)
        return lhs.leq(rhs) and rhs.leq(lhs)

    def preserves_imp_inequality(self, x: A_contra, y: A_contra) -> bool:
        """Check f(x ⇒ y) ≤ f(x) ⇒ f(y)."""
        lhs = self(cast(A_contra, x.imp(y)))
        rhs = self(x).imp(self(y))
        return lhs.leq(rhs)


class IdentityMorphism(Generic[A]):
    """Identity map on a Heyting algebra."""

    def __call__(self, x: A) -> A:
        return x

    def preserves_meet(self, x: A, y: A) -> bool:
        return True

    def preserves_join(self, x: A, y: A) -> bool:
        return True

    def preserves_imp_inequality(self, x: A, y: A) -> bool:
        return True


__all__ = ["RelationalMorphism", "IdentityMorphism", "A_contra", "B_co", "A"]

