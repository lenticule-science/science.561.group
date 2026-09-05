"""
Quotients under eventual equivalence for Reflex steps.

This module provides a small finite quotient construction for a
`MonotoneEndomap` S on a Heyting algebra carrier, using the
eventual-equivalence relation x ≡_S y induced by Reflex iteration.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Generic, Mapping, Sequence, TypeVar

from .heyting_algebra import HeytingAlgebra
from .iteration import eventual_equivalent, eventual_equivalence_classes
from .monotone_endomap import MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class EventualEquivalenceQuotient(Generic[A]):
    """Finite quotient carrier under eventual equivalence ≡_S."""

    classes: Sequence[frozenset[A]]
    representative_of: Mapping[A, frozenset[A]]

    def class_of(self, x: A) -> frozenset[A]:
        """Return the ≡_S-equivalence class containing x."""
        cls = self.representative_of.get(x)
        if cls is None:
            raise KeyError("element not in quotient carrier")
        return cls


def build_eventual_equivalence_quotient(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> EventualEquivalenceQuotient[A]:
    """Construct the finite quotient of a carrier under ≡_S.

    For each x in the carrier we compute its eventual-equivalence
    class using `eventual_equivalence_classes`, then build an
    immutable representation of the partition together with a lookup
    from elements to their classes.
    """

    raw_classes = eventual_equivalence_classes(step, carrier, max_steps)
    classes: list[frozenset[A]] = [frozenset(cls) for cls in raw_classes]
    rep: Dict[A, frozenset[A]] = {}
    for cls in classes:
        for x in cls:
            rep[x] = cls
    return EventualEquivalenceQuotient(classes=classes, representative_of=rep)


def heyting_ops_respect_eventual_equivalence(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> bool:
    """Check that ∧, ∨, ⇒ are compatible with ≡_S on a finite carrier.

    For all x ≡_S x' and y ≡_S y', we require:
    - x ∧ y ≡_S x' ∧ y'
    - x ∨ y ≡_S x' ∨ y'
    - x ⇒ y ≡_S x' ⇒ y'
    """

    for x in carrier:
        for x2 in carrier:
            if not eventual_equivalent(step, x, x2, max_steps):
                continue
            for y in carrier:
                for y2 in carrier:
                    if not eventual_equivalent(step, y, y2, max_steps):
                        continue
                    if not eventual_equivalent(step, x.meet(y), x2.meet(y2), max_steps):  # type: ignore[arg-type]
                        return False
                    if not eventual_equivalent(step, x.join(y), x2.join(y2), max_steps):  # type: ignore[arg-type]
                        return False
                    if not eventual_equivalent(step, x.imp(y), x2.imp(y2), max_steps):  # type: ignore[arg-type]
                        return False
    return True


def implication_quotient_table(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> tuple[EventualEquivalenceQuotient[A], Dict[tuple[frozenset[A], frozenset[A]], frozenset[A]]]:
    """Compute where implication is well-defined on the ≡_S quotient.

    Returns the eventual-equivalence quotient together with a mapping
    (C_x, C_y) ↦ C_{x⇒y} for those class pairs where, for all choices
    x, x' in C_x and y, y' in C_y, the implications x ⇒ y and x' ⇒ y'
    lie in the same ≡_S-class. Pairs where implication is not
    well-defined on the quotient are omitted from the mapping.
    """

    quotient = build_eventual_equivalence_quotient(step, carrier, max_steps)
    table: Dict[tuple[frozenset[A], frozenset[A]], frozenset[A]] = {}
    classes = list(quotient.classes)

    for cx in classes:
        for cy in classes:
            target_cls: frozenset[A] | None = None
            ok = True
            for x in cx:
                for y in cy:
                    cls_xy = quotient.class_of(x.imp(y))  # type: ignore[arg-type]
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


def implication_total_on_quotient(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> bool:
    """Check whether ⇒ is well-defined on all quotient classes.

    On a finite carrier, implication is *total* on the quotient iff
    for every pair of ≡_S-classes (C_x, C_y) there is a unique target
    class C_z such that, for all x, x' in C_x and y, y' in C_y, the
    implications x ⇒ y and x' ⇒ y' are ≡_S-equivalent. This helper
    checks that condition using ``implication_quotient_table``.
    """

    quotient, table = implication_quotient_table(step, carrier, max_steps)
    classes = list(quotient.classes)
    expected_pairs = {(cx, cy) for cx in classes for cy in classes}
    return set(table.keys()) == expected_pairs

__all__ = [
    "EventualEquivalenceQuotient",
    "build_eventual_equivalence_quotient",
    "heyting_ops_respect_eventual_equivalence",
    "implication_quotient_table",
    "implication_total_on_quotient",
]
