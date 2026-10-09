import Obsmetrologia.Calculus.Probability.Dequantization

/-!
# The magnitude witness — the non-divisibility `D ∤ C` that dequantization forgets

[Maslov dequantization](Dequantization.lean) collapses the counting magnitude `C ∈ ℕ` to its support
`supp C = (C > 0) ∈ Bool`. The support keeps *existence* and discards *magnitude*. This module pins
down exactly what is discarded: the **divisibility witness** `D ∤ C`.

The support map is blind to divisibility — two nonzero magnitudes can have the same support yet differ
in whether `D` divides them (`supp_blind_to_dvd`). So the residue datum `D ∤ C` — the
[descent / residue gap](../Closure/Collatz/ResidueGap.lean) obstruction (`C ∉ ⟨D, M⟩` reduces to a
residue inequality gated on `D ∤ C`) — is *precisely* the `p = 1` magnitude information the `p = ∞`
collapse loses. Recovering it is what the (real-power) power-mean deformation back to `natStoch` would
restore.

At a causal boundary the curvature magnitude is `±1`, whose witness is always on (`D ∤ 1` for
every `D ≥ 2`); in the flat interior the magnitude is `0`, whose witness is off (`D ∣ 0`). So
curvature ≠ 0 ↔ the witness fires (`diamond_boundary_witness`, `diamond_interior_no_witness`, in the
physical-science package's `CausalSets.Action.DiamondDequantization`).
The non-vanishing of curvature, the descent depth, and the residue gap are one non-divisibility
`D ∤ C` — the magnitude `supp` throws away.

## Main definitions

* `witness D C` — the non-divisibility witness `D ∤ C` as a `Bool`.

## Main results

* `supp_blind_to_dvd` — the support map cannot see divisibility: same support, different `D ∣ ·`.
* `witness_one` / `witness_zero` — the witness is always on at magnitude `1`, off at `0`.

## References

`content/.../valuation/content/maslov-dequantization`; the support map of `Probability.Dequantization`, the
residue gap of `Closure.Collatz.ResidueGap`.

## Tags

non-divisibility, residue gap, descent depth, dequantization, magnitude, curvature witness
-/

namespace Obsmetrologia
namespace Probability.Dequantization

/-! ## (A) The divisibility witness -/

/-- The **non-divisibility witness** `D ∤ C`: the residue/descent datum that distinguishes magnitudes
of the same support. -/
def witness (D C : Nat) : Bool := decide (¬ D ∣ C)

/-- **The witness is always on at magnitude `1`.** For `D ≥ 2`, `D ∤ 1` — the boundary curvature
magnitude `±1` carries the witness unconditionally. -/
theorem witness_one (D : Nat) (hD : 2 ≤ D) : witness D 1 = true := by
  simp only [witness, decide_eq_true_eq, Nat.dvd_one]
  omega

/-- **The witness is off at magnitude `0`.** `D ∣ 0` always, so the flat (zero-curvature) interior
carries no witness. -/
theorem witness_zero (D : Nat) : witness D 0 = false := by
  simp [witness]

/-! ## (B) The support map is blind to divisibility -/

/-- **Dequantization forgets the divisibility witness.** For any `D ≥ 2` there are two magnitudes of
the *same* support (both nonzero) that differ in divisibility — `D ∣ C` but `D ∤ C'`. So `supp` (the
`p = ∞` collapse) cannot recover `D ∤ ·`: the residue/descent witness is exactly the `p = 1` magnitude
information lost. The minimal witnesses are `C = D` (divisible) and `C' = D + 1` (not). -/
theorem supp_blind_to_dvd (D : Nat) (hD : 2 ≤ D) :
    ∃ C C', supp C = supp C' ∧ supp C = true ∧ D ∣ C ∧ ¬ D ∣ C' := by
  refine ⟨D, D + 1, ?_, ?_, Nat.dvd_refl D, ?_⟩
  · rw [supp_eq_true (by omega), supp_eq_true (by omega)]
  · exact supp_eq_true (by omega)
  · intro h
    have h1 : D ∣ 1 := (Nat.dvd_add_right (Nat.dvd_refl D)).mp h
    have := Nat.le_of_dvd Nat.one_pos h1
    omega

end Probability.Dequantization
end Obsmetrologia
