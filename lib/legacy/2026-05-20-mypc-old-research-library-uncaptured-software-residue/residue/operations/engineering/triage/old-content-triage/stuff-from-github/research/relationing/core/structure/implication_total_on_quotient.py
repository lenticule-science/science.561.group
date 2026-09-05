from __future__ import annotations

from typing import Sequence

from .eventual_equivalence_quotient import A
from .implication_quotient_table import implication_quotient_table
from .monotone_endomap import MonotoneEndomap


def implication_total_on_quotient(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> bool:
    """Check whether ⇒ is well-defined on all quotient classes."""

    quotient, table = implication_quotient_table(step, carrier, max_steps)
    classes = list(quotient.classes)
    expected_pairs = {(cx, cy) for cx in classes for cy in classes}
    return set(table.keys()) == expected_pairs


__all__ = ["implication_total_on_quotient"]
