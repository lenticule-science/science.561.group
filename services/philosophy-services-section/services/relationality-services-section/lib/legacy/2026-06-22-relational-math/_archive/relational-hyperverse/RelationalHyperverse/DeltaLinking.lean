import RelationalHyperverse.HaNucl

-- Establishes: delta-linking

/-!
# DeltaLinking: the reflection adjunction for a nucleus

Corresponds to `math/delta-linking.md`.

A nucleus `j` on a Heyting algebra is the **left adjoint** to the inclusion
`ι : Fix(j) ↪ H` (the Eilenberg-Moore adjunction). Explicitly:

  `j(a) ≤ c ↔ a ≤ c`   for any `c ∈ Fix(j)`

The unit of this adjunction is the extensivity map `a ≤ j(a)`.
The counit is the identity `j(c) = c` for `c ∈ Fix(j)`.

This characterization is used in `math/delta-linking.md` to link the transfer
nucleus Δ to the adjunction structure of the history category extension.

## Main results
- `Nucleus.reflection_adjoint` : j(a) ≤ c ↔ a ≤ c for c ∈ Fix(j)
-/

namespace Nucleus

section HeytingAlgebra

variable {H : Type*} [HeytingAlgebra H] (j : Nucleus H)

/-- The reflection adjunction for nucleus j (`math/delta-linking.md` §adjoint-characterization).

    j is the left adjoint to the inclusion ι : Fix(j) ↪ H:
      j(a) ≤ c ↔ a ≤ c    for any c ∈ Fix(j).

    This is the categorical content of j: it is the reflection of H onto Fix(j),
    and the unit of the adjunction is the extensivity map a ≤ j(a).

    Together with `le_fixed_of_le`, this gives the full adjunction. -/
theorem reflection_adjoint {a c : H} (hc : c ∈ j.fixedPoints) :
    j.toFun a ≤ c ↔ a ≤ c := by
  simp only [mem_fixedPoints] at hc
  constructor
  · intro h; exact le_trans (j.extensive a) h
  · intro h
    calc j.toFun a ≤ j.toFun c := j.monotone h
      _ = c := hc

end HeytingAlgebra

end Nucleus
