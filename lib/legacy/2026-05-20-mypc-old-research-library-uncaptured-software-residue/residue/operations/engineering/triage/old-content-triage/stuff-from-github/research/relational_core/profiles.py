"""
Filters and finite profiles.

This module builds on the Geometry layer to provide concrete finite
profiles: stable domains of recognitions induced by Filters, in the
spirit of the Treatise's Profile and Composite Profile constructions.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Iterable, Sequence, Set, TypeVar

from .geometry import Filter, Flow, Nucleus
from .structure import HeytingAlgebra, MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class FiniteProfile(Generic[A]):
    """Finite profile of recognitions.

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
        # Compute internal bottom/top by folding meet/join.
        bottom = elems[0]
        top = elems[0]
        for x in elems[1:]:
            bottom = bottom.meet(x)  # type: ignore[assignment]
            top = top.join(x)  # type: ignore[assignment]
        # They are necessarily in `elements` by construction, but we
        # check for sanity.
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


def finite_profile_from_filter(filter_: Filter[A], carrier: Iterable[A]) -> FiniteProfile[A]:
    """Construct the finite profile of fixed points of a Filter."""
    elems: Set[A] = set(carrier)
    fixed = {x for x in elems if filter_(x) == x}
    return FiniteProfile(fixed)


def is_filter_reflex_compatible(
    filter_: Filter[A],
    reflex: MonotoneEndomap[A],
    carrier: Iterable[A],
) -> bool:
    """Check that a Filter commutes with a given Reflex on a carrier."""

    for x in carrier:
        if not filter_.commutes_with_reflex(reflex, x):  # type: ignore[arg-type]
            return False
    return True
