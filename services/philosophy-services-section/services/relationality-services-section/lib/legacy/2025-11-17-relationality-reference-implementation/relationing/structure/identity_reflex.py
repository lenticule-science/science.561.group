from __future__ import annotations

from relationing.structure.bool_ha_type import BoolCarrier
from relationing.structure.monotone_endomap import MonotoneEndomap


class IdentityReflex(MonotoneEndomap[BoolCarrier]):
    """Trivial Reflex endomap on the Boolean carrier (identity)."""

    def __call__(self, x: BoolCarrier) -> BoolCarrier:
        return x


__all__ = ["IdentityReflex"]
