"""
Profile-level RelationalPhysicalSystem.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Sequence, TypeVar

from relationing.core.geometry import Flow, Nucleus
from .observable import Observable
from relationing.library.profiles.geometry.profiles import FiniteFixedProfile
from relationing.core.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass
class ProfilePhysicalSystem(Generic[A]):
    """Physical system restricted to a finite fixed-point profile."""

    profile: FiniteFixedProfile[A]
    flow: Flow[A]
    nuclei: Sequence[Nucleus[A]]
    observables: Sequence[Observable[A]]

    def evolve(self, state: A) -> A:
        """Step the system forward along its flow (assumed profile-invariant)."""
        return self.flow(state)


__all__ = ["ProfilePhysicalSystem"]
