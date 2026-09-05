from __future__ import annotations

from typing import Sequence, cast

from .eventual_equivalent import eventual_equivalent, A
from .monotone_endomap import MonotoneEndomap


def heyting_ops_respect_eventual_equivalence(
    step: MonotoneEndomap[A],
    carrier: Sequence[A],
    max_steps: int,
) -> bool:
    """Check that ∧, ∨, ⇒ are compatible with ≡_S on a finite carrier."""

    for x in carrier:
        for x2 in carrier:
            if not eventual_equivalent(step, x, x2, max_steps):
                continue
            for y in carrier:
                for y2 in carrier:
                    if not eventual_equivalent(step, y, y2, max_steps):
                        continue
                    xy = cast(A, x.meet(y))
                    x2y2 = cast(A, x2.meet(y2))
                    if not eventual_equivalent(step, xy, x2y2, max_steps):
                        return False
                    xy = cast(A, x.join(y))
                    x2y2 = cast(A, x2.join(y2))
                    if not eventual_equivalent(step, xy, x2y2, max_steps):
                        return False
                    xy = cast(A, x.imp(y))
                    x2y2 = cast(A, x2.imp(y2))
                    if not eventual_equivalent(step, xy, x2y2, max_steps):
                        return False
    return True


__all__ = ["heyting_ops_respect_eventual_equivalence"]
