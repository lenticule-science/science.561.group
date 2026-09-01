from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Sequence, Set, TypeVar, cast

from relationing.core.geometry import Flow, Nucleus
from relationing.core.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class FiniteFixedProfile(Generic[A]):
    """Finite fixed-point profile of recognitions.

    Intended to represent a Profile(Filter) on a finite carrier: a
    stable, Heyting-closed substructure plus inherited flow/nuclei.
    """

    elements: Set[A]

    def is_heyting_closed(self) -> bool:
        """Check closure under ∧, ∨, ⇒.

        The profile is treated as carrying its own ⊥, ⊤ given by the
        meet/join of all elements, rather than requiring the global
        carrier's bounds to lie inside the profile.
        """
        elems: Sequence[A] = list(self.elements)
        if not elems:
            return False
        bottom = elems[0]
        top = elems[0]
        for x in elems[1:]:
            bottom = cast(A, bottom.meet(x))
            top = cast(A, top.join(x))
        if bottom not in self.elements or top not in self.elements:
            return False
        for x in elems:
            for y in elems:
                if x.meet(y) not in self.elements:
                    return False
                if x.join(y) not in self.elements:
                    return False
                if x.imp(y) not in self.elements:
                    return False
        return True

    def is_flow_invariant(self, flow: Flow[A]) -> bool:
        """Check that the flow restricts to the profile."""
        return all(flow(x) in self.elements for x in self.elements)

    def is_nucleus_invariant(self, nu: Nucleus[A]) -> bool:
        """Check that the nucleus restricts to the profile."""
        return all(nu(x) in self.elements for x in self.elements)


__all__ = ["FiniteFixedProfile"]
