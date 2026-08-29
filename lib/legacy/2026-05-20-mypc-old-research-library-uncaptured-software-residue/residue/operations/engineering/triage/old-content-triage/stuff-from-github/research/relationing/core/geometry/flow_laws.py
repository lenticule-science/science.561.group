"""
Finite checks for flow laws in Relational Geometry.
"""

from __future__ import annotations

from typing import Iterable, List, TypeVar

from relationing.core.structure import HeytingAlgebra

from .flow import Flow


T = TypeVar("T", bound=HeytingAlgebra)


def flow_respects_laws(
    flow: Flow[T],
    carrier: Iterable[T],
    inflationary: bool | None = None,
) -> bool:
    """Check flow laws on a finite carrier.

    We require monotonicity, lax-idempotence, and the chosen
    inflationary/deflationary directionality.
    """

    elems: List[T] = list(carrier)
    for x in elems:
        if not flow.is_lax_idempotent(x):
            return False
        if inflationary is True and not flow.is_inflationary(x):
            return False
        if inflationary is False and not flow.is_deflationary(x):
            return False
    # Monotonicity is inherited from Flow/MonotoneEndomap; we
    # sanity-check it on the carrier.
    for x in elems:
        for y in elems:
            if x.leq(y) and not flow(x).leq(flow(y)):
                return False
    return True


__all__ = ["flow_respects_laws"]

