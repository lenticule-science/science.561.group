from __future__ import annotations

from typing import TypeVar

from relationing.core.geometry import Filter
from relationing.core.structure import HeytingAlgebra
from relationing.library.profiles.geometry.profiles import FiniteFixedProfile

from .profile_system import ProfilePhysicalSystem


A = TypeVar("A", bound=HeytingAlgebra)


def nested_profile_physical_system_from_filter(
    base_system: ProfilePhysicalSystem[A],
    nested_filter: Filter[A],
) -> ProfilePhysicalSystem[A]:
    """Restrict a ProfilePhysicalSystem further via a Filter on its profile."""

    nested_elems = {x for x in base_system.profile.elements if nested_filter(x) == x}
    nested_profile = FiniteFixedProfile(nested_elems)
    flow = base_system.flow
    nuclei = list(base_system.nuclei)
    observables = list(base_system.observables)
    return ProfilePhysicalSystem(
        profile=nested_profile,
        flow=flow,
        nuclei=nuclei,
        observables=observables,
    )


__all__ = ["nested_profile_physical_system_from_filter"]
