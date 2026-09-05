from __future__ import annotations

from abc import ABC, abstractmethod

from relationing.structure.preorder import Preorder


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


__all__ = ["HeytingAlgebra"]

