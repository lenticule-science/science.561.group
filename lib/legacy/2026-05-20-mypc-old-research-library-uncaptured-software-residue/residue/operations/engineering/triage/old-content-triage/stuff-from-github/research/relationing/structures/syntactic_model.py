"""
Finite semantic/syntactic Heyting model over λ_R types.

This module constructs a small Heyting algebra whose carrier consists
of equivalence classes of λ_R Types under semantic entailment across a
chosen family of finite Heyting models. It is an executable analogue
of the Treatise's R_Γ construction, restricted to a finite fragment.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import product
from typing import Dict, Iterable, List, Mapping, Sequence, Set, Tuple

from relationing.language import Term, Type, TypeKind
from relationing.structure import (
    BoolHA,
    ThreeHA,
    bool_ha_elements,
    three_ha_elements,
    bool_relational_structure,
    three_relational_structure,
)
from relationing.structures.semantics import (
    interpret_closed_atom_arrow_as_discipline,
    interpret_type,
    is_sequent_valid,
)
from relationing.structures.proof_search import check_inhabited, is_implicational


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
            return ("ATOM", t.atom)
        if t.kind in (TypeKind.BOTTOM, TypeKind.TOP):
            return (t.kind.name,)
        return (t.kind.name, key(t.left), key(t.right))  # type: ignore[arg-type]

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
    """Semantic entailment a ≤ b across BoolHA and ThreeHA.

    We say a ≤ b iff for all valuations of atoms into BoolHA and ThreeHA,
    the sequent a ⊢ b is valid.
    """

    carriers = (bool_ha_elements(), three_ha_elements())
    for carrier in carriers:
        if not is_sequent_valid(
            assumptions=[a],
            conclusion=b,
            carrier=carrier,
            atom_names=atoms,
        ):
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

    def interpret_atom_arrow_as_endomaps(
        self,
        atom_name: str,
        lam_term: Term,
    ) -> Tuple[
        Tuple[BoolHA, BoolHA],
        Tuple[ThreeHA, ThreeHA],
    ]:
        """Interpret a closed λ-term of type p ⇒ p as endomaps.

        Given an atom name p and a λ_R term inhabiting p ⇒ p (relative
        to some search or typing context), build its Discipline
        semantics over BoolHA and ThreeHA and return their action on
        the finite carriers as ((f_bool(⊥), f_bool(⊤)),
        (f_three(0), f_three(1))) for quick inspection.

        This is a thin bridge from the finite syntactic model to the
        λ_R→Discipline semantics used elsewhere.
        """

        bool_struct = bool_relational_structure()
        three_struct = three_relational_structure()

        disc_bool = interpret_closed_atom_arrow_as_discipline(bool_struct, atom_name, lam_term)
        disc_three = interpret_closed_atom_arrow_as_discipline(three_struct, atom_name, lam_term)

        bool_elems = bool_ha_elements()
        three_elems = three_ha_elements()

        bool_bottom, bool_top = bool_elems[0], bool_elems[1]
        three_zero, three_one = three_elems[0], three_elems[1]

        return (
            (disc_bool(bool_bottom), disc_bool(bool_top)),
            (disc_three(three_zero), disc_three(three_one)),
        )


def equivalent_types(a: Type, b: Type, atoms: Sequence[str]) -> bool:
    """Mutual semantic entailment equivalence: a ≤ b and b ≤ a."""

    return semantic_leq(a, b, atoms) and semantic_leq(b, a, atoms)


def syntactic_leq(a: Type, b: Type, max_depth: int) -> bool:
    """Syntactic entailment a ≤_Γ b via inhabitation of a ⇒ b.

    We witness a ≤_Γ b by inhabitation of the arrow type a ⇒ b using
    the existing depth-bounded proof search in the implicational
    fragment. This is a small, fragmentary analogue of the Treatise's
    syntactic entailment.
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

    all_types = [ty for ty in enumerate_types(atoms, max_depth_types) if is_implicational(ty)]
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
            extended_syntactic_equivalent(t, c.repr, atoms, max_depth_proof) for c in classes
        ):
            classes.append(SyntacticTypeClass(repr=t))
    return FiniteSyntacticRecognitionModel(
        atoms=atoms,
        types=all_types,
        classes=classes,
        max_depth_proof=max_depth_proof,
    )


def build_finite_syntactic_model(atoms: Sequence[str], max_depth: int) -> FiniteSyntacticModel:
    """Build a finite semantic/syntactic model over Types."""

    types = enumerate_types(atoms, max_depth)
    classes: List[TypeClass] = []
    for t in types:
        if not any(equivalent_types(t, c.repr, atoms) for c in classes):
            classes.append(TypeClass(repr=t))
    return FiniteSyntacticModel(atoms=atoms, types=types, classes=classes)
