/-!
# Chromatic-Lorentzian settling — a non-idempotent transfinite MLD carrier

`UpToClosureCoinduction` discharged the cross-base MLD converse (`geoMld_iff_settleEq`) on the settling
coalgebra, and `TransfiniteUpToClosure` carried the limit-stage ladder — but both ran over the in-tree
`ModalFrame` closure, which is **idempotent** (the strict-finite regime, `closureOp_idem`). The residue
of `thm:aperiodic-mld-classification` was then a single named obstacle: realize a 
**non-idempotent** transfinite carrier (closure settling only at a countable limit), where the
seed-to-`Cl E` squeeze no longer collapses the limit.

The cross-base classification never uses idempotence: `bisimUTC_sound` / `bisimUTC_settleKernel`
/ `geoMld_iff_settleEq` all use exactly one law, closure-absorption `settle (step x) = settle x`
— `closureOp_idem` is merely how the `ModalFrame` instance proves it (because `settle = step`
there). So the classification holds for any frame with a step and a (possibly transfinite)
`settle` satisfying absorption, step not required to be idempotent.

This module abstracts the classification over such a `SettleFrame` and realizes a
non-idempotent instance: the chromatic Lorentzian. The Lorentzian datum is the causal
chain `ℕ` (`n ≺ n+1`); a marking is `Nat → Bool`; the settling `step` propagates each mark one tick
into the causal future, and its fixed point `settle` is the **causal past-closure** (`n` is marked iff
some `m ≤ n` is) — reached only after **all** finite propagation stages, the limit `κ = ω`. The step is
non-idempotent (`step² ≠ step`, e.g. a single mark spreads one tick per stage), yet its
past-closure satisfies absorption, so the full cross-base classification holds on it.

So a non-idempotent (`κ = ω`) settling carrier exists and carries the MLD classification with
no idempotence used — discharging the non-idempotent-carrier obstacle of `thm:aperiodic-mld-classification`.
What stays red narrows further: the `ℕ`-chain realizes the countable-cofinality limit `ω`; the 
**aperiodic** `κ ≥ ω₁` regime (uncountable cofinality, beyond the `Nat → Ord` Brouwer ladder) is the
sole remaining height.

## Main definitions

* `SettleFrame` — a step + (transfinite) settle with closure-absorption; no idempotence.
* `SettleFrame.GeoMld` — geometric MLD: a bisimulation up to closure exists.
* `ChromaticLorentzian.step` / `settle` — mark-propagation and past-closure on the causal chain `ℕ`.

## Main results

* `SettleFrame.geoMld_iff_settleEq` — the cross-base converse, idempotence-free.
* `SettleFrame.crossBase_classification` — `GeoMld` is an equivalence relation classified by `settle`.
* `ChromaticLorentzian.step_not_idempotent` — the chromatic-Lorentzian step is non-idempotent.
* `ChromaticLorentzian.chromatic_lorentzian_classification` — a non-idempotent carrier on which the
  classification holds.

## References

`content/.../aperiodic-regime-classification` (Step 4, the transfinite carrier);
`content/.../lorentzian-causal-settling`. Generalizes `Obsmetrologia.AperiodicOrder.Tiling.UpToClosureCoinduction` by
dropping idempotence.

## Tags

MLD classification, up-to-closure, non-idempotent closure, transfinite carrier, chromatic, causal chain
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace Settle

/-! ## (A) The abstract settling frame — classification without idempotence -/

universe u

/-- A **settling frame**: a closure `step` (one settling stage) and its possibly-transfinite fixed
point `settle`, related only by **closure-absorption** `settle ∘ step = settle`. No idempotence of
`step` is required — `settle` may be reached only at a transfinite stage. Universe-polymorphic in the
carrier, so carriers in any `Type u` (e.g. the `Type 1` aperiodic settlings) are admissible. -/
structure SettleFrame where
  /-- The carrier of settling states. -/
  carrier : Type u
  /-- One settling stage (the closure step); need not be idempotent. -/
  step : carrier → carrier
  /-- The settled value — the (possibly transfinite) fixed point. -/
  settle : carrier → carrier
  /-- **Closure-absorption**: settling absorbs a step. The only law the classification needs. -/
  settle_step : ∀ x, settle (step x) = settle x

namespace SettleFrame

variable (F : SettleFrame)

/-- The successor orbit `stepⁿ x`. -/
def orbit (x : F.carrier) : Nat → F.carrier
  | 0 => x
  | n + 1 => F.step (orbit x n)

@[simp] theorem orbit_zero (x : F.carrier) : F.orbit x 0 = x := rfl

@[simp] theorem orbit_succ (x : F.carrier) (n : Nat) :
    F.orbit x (n + 1) = F.step (F.orbit x n) := rfl

/-- **`settle` is constant along the orbit** — closure-absorption iterated. No idempotence. -/
theorem settle_orbit (x : F.carrier) : ∀ n, F.settle (F.orbit x n) = F.settle x := by
  intro n
  induction n with
  | zero => rfl
  | succ k ih => rw [orbit_succ, F.settle_step]; exact ih

/-- **Settling bisimilarity** — orbits agree on the settled value at every stage. -/
def Bisim (x y : F.carrier) : Prop := ∀ n, F.settle (F.orbit x n) = F.settle (F.orbit y n)

/-- **A bisimulation up to closure** — agrees on the settled value and is closed under the joint step. -/
def BisimUTC (R : F.carrier → F.carrier → Prop) : Prop :=
  ∀ x y, R x y → F.settle x = F.settle y ∧ R (F.step x) (F.step y)

/-- A bisimulation up to closure stays on the orbit. -/
theorem bisimUTC_orbit {R : F.carrier → F.carrier → Prop} (hR : F.BisimUTC R)
    {x y : F.carrier} (h : R x y) : ∀ n, R (F.orbit x n) (F.orbit y n) := by
  intro n
  induction n with
  | zero => exact h
  | succ k ih => exact (hR _ _ ih).2

/-- **Up-to-closure coinduction (soundness)** — a bisimulation up to closure is contained in settling
bisimilarity. Uses only closure-absorption, no idempotence. -/
theorem bisimUTC_sound {R : F.carrier → F.carrier → Prop} (hR : F.BisimUTC R)
    {x y : F.carrier} (h : R x y) : F.Bisim x y :=
  fun n => (hR _ _ (F.bisimUTC_orbit hR h n)).1

/-- **Bisimilarity ⟺ equal settled value.** -/
theorem bisim_iff_settleEq (x y : F.carrier) : F.Bisim x y ↔ F.settle x = F.settle y := by
  constructor
  · intro h; have h0 := h 0; simpa using h0
  · intro h n; rw [F.settle_orbit, F.settle_orbit]; exact h

/-- **Geometric mutual local derivability** — a bisimulation up to closure exists. -/
def GeoMld (x y : F.carrier) : Prop := ∃ R, F.BisimUTC R ∧ R x y

/-- The **settled-value kernel** is a bisimulation up to closure (closure-absorption). -/
theorem bisimUTC_settleKernel : F.BisimUTC (fun x y => F.settle x = F.settle y) :=
  fun x y h => ⟨h, by
    show F.settle (F.step x) = F.settle (F.step y)
    rw [F.settle_step, F.settle_step]; exact h⟩

/-- **The cross-base MLD converse, idempotence-free.** Geometric MLD coincides with equal settled
value — converse included, the settled-value kernel as the constructed witness — for *any* settling
frame, the step idempotent or not. -/
theorem geoMld_iff_settleEq (x y : F.carrier) : F.GeoMld x y ↔ F.settle x = F.settle y := by
  constructor
  · rintro ⟨R, hR, hxy⟩; exact (hR _ _ hxy).1
  · intro h; exact ⟨_, F.bisimUTC_settleKernel, h⟩

theorem geoMld_refl (x : F.carrier) : F.GeoMld x x := (F.geoMld_iff_settleEq x x).2 rfl

theorem geoMld_symm {x y : F.carrier} (h : F.GeoMld x y) : F.GeoMld y x :=
  (F.geoMld_iff_settleEq y x).2 ((F.geoMld_iff_settleEq x y).1 h).symm

theorem geoMld_trans {x y z : F.carrier} (h : F.GeoMld x y) (h' : F.GeoMld y z) : F.GeoMld x z :=
  (F.geoMld_iff_settleEq x z).2
    (((F.geoMld_iff_settleEq x y).1 h).trans ((F.geoMld_iff_settleEq y z).1 h'))

/-- **The cross-base classification on a settling frame.** `GeoMld` is an equivalence relation and
coincides with equality of the settled value — for any frame satisfying closure-absorption, with **no
idempotence**. The `ModalFrame` settling is the idempotent instance
(`AperiodicOrder.Tiling.UpTo.crossBase_classification`); the chromatic Lorentzian below is a non-idempotent one. -/
theorem crossBase_classification :
    (∀ x : F.carrier, F.GeoMld x x)
    ∧ (∀ x y : F.carrier, F.GeoMld x y → F.GeoMld y x)
    ∧ (∀ x y z : F.carrier, F.GeoMld x y → F.GeoMld y z → F.GeoMld x z)
    ∧ (∀ x y : F.carrier, F.GeoMld x y ↔ F.settle x = F.settle y) :=
  ⟨F.geoMld_refl,
   fun _ _ h => F.geoMld_symm h,
   fun _ _ _ h h' => F.geoMld_trans h h',
   fun x y => F.geoMld_iff_settleEq x y⟩

end SettleFrame

end Settle

/-! ## (B) The chromatic Lorentzian — a non-idempotent carrier -/

namespace ChromaticLorentzian

open Settle

/-- The settling **step** on a marking of the causal chain `ℕ` (`n ≺ n+1`): each mark propagates one
tick into the causal future. `step f (n+1) = f (n+1) ∨ f n` — `n+1` is marked if it was, or if its
causal predecessor `n` was. -/
def step (f : Nat → Bool) : Nat → Bool
  | 0 => f 0
  | n + 1 => f (n + 1) || f n

/-- The **settled marking** — the causal past-closure: `n` is marked iff some `m ≤ n` is.
`settle f (n+1) = f (n+1) ∨ settle f n`. This is the transfinite fixed point of `step`, reached only
after all finite propagation stages (the limit `κ = ω`). -/
def settle (f : Nat → Bool) : Nat → Bool
  | 0 => f 0
  | n + 1 => f (n + 1) || settle f n

/-- The settled value absorbs the seed at each point: `f n ∨ settle f n = settle f n`. -/
theorem self_le_settle (f : Nat → Bool) (n : Nat) : (f n || settle f n) = settle f n := by
  cases n with
  | zero => show (f 0 || f 0) = f 0; exact Bool.or_self (f 0)
  | succ k =>
    show (f (k + 1) || (f (k + 1) || settle f k)) = (f (k + 1) || settle f k)
    rw [← Bool.or_assoc, Bool.or_self]

/-- **Closure-absorption** for the chromatic Lorentzian: `settle (step f) = settle f`. Propagating the
marks one tick before taking the past-closure changes nothing — the past-closure already saw every
earlier mark. Proof by induction on the index. -/
theorem settle_step (f : Nat → Bool) : settle (step f) = settle f := by
  funext n
  induction n with
  | zero => rfl
  | succ k ih =>
    show settle (step f) (k + 1) = settle f (k + 1)
    simp only [settle, step]
    rw [ih, Bool.or_assoc, self_le_settle]

/-- The single mark at the origin `0`. -/
def mark0 : Nat → Bool := fun n => decide (n = 0)

/-- **The chromatic-Lorentzian step is non-idempotent.** A single mark at `0` reaches `1`
after one step and `2` only after two — `step (step mark0) ≠ step mark0` at index `2`. So the closure
settles only at the limit `κ = ω`, not at any finite stage: a transfinite carrier. -/
theorem step_not_idempotent : step (step mark0) ≠ step mark0 := by
  intro h
  have h2 := congrFun h 2
  rw [show step (step mark0) 2 = true from rfl, show step mark0 2 = false from rfl] at h2
  exact absurd h2 (by decide)

/-- The **chromatic-Lorentzian settling frame**: markings of the causal chain `ℕ` under past-closure
propagation. A non-idempotent carrier (`step² ≠ step`) settling at `κ = ω`, satisfying
closure-absorption (`settle_step`). -/
def frame : SettleFrame where
  carrier := Nat → Bool
  step := step
  settle := settle
  settle_step := settle_step

/-- **The chromatic Lorentzian realizes a non-idempotent MLD carrier.** The frame's step is 
non-idempotent (`step² ≠ step`), yet the cross-base MLD classification holds on it: geometric MLD
coincides with equality of the settled (past-closure) value, with **no idempotence used**. This
discharges the non-idempotent-carrier obstacle of `thm:aperiodic-mld-classification` for a concrete
transfinite (`κ = ω`) carrier; the residue narrows to the aperiodic `κ ≥ ω₁` height. -/
theorem chromatic_lorentzian_classification :
    (∃ f : Nat → Bool, frame.step (frame.step f) ≠ frame.step f)
    ∧ (∀ x y : Nat → Bool, frame.GeoMld x y ↔ frame.settle x = frame.settle y) :=
  ⟨⟨mark0, step_not_idempotent⟩, fun x y => frame.geoMld_iff_settleEq x y⟩

end ChromaticLorentzian

end AperiodicOrder.Tiling
end Obsmetrologia
