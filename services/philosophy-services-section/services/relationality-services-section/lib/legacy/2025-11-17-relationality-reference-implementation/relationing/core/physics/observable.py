"""
Observable protocol for Relational Physics.
"""

from __future__ import annotations

from typing import Protocol, TypeVar

from relationing.core.structure import HeytingAlgebra


A_contra = TypeVar("A_contra", bound=HeytingAlgebra, contravariant=True)


class Observable(Protocol[A_contra]):
    """Observable as a function on recognitions."""

    def evaluate(self, state: A_contra) -> None:
        ...


__all__ = ["Observable"]
