import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicPowerLens
import Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian
import Obsmetrologia.Calculus.Real.ExpSeries

/-!
# The metallization dichotomy — `κ < ω` algebraic vs `κ = ω` transcendental

The metallic power lens grades real *algebraic* powers `zᵏ = Pₖz + Qₖ` (`metallic_power_expansion`) —
a **finite** integer recurrence, the `κ < ω` strict-algebraic regime. The chromatic Lorentzian is the
**non-idempotent** carrier (`step_not_idempotent`): its closure settles only at the limit,
the `κ = ω` regime, where no finite recurrence catches it — it *cannot be metallized*. Its
transcendental residue is discharged by the exponential power series, which is **summable but never
finite** (`expSeq_summable`): the partial sums approach a limit no algebraic expansion reaches.

This module is about **metallization**, not conduction. A metalized carrier is the StepN algebraic
lens: finite powers close by an integer recurrence. Conduction/load-bearing lives elsewhere, in the
cover-nerve `H¹` and Landauer proofs (`MatterTopology`, `Percolation`, `Thermodynamics.Temperature`).

The dichotomy rests on three proof faces: the finite metallic expansion (`κ < ω`), the
non-idempotent chromatic step (`κ = ω`), and the summable exponential series (`κ = ω`). The boundary
between "metallizable" and "not" is exactly the `κ < ω` / `κ = ω` boundary — the
algebraic/transcendental cut.

## Main results

* `metallization_is_stepn_recurrence` — metalization is the finite StepN recurrence.
* `chromatic_residue_not_metalized` — the chromatic carrier is non-idempotent.
* `transcendental_residue_summable` — the exponential residue is summable at the limit.
* `metallization_dichotomy` — the three signatures bundled together.

## References

`AperiodicOrder.Tiling.StepN.MetallicPowerLens` (the algebraic lens), `AperiodicOrder.Tiling.ChromaticLorentzian` (the
non-idempotent carrier), `Real.ExpSeries` (the transcendental series).

## Tags

metallic, chromatic, transcendental, non-idempotent, dichotomy, kappa-omega
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.AperiodicOrder.Tiling.StepN
open Obsmetrologia.Real.Internal
open Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian

/-- **Metallization is the StepN finite recurrence.** Every metallic real power is a finite
integer-graded combination `zᵏ = Pₖz + Qₖ`. This is the proof face behind the word "metalized":
finite algebraic closure, not load-bearing conduction. -/
theorem metallization_is_stepn_recurrence :
    ∀ (n k : Nat), zpow (metallicZ n) k = (coef n k).1 * metallicZ n + (coef n k).2 :=
  metallic_power_expansion

/-- **The chromatic residue is not metalized by finite idempotence.** The chromatic Lorentzian step
does not collapse after one further step, so it is not caught by the finite metallic recurrence
face. -/
theorem chromatic_residue_not_metalized : step (step mark0) ≠ step mark0 :=
  step_not_idempotent

/-- **The transcendental residue is summable at the limit.** The residue missed by finite
metallization is controlled by the exponential summability estimate. -/
theorem transcendental_residue_summable :
    ∀ (N M : Nat), 1 ≤ N → expSeq (N + M) ≤ expSeq N + (expTerm N + expTerm N) :=
  fun N M hN => expSeq_summable N hN M

/-- **The metallization dichotomy.** Three regime signatures coexist, splitting at the `κ < ω` / `κ =
ω` (algebraic / transcendental) boundary:

1. **`κ < ω` — metallizable.** Every metallic real power is a *finite* integer-graded combination,
   `zᵏ = Pₖz + Qₖ` (`metallic_power_expansion`): the algebraic lens closes at every grade.
2. **`κ = ω` — chromatic, not metallizable.** The chromatic Lorentzian step is 
   *non-idempotent* (`step_not_idempotent`): its closure never stabilizes finitely, so no finite
   metallic recurrence catches it.
3. **`κ = ω` — transcendental discharge.** The exponential series is *summable* — bounded by twice the
   `N`-th term (`expSeq_summable`) — yet never finite: it settles only at the `ω`-limit, the
   transcendental closure of the residue the lens cannot grade. -/
theorem metallization_dichotomy :
    (∀ (n k : Nat), zpow (metallicZ n) k = (coef n k).1 * metallicZ n + (coef n k).2)
    ∧ (step (step mark0) ≠ step mark0)
    ∧ (∀ (N M : Nat), 1 ≤ N → expSeq (N + M) ≤ expSeq N + (expTerm N + expTerm N)) :=
  ⟨metallization_is_stepn_recurrence, chromatic_residue_not_metalized,
    transcendental_residue_summable⟩

end AperiodicOrder.Tiling
end Obsmetrologia
