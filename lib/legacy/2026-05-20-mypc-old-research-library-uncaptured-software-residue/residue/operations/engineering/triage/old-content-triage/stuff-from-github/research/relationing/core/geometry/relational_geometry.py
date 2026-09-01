"""
Concrete ``RelationalGeometry`` container and finite law checkers.

This mirrors the ``RelationalGeometry`` definition in the formal notes
(``docs/relational_core/geometry.rst``) and provides small helpers for
checking, on finite carriers, that a chosen family of nuclei and a flow
respect the required algebraic and compatibility laws.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, Sequence, TypeVar

from relationing.core.structure import (
    HeytingAlgebra,
    MonotoneEndomap,
    RelationalStructure,
)

from .flow import Flow
from .nucleus import Nucleus


T = TypeVar("T", bound=HeytingAlgebra)


@dataclass(frozen=True)
class RelationalGeometry(Generic[T]):
    """Bundle a RelationalStructure with nuclei and a flow."""

    structure: RelationalStructure[T, MonotoneEndomap[T]]
    nuclei: Sequence[Nucleus[T]]
    flow: Flow[T]


__all__ = ["RelationalGeometry"]
