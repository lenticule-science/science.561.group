"""
Filters and finite profiles.

This module builds on the Geometry layer to provide concrete finite
profiles: stable domains of recognitions induced by Filters, in the
spirit of the Treatise's Profile and Composite Profile constructions.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Iterable, Sequence, Set, TypeVar

from relationing.geometry import Discipline, Filter, Flow, Nucleus
from relationing.structure import HeytingAlgebra, MonotoneEndomap
from relationing.structure.iteration import eventual_limit


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


def finite_profile_from_discipline(
    discipline: Discipline[A],
    carrier: Iterable[A],
) -> FiniteProfile[A]:
    """Construct the finite profile of fixed points of a Discipline.

    This generalises `finite_profile_from_filter` to any Discipline,
    using its fixed-point set as the profile elements.
    """

    elems: Set[A] = set(carrier)
    fixed = {x for x in elems if discipline(x) == x}
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


def is_discipline_filter_compatible(
    discipline: Discipline[A],
    filter_: Filter[A],
    carrier: Iterable[A],
) -> bool:
    """Check that a Discipline is gated by a Filter on a carrier.

    Intended reading (in the finite setting):
    - the Filter's fixed‑point profile is stable under the Discipline; and
    - the Discipline commutes with the Filter on all recognitions.
    """

    elems: Set[A] = set(carrier)
    for x in elems:
        fx = filter_(x)
        # Fixed points of the Filter must stay inside the profile.
        if fx == x and filter_(discipline(x)) != discipline(x):
            return False
        # Full commutation on the carrier.
        if filter_(discipline(x)) != discipline(filter_(x)):
            return False
    return True


def finite_profile_from_step_fixed_points(
    step: MonotoneEndomap[A],
    carrier: Iterable[A],
    max_steps: int,
) -> FiniteProfile[A]:
    """Finite profile from fixed points of a Reflex step endomap.

    Elements are recognitions whose Reflex-step sequence stabilises at
    a fixed point equal to themselves within `max_steps`.
    """

    elems: Set[A] = set(carrier)
    fixed = {x for x in elems if eventual_limit(step, x, max_steps) == x}
    return FiniteProfile(fixed)


def composite_profile_from_filters(
    filters: Sequence[Filter[A]],
    carrier: Iterable[A],
) -> FiniteProfile[A]:
    """Composite profile induced by a finite family of Filters.

    Given a finite family of Filters (assumed to commute, as in the
    Composite Filter / Composite Profile constructions in the
    Relational Core notes), the composite profile is the intersection
    of their individual profiles:

    Profile({Filter_i}) := ⋂_i Profile(Filter_i).

    On a finite carrier we compute this intersection directly by
    intersecting fixed-point sets. When the Filters commute, this
    coincides with the profile of the composite Filter built by their
    pointwise composition.
    """

    elems: Set[A] = set(carrier)
    if not filters:
        return FiniteProfile(set())
    fixed_sets: list[Set[A]] = []
    for filter_ in filters:
        fixed_sets.append({x for x in elems if filter_(x) == x})
    intersection = set.intersection(*fixed_sets)
    return FiniteProfile(intersection)


def nested_profile_from_filters(
    base_filter: Filter[A],
    nested_filter: Filter[A],
    carrier: Iterable[A],
) -> FiniteProfile[A]:
    """Nested profile induced by a base Filter and a secondary Filter.

    In the finite setting this mirrors the Nested Profile construction
    in the Relational Core notes: given a base Filter F and a "GFilter"
    acting on the ProfileGeom(F), we obtain:

      Profile(GFilter) ⊆ Profile(F).

    Here we compute Profile(F) as the fixed points of ``base_filter``
    on ``carrier``, then restrict ``nested_filter`` to that profile and
    take its fixed points. When ``nested_filter`` is a Filter on
    ProfileGeom(F) in the sense of the notes, this matches the
    theoretical Nested Profile.
    """

    base_profile = finite_profile_from_filter(base_filter, carrier)
    nested_carrier = base_profile.elements
    nested_fixed = {x for x in nested_carrier if nested_filter(x) == x}
    return FiniteProfile(nested_fixed)
