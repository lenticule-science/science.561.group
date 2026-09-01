"""
Relational morphisms and finite substructures.

This module adds algebraic structure on top of HeytingAlgebra values,
following the Relationality notes' RelationalMorphism and Substructure concepts.
"""

from __future__ import annotations

from relationing.library.structures.finite_substructure import (
    FiniteSubstructure,
    A,
)
from relationing.library.structures.relational_morphism import (
    IdentityMorphism,
    RelationalMorphism,
    A_contra,
    B_co,
)


__all__ = [
    "RelationalMorphism",
    "IdentityMorphism",
    "FiniteSubstructure",
    "A_contra",
    "B_co",
    "A",
]
