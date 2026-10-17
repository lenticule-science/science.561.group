import Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian
import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.Closure.Ordinal

/-!
# The aperiodic witness as a settling frame

`aperiodicFrame` is the `SettleFrame` (`ChromaticLorentzian`) on `Settling × Nat` built from
`aperiodicWitness` (`regime = aperiodic`, `cl-inv = [φ] ≠ 0`). `step` advances a bare stage
counter and never reads the settling component; `settle` discards the counter and reads
`cl-inv`. `step_not_idempotent` is `Nat.succ`'s non-idempotence and holds regardless of
`aperiodicWitness`'s regime — it is not evidence of `κ ≥ ω₁`.

`aperiodicWitness.regime = aperiodic` is asserted data, not derived from an ordinal:
`Ord.regimeOfOrdHonest_ne_aperiodic` (`Closure.Ordinal`) shows no `Ord`-derived classifier
outputs `aperiodic`, since every `Ord` this library can build carries a countable cofinal
witness (`Ord.exists_countable_cofinal_witness`), making `κ ≥ ω₁` unreachable here.

## Main definitions

`canonicalAperiodic`, `aperiodicFrame`.

## Main results

`aperiodic_settle_frame` (bundled headline), `aperiodicWitness_regime_not_ordinal_derived`.

## References

`content/.../aperiodic-regime-classification` (Step 4, aperiodic carrier).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace AperiodicCarrier

open Settle

/-! ## (A) The canonical aperiodic settling at a cl-inv coordinate -/

/-- The aperiodic settling at `cl-inv` coordinate `n`, on the one-edge complex with generator
marked `n`. -/
def canonicalAperiodic (n : Int) : Settling where
  regime := ClosureRegime.aperiodic
  carrier := coordCarrier n
  vanishing := fun h => by simp [cohomologyVanishes] at h

@[simp] theorem canonicalAperiodic_clInv (n : Int) : (canonicalAperiodic n).clInv = ⟨n⟩ := rfl

theorem canonicalAperiodic_inj {a b : Int} (h : canonicalAperiodic a = canonicalAperiodic b) :
    a = b := by
  have := congrArg (fun s => s.clInv.coord) h
  simpa using this

/-! ## (B) The settling frame on the aperiodic carrier -/

/-- Advances the stage counter; never reads the settling component. -/
def step (p : Settling × Nat) : Settling × Nat := (p.1, p.2 + 1)

/-- Discards the counter, reads `cl-inv` at stage `0`. -/
def settle (p : Settling × Nat) : Settling × Nat := (canonicalAperiodic p.1.clInv.coord, 0)

theorem settle_step (p : Settling × Nat) : settle (step p) = settle p := rfl

def aperiodicFrame : SettleFrame where
  carrier := Settling × Nat
  step := step
  settle := settle
  settle_step := settle_step

/-! ## (C) The stage counter never idempotes, and the aperiodic label is asserted, not derived -/

/-- `step² ≠ step` — `Nat.succ`'s non-idempotence; holds for any regime, not just aperiodic. -/
theorem step_not_idempotent : ∃ p : Settling × Nat, step (step p) ≠ step p := by
  refine ⟨(aperiodicWitness, 0), ?_⟩
  intro h
  have h2 := congrArg Prod.snd h
  simp [step] at h2

/-- `aperiodicWitness`'s settled value differs from the trivial (`cl-inv = 0`) settling's. -/
theorem aperiodic_witness_separated :
    aperiodicFrame.settle (aperiodicWitness, 0) ≠ aperiodicFrame.settle (canonicalAperiodic 0, 0) := by
  intro h
  apply aperiodicWitness_clinv_nonzero
  have hfst : canonicalAperiodic aperiodicWitness.clInv.coord = canonicalAperiodic 0 :=
    congrArg Prod.fst h
  have hc : aperiodicWitness.clInv.coord = 0 := canonicalAperiodic_inj hfst
  show (⟨aperiodicWitness.clInv.coord⟩ : H1Class) = ⟨0⟩
  rw [hc]

/-! ## (D) The cross-base converse on the aperiodic carrier -/

/-- `aperiodicFrame.GeoMld p q ↔ p.1.clInv = q.1.clInv`. -/
theorem aperiodic_geoMld_iff_cohEquiv (p q : Settling × Nat) :
    aperiodicFrame.GeoMld p q ↔ p.1.clInv = q.1.clInv := by
  rw [SettleFrame.geoMld_iff_settleEq]
  constructor
  · intro h
    have hco : p.1.clInv.coord = q.1.clInv.coord :=
      canonicalAperiodic_inj (congrArg Prod.fst h)
    show p.1.clInv = q.1.clInv
    have hp : p.1.clInv = ⟨p.1.clInv.coord⟩ := rfl
    have hq : q.1.clInv = ⟨q.1.clInv.coord⟩ := rfl
    rw [hp, hq, hco]
  · intro h
    show aperiodicFrame.settle p = aperiodicFrame.settle q
    show settle p = settle q
    have : p.1.clInv.coord = q.1.clInv.coord := congrArg H1Class.coord h
    show (canonicalAperiodic p.1.clInv.coord, 0) = (canonicalAperiodic q.1.clInv.coord, 0)
    rw [this]

/-! ## (E) The bundled headline -/

/-- Bundles `step_not_idempotent`, `aperiodic_witness_separated`, `aperiodic_geoMld_iff_cohEquiv`. -/
theorem aperiodic_settle_frame :
    (∃ p : Settling × Nat, aperiodicFrame.step (aperiodicFrame.step p) ≠ aperiodicFrame.step p)
    ∧ aperiodicFrame.settle (aperiodicWitness, 0) ≠ aperiodicFrame.settle (canonicalAperiodic 0, 0)
    ∧ (∀ p q : Settling × Nat, aperiodicFrame.GeoMld p q ↔ p.1.clInv = q.1.clInv) :=
  ⟨step_not_idempotent, aperiodic_witness_separated, aperiodic_geoMld_iff_cohEquiv⟩

/-! ## (F) The aperiodic label is asserted data, not a derived ordinal fact -/

/-- No `Ord.regimeOfOrdHonest` output equals `aperiodicWitness.regime` — see the module
docstring. -/
theorem aperiodicWitness_regime_not_ordinal_derived (κ : Ord) (scottContinuous : Bool) :
    Ord.regimeOfOrdHonest κ scottContinuous ≠ aperiodicWitness.regime :=
  Ord.regimeOfOrdHonest_ne_aperiodic κ scottContinuous

end AperiodicCarrier
end AperiodicOrder.Tiling
end Obsmetrologia
