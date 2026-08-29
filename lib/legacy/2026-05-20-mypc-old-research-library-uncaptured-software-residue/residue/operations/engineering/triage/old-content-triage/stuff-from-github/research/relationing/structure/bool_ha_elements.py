from __future__ import annotations

from relationing.structure.bool_ha_type import BoolHA


def bool_ha_elements() -> list[BoolHA]:
    """All elements of the Boolean Heyting algebra."""
    return [BoolHA.bottom(), BoolHA.top()]


__all__ = ["bool_ha_elements"]

