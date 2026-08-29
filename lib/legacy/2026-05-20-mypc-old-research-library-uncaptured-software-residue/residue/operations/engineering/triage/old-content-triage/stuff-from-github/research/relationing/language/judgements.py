"""
Judgemental layer for the λ_R language.

This module exposes thin wrappers for the equality and ≤ judgements
described in the Treatise. For now they are witnessed via the existing
operational and semantic machinery rather than a separate proof system.
"""

from __future__ import annotations

from typing import Iterable, Sequence

from relationing.language.context import Context
from relationing.language.reduction import normalize
from relationing.language.terms import Term
from relationing.language.types import Type
from relationing.structures.semantics import is_sequent_valid, is_sequent_valid_in_models
from relationing.structures.syntactic_model import syntactic_leq
from relationing.structures.proof_search import is_implicational
from relationing.language import type_of, TypeError as LangTypeError  # circular-safe import
from relationing.structure import bool_ha_elements, three_ha_elements


def judgementally_equal(ctx: Context, t1: Term, t2: Term, ty: Type) -> bool:
    """Provisional Γ ⊢ t1 ≡ t2 : A judgement.

    We currently require:
    - both t1 and t2 are well-typed at A in context Γ; and
    - their β-normal forms are syntactically equal.

    This matches a β-only definitional equality for λ_R on the tested
    fragment; η and richer equational structure are not yet modelled.
    """

    try:
        ty1 = type_of(ctx, t1)
        ty2 = type_of(ctx, t2)
    except LangTypeError:
        return False
    if ty1 != ty or ty2 != ty or ty1 != ty2:
        return False

    nf1 = normalize(t1)
    nf2 = normalize(t2)
    return nf1.tag == nf2.tag and nf1.value == nf2.value


def semantic_type_leq(
    assumptions: Iterable[Type],
    conclusion: Type,
    atom_names: Sequence[str],
) -> bool:
    """Semantic ≤ judgement on types via sequent validity.

    We interpret `assumptions ≤ conclusion` as the validity of the
    sequent Γ ⊢ A across both BoolHA and ThreeHA, mirroring the
    finite semantic-leq used in the syntactic model.
    """

    carrier_bool = bool_ha_elements()
    carrier_three = three_ha_elements()
    return is_sequent_valid(assumptions, conclusion, carrier_bool, atom_names) and is_sequent_valid(
        assumptions,
        conclusion,
        carrier_three,
        atom_names,
    )


def semantic_type_leq_in_models(
    assumptions: Iterable[Type],
    conclusion: Type,
    models: Sequence[Sequence["HeytingAlgebra"]],  # type: ignore[name-defined]
    atom_names: Sequence[str],
) -> bool:
    """Semantic ≤ judgement uniformly across explicit finite models.

    This is a generalisation of :func:`semantic_type_leq` where the
    models are supplied explicitly as finite carriers, rather than
    being fixed to BoolHA/ThreeHA.
    """

    return is_sequent_valid_in_models(assumptions, conclusion, models, atom_names)


def syntactic_type_leq(a: Type, b: Type, max_depth: int) -> bool:
    """Syntactic ≤_Γ judgement on types via inhabitation of a ⇒ b.

    This is a language-level wrapper around `syntactic_leq`, limited
    to the implicational fragment where proof search is defined.
    """

    if not (is_implicational(a) and is_implicational(b)):
        return False
    return syntactic_leq(a, b, max_depth)


__all__ = ["judgementally_equal", "semantic_type_leq", "semantic_type_leq_in_models", "syntactic_type_leq"]
