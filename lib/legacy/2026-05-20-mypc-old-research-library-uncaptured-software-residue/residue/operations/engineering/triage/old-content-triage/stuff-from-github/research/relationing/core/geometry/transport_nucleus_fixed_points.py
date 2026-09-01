"""
Transport of nucleus fixed points along a morphism.
"""

from __future__ import annotations

from typing import Iterable, TypeVar

from relationing.core.structure import HeytingAlgebra, MonotoneEndomap

from .nucleus import Nucleus


T = TypeVar("T", bound=HeytingAlgebra)


def transport_nucleus_fixed_points(
    morphism: MonotoneEndomap[T],
    nucleus_domain: Nucleus[T],
    nucleus_codomain: Nucleus[T],
    carrier: Iterable[T],
) -> bool:
    """Finite check of the 'Transport of Nucleus Fixed Points' proposition."""

    elems = list(carrier)
    for x in elems:
        if morphism(nucleus_domain(x)) != nucleus_codomain(morphism(x)):
            return False
    for x in elems:
        if nucleus_domain(x) == x and nucleus_codomain(morphism(x)) != morphism(x):
            return False
    return True


__all__ = ["transport_nucleus_fixed_points"]

