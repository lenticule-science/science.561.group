"""
Articulation and Reflex Emergence (Structure Origination).

This module gives a minimal executable reflection of the Articulation
Theorem and Reflex Emergence Lemma from the Treatise:

- Relationlessness carries no recognitions.
- An act of articulation produces at least one ExclusionRecognition.
- Reflex Emergence is the choice of such an articulation as the
  minimal witness from Relationlessness to the first recognition.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Generic, TypeVar

from relationing.structure.heyting_algebra import HeytingAlgebra
from relationing.structure.exclusion_recognition import ExclusionRecognition
from relationing.structure.relationlessness import Relationlessness
from relationing.structure.bool_ha_type import BoolHA
from relationing.structure.bool_relational_structure import bool_relational_structure
from relationing.structure.three_ha_type import ThreeHA
from relationing.structure.three_relational_structure import three_relational_structure
from relationing.structure.relational_structure import RelationalStructure


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


def emergence_to_bool_relational_structure(
    _emergence: ReflexEmergence[BoolHA],
) -> RelationalStructure[BoolHA, object]:
    """View BoolHA RelationalStructure as arising from a Reflex Emergence.

    This helper does not construct a new carrier from scratch; rather
    it treats the existing BoolHA RelationalStructure as a concrete
    realisation of a first ExclusionRecognition over BoolHA.
    """

    return bool_relational_structure()  # type: ignore[return-value]


def emergence_to_three_relational_structure(
    _emergence: ReflexEmergence[ThreeHA],
) -> RelationalStructure[ThreeHA, object]:
    """View ThreeHA RelationalStructure as arising from a Reflex Emergence.

    As with the BoolHA case, this helper reuses the existing
    ThreeHA RelationalStructure as a concrete realisation of a first
    ExclusionRecognition over ThreeHA.
    """

    return three_relational_structure()  # type: ignore[return-value]


__all__ = [
    "articulate_relationlessness",
    "ReflexEmergence",
    "reflex_emergence",
    "emergence_to_bool_relational_structure",
    "emergence_to_three_relational_structure",
]
