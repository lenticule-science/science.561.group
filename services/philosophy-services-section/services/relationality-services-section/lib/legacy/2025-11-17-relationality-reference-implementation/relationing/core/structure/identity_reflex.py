from __future__ import annotations

from .monotone_endomap import MonotoneEndomap
from .heyting_algebra import HeytingAlgebra


class IdentityReflex(MonotoneEndomap[HeytingAlgebra]):
    """Trivial Reflex endomap (identity) on any Heyting algebra carrier."""

    def __call__(self, x: HeytingAlgebra) -> HeytingAlgebra:  # pragma: no cover - trivial
        return x


__all__ = ["IdentityReflex"]
