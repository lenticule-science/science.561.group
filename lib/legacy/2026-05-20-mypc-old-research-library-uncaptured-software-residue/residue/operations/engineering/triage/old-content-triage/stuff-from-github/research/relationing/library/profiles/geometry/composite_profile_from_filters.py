from __future__ import annotations

from typing import Iterable, Sequence, Set, TypeVar

from relationing.core.geometry import Filter
from relationing.core.structure import HeytingAlgebra

from .finite_profile import FiniteFixedProfile


A = TypeVar("A", bound=HeytingAlgebra)


def composite_profile_from_filters(
    filters: Sequence[Filter[A]],
    carrier: Iterable[A],
) -> FiniteFixedProfile[A]:
    """Composite profile induced by a finite family of Filters.

    Given a finite family of Filters (assumed to commute, as in the
    Composite Filter / Composite Profile constructions in the
    Relational Core notes), the composite profile is the intersection
    of their individual profiles.

    On a finite carrier we compute this intersection directly by
    intersecting fixed-point sets. When the Filters commute, this
    coincides with the profile of the composite Filter built by their
    pointwise composition.
    """

    elems: Set[A] = set(carrier)
    if not filters:
        return FiniteFixedProfile(set())
    fixed_sets: list[Set[A]] = []
    for filter_ in filters:
        fixed_sets.append({x for x in elems if filter_(x) == x})
    intersection = set.intersection(*fixed_sets)
    return FiniteFixedProfile(intersection)


__all__ = ["composite_profile_from_filters"]
