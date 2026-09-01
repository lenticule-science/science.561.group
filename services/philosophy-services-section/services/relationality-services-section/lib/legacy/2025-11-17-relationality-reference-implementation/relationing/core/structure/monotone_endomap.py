from __future__ import annotations

from typing import Protocol, TypeVar

from .heyting_algebra import HeytingAlgebra


A_co = TypeVar("A_co", bound=HeytingAlgebra)


class MonotoneEndomap(Protocol[A_co]):
    """Monotone endomap on a Heyting algebra.

    This is the shape shared by Reflex, nuclei, flows, and disciplines
    in the Relationality notes. Specific refinements can add further laws.
    """

    def __call__(self, x: A_co) -> A_co:
        ...

    def preserves_order(self, x: A_co, y: A_co) -> bool:
        """Check the intended monotonicity law on a pair."""
        if x.leq(y):
            return self(x).leq(self(y))
        return True


__all__ = ["MonotoneEndomap", "A_co"]
