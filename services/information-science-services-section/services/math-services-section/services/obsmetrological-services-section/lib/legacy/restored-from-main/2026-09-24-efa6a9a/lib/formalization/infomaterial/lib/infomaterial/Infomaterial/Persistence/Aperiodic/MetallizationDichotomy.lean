import Infomaterial.Persistence.Aperiodic.StepN.MetallicPowerLens
import Infomaterial.Persistence.Aperiodic.ChromaticLorentzian
import Infomaterial.Calculus.Real.ExpSeries

/-!
# The metallization dichotomy — `κ < ω` algebraic vs `κ = ω` transcendental

The metallic power lens grades real *algebraic* powers `zᵏ = Pₖz + Qₖ` (`metallic_power_expansion`) —
a **finite** integer recurrence, the `κ < ω` strict-algebraic regime. The chromatic Lorentzian is the
genuinely **non-idempotent** carrier (`step_not_idempotent`): its closure settles only at the limit,
the `κ = ω` regime, where no finite recurrence catches it — it *cannot be metallized*. Its
transcendental residue is discharged by the exponential power series, which is **summable but never
finite** (`expSeq_summable`): the partial sums approach a limit no algebraic expansion reaches.

This module crystallizes the dichotomy as one theorem bundling the three regimes' signatures: the
finite metallic expansion (`κ < ω`), the non-idempotent chromatic step (`κ = ω`), and the summable
exponential series (`κ = ω`). The boundary between "metallizable" and "not" is exactly the `κ < ω` /
`κ = ω` boundary — the algebraic/transcendental cut.

## Main results

* `metallization_dichotomy` — the three coexisting signatures: metallic finiteness, chromatic
  non-idempotence, exponential summability.

## References

`Persistence.Aperiodic.StepN.MetallicPowerLens` (the algebraic lens), `Persistence.Aperiodic.ChromaticLorentzian` (the
non-idempotent carrier), `Real.ExpSeries` (the transcendental series).

## Tags

metallic, chromatic, transcendental, non-idempotent, dichotomy, kappa-omega
-/

namespace Infomaterial
namespace Persistence.Aperiodic

open Infomaterial.Persistence.Aperiodic.StepN
open Infomaterial.Real.Internal
open Infomaterial.Persistence.Aperiodic.ChromaticLorentzian

/-- **The metallization dichotomy.** Three regime signatures coexist, splitting at the `κ < ω` / `κ =
ω` (algebraic / transcendental) boundary:

1. **`κ < ω` — metallizable.** Every metallic real power is a *finite* integer-graded combination,
   `zᵏ = Pₖz + Qₖ` (`metallic_power_expansion`): the algebraic lens closes at every grade.
2. **`κ = ω` — chromatic, not metallizable.** The chromatic Lorentzian step is genuinely
   *non-idempotent* (`step_not_idempotent`): its closure never stabilizes finitely, so no finite
   metallic recurrence catches it.
3. **`κ = ω` — transcendental discharge.** The exponential series is *summable* — bounded by twice the
   `N`-th term (`expSeq_summable`) — yet never finite: it settles only at the `ω`-limit, the
   transcendental closure of the residue the lens cannot grade. -/
theorem metallization_dichotomy :
    (∀ (n k : Nat), zpow (metallicZ n) k = (coef n k).1 * metallicZ n + (coef n k).2)
    ∧ (step (step mark0) ≠ step mark0)
    ∧ (∀ (N M : Nat), 1 ≤ N → expSeq (N + M) ≤ expSeq N + (expTerm N + expTerm N)) :=
  ⟨metallic_power_expansion, step_not_idempotent, fun N M hN => expSeq_summable N hN M⟩

end Persistence.Aperiodic
end Infomaterial
