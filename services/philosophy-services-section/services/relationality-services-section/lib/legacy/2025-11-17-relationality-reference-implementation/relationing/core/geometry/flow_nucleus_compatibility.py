"""
Flow–Nucleus compatibility checks on finite carriers.
"""

from __future__ import annotations

from typing import Iterable, TypeVar

from relationing.core.structure import HeytingAlgebra

from .flow import Flow
from .nucleus import Nucleus


T = TypeVar("T", bound=HeytingAlgebra)


def flow_nucleus_compatible(
    flow: Flow[T],
    nucleus: Nucleus[T],
    carrier: Iterable[T],
    closure_like: bool,
) -> bool:
    """Check Flow–Nucleus compatibility on a finite carrier.

    For closure-like ν we check F ∘ ν ≤ ν ∘ F; for interior-like ν we
    check ν ∘ F ≤ F ∘ ν.
    """

    elems = list(carrier)
    if closure_like:
        for x in elems:
            left = flow(nucleus(x))
            right = nucleus(flow(x))
            if not left.leq(right):
                return False
    else:
        for x in elems:
            left = nucleus(flow(x))
            right = flow(nucleus(x))
            if not left.leq(right):
                return False
    return True


__all__ = ["flow_nucleus_compatible"]

