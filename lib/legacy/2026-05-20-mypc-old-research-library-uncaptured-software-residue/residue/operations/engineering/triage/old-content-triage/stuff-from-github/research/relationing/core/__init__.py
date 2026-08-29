"""
Relational Core calculator API.

This module provides a small, stable facade over the underlying
structure, language, and semantics layers so that callers can perform
basic relational calculations without needing to know the full module
layout. It focuses on the finite BoolHA and ThreeHA models used
throughout the tests.
"""

from __future__ import annotations

from typing import Sequence

from relationing.language import Context, Term, Type, TypeError, TypeKind, Var, normalize, type_of
from relationing.structure import (
    BoolHA,
    ThreeHA,
    bool_ha_elements,
    bool_relational_structure,
    three_ha_elements,
    three_relational_structure,
)
from relationing.structures.semantics import (
    denote_closed_in_structure,
    is_sequent_valid,
)


def bool_carrier() -> list[BoolHA]:
    """Finite carrier for BoolHA."""

    return list(bool_ha_elements())


def three_carrier() -> list[ThreeHA]:
    """Finite carrier for ThreeHA."""

    return list(three_ha_elements())


def bool_structure():
    """RelationalStructure on BoolHA with IdentityReflex."""

    return bool_relational_structure()


def three_structure():
    """RelationalStructure on ThreeHA with ThreeReflex."""

    return three_relational_structure()


def bool_sequent_valid(
    assumptions: Sequence[Type],
    conclusion: Type,
    atom_names: Sequence[str],
) -> bool:
    """Check Γ ⊢ A in the BoolHA carrier."""

    return is_sequent_valid(assumptions, conclusion, bool_carrier(), atom_names)


def three_sequent_valid(
    assumptions: Sequence[Type],
    conclusion: Type,
    atom_names: Sequence[str],
) -> bool:
    """Check Γ ⊢ A in the ThreeHA carrier."""

    return is_sequent_valid(assumptions, conclusion, three_carrier(), atom_names)


def denote_in_bool_structure(term: Term) -> BoolHA:
    """Denote a closed term in the BoolHA RelationalStructure."""

    return denote_closed_in_structure(bool_structure(), bool_carrier(), term)


def denote_in_three_structure(term: Term) -> ThreeHA:
    """Denote a closed term in the ThreeHA RelationalStructure."""

    return denote_closed_in_structure(three_structure(), three_carrier(), term)


__all__ = [
    # λ_R surface
    "TypeKind",
    "Type",
    "Var",
    "Term",
    "Context",
    "TypeError",
    "type_of",
    "normalize",
    # Finite carriers and structures
    "BoolHA",
    "ThreeHA",
    "bool_carrier",
    "three_carrier",
    "bool_structure",
    "three_structure",
    # Calculator-style helpers
    "bool_sequent_valid",
    "three_sequent_valid",
    "denote_in_bool_structure",
    "denote_in_three_structure",
]
