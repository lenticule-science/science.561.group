"""
Constructed RelationalStructures and related tooling.

Includes:
- semantics of λ_R into RelationalStructures,
- finite semantic/syntactic models over types,
- small proof search in the implicational fragment,
- Heyting-algebra morphisms and finite substructures.
"""

from __future__ import annotations

from . import semantics, syntactic_model, proof_search, morphisms

__all__ = ["semantics", "syntactic_model", "proof_search", "morphisms"]
