"""
Profile-level RelationalPhysicalSystem.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, List, TypeVar

from relationing.geometry import Flow, Nucleus
from relationing.physics.observable import Observable
from relationing.profiles.geometry.profiles import FiniteProfile
from relationing.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)
F = TypeVar("F", bound=Flow[A])
N = TypeVar("N", bound=Nucleus[A])
O = TypeVar("O", bound=Observable[A])


@dataclass
class ProfilePhysicalSystem(Generic[A, F, N, O]):
    """Physical system restricted to a finite profile."""

    profile: FiniteProfile[A]
    flow: F
    nuclei: List[N]
    observables: List[O]

    def evolve(self, state: A) -> A:
        """Step the system forward along its flow (assumed profile-invariant)."""
        return self.flow(state)


__all__ = ["ProfilePhysicalSystem"]

