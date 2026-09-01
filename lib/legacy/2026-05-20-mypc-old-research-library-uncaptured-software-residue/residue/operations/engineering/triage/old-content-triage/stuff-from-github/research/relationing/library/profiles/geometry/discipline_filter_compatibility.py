from __future__ import annotations

from typing import Iterable, Set, TypeVar

from relationing.core.geometry import Discipline, Filter
from relationing.core.structure import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


def is_discipline_filter_compatible(
    discipline: Discipline[A],
    filter_: Filter[A],
    carrier: Iterable[A],
) -> bool:
    """Check that a Discipline is gated by a Filter on a carrier.

    Intended reading (in the finite setting):
    - the Filter's fixed-point profile is stable under the Discipline; and
    - the Discipline commutes with the Filter on all recognitions.
    """

    elems: Set[A] = set(carrier)
    for x in elems:
        fx = filter_(x)
        if fx == x and filter_(discipline(x)) != discipline(x):
            return False
        if filter_(discipline(x)) != discipline(filter_(x)):
            return False
    return True


__all__ = ["is_discipline_filter_compatible"]

