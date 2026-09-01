from __future__ import annotations

from typing import Dict, Sequence, Tuple, cast

from .eventual_equivalence_quotient import EventualEquivalenceQuotient, A
from .build_eventual_equivalence_quotient import build_eventual_equivalence_quotient
from .monotone_endomap import MonotoneEndomap


def implication_quotient_table(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> Tuple[
    EventualEquivalenceQuotient[A],
    Dict[Tuple[frozenset[A], frozenset[A]], frozenset[A]],
]:
    """Compute where implication is well-defined on the ≡_S quotient."""

    quotient = build_eventual_equivalence_quotient(step, carrier, max_steps)
    table: Dict[Tuple[frozenset[A], frozenset[A]], frozenset[A]] = {}
    classes = list(quotient.classes)

    for cx in classes:
        for cy in classes:
            target_cls: frozenset[A] | None = None
            ok = True
            for x in cx:
                for y in cy:
                    result = x.imp(y)
                    cls_xy = quotient.class_of(cast(A, result))
                    if target_cls is None:
                        target_cls = cls_xy
                    elif cls_xy != target_cls:
                        ok = False
                        break
                if not ok:
                    break
            if ok and target_cls is not None:
                table[(cx, cy)] = target_cls

    return quotient, table


__all__ = ["implication_quotient_table"]
