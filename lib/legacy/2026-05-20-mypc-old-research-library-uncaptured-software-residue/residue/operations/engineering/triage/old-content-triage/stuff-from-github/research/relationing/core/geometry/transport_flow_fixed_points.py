"""
Transport of flow fixed points along a morphism.
"""

from __future__ import annotations

from typing import Iterable, TypeVar

from relationing.core.structure import HeytingAlgebra, MonotoneEndomap

from .flow import Flow


T = TypeVar("T", bound=HeytingAlgebra)


def transport_flow_fixed_points(
    morphism: MonotoneEndomap[T],
    flow_domain: Flow[T],
    flow_codomain: Flow[T],
    carrier: Iterable[T],
) -> bool:
    """Finite check of the 'Transport of Fixed Points' proposition.

    We require f ∘ F = F' ∘ f on the given carrier and verify that
    f sends F-fixed points to F'-fixed points.
    """

    elems = list(carrier)
    for x in elems:
        if morphism(flow_domain(x)) != flow_codomain(morphism(x)):
            return False
    for x in elems:
        if flow_domain(x) == x and flow_codomain(morphism(x)) != morphism(x):
            return False
    return True


__all__ = ["transport_flow_fixed_points"]

