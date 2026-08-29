"""
λ_R types.

Defines `TypeKind` and `Type` for the Relational Language.
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import Enum, auto
from typing import Optional


class TypeKind(Enum):
    ATOM = auto()
    BOTTOM = auto()
    TOP = auto()
    AND = auto()
    OR = auto()
    IMP = auto()


@dataclass(frozen=True)
class Type:
    kind: TypeKind
    left: Optional["Type"] = None
    right: Optional["Type"] = None

    # For ATOM kinds, `left` and `right` are unused; the atom name is
    # stored in `atom_name`.
    atom_name: Optional[str] = None

    @staticmethod
    def bottom() -> "Type":
        return Type(TypeKind.BOTTOM)

    @staticmethod
    def top() -> "Type":
        return Type(TypeKind.TOP)

    @staticmethod
    def and_(a: "Type", b: "Type") -> "Type":
        return Type(TypeKind.AND, a, b)

    @staticmethod
    def or_(a: "Type", b: "Type") -> "Type":
        return Type(TypeKind.OR, a, b)

    @staticmethod
    def imp(a: "Type", b: "Type") -> "Type":
        return Type(TypeKind.IMP, a, b)

    @staticmethod
    def atom(name: str) -> "Type":
        return Type(TypeKind.ATOM, None, None, atom_name=name)

    @staticmethod
    def neg(a: "Type") -> "Type":
        """Heyting negation ¬A defined as A ⇒ ⊥."""
        return Type.imp(a, Type.bottom())


__all__ = ["TypeKind", "Type"]
