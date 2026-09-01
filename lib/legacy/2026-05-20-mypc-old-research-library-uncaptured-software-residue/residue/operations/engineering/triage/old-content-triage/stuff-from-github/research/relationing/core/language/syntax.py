"""
Relational Language (λ_R) syntax aggregate.

This module re-exports the core syntactic pieces from the atomic
submodules in :mod:`relationing.core.language` so that existing
imports from ``relationing.language.syntax`` continue to work.
"""

from __future__ import annotations

from .context import Binding, Context
from .errors import TypeError
from .terms import Term, Var
from .types import Type, TypeKind

__all__ = ["TypeKind", "Type", "Var", "Term", "Binding", "Context", "TypeError"]
