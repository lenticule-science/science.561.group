from __future__ import annotations

from typing import Iterable, Set, TypeVar

from relationing.core.geometry import Filter
from relationing.core.structure import HeytingAlgebra

from .finite_profile import FiniteFixedProfile


A = TypeVar("A", bound=HeytingAlgebra)


def finite_filter_fixed_profile(
    filter_: Filter[A],
    carrier: Iterable[A],
) -> FiniteFixedProfile[A]:
    """Construct the finite profile of fixed points of a Filter."""
    elems: Set[A] = set(carrier)
    fixed = {x for x in elems if filter_(x) == x}
    return FiniteFixedProfile(fixed)


__all__ = ["finite_filter_fixed_profile"]
