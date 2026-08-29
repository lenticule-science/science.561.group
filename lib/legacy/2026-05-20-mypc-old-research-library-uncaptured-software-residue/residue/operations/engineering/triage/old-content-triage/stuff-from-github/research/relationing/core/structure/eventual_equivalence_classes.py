from __future__ import annotations

from typing import Dict, List, Sequence, Set, TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap
from .eventual_limit import eventual_limit


A = TypeVar("A", bound=HeytingAlgebra)


def eventual_equivalence_classes(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> List[Set[A]]:
    """Equivalence classes of ≡_S over a finite carrier.

    Two recognitions are equivalent when their eventual limits under S
    (when they exist within ``max_steps``) coincide. Elements that do
    not stabilise within the bound are placed in singleton classes.
    """

    classes: Dict[A, Set[A]] = {}
    unstable: Set[A] = set()
    for x in carrier:
        limit = eventual_limit(step, x, max_steps)
        if limit is None:
            unstable.add(x)
            continue
        bucket = classes.setdefault(limit, set())
        bucket.add(x)
    result = list(classes.values())
    for x in unstable:
        result.append({x})
    return result


__all__ = ["eventual_equivalence_classes", "A"]

