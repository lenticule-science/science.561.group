from __future__ import annotations

from relationing.structure.three_ha_type import ThreeHA


def three_ha_elements() -> list[ThreeHA]:
    """All elements of the three-element carrier."""
    return [ThreeHA.bottom(), ThreeHA.mid(), ThreeHA.top()]


__all__ = ["three_ha_elements"]
