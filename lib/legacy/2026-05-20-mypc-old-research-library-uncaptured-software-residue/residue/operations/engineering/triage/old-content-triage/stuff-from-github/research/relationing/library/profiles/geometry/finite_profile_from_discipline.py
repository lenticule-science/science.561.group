from __future__ import annotations

from typing import Iterable, Set, TypeVar

from relationing.core.geometry import Discipline
from relationing.core.structure import HeytingAlgebra

from .finite_profile import FiniteFixedProfile


A = TypeVar("A", bound=HeytingAlgebra)


def finite_discipline_fixed_profile(
    discipline: Discipline[A],
    carrier: Iterable[A],
) -> FiniteFixedProfile[A]:
    """Construct the finite profile of fixed points of a Discipline.

    This generalises ``finite_profile_from_filter`` to any Discipline,
    using its fixed-point set as the profile elements.
    """

    elems: Set[A] = set(carrier)
    fixed = {x for x in elems if discipline(x) == x}
    return FiniteFixedProfile(fixed)


__all__ = ["finite_discipline_fixed_profile"]
