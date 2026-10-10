from __future__ import annotations

from dataclasses import dataclass

from relationing.structure.heyting_algebra import HeytingAlgebra
from relationing.structure.exclusion_atoms import ExclusionAtom, atoms_from_relationlessness
from relationing.structure.relationlessness import Relationlessness


@dataclass(frozen=True)
class ThreeCarrier(HeytingAlgebra):
    """Three-element Relational finite Heyting element on a chain 0 < 1 < 2.

    Internally we realise the chain as the subsets
    ∅ < {•} < {•,◦} of a two-element universe, but all operations are
    defined via the integer view 0/1/2 so that implication behaves as
    on the standard three-element Heyting chain.
    """

    subset: frozenset[object]

    # Underlying two-atom exclusion universe derived from
    # Relationlessness. The three-element chain we use is the subalgebra
    # {⊥, {α}, {α, β}} of the powerset Heyting algebra on {α, β}.
    _VOID_FOR_THREE: Relationlessness = Relationlessness()
    _ATOMS: tuple[ExclusionAtom, ...] = atoms_from_relationlessness(_VOID_FOR_THREE, ["•", "◦"])
    _ALPHA: ExclusionAtom = _ATOMS[0]
    _BETA: ExclusionAtom = _ATOMS[1]

    _BOTTOM: frozenset[object] = frozenset()
    _MID: frozenset[object] = frozenset({_ALPHA})
    _TOP: frozenset[object] = frozenset({_ALPHA, _BETA})

    def __repr__(self) -> str:  # pragma: no cover - cosmetic
        return f"ThreeCarrier({self.subset})"

    @property
    def value(self) -> int:
        """Integer view 0/1/2 of the underlying recognition."""

        if self.subset == self._BOTTOM:
            return 0
        if self.subset == self._MID:
            return 1
        if self.subset == self._TOP:
            return 2
        raise ValueError(f"invalid ThreeCarrier subset {self.subset!r}")

    # Preorder
    def leq(self, other: "ThreeCarrier") -> bool:
        return self.value <= other.value

    # Heyting algebra operations restricted to the three-element subalgebra.
    @classmethod
    def bottom(cls) -> "ThreeCarrier":
        return cls(cls._BOTTOM)

    @classmethod
    def mid(cls) -> "ThreeCarrier":
        return cls(cls._MID)

    @classmethod
    def top(cls) -> "ThreeCarrier":
        return cls(cls._TOP)

    def meet(self, other: "ThreeCarrier") -> "ThreeCarrier":
        v = min(self.value, other.value)
        if v == 0:
            return ThreeCarrier.bottom()
        if v == 1:
            return ThreeCarrier.mid()
        return ThreeCarrier.top()

    def join(self, other: "ThreeCarrier") -> "ThreeCarrier":
        v = max(self.value, other.value)
        if v == 0:
            return ThreeCarrier.bottom()
        if v == 1:
            return ThreeCarrier.mid()
        return ThreeCarrier.top()

    def imp(self, other: "ThreeCarrier") -> "ThreeCarrier":
        # Implication on the three-element Heyting chain:
        # a ⇒ b = ⊤ if a ≤ b, otherwise b.
        if self.value <= other.value:
            return ThreeCarrier.top()
        return other


class ThreeHA(ThreeCarrier):
    """Legacy alias for the three-element Relational finite Heyting carrier."""

    pass


__all__ = ["ThreeCarrier", "ThreeHA"]

