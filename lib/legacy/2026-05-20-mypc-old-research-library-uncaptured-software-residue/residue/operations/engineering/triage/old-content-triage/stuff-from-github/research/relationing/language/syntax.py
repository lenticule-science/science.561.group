"""
Relational Language (λ_R) syntax aggregate.

This module re-exports the core syntactic pieces from more atomic
submodules so that existing imports from `relationing.language.syntax`
continue to work.
"""

from __future__ import annotations

from relationing.language.context import Binding, Context
from relationing.language.errors import TypeError
from relationing.language.terms import Term, Var
from relationing.language.types import Type, TypeKind

__all__ = ["TypeKind", "Type", "Var", "Term", "Binding", "Context", "TypeError"]

