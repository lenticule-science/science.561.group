"""
Public entrypoint for constructed RelationalStructures.

This mirrors :mod:`relationing.library.structures` but is exposed as
``relationing.structures`` to align with the layered layout used in the
Relational Mathematics Specification.
"""

from __future__ import annotations

from relationing.library.structures import (
    morphisms,
    proof_search,
    semantics,
    syntactic_model,
)

__all__ = ["semantics", "syntactic_model", "proof_search", "morphisms"]
