from __future__ import annotations

from relationing.structure.monotone_endomap import MonotoneEndomap
from relationing.structure.three_ha_type import ThreeCarrier
from relationing.structure.three_ha_elements import three_ha_elements


class ThreeReflex(MonotoneEndomap[ThreeCarrier]):
    """Reflex endomap on the three-element carrier, acting like the ThreeStepFlow."""

    def __call__(self, x: ThreeCarrier) -> ThreeCarrier:
        bottom, mid, top = three_ha_elements()
        if x == bottom:
            return mid
        return x


__all__ = ["ThreeReflex"]
