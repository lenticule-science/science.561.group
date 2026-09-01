from __future__ import annotations

from typing import Iterable, Set, TypeVar

from relationing.core.structure import HeytingAlgebra, MonotoneEndomap
from relationing.core.structure.eventual_limit import eventual_limit

from .finite_profile import FiniteFixedProfile


A = TypeVar("A", bound=HeytingAlgebra)


def finite_profile_from_step_fixed_points(
    step: MonotoneEndomap[A],
    carrier: Iterable[A],
    max_steps: int,
) -> FiniteFixedProfile[A]:
    """Finite profile from fixed points of a Reflex step endomap.

    Elements are recognitions whose Reflex-step sequence stabilises at
    a fixed point equal to themselves within ``max_steps``.
    """

    elems: Set[A] = set(carrier)
    fixed = {x for x in elems if eventual_limit(step, x, max_steps) == x}
    return FiniteFixedProfile(fixed)


__all__ = ["finite_profile_from_step_fixed_points"]
