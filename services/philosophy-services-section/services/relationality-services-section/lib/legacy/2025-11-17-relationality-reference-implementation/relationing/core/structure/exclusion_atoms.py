from __future__ import annotations

from typing import Iterable, Sequence

from .relationlessness import Relationlessness
from .exclusion_atom import ExclusionAtom


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


__all__ = ["atoms_from_relationlessness"]
