from __future__ import annotations

from abc import ABC
from typing import TypeVar

from relationing.core.structure import HeytingAlgebra

from .discipline import Discipline


A = TypeVar("A", bound=HeytingAlgebra)


class Filter(Discipline[A], ABC):
    """Filter notion for Relational Geometry.

    A Discipline whose fixed points define a stable profile (regime)
    and that is intended to commute with nuclei and flow.
    """

    # This class does not add behaviour over `Discipline` yet; it
    # serves as a semantic marker for filters in examples.


__all__ = ["Filter"]
