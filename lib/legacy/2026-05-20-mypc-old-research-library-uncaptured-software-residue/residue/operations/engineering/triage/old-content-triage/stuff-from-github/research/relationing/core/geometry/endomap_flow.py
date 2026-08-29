"""
Endomap-backed Flow implementation.

This module provides ``EndomapFlow``, a small wrapper that turns an
arbitrary monotone endomap into a ``Flow`` suitable for use in
Relational Geometry examples.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, TypeVar

from relationing.core.structure import HeytingAlgebra, MonotoneEndomap

from .flow import Flow


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass
class EndomapFlow(Generic[A], Flow[A]):
    """Flow wrapper around a unary endomap/Discipline."""

    endomap: MonotoneEndomap[A]

    def __call__(self, x: A) -> A:
        return self.endomap(x)


__all__ = ["EndomapFlow"]

