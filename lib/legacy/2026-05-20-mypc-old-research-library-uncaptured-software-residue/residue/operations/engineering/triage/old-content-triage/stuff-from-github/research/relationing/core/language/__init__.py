"""
Relational Language (λ_R) layer (Python).

This package realises the λ‑like language ``λ_R`` from the Relational
Core notes (see ``docs/relational_core/language.rst``; the legacy
``docs/relational_foundations/language.rst`` tree is kept only for
backwards compatibility of links).  It
provides:

* syntactic categories for types, terms, variables, bindings, and
  typing contexts;
* a typing algorithm ``type_of`` implementing the λ_R typing rules;
* a small‑step reduction and ``normalize`` function for computing
  normal forms; and
* judgemental and semantic preorder checks over types, linking typing
  derivations to finite Heyting models built from
  :mod:`relationing.structure`.

Public users are expected to import these names via
``relationing.language``; this module hosts the core implementation.
"""

from __future__ import annotations

from .binding import Binding
from .context import Context
from .derivation import Derivation
from .errors import TypeError
from .judgements import (
    judgementally_equal,
    semantic_type_leq,
    semantic_type_leq_in_models,
    syntactic_type_leq,
)
from .reduction import normalize, normalize_with_trace
from .reduction_step import ReductionStep
from .terms import Term, Var
from .types import Type, TypeKind
from .typing import type_of, type_of_with_derivation

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
    "ReductionStep",
    "normalize",
    "normalize_with_trace",
    "judgementally_equal",
    "semantic_type_leq",
    "semantic_type_leq_in_models",
    "syntactic_type_leq",
]
