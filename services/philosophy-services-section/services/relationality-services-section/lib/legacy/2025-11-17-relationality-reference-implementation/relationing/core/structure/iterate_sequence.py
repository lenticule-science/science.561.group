from __future__ import annotations

from typing import List, TypeVar

from .heyting_algebra import HeytingAlgebra
from .monotone_endomap import MonotoneEndomap


A = TypeVar("A", bound=HeytingAlgebra)


def iterate_sequence(step: MonotoneEndomap[A], x: A, max_steps: int) -> List[A]:
    """Sequence [x, S(x), S²(x), …] up to stabilisation or max_steps."""

    if max_steps < 0:
        raise ValueError("max_steps must be non-negative")
    seq: List[A] = [x]
    current = x
    for _ in range(max_steps):
        nxt = step(current)
        seq.append(nxt)
        if nxt == current:
            break
        current = nxt
    return seq


__all__ = ["iterate_sequence", "A"]

