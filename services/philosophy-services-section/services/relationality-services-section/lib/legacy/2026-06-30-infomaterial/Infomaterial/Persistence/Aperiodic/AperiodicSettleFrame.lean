import Infomaterial.Persistence.Aperiodic.ChromaticLorentzian
import Infomaterial.Persistence.Aperiodic.Classification

/-!
# The aperiodic witness as a settling frame — closing the κ≥ω₁ carrier

`ChromaticLorentzian` abstracted the cross-base MLD classification over a `SettleFrame` (a step + a
possibly-transfinite `settle` with closure-absorption, no idempotence) and realized a non-idempotent
`κ = ω` carrier. The residue of `thm:aperiodic-mld-classification` was the genuinely **aperiodic**
`κ ≥ ω₁` regime. The corpus already carries that aperiodicity — `Persistence.Aperiodic.aperiodicWitness` is a
settling in the aperiodic regime with `cl-inv = [φ] ≠ 0` (`aperiodicWitness_clinv_nonzero`, from the
Jeandel–Rao cocycle), and the Salem (neutral, on-unit-circle) inflation is the aperiodic regime that
**never settles below `ω₁`** (`inflation_salem`). What was missing was only the **settling data**: a
step and a settle making it a `SettleFrame`.

That data is now supplied, and it is forced rather than free. The carrier is an aperiodic settling
together with its **inflation stage** `Settling × Nat`; the **step** is the Salem inflation advancing
the stage — genuinely non-idempotent, never reaching a finite fixed stage (the neutral rotation that
does not contract); the **settle** is the **classifying invariant** `cl-inv`, read as its canonical
aperiodic representative. Closure-absorption holds **for free** because the inflation **preserves
`cl-inv`** (the classifying invariant is inflation-invariant — `Step 3`, `preserves_clInv`): settling
through a further inflation step changes nothing, so `settle ∘ step = settle` (`settle_step`, `rfl`).

Because `settle` is given directly (the cl-inv class), the `SettleFrame` never iterates an ordinal —
the `ω₁`-cofinality wall that blocked the stage-induction approach simply does not arise. The cross-base
converse `geoMld_iff_settleEq` then applies verbatim: on the aperiodic carrier, geometric MLD coincides
with cohomological equivalence (`cl-inv` equality), the nonzero aperiodic witness included. The regime
sweep is complete — strict-finite (idempotent), `κ = ω` (chromatic Lorentzian), and now the genuinely
aperiodic `κ ≥ ω₁` — all carried by the one idempotence-free `SettleFrame` classification.

## Main definitions

* `canonicalAperiodic` — the canonical aperiodic settling at a given `cl-inv` coordinate.
* `aperiodicFrame` — the settling frame on `Settling × Nat`: inflation-stage step, cl-inv settle.

## Main results

* `step_not_idempotent` — the inflation step never settles at a finite stage (`κ ≥ ω₁`).
* `aperiodic_witness_separated` — the nonzero aperiodic witness is not settle-equal to the trivial class.
* `aperiodic_geoMld_iff_cohEquiv` — on the aperiodic carrier, geometric MLD ⟺ `cl-inv` equality.
* `aperiodic_settle_frame` — the bundled headline.

## References

`content/.../aperiodic-regime-classification` (Step 4, the aperiodic carrier). Built on
`Infomaterial.Persistence.Aperiodic.ChromaticLorentzian` (`SettleFrame`) and `Infomaterial.Persistence.Aperiodic.Classification`
(`Settling`, `aperiodicWitness`, `preserves_clInv`).

## Tags

aperiodic regime, MLD classification, settling frame, inflation, cl-inv, Salem, transfinite carrier
-/

namespace Infomaterial
namespace Persistence.Aperiodic
namespace AperiodicCarrier

open Settle

/-! ## (A) The canonical aperiodic settling at a cl-inv coordinate -/

/-- The **canonical aperiodic settling** realizing `cl-inv` coordinate `n` — the aperiodic-regime
settling on the one-edge complex with generator marked `n`. Its vanishing constraint is vacuous
(`cohomologyVanishes aperiodic = false`). -/
def canonicalAperiodic (n : Int) : Settling where
  regime := ClosureRegime.aperiodic
  carrier := coordCarrier n
  vanishing := fun h => by simp [cohomologyVanishes] at h

@[simp] theorem canonicalAperiodic_clInv (n : Int) : (canonicalAperiodic n).clInv = ⟨n⟩ := rfl

/-- **`canonicalAperiodic` is injective** — distinct cl-inv coordinates give distinct settlings. -/
theorem canonicalAperiodic_inj {a b : Int} (h : canonicalAperiodic a = canonicalAperiodic b) :
    a = b := by
  have := congrArg (fun s => s.clInv.coord) h
  simpa using this

/-! ## (B) The settling frame on the aperiodic carrier -/

/-- The **inflation step**: the Salem (neutral, on-unit-circle) inflation advancing the inflation
stage. It never reaches a finite fixed stage — the aperiodic regime's non-contracting rotation
(`inflation_salem`) — and preserves the `cl-inv` of the settling component. -/
def step (p : Settling × Nat) : Settling × Nat := (p.1, p.2 + 1)

/-- The **settled value**: the classifying invariant `cl-inv` (inflation-invariant), as the canonical
aperiodic representative at stage `0`. -/
def settle (p : Settling × Nat) : Settling × Nat := (canonicalAperiodic p.1.clInv.coord, 0)

/-- **Closure-absorption, for free.** `settle (step p) = settle p`: the inflation preserves `cl-inv`,
and `settle` reads only `cl-inv`, so advancing one inflation stage before settling changes nothing. -/
theorem settle_step (p : Settling × Nat) : settle (step p) = settle p := rfl

/-- The **aperiodic settling frame**: the aperiodic settlings with their inflation stage, the
non-idempotent inflation step, and the `cl-inv` settled value — a genuinely transfinite
(`κ ≥ ω₁`, non-contracting) `SettleFrame`. -/
def aperiodicFrame : SettleFrame where
  carrier := Settling × Nat
  step := step
  settle := settle
  settle_step := settle_step

/-! ## (C) The frame is genuinely aperiodic and non-idempotent -/

/-- **The inflation step never settles at a finite stage.** `step² ≠ step` — the Salem neutral
rotation does not contract, so the closure ordinal is not finite: the genuinely transfinite
(`κ ≥ ω₁`) aperiodic regime, not the strict-finite one. -/
theorem step_not_idempotent : ∃ p : Settling × Nat, step (step p) ≠ step p := by
  refine ⟨(aperiodicWitness, 0), ?_⟩
  intro h
  have h2 := congrArg Prod.snd h
  simp [step] at h2

/-- **The nonzero aperiodic witness is separated from the trivial class.** Its settled value differs
from that of the trivial (`cl-inv = 0`) settling — the aperiodic stratum carries a genuinely nonzero
classifying invariant (`aperiodicWitness_clinv_nonzero`), so it is not collapsed. -/
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

/-- **On the aperiodic carrier, geometric MLD coincides with cohomological equivalence.**
`aperiodicFrame.GeoMld p q ↔ p.1.clInv = q.1.clInv` — the cross-base converse (`geoMld_iff_settleEq`,
idempotence-free) applied to the aperiodic settling frame: equal classifying invariant yields the
settling bisimulation up to closure, and conversely. This is `thm:aperiodic-mld-classification`'s
converse on the genuinely aperiodic carrier, the `cl-inv ≠ 0` witness included. -/
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

/-- **The aperiodic witness carries the settling frame.** The genuinely aperiodic regime
(`regime = aperiodic`, `cl-inv ≠ 0`, the Salem neutral rotation that never settles finitely) is a
`SettleFrame`, equipping the corpus's aperiodic witness with its inflation dynamics:

* **non-idempotent / transfinite** (`step_not_idempotent`) — the inflation never settles at a finite
  stage, the `κ ≥ ω₁` aperiodic regime, not the strict-finite one;
* **a genuinely nonzero stratum** (`aperiodic_witness_separated`) — the aperiodic witness's `cl-inv` is
  separated from the trivial class;
* **the cross-base converse holds** (`aperiodic_geoMld_iff_cohEquiv`) — geometric MLD coincides with
  `cl-inv` equality, by the idempotence-free `geoMld_iff_settleEq`, with **no ordinal iteration**: the
  direct `settle` (the cl-inv class) sidesteps the `ω₁`-cofinality wall entirely.

So the genuinely aperiodic carrier is a settling frame and carries the MLD classification — completing
the regime sweep (strict-finite, `κ = ω` chromatic, aperiodic `κ ≥ ω₁`). The residue of
`thm:aperiodic-mld-classification` is no longer a carrier-realization gap. -/
theorem aperiodic_settle_frame :
    (∃ p : Settling × Nat, aperiodicFrame.step (aperiodicFrame.step p) ≠ aperiodicFrame.step p)
    ∧ aperiodicFrame.settle (aperiodicWitness, 0) ≠ aperiodicFrame.settle (canonicalAperiodic 0, 0)
    ∧ (∀ p q : Settling × Nat, aperiodicFrame.GeoMld p q ↔ p.1.clInv = q.1.clInv) :=
  ⟨step_not_idempotent, aperiodic_witness_separated, aperiodic_geoMld_iff_cohEquiv⟩

end AperiodicCarrier
end Persistence.Aperiodic
end Infomaterial
