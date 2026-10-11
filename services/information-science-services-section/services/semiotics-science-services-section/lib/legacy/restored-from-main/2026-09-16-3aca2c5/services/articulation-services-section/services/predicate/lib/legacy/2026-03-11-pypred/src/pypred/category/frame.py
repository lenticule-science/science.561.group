"""Frame primitive (concrete: PowersetFrame on a finite base set).

A `Frame` is a poset with arbitrary joins, finite meets, and meet distributing
over arbitrary joins. We give the concrete `PowersetFrame` (subsets of a finite
base set, ordered by ⊂) — the only frame the corpus's finite-cellular settings
need. Generalization to non-powerset frames (Heyting algebras, etc.) is a
future expansion driven by need, not pre-emptive abstraction.

A `FrameMorphism` is a join-preserving function between frames. Right adjoints
exist for any frame morphism (frames are sup-lattices) and are computed by
enumeration in the finite case.
"""

from __future__ import annotations

from dataclasses import dataclass
from itertools import combinations
from typing import Callable, FrozenSet, Hashable, Iterator, TypeVar

T = TypeVar("T", bound=Hashable)


@dataclass(frozen=True)
class PowersetFrame:
    """The frame of subsets of a finite base set, ordered by inclusion.

    Operations:
        - `top` = the base set itself
        - `bottom` = the empty set
        - `meet(*items)` = intersection
        - `join(*items)` = union
        - `leq(a, b)` = a ⊆ b

    Elements are `frozenset` objects (so they're hashable/comparable).
    """

    base: frozenset[Hashable]

    @property
    def top(self) -> frozenset[Hashable]:
        return self.base

    @property
    def bottom(self) -> frozenset[Hashable]:
        return frozenset()

    def elements(self) -> Iterator[frozenset[Hashable]]:
        """Yield all subsets of base. Total count is 2^|base|."""
        items = tuple(self.base)
        for size in range(len(items) + 1):
            for combo in combinations(items, size):
                yield frozenset(combo)

    def meet(self, *items: frozenset[Hashable]) -> frozenset[Hashable]:
        if not items:
            return self.top
        result = items[0]
        for x in items[1:]:
            result = result & x
        return result

    def join(self, *items: frozenset[Hashable]) -> frozenset[Hashable]:
        if not items:
            return self.bottom
        result = items[0]
        for x in items[1:]:
            result = result | x
        return result

    def leq(self, a: frozenset[Hashable], b: frozenset[Hashable]) -> bool:
        return a.issubset(b)

    def __repr__(self) -> str:
        return f"PowersetFrame({set(self.base)!r})"


@dataclass(frozen=True)
class FrameMorphism:
    """A frame morphism: a join-preserving function between PowersetFrames.

    Stored as the source frame, target frame, and a callable mapping. For
    finite powerset frames, right adjoints can be computed by enumeration.

    Restriction-with-clopen morphisms (e.g., `f(x) = x ∩ U` for some clopen U)
    are the most common kind in the corpus's cellular sheaves; build them via
    `restrict_with(source, target, clopen)`.
    """

    source: PowersetFrame
    target: PowersetFrame
    mapping: Callable[[frozenset[Hashable]], frozenset[Hashable]]

    def __call__(self, x: frozenset[Hashable]) -> frozenset[Hashable]:
        return self.mapping(x)

    def right_adjoint(self) -> FrameMorphism:
        """Compute the right adjoint f^*: target → source.

        f^*(y) = max {x ∈ source : f(x) ≤ y} (which exists since source is
        a complete sup-lattice — sup of preimage of down-set of y).

        For finite frames this is computed by enumeration: f^*(y) is the
        join in source of all x with f(x) ⊆ y.
        """
        source_elements = list(self.source.elements())

        def adjoint(y: frozenset[Hashable]) -> frozenset[Hashable]:
            preimage = [x for x in source_elements if self.target.leq(self.mapping(x), y)]
            return self.source.join(*preimage)

        return FrameMorphism(source=self.target, target=self.source, mapping=adjoint)


def restrict_with(source: PowersetFrame, target: PowersetFrame, clopen: frozenset[Hashable]) -> FrameMorphism:
    """Construct the restriction-with-clopen morphism f(x) = x ∩ clopen.

    Used by the bitopological-site cellular sheaves where stalks at clopens
    are powersets of cells inside the clopen, and restrictions to sub-clopens
    are the obvious intersections.
    """
    return FrameMorphism(
        source=source,
        target=target,
        mapping=lambda x: x & clopen,
    )
