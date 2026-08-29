"""
Global RelationalPhysicalSystem.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Sequence, TypeVar

from relationing.core.geometry import Flow, Nucleus
from .observable import Observable
from relationing.core.structure import (
    HeytingAlgebra,
    MonotoneEndomap,
    RelationalStructure,
)


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass
class RelationalPhysicalSystem(Generic[A]):
    """Bundle a geometry with flow, nuclei, and observables."""

    structure: RelationalStructure[A, MonotoneEndomap[A]]
    flow: Flow[A]
    nuclei: Sequence[Nucleus[A]]
    observables: Sequence[Observable[A]]

    def evolve(self, state: A) -> A:
        """Step the system forward along its flow."""
        return self.flow(state)


__all__ = ["RelationalPhysicalSystem"]
