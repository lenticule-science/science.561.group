"""Python toolkit for the relational-infinity-topoi triage subtheory.

Mirrors the shape of `predication_categories/` (link registry, validator)
without copying its contents. Triage-stub form: link registry only,
no primitives or theorems modules yet.

Promotion out of triage will populate `primitives/` (cohesive-quadruple
constructors, KZ-comonad iteration, latching/matching computation on
finite SD sites) and `theorems/` (computational verification of SD-
ambidexterity on the minimal presheaf cell, etc.).
"""

from . import link

__all__ = ["link"]
