"""
Finite checks for closure-like nucleus laws.
"""

from __future__ import annotations

from typing import Iterable, List, TypeVar, cast

from relationing.core.structure import HeytingAlgebra

from .nucleus import Nucleus


T = TypeVar("T", bound=HeytingAlgebra)


def nucleus_respects_closure_laws(nucleus: Nucleus[T], carrier: Iterable[T]) -> bool:
    """Check closure-like nucleus laws on a finite carrier.

    For a closure-like nucleus ν we require, for all recognitions x, y:

    * x ≤ ν(x) (extensivity), and
    * x ∧ ν(y) ≤ ν(x ∧ y), and
    * ν(x) ∨ ν(y) = ν(x ∨ y).
    """

    elems: List[T] = list(carrier)
    for x in elems:
        nx = nucleus(x)
        if not x.leq(nx):
            return False
    for x in elems:
        for y in elems:
            ny = nucleus(y)
            left_meet = cast(T, x.meet(ny))
            right_meet = nucleus(cast(T, x.meet(y)))
            if not left_meet.leq(right_meet):
                return False
            nx = nucleus(x)
            ny = nucleus(y)
            left_join = cast(T, nx.join(ny))
            right_join = nucleus(cast(T, x.join(y)))
            if not left_join.leq(right_join) or not right_join.leq(left_join):
                return False
    return True


__all__ = ["nucleus_respects_closure_laws"]

