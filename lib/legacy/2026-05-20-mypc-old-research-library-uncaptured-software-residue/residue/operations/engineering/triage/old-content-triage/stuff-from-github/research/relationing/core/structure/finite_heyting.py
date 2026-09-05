"""
Finite Relational Heyting algebras from Relationlessness.

This module provides a small, explicit construction of finite
Heyting-like carriers derived from :class:`Relationlessness` via
exclusion atoms. It realises the powerset Heyting structure on a
finite exclusion universe generated from a distinguished "void" and a
    finite list of atom names.

    The resulting objects are not subclasses of :class:`HeytingAlgebra`;
    instead they provide a minimal set of operations (⊥, ⊤, ∧, ∨, ⇒) on
    finite subsets of exclusion atoms. Callers such as the finite
    semantic/syntactic model can use these operations as a concrete
    Relational finite Heyting algebra without introducing carrier-
    specific types.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import chain, combinations
from typing import Iterable, Mapping, Sequence, Tuple

from .exclusion_atoms import ExclusionAtom, atoms_from_relationlessness
from .relationlessness import Relationlessness
from .heyting_algebra import HeytingAlgebra
from relationing.core.language import Type, TypeKind


Subset = frozenset[ExclusionAtom]


def _powerset_universe(atoms: Sequence[ExclusionAtom]) -> Tuple[Subset, ...]:
    """All finite subsets of a finite exclusion universe."""

    items = list(atoms)
    subsets = []
    for r in range(len(items) + 1):
        for combo in combinations(items, r):
            subsets.append(frozenset(combo))
    return tuple(subsets)


@dataclass(frozen=True)
class FinitePowersetHeytingAlgebra:
    """Finite powerset Heyting carrier over exclusion atoms.

    The universe is a finite family of :class:`ExclusionAtom` values
    obtained from :class:`Relationlessness`. Elements are subsets of
    this universe, ordered by ⊆, with Heyting operations:

    - x ∧ y := x ∩ y
    - x ∨ y := x ∪ y
    - x ⇒ y := (¬x) ∪ y, where ¬x is complement in the universe.
    """

    universe: Tuple[ExclusionAtom, ...]
    elements: Tuple[Subset, ...]

    @classmethod
    def from_relationlessness(
        cls,
        void: Relationlessness,
        atom_names: Sequence[str] | Iterable[str],
    ) -> "FinitePowersetHeytingAlgebra":
        atoms = atoms_from_relationlessness(void, atom_names)
        elems = _powerset_universe(atoms)
        return cls(universe=atoms, elements=elems)

    @property
    def _universe_set(self) -> Subset:
        return frozenset(self.universe)

    def bottom(self) -> Subset:
        """Least element ⊥."""

        return frozenset()

    def top(self) -> Subset:
        """Greatest element ⊤."""

        return self._universe_set

    def meet(self, a: Subset, b: Subset) -> Subset:
        """Conjunction x ∧ y."""

        return a & b

    def join(self, a: Subset, b: Subset) -> Subset:
        """Disjunction x ∨ y."""

        return a | b

    def imp(self, a: Subset, b: Subset) -> Subset:
        """Heyting implication x ⇒ y as (¬x) ∪ y."""

        return (self._universe_set - a) | b

    def leq(self, a: Subset, b: Subset) -> bool:
        """Order x ≤ y as subset inclusion."""

        return a.issubset(b)

    # ------------------------------------------------------------------
    # Type evaluation helper
    # ------------------------------------------------------------------

    def eval_type(self, ty: Type, valuation: Mapping[str, Subset]) -> Subset:
        """Evaluate a λ_R Type in this finite Heyting algebra.

        `valuation` assigns each atomic type name p a subset v(p) of
        the exclusion universe. The evaluation then interprets:

        - ATOM(p) as v(p),
        - ⊥ as bottom(),
        - ⊤ as top(),
        - A ∧ B via meet,
        - A ∨ B via join,
        - A ⇒ B via imp.
        """

        if ty.kind == TypeKind.ATOM:
            if ty.atom is None or ty.atom not in valuation:
                raise KeyError(f"no valuation for atom {ty.atom!r}")
            return valuation[ty.atom]

        if ty.kind == TypeKind.BOTTOM:
            return self.bottom()

        if ty.kind == TypeKind.TOP:
            return self.top()

        assert ty.left is not None and ty.right is not None
        a = self.eval_type(ty.left, valuation)
        b = self.eval_type(ty.right, valuation)

        if ty.kind == TypeKind.AND:
            return self.meet(a, b)
        if ty.kind == TypeKind.OR:
            return self.join(a, b)
        if ty.kind == TypeKind.IMP:
            return self.imp(a, b)

        raise ValueError(f"unknown type kind {ty.kind!r}")


__all__ = ["FinitePowersetHeytingAlgebra"]
