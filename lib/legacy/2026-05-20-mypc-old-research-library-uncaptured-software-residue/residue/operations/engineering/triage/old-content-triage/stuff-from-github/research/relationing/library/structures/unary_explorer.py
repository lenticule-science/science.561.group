"""
Exploration of unary λ_R A ⇒ A operators over small fragments.

This module provides helper APIs to systematically explore unary
implicational types A ⇒ A over a finite fragment (typically one atom
and bounded depth), check validity/top-ness/inhabitation, and expose
canonical inhabitants. It is intended as an exploratory tool for the
Reflex-friendly fragment described in the Relational Core notes, not
as a core export-surface.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import List, Optional, Sequence, TypeVar, cast

from relationing.core.language import Context, Type, TypeKind, Term, Var
from relationing.core.geometry import Discipline
from relationing.core.structure import (
    HeytingAlgebra,
    MonotoneEndomap,
    RelationalStructure,
)
from relationing.library.structures.proof_search import (
    SearchContext,
    check_inhabited,
    find_term,
    is_implicational,
)
from relationing.library.structures.semantics import (
    is_sequent_valid_in_models,
    typed_unary_lambda_as_endomap,
)
from relationing.library.structures.syntactic_model import (
    build_finite_syntactic_model,
    enumerate_types,
    equivalent_types,
)


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class UnaryFragment:
    """Finite fragment specification for unary A ⇒ A exploration."""

    atom: str
    type_depth: int
    model_height: int
    proof_search_depth: int

    @staticmethod
    def small_implicational_fragment(atom: str = "p") -> "UnaryFragment":
        """Canonical tiny fragment over a single atom.

        This fragment uses:
        - type_depth = 1,
        - model_height = 1,
        - proof_search_depth = 3,
        matching the smallest worked examples in tests and docs.
        """

        return UnaryFragment(
            atom=atom,
            type_depth=1,
            model_height=1,
            proof_search_depth=3,
        )


def _is_unary_arrow_a_to_a(ty: Type) -> bool:
    """Return True when ty is of the form A ⇒ A."""

    if ty.kind != TypeKind.IMP or ty.left is None or ty.right is None:
        return False
    return ty.left == ty.right


def find_unary_ops(
    fragment: UnaryFragment,
    models: Sequence[Sequence[HeytingAlgebra]],
) -> List[UnaryOpAnalysisModels]:
    """Explore unary A ⇒ A operators over a specified finite fragment.

    ``fragment`` packages the atom name, type fragment depth,
    syntactic-model height, and proof-search depth. For each candidate
    implicational type A ⇒ A built from that fragment, this function
    checks:

    - validity uniformly across a caller-supplied family of finite
      Heyting models;
    - whether it is top in the finite syntactic model; and
    - whether it is inhabited by the proof search.
    """

    return find_unary_ops_in_models(fragment, models)


@dataclass(frozen=True)
class UnaryOpAnalysisModels:
    """Unary A ⇒ A analysis relative to explicit semantic models."""

    domain: Type
    goal: Type
    inhabitant: Optional[Term]
    valid_in_all_models: bool
    top_in_model: bool
    inhabited: bool

    @property
    def reflex_triangle_holds(self) -> bool:
        """Validity ⇔ top ⇔ inhabitation (on the explored fragment)."""

        return self.valid_in_all_models and self.top_in_model and self.inhabited


def find_unary_ops_in_models(
    fragment: UnaryFragment,
    models: Sequence[Sequence[HeytingAlgebra]],
) -> List[UnaryOpAnalysisModels]:
    """Explore unary A ⇒ A operators relative to explicit models.

    ``models`` is a sequence of finite Heyting carriers. For each
    unary implicational type A ⇒ A in the fragment we check:

    - validity in every model in ``models`` via
      :func:`is_sequent_valid_in_models`;
    - whether it is top in the finite syntactic model; and
    - whether it is inhabited by proof search.
    """

    atoms: Sequence[str] = [fragment.atom]
    all_types = enumerate_types(atoms, fragment.type_depth)
    model = build_finite_syntactic_model(atoms, fragment.model_height)

    analyses: List[UnaryOpAnalysisModels] = []

    for domain in all_types:
        goal = Type.imp(domain, domain)
        if not is_implicational(goal):
            continue

        valid_in_all = is_sequent_valid_in_models(
            assumptions=[],
            conclusion=goal,
            models=models,
            atom_names=atoms,
        )
        top_in_model = equivalent_types(goal, model.top.repr, atoms)

        inhabited = check_inhabited(goal, max_depth=fragment.proof_search_depth)
        inhabitant: Optional[Term] = None
        if inhabited:
            search_ctx = SearchContext.empty()
            inhabitant = find_term(
                goal,
                max_depth=fragment.proof_search_depth,
                ctx=search_ctx,
            )

        analyses.append(
            UnaryOpAnalysisModels(
                domain=domain,
                goal=goal,
                inhabitant=inhabitant,
                valid_in_all_models=valid_in_all,
                top_in_model=top_in_model,
                inhabited=inhabited,
            )
        )

    return analyses


def triangle_unary_ops(
    fragment: UnaryFragment,
    models: Sequence[Sequence[HeytingAlgebra]],
) -> List[UnaryOpAnalysisModels]:
    """Return unary A ⇒ A operators where the triangle holds.

    Filters :func:`find_unary_ops_in_models` results down to those
    where:
    - the operator is valid in all supplied models;
    - it is top in the syntactic model at the given depth; and
    - it is inhabited by proof search.
    """

    analyses = find_unary_ops_in_models(fragment, models)
    filtered: List[UnaryOpAnalysisModels] = []
    for a in analyses:
        if not a.reflex_triangle_holds or a.inhabitant is None:
            continue
        term = a.inhabitant
        if term.tag != "lam":
            continue
        param, body = cast(tuple[Var, Term], term.value)
        # For the triangle catalogue we only keep simple unary λ-terms
        # (one visible parameter, non-lambda body), which match the
        # endomap interpretation used in the Geometry layer.
        from relationing.language import Term as _Term, Var as _Var  # local import

        if not isinstance(param, _Var) or not isinstance(body, _Term):
            continue
        if body.tag == "lam":
            continue
        filtered.append(a)
    return filtered


def analysis_to_discipline_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    analysis: UnaryOpAnalysisModels,
) -> Discipline[A]:
    """Interpret a unary analysis as a Discipline in a structure.

    This helper assumes:
    - `analysis.inhabitant` is a unary λ-term inhabiting A ⇒ A;
    - `analysis.domain` is the corresponding A; and
    - the structure provides the Reflex endomap used for semantics.

    It reconstructs the typing context from the λ-parameter and
    delegates to `typed_unary_lambda_as_endomap`, yielding a
    Reflex-aware Discipline on recognitions.
    """

    if analysis.inhabitant is None:
        raise ValueError(
            "analysis_to_discipline_in_structure requires an inhabitant term"
        )
    lam = analysis.inhabitant
    if lam.tag != "lam":
        raise TypeError("analysis inhabitant must be a lambda term")
    param, _ = cast(tuple[Var, Term], lam.value)
    if not isinstance(param, Var):
        raise TypeError("malformed lambda term in analysis")

    ctx = Context.empty().extend(param, analysis.domain)
    # typed_unary_lambda_as_endomap rechecks that the inferred type is A ⇒ A.
    return typed_unary_lambda_as_endomap(structure, ctx, lam)


def triangle_unary_disciplines_over_atom(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    atom: str,
    max_depth_types: int,
    max_depth_model: int,
    search_depth: int,
    models: Sequence[Sequence[HeytingAlgebra]],
) -> List[Discipline[A]]:
    """Backwards-compatible wrapper for triangle_unary_disciplines.

    New callers should prefer the fragment-based
    :func:`triangle_unary_disciplines` API.
    """

    fragment = UnaryFragment(
        atom=atom,
        type_depth=max_depth_types,
        model_height=max_depth_model,
        proof_search_depth=search_depth,
    )
    return triangle_unary_disciplines(structure, fragment, models)


def triangle_unary_disciplines(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    fragment: UnaryFragment,
    models: Sequence[Sequence[HeytingAlgebra]],
) -> List[Discipline[A]]:
    """Build Disciplines from all unary triangle operators over a given atom.

    This is a small bridge between the unary metatheory triangle and
    the Geometry layer: for each UnaryOpAnalysis returned by
    :func:`triangle_unary_ops`, we interpret its canonical inhabitant
    as a Discipline on the given structure using
    analysis_to_discipline_in_structure.
    """

    analyses = triangle_unary_ops(fragment, models)
    disciplines: List[Discipline[A]] = []
    for analysis in analyses:
        if not analysis.inhabitant:
            continue
        disc = analysis_to_discipline_in_structure(structure, analysis)
        disciplines.append(disc)
    return disciplines
