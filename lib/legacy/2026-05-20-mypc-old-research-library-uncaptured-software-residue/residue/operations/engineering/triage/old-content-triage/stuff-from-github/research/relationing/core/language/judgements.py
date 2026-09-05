"""
Judgemental layer for the λ_R language.

This module exposes thin wrappers for the equality and ≤ judgements
described in the Relationality notes. For now they are witnessed via
the existing operational and semantic machinery rather than a separate
proof system.
"""

from __future__ import annotations

from typing import Iterable, Sequence

from .context import Context
from .reduction import normalize
from .terms import Term
from .types import Type
from .typing import type_of
from .errors import TypeError as LangTypeError
from relationing.library.structures.semantics import is_sequent_valid_in_models
from relationing.library.structures.syntactic_model import syntactic_leq
from relationing.library.structures.proof_search import is_implicational
from relationing.core.structure import Relationlessness
from relationing.core.structure.finite_powerset_heyting_algebra import (
    FinitePowersetHeytingAlgebra,
    Subset,
)
from relationing.core.structure import HeytingAlgebra


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
    """Semantic ≤ judgement on types in a Relational finite HA.

    We interpret Γ ⊢ A in a finite powerset Heyting algebra built from
    :class:`Relationlessness` and the given `atom_names`, and require
    that for every valuation of atoms into that carrier, the meet of
    the assumptions is below the conclusion.
    """

    void = Relationlessness()
    algebra = FinitePowersetHeytingAlgebra.from_relationlessness(void, atom_names)
    carrier: Sequence[Subset] = algebra.elements

    assumptions = list(assumptions)
    atoms = list(atom_names)

    # Precompute interpretations of assumptions for each valuation.
    for valuation_elems in _finite_valuations(atoms, carrier):
        valuation = {name: elem for name, elem in zip(atoms, valuation_elems)}
        if assumptions:
            acc = algebra.eval_type(assumptions[0], valuation)
            for ty in assumptions[1:]:
                acc = algebra.meet(acc, algebra.eval_type(ty, valuation))
        else:
            acc = algebra.top()
        concl_val = algebra.eval_type(conclusion, valuation)
        if not algebra.leq(acc, concl_val):
            return False
    return True


def _finite_valuations(
    atoms: Sequence[str],
    carrier: Sequence[Subset],
) -> Iterable[Sequence[Subset]]:
    """Finite valuations of atoms into a given carrier."""

    if not atoms:
        yield []
        return
    # Simple product over the carrier for each atom.
    if len(atoms) == 1:
        for elem in carrier:
            yield [elem]
        return
    # Iterative product to avoid importing itertools here.
    valuations: list[list[Subset]] = [[]]
    for _ in atoms:
        new_vals: list[list[Subset]] = []
        for prefix in valuations:
            for elem in carrier:
                new_vals.append(prefix + [elem])
        valuations = new_vals
    for v in valuations:
        yield v


def semantic_type_leq_in_models(
    assumptions: Iterable[Type],
    conclusion: Type,
    models: Sequence[Sequence[HeytingAlgebra]],
    atom_names: Sequence[str],
) -> bool:
    """Semantic ≤ judgement uniformly across explicit finite models.

    This is a generalisation of :func:`semantic_type_leq` where the
    models are supplied explicitly as finite carriers, without baking
    in any particular carrier instances.
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


__all__ = [
    "judgementally_equal",
    "semantic_type_leq",
    "semantic_type_leq_in_models",
    "syntactic_type_leq",
]
