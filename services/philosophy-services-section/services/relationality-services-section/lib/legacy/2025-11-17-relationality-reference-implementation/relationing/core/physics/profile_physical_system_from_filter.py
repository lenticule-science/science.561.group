from __future__ import annotations

from typing import Iterable, Sequence, TypeVar

from relationing.core.geometry import Filter, Nucleus
from relationing.core.structure import HeytingAlgebra
from relationing.library.profiles.geometry.profiles import (
    FiniteFixedProfile,
    finite_filter_fixed_profile,
)

from .observable import Observable
from .profile_system import ProfilePhysicalSystem
from .system import RelationalPhysicalSystem


A = TypeVar("A", bound=HeytingAlgebra)


def profile_physical_system_from_filter(
    system: RelationalPhysicalSystem[A],
    filter_: Filter[A],
    carrier: Iterable[A],
) -> ProfilePhysicalSystem[A]:
    """Build a ProfilePhysicalSystem induced by a Filter on a global system."""

    profile: FiniteFixedProfile[A] = finite_filter_fixed_profile(filter_, carrier)
    flow = system.flow
    nuclei: Sequence[Nucleus[A]] = list(system.nuclei)
    observables: Sequence[Observable[A]] = list(system.observables)
    return ProfilePhysicalSystem(
        profile=profile,
        flow=flow,
        nuclei=list(nuclei),
        observables=list(observables),
    )


__all__ = ["profile_physical_system_from_filter"]
