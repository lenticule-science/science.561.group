"""
Finite checks for interior-like nucleus laws.
"""

from __future__ import annotations

from typing import Iterable, List, TypeVar, cast

from relationing.core.structure import HeytingAlgebra

from .nucleus import Nucleus


T = TypeVar("T", bound=HeytingAlgebra)


def nucleus_respects_interior_laws(
    nucleus: Nucleus[T],
    carrier: Iterable[T],
) -> bool:
    """Check interior-like nucleus laws on a finite carrier.

    For an interior-like nucleus ν we require, for all recognitions x, y:

    * ν(x) ≤ x (intensivity),
    * ν(x ∧ y) = ν(x) ∧ ν(y), and
    * ν(x ∨ y) ≤ ν(x) ∨ ν(y).
    """

    elems: List[T] = list(carrier)
    for x in elems:
        nx = nucleus(x)
        if not nx.leq(x):
            return False
    for x in elems:
        for y in elems:
            left_meet = nucleus(cast(T, x.meet(y)))
            nx = nucleus(x)
            ny = nucleus(y)
            right_meet = cast(T, nx.meet(ny))
            if not left_meet.leq(right_meet) or not right_meet.leq(left_meet):
                return False
            left_join = nucleus(cast(T, x.join(y)))
            right_join = cast(T, nx.join(ny))
            if not left_join.leq(right_join):
                return False
    return True


__all__ = ["nucleus_respects_interior_laws"]

