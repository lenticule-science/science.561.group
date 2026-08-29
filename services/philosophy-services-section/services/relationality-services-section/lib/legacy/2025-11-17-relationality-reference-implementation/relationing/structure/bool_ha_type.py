from __future__ import annotations

from dataclasses import dataclass

from relationing.structure.heyting_algebra import HeytingAlgebra
from relationing.structure.exclusion_atoms import ExclusionAtom, atoms_from_relationlessness
from relationing.structure.relationlessness import Relationlessness


# In the Origination picture, the Boolean Relational finite Heyting
# algebra is realised as the powerset over a one-atom exclusion
# universe arising from Relationlessness. We make this explicit by
# generating that atom from a distinguished Relationlessness value.
_VOID_FOR_BOOL = Relationlessness()
_BOOL_ATOMS: tuple[ExclusionAtom, ...] = atoms_from_relationlessness(_VOID_FOR_BOOL, ["•"])
EXCLUSION_UNIVERSE: frozenset[object] = frozenset(_BOOL_ATOMS)


@dataclass(frozen=True)
class BoolCarrier(HeytingAlgebra):
    """Boolean Relational finite Heyting element derived from ExclusionAtoms."""

    subset: frozenset[object]

    def __repr__(self) -> str:  # pragma: no cover - cosmetic
        return f"BoolCarrier({self.subset})"

    @property
    def value(self) -> bool:
        """Boolean view of the underlying recognition."""

        return bool(self.subset)

    # Preorder
    def leq(self, other: "BoolCarrier") -> bool:
        return self.subset.issubset(other.subset)

    # Heyting algebra operations as on a powerset Boolean algebra.
    @classmethod
    def bottom(cls) -> "BoolCarrier":
        return cls(frozenset())

    @classmethod
    def top(cls) -> "BoolCarrier":
        return cls(EXCLUSION_UNIVERSE)

    def meet(self, other: "BoolCarrier") -> "BoolCarrier":
        return BoolCarrier(self.subset & other.subset)

    def join(self, other: "BoolCarrier") -> "BoolCarrier":
        return BoolCarrier(self.subset | other.subset)

    def imp(self, other: "BoolCarrier") -> "BoolCarrier":
        # a ⇒ b = (U \ a) ∪ b in a powerset Boolean algebra.
        return BoolCarrier((EXCLUSION_UNIVERSE - self.subset) | other.subset)


class BoolHA(BoolCarrier):
    """Legacy alias for the Boolean Relational finite Heyting carrier."""

    pass


def bool_ha_elements() -> list[BoolHA]:
    """All elements of the Boolean Relational finite Heyting algebra."""

    return [BoolHA.bottom(), BoolHA.top()]


__all__ = ["EXCLUSION_UNIVERSE", "BoolCarrier", "BoolHA", "bool_ha_elements"]

