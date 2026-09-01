"""
Public Relational Language (λ_R) entrypoint.

This module re-exports the :mod:`relationing.core.language` surface so
callers can import ``relationing.language`` without depending on the
internal layout.
"""

from __future__ import annotations

from relationing.core.language import (
    Derivation,
    ReductionStep,
    TypeKind,
    Type,
    Var,
    Term,
    Binding,
    Context,
    TypeError,
    type_of,
    type_of_with_derivation,
    normalize,
    normalize_with_trace,
    judgementally_equal,
    semantic_type_leq,
    semantic_type_leq_in_models,
    syntactic_type_leq,
)

__all__ = [
    "TypeKind",
    "Type",
    "Var",
    "Term",
    "Binding",
    "Context",
    "TypeError",
    "Derivation",
    "type_of",
    "type_of_with_derivation",
    "normalize",
    "ReductionStep",
    "normalize_with_trace",
    "judgementally_equal",
    "semantic_type_leq",
    "semantic_type_leq_in_models",
    "syntactic_type_leq",
]
