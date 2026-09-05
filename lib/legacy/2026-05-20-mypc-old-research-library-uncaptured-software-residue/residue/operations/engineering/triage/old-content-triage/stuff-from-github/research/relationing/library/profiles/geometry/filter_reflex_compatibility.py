from __future__ import annotations

from typing import Iterable, TypeVar

from relationing.core.geometry import Filter
from relationing.core.structure import HeytingAlgebra, MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


def is_filter_reflex_compatible(
    filter_: Filter[A],
    reflex: MonotoneEndomap[A],
    carrier: Iterable[A],
) -> bool:
    """Check that a Filter commutes with a given Reflex on a carrier."""

    for x in carrier:
        if not filter_.commutes_with_reflex(reflex, x):
            return False
    return True


__all__ = ["is_filter_reflex_compatible"]

