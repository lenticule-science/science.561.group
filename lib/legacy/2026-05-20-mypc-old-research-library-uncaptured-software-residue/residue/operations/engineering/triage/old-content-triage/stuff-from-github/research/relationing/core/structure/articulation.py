"""
Articulation and Reflex Emergence (Structure Origination).

This module gives a minimal executable reflection of the Articulation
Theorem and Reflex Emergence Lemma from the Relationality notes:

- Relationlessness carries no recognitions.
- An act of articulation produces at least one ExclusionRecognition.
- Reflex Emergence is the choice of such an articulation as the
  minimal witness from Relationlessness to the first recognition.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, TypeVar

from .articulate_relationlessness import articulate_relationlessness
from .exclusion_recognition import ExclusionRecognition
from .heyting_algebra import HeytingAlgebra
from .relationlessness import Relationlessness


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class ReflexEmergence(Generic[A]):
    """Minimal witness of Reflex Emergence from Relationlessness.

    This wraps the first ExclusionRecognition obtained by articulating
    Relationlessness; further structure (RelationalStructures, Reflex
    steps) can be seen as built on top of such recognitions.
    """

    recognition: ExclusionRecognition[A]


def reflex_emergence(
    void: Relationlessness,
    interior: A,
    exterior: A,
) -> ReflexEmergence[A]:
    """Perform a single Reflex Emergence from Relationlessness.

    This helper packages the articulation of Relationlessness into a
    ReflexEmergence value, mirroring the lemma that there exists an
    act (Reflex) that brings forth the first recognition.
    """

    rec = articulate_relationlessness(void, interior, exterior)
    return ReflexEmergence(recognition=rec)


__all__ = [
    "ReflexEmergence",
    "reflex_emergence",
]
