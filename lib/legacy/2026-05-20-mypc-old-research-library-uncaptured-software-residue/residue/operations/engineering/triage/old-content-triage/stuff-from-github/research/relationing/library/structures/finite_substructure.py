from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Iterable, Sequence, Set, TypeVar

from relationing.core.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class FiniteSubstructure(Generic[A]):
    """A finite Heyting-closed substructure of a carrier."""

    elements: Set[A]

    def is_closed_under_operations(self) -> bool:
        """Naively check closure under ∧, ∨, ⇒ within ``elements``."""
        elems: Sequence[A] = list(self.elements)
        if not elems:
            return True
        for x in elems:
            for y in elems:
                if x.meet(y) not in self.elements:
                    return False
                if x.join(y) not in self.elements:
                    return False
                if x.imp(y) not in self.elements:
                    return False
        bottom = type(elems[0]).bottom()
        top = type(elems[0]).top()
        return bottom in self.elements and top in self.elements

    @classmethod
    def from_elements(cls, elements: Iterable[A]) -> "FiniteSubstructure[A]":
        return cls(set(elements))


__all__ = ["FiniteSubstructure", "A"]

