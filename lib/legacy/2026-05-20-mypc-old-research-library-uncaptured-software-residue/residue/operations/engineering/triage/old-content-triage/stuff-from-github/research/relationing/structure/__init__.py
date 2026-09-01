"""
Public Relational Structure entrypoint.

This module mirrors the :mod:`relationing.core.structure` surface so
callers can import ``relationing.structure`` as in the original
layout, while the core definitions live under ``relationing.core``.
"""

from __future__ import annotations

import relationing.core.structure as _core
from relationing.core.structure import (
    Preorder,
    HeytingAlgebra,
    MonotoneEndomap,
    ReflexStep,
    RelationalStructure,
    Relationlessness,
    ExclusionRecognition,
    IdentityReflex,
    articulate_relationlessness,
    ReflexEmergence,
    reflex_emergence,
    iterate_step,
    iterate_sequence,
    stabilization_depth,
    is_persistent,
    eventual_limit,
    baseline_limit,
    baseline_converges,
    eventual_equivalent,
    eventual_equivalence_classes,
    EventualEquivalenceQuotient,
    build_eventual_equivalence_quotient,
    heyting_ops_respect_eventual_equivalence,
    implication_quotient_table,
    implication_total_on_quotient,
)

first_recognition_structure = _core.first_recognition_structure

__all__ = [
    # Algebra
    "Preorder",
    "HeytingAlgebra",
    "MonotoneEndomap",
    "ReflexStep",
    "RelationalStructure",
    "first_recognition_structure",
    # Origin / Exclusion
    "Relationlessness",
    "ExclusionRecognition",
    "IdentityReflex",
    # Articulation / Reflex Emergence
    "articulate_relationlessness",
    "ReflexEmergence",
    "reflex_emergence",
    # Iteration / asymptotics helpers
    "iterate_step",
    "iterate_sequence",
    "stabilization_depth",
    "is_persistent",
    "eventual_limit",
    "baseline_limit",
    "baseline_converges",
    "eventual_equivalent",
    "eventual_equivalence_classes",
    "EventualEquivalenceQuotient",
    "build_eventual_equivalence_quotient",
    "heyting_ops_respect_eventual_equivalence",
    "implication_quotient_table",
    "implication_total_on_quotient",
]
