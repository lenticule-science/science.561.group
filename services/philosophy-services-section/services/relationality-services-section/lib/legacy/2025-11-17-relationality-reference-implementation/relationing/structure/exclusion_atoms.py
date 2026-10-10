from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable, Sequence

from relationing.structure.relationlessness import Relationlessness


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


def atoms_from_relationlessness(
    _void: Relationlessness,
    names: Sequence[str] | Iterable[str],
) -> tuple[ExclusionAtom, ...]:
    """Introduce a finite family of exclusion atoms from Relationlessness.

    This helper makes explicit that the underlying universes for our
    finite Heyting algebras are generated from Relationlessness by
    acts of articulation: given a distinguished "void" and a finite
    list of atom names, we produce a corresponding tuple of atomic
    exclusion markers.
    """

    # Normalise to a concrete sequence so iteration has a stable order.
    if not isinstance(names, Sequence):
        names = tuple(names)
    return tuple(ExclusionAtom(str(name)) for name in names)


__all__ = ["ExclusionAtom", "atoms_from_relationlessness"]

