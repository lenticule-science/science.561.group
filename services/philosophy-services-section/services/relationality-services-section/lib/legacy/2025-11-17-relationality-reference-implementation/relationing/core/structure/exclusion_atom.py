"""
ExclusionAtom for finite origination universes.
"""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class ExclusionAtom:
    """Atomic exclusion witness arising from Relationlessness.

    In the Origination story, Relationlessness carries no recognitions
    until an articulation occurs. Each articulation can be viewed as
    bringing forth a small, finite set of atomic "not-with" markers.
    These atoms are the points of the finite exclusion universe over
    which our concrete Heyting algebras are realised as powerset
    subalgebras.
    """

    name: str


__all__ = ["ExclusionAtom"]

