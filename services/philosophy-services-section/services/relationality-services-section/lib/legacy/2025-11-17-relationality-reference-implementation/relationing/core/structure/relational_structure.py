from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap


A_co = TypeVar("A_co", bound=HeytingAlgebra)
T = TypeVar("T")


@dataclass(frozen=True)
class RelationalStructure(Generic[A_co, T]):
    """A RelationalStructure packages a carrier and a Reflex endomap."""

    reflex: MonotoneEndomap[A_co]


__all__ = ["RelationalStructure"]
