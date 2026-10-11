"""DFrame primitive (d-frame as 4-tuple with con, tot relations).

A `DFrame` is a 4-tuple `(L_plus, L_minus, con, tot)` where:

- `L_plus`, `L_minus` are frames.
- `con ⊆ L_plus × L_minus` is the **consistency relation**: downward-closed pairs
  that don't co-witness a ⊤-cell. `(a, b) ∈ con` means a and b can co-exist
  without producing inconsistency.
- `tot ⊆ L_plus × L_minus` is the **totality relation**: upward-closed pairs whose
  joint covers all settled cells. `(a, b) ∈ tot` means a ∪ b covers the
  settled-cell set in the relevant context.

For the bitopological-settling-site setting at a clopen U:
- L_plus = P(U ∩ Δ⁺) (truth-positive cells in U)
- L_minus = P(U ∩ Δ⁻) (falsity-positive cells in U)
- con = pairs (a, b) with a ∩ b = ∅ (in the underlying cell space — no co-witness)
- tot = pairs (a, b) with a ∪ b ⊇ (U ∩ Δ⁺) ∪ (U ∩ Δ⁻) (covers all settled cells)

Construction validates the d-frame axioms (downward-closed con, upward-closed tot,
plus the empty/full pairs being trivially in / out of the relations).
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Hashable

from .frame import PowersetFrame


@dataclass(frozen=True)
class DFrame:
    """A d-frame: pair of frames with con and tot relations.

    For finite powerset frames, con and tot are stored as frozen sets of
    pairs (a, b) for explicit enumeration.
    """

    L_plus: PowersetFrame
    L_minus: PowersetFrame
    con: frozenset[tuple[frozenset[Hashable], frozenset[Hashable]]]
    tot: frozenset[tuple[frozenset[Hashable], frozenset[Hashable]]]

    def __post_init__(self) -> None:
        # Validate con is downward-closed: if (a, b) ∈ con and a' ⊆ a, b' ⊆ b, then (a', b') ∈ con
        for a, b in self.con:
            for a_prime in self.L_plus.elements():
                if not self.L_plus.leq(a_prime, a):
                    continue
                for b_prime in self.L_minus.elements():
                    if not self.L_minus.leq(b_prime, b):
                        continue
                    if (a_prime, b_prime) not in self.con:
                        raise ValueError(
                            f"con not downward-closed: ({a}, {b}) ∈ con but "
                            f"({a_prime}, {b_prime}) ∉ con (sub-pair)"
                        )
        # Validate tot is upward-closed: if (a, b) ∈ tot and a ⊆ a', b ⊆ b', then (a', b') ∈ tot
        for a, b in self.tot:
            for a_prime in self.L_plus.elements():
                if not self.L_plus.leq(a, a_prime):
                    continue
                for b_prime in self.L_minus.elements():
                    if not self.L_minus.leq(b, b_prime):
                        continue
                    if (a_prime, b_prime) not in self.tot:
                        raise ValueError(
                            f"tot not upward-closed: ({a}, {b}) ∈ tot but "
                            f"({a_prime}, {b_prime}) ∉ tot (super-pair)"
                        )

    def check_con(self, a: frozenset[Hashable], b: frozenset[Hashable]) -> bool:
        return (a, b) in self.con

    def check_tot(self, a: frozenset[Hashable], b: frozenset[Hashable]) -> bool:
        return (a, b) in self.tot

    def __repr__(self) -> str:
        return (
            f"DFrame(L_plus={self.L_plus}, L_minus={self.L_minus}, "
            f"|con|={len(self.con)}, |tot|={len(self.tot)})"
        )


def settling_dframe_at_clopen(
    clopen: frozenset[Hashable],
    delta_plus: frozenset[Hashable],
    delta_minus: frozenset[Hashable],
) -> DFrame:
    """Build the settling d-frame at a clopen U for given Δ⁺, Δ⁻ placements.

    Per the markdown:
    - L_plus(U) = P(U ∩ Δ⁺)
    - L_minus(U) = P(U ∩ Δ⁻)
    - con: pairs (a, b) with a ∩ b = ∅ in the underlying cell space (no co-witness)
    - tot: pairs (a, b) with a ∪ b ⊇ settled cells of U = (U ∩ Δ⁺) ∪ (U ∩ Δ⁻)
    """
    L_plus = PowersetFrame(base=clopen & delta_plus)
    L_minus = PowersetFrame(base=clopen & delta_minus)
    settled = (clopen & delta_plus) | (clopen & delta_minus)

    con = frozenset(
        (a, b)
        for a in L_plus.elements()
        for b in L_minus.elements()
        if (a & b) == frozenset()
    )
    tot = frozenset(
        (a, b)
        for a in L_plus.elements()
        for b in L_minus.elements()
        if settled.issubset(a | b)
    )

    return DFrame(L_plus=L_plus, L_minus=L_minus, con=con, tot=tot)
