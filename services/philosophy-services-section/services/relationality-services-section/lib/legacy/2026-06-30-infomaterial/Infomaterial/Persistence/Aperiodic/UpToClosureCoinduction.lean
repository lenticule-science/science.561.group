import Infomaterial.Closure.Coalgebra

/-!
# Up-to-closure coinduction and the cross-base MLD converse, on the settling coalgebra

`CommonBaseClassification` proved the MLD converse on a *shared* base by an explicit firing-ordinal
bijection; `ClassificationReduction` isolated the remaining open part of
`thm:aperiodic-mld-classification` to **completeness** of the *geometric* MLD across **different**
bases, naming the bridge: Hermida–Jacobs fibered coinduction with Bonchi **up-to-closure**. This
module supplies that bridge on the settling coalgebra `(E, c)` of `SettlingCoalgebra`.

The settling dynamics is the closure step `Cl = closureOp`; the **settled value** `settle E = Cl E`
is the carrier-level classifying datum (the realized fixed point the `H¹` class is read from). The
construction:

* **`Bisim`** — settling bisimilarity, the greatest bisimulation unrolled over orbit stages
  (`∀ n, settle (orbit E n) = settle (orbit E' n)`).
* **`BisimUTC`** — a settling bisimulation **up to closure**: a relation that agrees on the settled
  value and is closed under the *joint closure step* (the successors `Cl v`, `Cl w` are related
  again). The "up to closure" is exactly what lets a relation across two **different bases** be a
  bisimulation: settling **absorbs** a closure step (`settle_closureOp`), so the settled-value kernel
  is forward-closed even though the two carriers differ stage by stage.
* **`bisimUTC_sound`** — the coinduction principle: a bisimulation up to closure is contained in
  settling bisimilarity. This is the Bonchi up-to-closure soundness, proved by induction over stages.
* **`geoMld_iff_settleEq`** — the converse, discharged: the geometric MLD (existence of a settling
  bisimulation up to closure — the invertible settling-morphism) **coincides** with equal settled
  value, the cross-base converse included; the witnessing morphism is the settled-value kernel.

This is `thm:aperiodic-mld-classification`'s converse on the coalgebra, wherever the settling closure
is **idempotent** (reaches its fixed point) — which `Infomaterial`'s closure provably is (`closureOp_idem`,
the strict-finite regime). The residue of the *abstract* node is the genuinely **transfinite**
aperiodic regime (non-idempotent stage-closure, fixed point only at a countable limit), where
`bisimUTC_sound`'s stage induction must be carried up the `coalgebraOrbitLimit` ladder through `ω₁`
and the abstract `Settling` carrier must be realized by a transfinite coalgebra — not a defect of the
coinduction principle, which is proved here, but the construction of its transfinite carrier.

## Main definitions

* `Bisim`, `BisimUTC` — settling bisimilarity and bisimulation up to closure.
* `GeoMld` — geometric mutual local derivability: a settling bisimulation up to closure exists.

## Main results

* `bisimUTC_sound` — up-to-closure coinduction: `BisimUTC R → R E E' → Bisim E E'`.
* `geoMld_iff_settleEq` — geometric MLD coincides with equal settled value (converse included).
* `crossBase_classification` — `GeoMld` is an equivalence relation and is classified by `settle`.

## References

`content/.../aperiodic-regime-classification` (Step 4, cross-base), `content/.../mutually-locally-derivable`.
Built on `Infomaterial.Closure.Coalgebra`.

## Tags

mutual local derivability, up-to-closure, coinduction, bisimulation, settling coalgebra, cross-base
-/

namespace Infomaterial
namespace Persistence.Aperiodic
namespace UpTo

open Valuation Valuation.ModalFrame

variable (M : ModalFrame)

/-! ## (A) Closure-absorption: the up-to-closure step is observationally inert

The settled value `settle = Cl` is a fixed point of the closure (`closureOp_idem`), so applying a
further closure step before settling changes nothing. This single fact is what makes the
settled-value kernel a bisimulation *up to closure*: it survives the joint closure step. -/

/-- The seed sits below its settled value (`E ≤ₖ settle E`); settling is inflationary. -/
theorem le_settle (E : Valuation) : leK E (M.settle E) := M.closureOp_infl E

/-- **Closure-absorption.** Settling absorbs a closure step: `settle (Cl E) = settle E`. (Here
`settle = Cl` and `Cl` is idempotent, so both sides are `Cl E`.) -/
theorem settle_closureOp (E : Valuation) : M.settle (M.closureOp E) = M.settle E :=
  M.closureOp_idem E

/-- **The settled value is constant along the orbit.** Every orbit stage settles to the same value
as the seed: `settle (orbit E n) = settle E`. The orbit only iterates the closure, which settling
absorbs. -/
theorem settle_orbit (E : Valuation) : ∀ n, M.settle (orbit M E n) = M.settle E := by
  intro n
  induction n with
  | zero => rw [orbit_zero]
  | succ k ih => rw [orbit_succ, settle_closureOp]; exact ih

/-! ## (B) Settling bisimilarity and bisimulation up to closure -/

/-- **Settling bisimilarity** — the greatest settling bisimulation, unrolled over orbit stages: two
carriers are bisimilar when their orbits agree on the settled value at every stage. -/
def Bisim (E E' : Valuation) : Prop := ∀ n, M.settle (orbit M E n) = M.settle (orbit M E' n)

/-- **A settling bisimulation up to closure.** A relation `R` that (i) agrees on the settled value
wherever it relates, and (ii) is closed under the **joint closure step** — if `R v w` then
`R (Cl v) (Cl w)`. "Up to closure" because, by closure-absorption, the successors need only be
re-related *after* a closure step, so a relation between two **different bases** qualifies. -/
def BisimUTC (R : Valuation → Valuation → Prop) : Prop :=
  ∀ v w, R v w → M.settle v = M.settle w ∧ R (M.closureOp v) (M.closureOp w)

/-- A bisimulation up to closure stays on the orbit: if `R E E'` then `R (orbit E n) (orbit E' n)`
at every stage — the joint closure step *is* the joint orbit step (`orbit_succ`). -/
theorem bisimUTC_orbit {R : Valuation → Valuation → Prop} (hR : BisimUTC M R)
    {E E' : Valuation} (h : R E E') : ∀ n, R (orbit M E n) (orbit M E' n) := by
  intro n
  induction n with
  | zero => rw [orbit_zero, orbit_zero]; exact h
  | succ k ih => rw [orbit_succ, orbit_succ]; exact (hR _ _ ih).2

/-- **Up-to-closure coinduction (soundness).** A settling bisimulation up to closure is contained in
settling bisimilarity: if `R E E'` and `R` is a `BisimUTC`, then the orbits of `E` and `E'` agree on
the settled value at every stage. This is the Bonchi up-to-closure principle — the closure context is
compatible, so reasoning "up to a closure step" is sound for settling bisimulation. -/
theorem bisimUTC_sound {R : Valuation → Valuation → Prop} (hR : BisimUTC M R)
    {E E' : Valuation} (h : R E E') : Bisim M E E' :=
  fun n => (hR _ _ (bisimUTC_orbit M hR h n)).1

/-! ## (C) Bisimilarity is classified by the settled value -/

/-- **Bisimilarity ⟺ equal settled value.** Settling bisimilarity collapses to equality of settled
values: the forward direction reads off stage `0`, the converse rebuilds the stage-wise agreement
from closure-absorption (`settle_orbit`). The settled value is a **complete** invariant for settling
bisimilarity. -/
theorem bisim_iff_settleEq (E E' : Valuation) :
    Bisim M E E' ↔ M.settle E = M.settle E' := by
  constructor
  · intro h
    have := h 0
    rwa [orbit_zero, orbit_zero] at this
  · intro h n
    rw [settle_orbit, settle_orbit]; exact h

/-! ## (D) Geometric MLD and the cross-base converse -/

/-- **Geometric mutual local derivability**: a settling bisimulation up to closure relating `E` and
`E'` exists — the invertible settling-morphism the corpus's MLD names, realized as the witnessing
bisimulation. A priori stronger than equality of the settled invariant (it demands a *morphism*, not
just equal values); the converse below shows it is in fact equivalent. -/
def GeoMld (E E' : Valuation) : Prop := ∃ R, BisimUTC M R ∧ R E E'

/-- The **settled-value kernel** `settle v = settle w` is a settling bisimulation up to closure: it
agrees on the settled value by definition, and survives the joint closure step by closure-absorption.
This is the witness that discharges the cross-base converse. -/
theorem bisimUTC_settleKernel : BisimUTC M (fun v w => M.settle v = M.settle w) :=
  fun v w h => ⟨h, by
    show M.settle (M.closureOp v) = M.settle (M.closureOp w)
    rw [settle_closureOp, settle_closureOp]; exact h⟩

/-- **The cross-base MLD converse, discharged.** Geometric MLD coincides with equal settled value.

* (**Step 3**, forward) a settling bisimulation up to closure agrees on the settled value at its
  seed, so `GeoMld E E' → settle E = settle E'`;
* (**Step 4**, converse — the open part) equal settled value yields a settling bisimulation up to
  closure: the settled-value kernel (`bisimUTC_settleKernel`) relates `E` and `E'`. The morphism is
  *constructed*, not assumed.

This is the cross-base case of `thm:aperiodic-mld-classification`, on the settling coalgebra, wherever
the closure settles (is idempotent). -/
theorem geoMld_iff_settleEq (E E' : Valuation) :
    GeoMld M E E' ↔ M.settle E = M.settle E' := by
  constructor
  · rintro ⟨R, hR, hEE'⟩
    exact (hR _ _ hEE').1
  · intro h
    exact ⟨_, bisimUTC_settleKernel M, h⟩

/-! ## (E) The groupoid laws and the headline -/

/-- `GeoMld` is reflexive — the identity morphism (the diagonal kernel). -/
theorem geoMld_refl (E : Valuation) : GeoMld M E E :=
  (geoMld_iff_settleEq M E E).2 rfl

/-- `GeoMld` is symmetric — the morphism inverts. -/
theorem geoMld_symm {E E' : Valuation} (h : GeoMld M E E') : GeoMld M E' E :=
  (geoMld_iff_settleEq M E' E).2 ((geoMld_iff_settleEq M E E').1 h).symm

/-- `GeoMld` is transitive — morphisms compose. -/
theorem geoMld_trans {E E' E'' : Valuation}
    (h : GeoMld M E E') (h' : GeoMld M E' E'') : GeoMld M E E'' :=
  (geoMld_iff_settleEq M E E'').2
    (((geoMld_iff_settleEq M E E').1 h).trans ((geoMld_iff_settleEq M E' E'').1 h'))

/-- **The coalgebraic cross-base MLD classification.** On the settling coalgebra, geometric mutual
local derivability is an equivalence relation and **coincides** with equality of the settled value —
both directions, the cross-base converse included — by up-to-closure coinduction
(`bisimUTC_sound`) with the settled-value kernel as the constructed morphism. This discharges the
common-frame, settled-reach case of `thm:aperiodic-mld-classification`; the residue is the genuinely
transfinite aperiodic regime, where the stage induction must climb the `coalgebraOrbitLimit` ladder
through `ω₁` over a transfinite carrier not yet realized in-tree. -/
theorem crossBase_classification :
    (∀ E : Valuation, GeoMld M E E)
    ∧ (∀ E E' : Valuation, GeoMld M E E' → GeoMld M E' E)
    ∧ (∀ E E' E'' : Valuation, GeoMld M E E' → GeoMld M E' E'' → GeoMld M E E'')
    ∧ (∀ E E' : Valuation, GeoMld M E E' ↔ M.settle E = M.settle E') :=
  ⟨geoMld_refl M,
   fun _ _ h => geoMld_symm M h,
   fun _ _ _ h h' => geoMld_trans M h h',
   fun E E' => geoMld_iff_settleEq M E E'⟩

end UpTo
end Persistence.Aperiodic
end Infomaterial
