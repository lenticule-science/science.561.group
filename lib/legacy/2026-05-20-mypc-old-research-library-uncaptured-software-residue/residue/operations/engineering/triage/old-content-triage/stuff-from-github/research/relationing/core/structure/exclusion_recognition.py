from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, TypeVar

from .heyting_algebra import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class ExclusionRecognition(Generic[A]):
    """Minimal exclusion recognition: "not-with" between two recognitions.

    This is a concrete stand-in for the Exclusion
    Recognition in the Relationality notes: it distinguishes an
    "interior" recognition from an "exterior" recognition by denying
    overlap.
    """

    interior: A
    exterior: A


__all__ = ["ExclusionRecognition", "A"]
