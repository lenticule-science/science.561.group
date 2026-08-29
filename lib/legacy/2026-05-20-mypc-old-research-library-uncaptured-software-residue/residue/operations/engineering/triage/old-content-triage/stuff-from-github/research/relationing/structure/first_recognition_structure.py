from __future__ import annotations

from typing import TypeVar

from relationing.structure.heyting_algebra import HeytingAlgebra
from relationing.structure.monotone_endomap import MonotoneEndomap
from relationing.structure.relational_structure import RelationalStructure


A_co = TypeVar("A_co", bound=HeytingAlgebra)


def first_recognition_structure(
    structure: RelationalStructure[A_co, MonotoneEndomap[A_co]],
) -> RelationalStructure[A_co, MonotoneEndomap[A_co]]:
    """View a RelationalStructure as arising from a first recognition.

    This helper does not change the underlying carrier or Reflex; it
    exists to make explicit, in code, the idea that the given
    RelationalStructure can be read as the result of a Reflex Emergence
    from Relationlessness followed by identification of recognitions
    with elements of the carrier.
    """

    return structure


__all__ = ["first_recognition_structure"]
