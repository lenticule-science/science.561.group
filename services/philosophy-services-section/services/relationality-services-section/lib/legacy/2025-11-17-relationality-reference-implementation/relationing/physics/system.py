"""
Global RelationalPhysicalSystem.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, List, TypeVar

from relationing.geometry import Flow, Nucleus
from relationing.physics.observable import Observable
from relationing.structure import HeytingAlgebra, MonotoneEndomap, RelationalStructure


A = TypeVar("A", bound=HeytingAlgebra)
R = TypeVar("R", bound=MonotoneEndomap[A])
F = TypeVar("F", bound=Flow[A])
N = TypeVar("N", bound=Nucleus[A])
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


__all__ = ["RelationalPhysicalSystem"]

