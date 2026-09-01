from __future__ import annotations

from typing import Dict, Sequence

from .eventual_equivalence_quotient import EventualEquivalenceQuotient, A
from .eventual_equivalence_classes import eventual_equivalence_classes
from .monotone_endomap import MonotoneEndomap


def build_eventual_equivalence_quotient(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> EventualEquivalenceQuotient[A]:
    """Construct the finite quotient of a carrier under ≡_S."""

    raw_classes = eventual_equivalence_classes(step, carrier, max_steps)
    classes: list[frozenset[A]] = [frozenset(cls) for cls in raw_classes]
    rep: Dict[A, frozenset[A]] = {}
    for cls in classes:
        for x in cls:
            rep[x] = cls
    return EventualEquivalenceQuotient(classes=classes, representative_of=rep)


__all__ = ["build_eventual_equivalence_quotient"]
