"""
Articulate Relationlessness as an ExclusionRecognition.

This module provides the minimal executable counterpart to the
Articulation Theorem from the Structure part of the Relational
Mathematics Specification: given Relationlessness and a choice of
interior and exterior recognitions, it constructs the corresponding
ExclusionRecognition.
"""

from __future__ import annotations

from typing import TypeVar

from .exclusion_recognition import ExclusionRecognition
from .heyting_algebra import HeytingAlgebra
from .relationlessness import Relationlessness


A = TypeVar("A", bound=HeytingAlgebra)


def articulate_relationlessness(
    _void: Relationlessness,
    interior: A,
    exterior: A,
) -> ExclusionRecognition[A]:
    """Articulate Relationlessness as an ExclusionRecognition.

    Given a (formal) Relationlessness value and a choice of interior
    and exterior recognitions in a Heyting algebra, returns the
    ExclusionRecognition that separates them. This is a direct
    executable analogue of the Articulation Theorem: effective
    articulation manifests as a recognition.
    """

    return ExclusionRecognition(interior=interior, exterior=exterior)


__all__ = ["articulate_relationlessness"]
