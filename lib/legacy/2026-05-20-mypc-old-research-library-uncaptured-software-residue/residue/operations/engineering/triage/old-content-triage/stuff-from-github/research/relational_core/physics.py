"""
Relational Physics layer (Python).

Provides thin abstractions for interpreting a RelationalGeometry as a
physical semantics: systems as geometries, states as recognitions,
observables as distinguished recognitions or operations, and flow as
dynamics.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, List, Protocol, TypeVar

from .geometry import Flow, Nucleus
from .profiles import FiniteProfile
from .structure import HeytingAlgebra, MonotoneEndomap, RelationalStructure


A = TypeVar("A", bound=HeytingAlgebra)
R = TypeVar("R", bound=MonotoneEndomap[A])
F = TypeVar("F", bound=Flow[A])
N = TypeVar("N", bound=Nucleus[A])


class Observable(Protocol[A]):
    """Observable as a function on recognitions."""

    def evaluate(self, state: A):
        ...


O = TypeVar("O", bound=Observable[A])


@dataclass
class RelationalPhysicalSystem(Generic[A, R, F, N, O]):
    """Bundle a geometry with flow, nuclei, and observables."""

    structure: RelationalStructure[A, R]
    flow: F
    nuclei: List[N]
    observables: List[O]

    def evolve(self, state: A) -> A:
        """Step the system forward along its flow."""
        return self.flow(state)


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

