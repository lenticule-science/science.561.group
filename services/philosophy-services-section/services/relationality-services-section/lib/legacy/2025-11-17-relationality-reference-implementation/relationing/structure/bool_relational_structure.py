from __future__ import annotations

from relationing.structure.bool_ha_type import BoolCarrier
from relationing.structure.identity_reflex import IdentityReflex
from relationing.structure.relational_structure import RelationalStructure


def bool_relational_structure() -> RelationalStructure[BoolCarrier, IdentityReflex]:
    """Convenience constructor for the Boolean RelationalStructure."""
    return RelationalStructure(reflex=IdentityReflex())


__all__ = ["bool_relational_structure"]
