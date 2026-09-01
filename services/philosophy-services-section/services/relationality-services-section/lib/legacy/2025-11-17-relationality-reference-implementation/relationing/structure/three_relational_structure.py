from __future__ import annotations

from relationing.structure.relational_structure import RelationalStructure
from relationing.structure.three_ha_type import ThreeCarrier
from relationing.structure.three_reflex import ThreeReflex


def three_relational_structure() -> RelationalStructure[ThreeCarrier, ThreeReflex]:
    """Convenience constructor for the three-element RelationalStructure."""
    return RelationalStructure(reflex=ThreeReflex())


__all__ = ["three_relational_structure"]
