/-!
# Pre-value categories — the non-thin value layer for lax closure

`Positing.Value.Category`'s `ValueCategory` is **antisymmetric** (thin), and `LaxSlackDiagnosis`
proves that on any antisymmetric carrier the KZ inequality collapses to strict idempotence — so a
thin carrier can carry *no* lax-idempotence slack. Stable contradiction dynamics therefore
need a **non-thin** carrier: a preorder that need not be antisymmetric, where two distinct values can
be mutually below each other. This module adds `PreValueCategory` alongside the existing thin
`ValueCategory` (it does not replace it), with a lax (KZ, not idempotent) closure, and proves the
structural fact that **lax slack witnesses non-thinness**.

## Main definitions

* `PreValueCategory` — a preorder-valued carrier with a seed `bot`, not required antisymmetric.
* `LaxVClosure` — an inflationary, monotone closure satisfying the KZ inequality (not idempotence).
* `HasLaxSlack` — `op (op v) ≤ op v` but `op (op v) ≠ op v`.

## Main results

* `laxSlack_witnesses_nonantisymmetry` — lax slack gives two mutually-`≤`, distinct values.
* `laxClosure_idem_of_antisymm` — on an antisymmetric carrier the lax closure is idempotent.
* `genuine_lax_cone_needs_non_thin_carrier` — lax slack forces a non-thin carrier.

## References

`content/.../aperiodic-settling`; complements `Obsmetrologia.Closure.LaxSlackDiagnosis`.

## Tags

pre-value category, preorder, lax closure, KZ inequality, non-thin carrier, paraconsistency
-/

namespace Obsmetrologia
namespace Positing.Value

/-- A **pre-value category**: a preorder-valued carrier with a seed, **not** required
antisymmetric — the non-thin generalization of `ValueCategory`. -/
structure PreValueCategory where
  /-- The value carrier. -/
  carrier : Type
  /-- The value preorder. -/
  le : carrier → carrier → Prop
  /-- Reflexivity. -/
  le_refl : ∀ a, le a a
  /-- Transitivity. -/
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  /-- The seed value. -/
  bot : carrier

/-- A **lax closure** over a pre-value carrier: inflationary and monotone, satisfying the KZ
inequality `op (op v) ≤ op v` rather than strict idempotence. -/
structure LaxVClosure (V : PreValueCategory) where
  /-- The closure operator. -/
  op : V.carrier → V.carrier
  /-- Inflationary: `v ≤ op v`. -/
  infl : ∀ v, V.le v (op v)
  /-- Monotone. -/
  mono : ∀ {v w}, V.le v w → V.le (op v) (op w)
  /-- The KZ (lax-idempotence) inequality `op (op v) ≤ op v`. -/
  kz : ∀ v, V.le (op (op v)) (op v)

/-- A closure has **lax slack** at `v` when `op (op v) ≤ op v` but they are not equal. -/
def HasLaxSlack {V : PreValueCategory} (T : LaxVClosure V) (v : V.carrier) : Prop :=
  V.le (T.op (T.op v)) (T.op v) ∧ T.op (T.op v) ≠ T.op v

/-- lax slack exhibits two mutually-`≤` but distinct values — the preorder version of
`LaxSlackDiagnosis.lax_slack_witnesses_antisymmetry_failure`. -/
theorem laxSlack_witnesses_nonantisymmetry {V : PreValueCategory} (T : LaxVClosure V)
    (v : V.carrier) (h : HasLaxSlack T v) :
    V.le (T.op (T.op v)) (T.op v)
    ∧ V.le (T.op v) (T.op (T.op v))
    ∧ T.op (T.op v) ≠ T.op v :=
  ⟨h.1, T.infl (T.op v), h.2⟩

/-- On an **antisymmetric** carrier the lax closure is idempotent — slack collapses, recovering the
thin `VClosure`. -/
theorem laxClosure_idem_of_antisymm {V : PreValueCategory}
    (hanti : ∀ x y, V.le x y → V.le y x → x = y) (T : LaxVClosure V) (v : V.carrier) :
    T.op (T.op v) = T.op v :=
  hanti _ _ (T.kz v) (T.infl (T.op v))

/-- **lax slack needs a non-thin carrier.** If a lax closure has real slack at any value,
the carrier is not antisymmetric: there exist distinct values that are mutually `≤`. This is the
structural justification for a paraconsistent/lax cone value layer. -/
theorem genuine_lax_cone_needs_non_thin_carrier {V : PreValueCategory} (T : LaxVClosure V)
    (v : V.carrier) (h : HasLaxSlack T v) :
    ∃ x y : V.carrier, V.le x y ∧ V.le y x ∧ x ≠ y :=
  ⟨T.op (T.op v), T.op v, h.1, T.infl (T.op v), h.2⟩

end Positing.Value
end Obsmetrologia
