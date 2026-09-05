from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Mapping, Sequence, TypeVar

from .heyting_algebra import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class EventualEquivalenceQuotient(Generic[A]):
    """Finite quotient carrier under eventual equivalence ≡_S."""

    classes: Sequence[frozenset[A]]
    representative_of: Mapping[A, frozenset[A]]

    def class_of(self, x: A) -> frozenset[A]:
        """Return the ≡_S-equivalence class containing x."""
        cls = self.representative_of.get(x)
        if cls is None:
            raise KeyError("element not in quotient carrier")
        return cls


__all__ = ["EventualEquivalenceQuotient", "A"]

