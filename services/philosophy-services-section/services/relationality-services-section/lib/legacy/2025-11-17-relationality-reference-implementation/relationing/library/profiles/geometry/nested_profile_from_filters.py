from __future__ import annotations

from typing import Iterable, TypeVar

from relationing.core.geometry import Filter
from relationing.core.structure import HeytingAlgebra

from .finite_profile import FiniteFixedProfile
from .finite_profile_from_filter import finite_filter_fixed_profile


A = TypeVar("A", bound=HeytingAlgebra)


def nested_profile_from_filters(
    base_filter: Filter[A],
    nested_filter: Filter[A],
    carrier: Iterable[A],
) -> FiniteFixedProfile[A]:
    """Nested profile induced by a base Filter and a secondary Filter.

    In the finite setting this mirrors the Nested Profile construction
    in the Relational Core notes: given a base Filter ``F`` and a
    ``GFilter`` acting on the ``ProfileGeom(F)``, we obtain:

      ``Profile(GFilter) ⊆ Profile(F)``.
    """

    base_profile = finite_filter_fixed_profile(base_filter, carrier)
    nested_carrier = base_profile.elements
    nested_fixed = {x for x in nested_carrier if nested_filter(x) == x}
    return FiniteFixedProfile(nested_fixed)


__all__ = ["nested_profile_from_filters"]
