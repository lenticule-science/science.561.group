"""Poset primitive and its order complex.

A `Poset` is a finite set with a partial order. Its `OrderComplex` is the
simplicial complex whose simplices are the totally-ordered chains of the poset.

Used by the bitopological-site cohomology computations: the per-base-point
fiber category is the order complex of the lattice of pairwise-Stone clopens.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable, Hashable, TypeVar
from itertools import combinations

T = TypeVar("T", bound=Hashable)


@dataclass(frozen=True)
class Poset:
    """A finite poset: an iterable of elements + a `≤` predicate.

    Construction validates antisymmetry and transitivity (reflexivity is
    trusted; if `leq(a, a)` doesn't hold for some `a`, that's the caller's
    bug). Validation is finite and exhaustive — Posets are expected to be
    small (≲ 100 elements).
    """

    elements: frozenset[Hashable]
    leq: Callable[[Hashable, Hashable], bool]

    def __post_init__(self) -> None:
        elts = list(self.elements)
        for a in elts:
            assert self.leq(a, a), f"reflexivity fails at {a!r}"
        for a in elts:
            for b in elts:
                if self.leq(a, b) and self.leq(b, a) and a != b:
                    raise ValueError(
                        f"antisymmetry fails: {a!r} ≤ {b!r} and {b!r} ≤ {a!r} but a ≠ b"
                    )
                if self.leq(a, b):
                    for c in elts:
                        if self.leq(b, c) and not self.leq(a, c):
                            raise ValueError(
                                f"transitivity fails: {a!r} ≤ {b!r} ≤ {c!r} but ¬({a!r} ≤ {c!r})"
                            )

    def chains(self, length: int) -> list[tuple[Hashable, ...]]:
        """Return all strictly-ascending chains of the given length.

        Length 1 = single elements; length 2 = ordered pairs a < b; etc.
        """
        if length < 1:
            return []
        if length == 1:
            return [(e,) for e in self.elements]
        result: list[tuple[Hashable, ...]] = []
        for combo in combinations(self.elements, length):
            for perm in self._all_orderings(combo):
                if self._is_strict_chain(perm):
                    result.append(perm)
        return result

    def _is_strict_chain(self, sequence: tuple[Hashable, ...]) -> bool:
        return all(
            self.leq(sequence[i], sequence[i + 1]) and sequence[i] != sequence[i + 1]
            for i in range(len(sequence) - 1)
        )

    def _all_orderings(self, items: tuple[Hashable, ...]) -> list[tuple[Hashable, ...]]:
        from itertools import permutations
        return list(permutations(items))


@dataclass(frozen=True)
class OrderComplex:
    """The order complex of a poset: simplicial complex whose k-simplices are
    strictly-ascending chains of length k+1 in the poset.

    For a 4-element Boolean algebra (powerset of 2-element set), the order
    complex has 4 vertices, 5 edges, 2 triangles — geometrically the
    contractible subdivided square (Δ¹).
    """

    poset: Poset

    def cells(self, dim: int) -> list[tuple[Hashable, ...]]:
        """Return all dim-dimensional cells (chains of length dim+1)."""
        return self.poset.chains(dim + 1)

    def dimension(self) -> int:
        """Return the maximum dimension of any cell."""
        for d in range(len(self.poset.elements), -1, -1):
            if self.cells(d):
                return d
        return -1

    def faces(self, simplex: tuple[Hashable, ...]) -> list[tuple[Hashable, ...]]:
        """Return the (codim-1) faces of a simplex: chains obtained by
        omitting one element of the chain."""
        if len(simplex) <= 1:
            return []
        return [
            tuple(simplex[:i] + simplex[i + 1:])
            for i in range(len(simplex))
        ]
