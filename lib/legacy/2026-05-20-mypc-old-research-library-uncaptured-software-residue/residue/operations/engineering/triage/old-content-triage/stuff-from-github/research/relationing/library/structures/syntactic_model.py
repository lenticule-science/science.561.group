"""
Finite semantic/syntactic Heyting model over λ_R types.

This module constructs a small Heyting algebra whose carrier consists
of equivalence classes of λ_R Types under semantic entailment across a
chosen family of finite Heyting models. It is an executable analogue
of the R_Γ construction in the Relationality notes, restricted to a
finite fragment.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import product
from typing import Dict, List, Sequence, Set, Tuple

from relationing.core.language.types import Type, TypeKind
from relationing.core.structure import Relationlessness
from relationing.core.structure.finite_powerset_heyting_algebra import (
    FinitePowersetHeytingAlgebra,
    Subset,
)
from relationing.library.structures.proof_search import (
    check_inhabited,
    is_implicational,
)


def enumerate_types(atoms: Sequence[str], max_depth: int) -> List[Type]:
    """Enumerate a finite set of λ_R Types up to a given depth.

    This is a simple generator for building a small universe of types
    for the semantic/syntactic model. It includes:
    - atoms
    - ⊥, ⊤
    - and of smaller types
    - or of smaller types
    - implication of smaller types
    """

    base: List[Type] = [Type.bottom(), Type.top()] + [Type.atom(a) for a in atoms]
    if max_depth <= 0:
        return base

    all_types: Set[Tuple] = set()
    result: List[Type] = []

    def key(t: Type) -> Tuple:
        if t.kind == TypeKind.ATOM:
            return ("ATOM", t.atom_name)
        if t.kind in (TypeKind.BOTTOM, TypeKind.TOP):
            return (t.kind.name,)
        if t.left is None or t.right is None:
            raise ValueError("binary type missing operands")
        return (t.kind.name, key(t.left), key(t.right))

    def add(t: Type) -> None:
        k = key(t)
        if k not in all_types:
            all_types.add(k)
            result.append(t)

    for t in base:
        add(t)

    prev_level = base[:]
    for _ in range(max_depth):
        new_level: List[Type] = []
        for a in prev_level:
            for b in prev_level:
                for ctor in (Type.and_, Type.or_, Type.imp):
                    new_level.append(ctor(a, b))
        for t in new_level:
            add(t)
        prev_level = new_level

    return result


def semantic_leq(a: Type, b: Type, atoms: Sequence[str]) -> bool:
    """Semantic entailment a ≤ b in a finite Relational powerset model.

    We say a ≤ b iff for all valuations of atoms into a finite
    Relational powerset Heyting algebra built from
    :class:`Relationlessness` and the given `atoms`, the implication
    a ⇒ b holds. This keeps the construction finite and ties the
    semantics back to exclusion-derived carriers without introducing
    carrier-specific special cases.
    """

    void = Relationlessness()
    algebra = FinitePowersetHeytingAlgebra.from_relationlessness(void, atoms)
    carrier: Sequence[Subset] = algebra.elements

    for valuation_elems in product(carrier, repeat=len(atoms)):
        valuation: Dict[str, Subset] = {
            atom: elem for atom, elem in zip(atoms, valuation_elems)
        }
        a_val = algebra.eval_type(a, valuation)
        b_val = algebra.eval_type(b, valuation)
        if algebra.leq(a_val, b_val) is False:
            return False
    return True


@dataclass(frozen=True)
class TypeClass:
    """Equivalence class of Types under mutual semantic entailment."""

    repr: Type


@dataclass
class FiniteSyntacticModel:
    """Finite Heyting-like structure built from Type equivalence classes."""

    atoms: Sequence[str]
    types: List[Type]
    classes: List[TypeClass]

    def class_of(self, t: Type) -> TypeClass:
        for c in self.classes:
            if equivalent_types(c.repr, t, self.atoms):
                return c
        # Fallback: return a new class (should not happen if `types`
        # is closed under the operations used to form `t`).
        return TypeClass(repr=t)

    def meet(self, a: TypeClass, b: TypeClass) -> TypeClass:
        return self.class_of(Type.and_(a.repr, b.repr))

    def join(self, a: TypeClass, b: TypeClass) -> TypeClass:
        return self.class_of(Type.or_(a.repr, b.repr))

    def imp(self, a: TypeClass, b: TypeClass) -> TypeClass:
        return self.class_of(Type.imp(a.repr, b.repr))

    @property
    def bottom(self) -> TypeClass:
        return self.class_of(Type.bottom())

    @property
    def top(self) -> TypeClass:
        return self.class_of(Type.top())

    # ------------------------------------------------------------------
    # λ_R-defined A ⇒ A endomaps as Disciplines over finite carriers.
    # ------------------------------------------------------------------

    # The previous implementation exposed carrier-specific endomaps
    # here. Those concrete carriers have been removed; callers should
    # instead use the generic λ→Discipline helpers in
    # :mod:`relationing.library.structures.semantics`.


def equivalent_types(a: Type, b: Type, atoms: Sequence[str]) -> bool:
    """Mutual semantic entailment equivalence: a ≤ b and b ≤ a."""

    return semantic_leq(a, b, atoms) and semantic_leq(b, a, atoms)


def syntactic_leq(a: Type, b: Type, max_depth: int) -> bool:
    """Syntactic entailment a ≤_Γ b via inhabitation of a ⇒ b.

    We witness a ≤_Γ b by inhabitation of the arrow type a ⇒ b using
    the existing depth-bounded proof search in the implicational
    fragment. This is a small, fragmentary analogue of the syntactic
    entailment described in the Relationality notes.
    """

    arrow = Type.imp(a, b)
    return check_inhabited(arrow, max_depth=max_depth)


def syntactic_equivalent(a: Type, b: Type, max_depth: int) -> bool:
    """Mutual syntactic entailment equivalence via a ⇒ b and b ⇒ a."""

    return syntactic_leq(a, b, max_depth) and syntactic_leq(b, a, max_depth)


def extended_syntactic_equivalent(
    a: Type,
    b: Type,
    atoms: Sequence[str],
    max_depth: int,
) -> bool:
    """Extended ≡_Γ on a tiny fragment including connectives.

    On purely implicational types we reuse proof-search-based
    `syntactic_equivalent`. For other types (involving ∧, ∨, ⊥, ⊤) we
    fall back to semantic equivalence via `equivalent_types`. This is
    a small, fragmentary extension of R_Γ intended for exploration,
    not a full proof-theoretic account.
    """

    if is_implicational(a) and is_implicational(b):
        return syntactic_equivalent(a, b, max_depth)
    return equivalent_types(a, b, atoms)


@dataclass(frozen=True)
class SyntacticTypeClass:
    """Equivalence class of Types under ≡_Γ (syntactic mutual entailment)."""

    repr: Type


@dataclass
class FiniteSyntacticRecognitionModel:
    """Finite R_Γ-like structure over a small implicational fragment.

    The carrier consists of equivalence classes of Types modulo
    syntactic_equivalent, restricted to implicational types built
    from the given atoms up to a bounded depth.
    """

    atoms: Sequence[str]
    types: List[Type]
    classes: List[SyntacticTypeClass]
    max_depth_proof: int

    def class_of(self, t: Type) -> SyntacticTypeClass:
        for c in self.classes:
            if syntactic_equivalent(c.repr, t, self.max_depth_proof):
                return c
        return SyntacticTypeClass(repr=t)


def build_finite_syntactic_recognition_model(
    atoms: Sequence[str],
    max_depth_types: int,
    max_depth_proof: int,
) -> FiniteSyntacticRecognitionModel:
    """Build a finite syntactic-recognition model R_Γ on an implicational fragment.

    - we enumerate Types up to `max_depth_types`;
    - restrict to implicational types (is_implicational);
    - group them into equivalence classes under syntactic_equivalent
      with proof-search depth `max_depth_proof`.
    """

    all_types = [
        ty for ty in enumerate_types(atoms, max_depth_types) if is_implicational(ty)
    ]
    classes: List[SyntacticTypeClass] = []
    for t in all_types:
        if not any(syntactic_equivalent(t, c.repr, max_depth_proof) for c in classes):
            classes.append(SyntacticTypeClass(repr=t))
    return FiniteSyntacticRecognitionModel(
        atoms=atoms,
        types=all_types,
        classes=classes,
        max_depth_proof=max_depth_proof,
    )


def build_extended_syntactic_recognition_model(
    atoms: Sequence[str],
    max_depth_types: int,
    max_depth_proof: int,
) -> FiniteSyntacticRecognitionModel:
    """Build an extended R_Γ-like model including simple connectives.

    This variant includes all Types up to `max_depth_types` (not just
    pure implication) and groups them into classes using
    `extended_syntactic_equivalent`, which falls back to semantic
    equivalence on non-implicational types.
    """

    all_types = enumerate_types(atoms, max_depth_types)
    classes: List[SyntacticTypeClass] = []
    for t in all_types:
        if not any(
            extended_syntactic_equivalent(t, c.repr, atoms, max_depth_proof)
            for c in classes
        ):
            classes.append(SyntacticTypeClass(repr=t))
    return FiniteSyntacticRecognitionModel(
        atoms=atoms,
        types=all_types,
        classes=classes,
        max_depth_proof=max_depth_proof,
    )


def build_finite_syntactic_model(
    atoms: Sequence[str],
    max_depth: int,
) -> FiniteSyntacticModel:
    """Build a finite semantic/syntactic model over Types."""

    types = enumerate_types(atoms, max_depth)
    classes: List[TypeClass] = []
    for t in types:
        if not any(equivalent_types(t, c.repr, atoms) for c in classes):
            classes.append(TypeClass(repr=t))
    return FiniteSyntacticModel(atoms=atoms, types=types, classes=classes)


def implicational_fragment_agreeing_types(
    atoms: Sequence[str],
    max_depth_types: int,
    max_depth_proof: int,
) -> List[Type]:
    """Compute a small fragment where entailments agree.

    For a given list of atom names and depth bounds, this helper:

    - enumerates all Types up to ``max_depth_types``;
    - restricts to the implicational fragment (``is_implicational``);
    - and incrementally constructs a sub-fragment ``F`` of those
      implicational types for which, for all ``A, B ∈ F``, semantic
      entailment ``semantic_leq(A, B, atoms)`` agrees with syntactic
      entailment ``syntactic_leq(A, B, max_depth_proof)``.

    On the tested fragments (see ``tests/test_syntactic_model.py``),
    the returned list ``F`` is non-empty and provides a finite witness
    that sequent validity in the powerset-based Relational models
    coincides with provability via depth-bounded proof search in the
    implicational λ_R fragment.
    """

    types = [
        ty for ty in enumerate_types(atoms, max_depth_types) if is_implicational(ty)
    ]
    fragment: List[Type] = []
    for candidate in types:
        tentative = fragment + [candidate]
        ok = True
        for a in tentative:
            for b in tentative:
                sem = semantic_leq(a, b, atoms)
                syn = syntactic_leq(a, b, max_depth_proof)
                if sem != syn:
                    ok = False
                    break
            if not ok:
                break
        if ok:
            fragment = tentative
    return fragment
