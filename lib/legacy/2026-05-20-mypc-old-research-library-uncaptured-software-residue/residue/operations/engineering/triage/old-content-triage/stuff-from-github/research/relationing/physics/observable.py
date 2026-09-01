"""
Observable protocol for Relational Physics.
"""

from __future__ import annotations

from typing import Protocol, TypeVar

from relationing.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


class Observable(Protocol[A]):
    """Observable as a function on recognitions."""

    def evaluate(self, state: A):
        ...


__all__ = ["Observable"]

