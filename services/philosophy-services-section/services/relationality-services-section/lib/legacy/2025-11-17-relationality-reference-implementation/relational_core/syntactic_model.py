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

from .language import Type, TypeKind
from .semantics import interpret_type
from .structure import BoolHA, ThreeHA, bool_ha_elements, three_ha_elements


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
    interpret_type(a) ≤ interpret_type(b) holds.
    """

    def holds_in(carrier: Sequence, mk_bottom_top) -> bool:
        elems = list(carrier)
        for values in product(elems, repeat=len(atoms)):
            env = dict(zip(atoms, values))
            va = interpret_type(a, env, elems)
            vb = interpret_type(b, env, elems)
            if not va.leq(vb):  # type: ignore[arg-type]
                return False
        return True

    return holds_in(bool_ha_elements(), BoolHA) and holds_in(three_ha_elements(), ThreeHA)


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


def equivalent_types(a: Type, b: Type, atoms: Sequence[str]) -> bool:
    """Mutual semantic entailment equivalence: a ≤ b and b ≤ a."""

    return semantic_leq(a, b, atoms) and semantic_leq(b, a, atoms)


def build_finite_syntactic_model(atoms: Sequence[str], max_depth: int) -> FiniteSyntacticModel:
    """Build a finite semantic/syntactic model over Types."""

    types = enumerate_types(atoms, max_depth)
    classes: List[TypeClass] = []
    for t in types:
        if not any(equivalent_types(t, c.repr, atoms) for c in classes):
            classes.append(TypeClass(repr=t))
    return FiniteSyntacticModel(atoms=atoms, types=types, classes=classes)

