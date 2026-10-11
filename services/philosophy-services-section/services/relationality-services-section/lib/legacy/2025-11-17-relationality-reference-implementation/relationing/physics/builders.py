"""
Helpers for constructing profile-level physical systems.

These functions are small, finite realisations of the
ProfilePhysics(Filter) construction from the Relational Core notes:
starting from a global RelationalPhysicalSystem and a compatible
Filter, we build a ProfilePhysicalSystem on the Filter-induced
FiniteProfile by restricting the flow, nuclei, and observables.
"""

from __future__ import annotations

from typing import Iterable, List, TypeVar

from relationing.geometry import Filter, Flow, Nucleus
from relationing.physics import Observable, ProfilePhysicalSystem, RelationalPhysicalSystem
from relationing.profiles.geometry.profiles import FiniteProfile, finite_profile_from_filter
from relationing.structure import HeytingAlgebra, MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)
R = TypeVar("R", bound=MonotoneEndomap[A])
F = TypeVar("F", bound=Flow[A])
N = TypeVar("N", bound=Nucleus[A])
O = TypeVar("O", bound=Observable[A])


def profile_physical_system_from_filter(
    system: RelationalPhysicalSystem[A, R, F, N, O],
    filter_: Filter[A],
    carrier: Iterable[A],
) -> ProfilePhysicalSystem[A, F, N, O]:
    """Build a ProfilePhysicalSystem induced by a Filter on a global system.

    In the finite setting this mirrors the ProfilePhysics(Filter)
    construction from the Relational Core notes:

      - Profile(Filter) is the fixed-point profile of the Filter;
      - the flow and nuclei are restricted to that profile; and
      - observables are reused on the restricted states.

    Here we assume that ``filter_`` is compatible with the system's
    geometry (commutes with Reflex, nuclei, and flow) as in the
    Filter-induced reconstruction theorem; this helper does not
    re-check those laws, but tests and examples do so on small
    carriers.
    """

    profile: FiniteProfile[A] = finite_profile_from_filter(filter_, carrier)
    # Flow, nuclei, and observables are reused; invariance/compatibility
    # are properties of the Filter relative to the system and carrier.
    flow: F = system.flow
    nuclei: List[N] = list(system.nuclei)
    observables: List[O] = list(system.observables)
    return ProfilePhysicalSystem(profile=profile, flow=flow, nuclei=nuclei, observables=observables)


__all__ = ["profile_physical_system_from_filter"]


def nested_profile_physical_system_from_filter(
    base_system: ProfilePhysicalSystem[A, F, N, O],
    nested_filter: Filter[A],
) -> ProfilePhysicalSystem[A, F, N, O]:
    """Restrict a ProfilePhysicalSystem further via a Filter on its profile.

    This is the finite analogue of applying a second Filter on
    ProfileGeom(Filter) as in the nested profile construction of the
    Relational Core notes: starting from a base Profile, we apply a
    Filter on that profile's recognitions and take its fixed points as
    the nested profile.
    """

    nested_elems = {x for x in base_system.profile.elements if nested_filter(x) == x}
    nested_profile = FiniteProfile(nested_elems)
    flow: F = base_system.flow
    nuclei: List[N] = list(base_system.nuclei)
    observables: List[O] = list(base_system.observables)
    return ProfilePhysicalSystem(
        profile=nested_profile,
        flow=flow,
        nuclei=nuclei,
        observables=observables,
    )

