import Infomaterial.Persistence.Aperiodic.AperiodicSettleFrame
import Infomaterial.Persistence.Aperiodic.ClassificationReduction

/-!
# The geometric MLD is complete — the coalgebraic resolution of the classification

`ClassificationReduction` reduced `thm:aperiodic-mld-classification` to one named condition:
**completeness** of the *geometric* MLD (`CohEquiv ⟹ Mld`). It proved completeness *realizable* only
by the coarsest structure `cohEquivLocalDerivability`, where `Mld` is *defined* to be `CohEquiv` — and
flagged, honestly, that this is **not** the geometric resolution: the abstract `LocalDerivability.Mld :
Prop` carries no morphism data, and the open bridge is "whether the *geometric* MLD (invertible
settling-morphisms) is complete… a genuinely richer (coalgebraic) settling model than the abstract
`Mld : Prop`."

This module supplies that geometric model and proves it complete. The geometric MLD is the coalgebraic
relation of `AperiodicSettleFrame`: `v ∼ v'` iff a **settling bisimulation up to closure** relates them
on the aperiodic inflation-stage coalgebra (embedded at stage `0`) — `∃ R, BisimUTC R ∧ R (v,0)
(v',0)`, genuine **morphism-existence**, not equality of an invariant. We build a `LocalDerivability`
whose `Mld` is this geometric relation and prove it `Complete`. Completeness is **not** definitional: the
witnessing morphism for `CohEquiv v v' ⟹ Mld v v'` is *constructed* — the settled-value kernel
(`bisimUTC_settleKernel`), the Bonchi up-to-closure bisimulation — by the idempotence-free
`geoMld_iff_settleEq`. So the structure realizing completeness is the geometric one, with morphism data,
discharging `ClassificationReduction`'s named bridge rather than the trivial `cohEquivLocalDerivability`.

What this does **not** yet do, and stays the residue of `thm:aperiodic-mld-classification`: the aperiodic
frame's `settle` is taken to read the realized fixed point as its `cl-inv` class (the corpus's own
identification — the `H¹` class *is* read off the settled value), not derived from an independent
primitive transfinite `closureOp : Settling → Settling` iterated to `κ ≥ ω₁`. Identifying the frame's
`settle` with that primitive closure operator — making the `cl-inv`-readout a *theorem* about it rather
than the frame's definition — is the last, purely-definitional hair of the converse.

## Main definitions

* `geometricMld` — the geometric MLD relation: a settling bisimulation up to closure exists on the
  aperiodic coalgebra (morphism-existence, not `cl-inv`-equality).
* `geometricLocalDerivability` — the `LocalDerivability` whose `Mld` is `geometricMld`.

## Main results

* `geometricMld_iff_cohEquiv` — geometric MLD coincides with cohomological equivalence.
* `geometricLocalDerivability_complete` — the geometric structure is **complete** (Step 4).
* `geometric_mld_complete` — the bundled headline: the geometric MLD is a `LocalDerivability`, is
  complete, and is classified by `cl-inv` — the geometric resolution of the reduction.

## References

`content/.../aperiodic-regime-classification` (Step 4, geometric MLD). Built on
`Infomaterial.Persistence.Aperiodic.AperiodicSettleFrame` (the aperiodic coalgebra `GeoMld`) and
`Infomaterial.Persistence.Aperiodic.ClassificationReduction` (`Complete`, `classification_iff_complete`).

## Tags

aperiodic classification, mutual local derivability, completeness, up-to-closure, coalgebra, cl-inv
-/

namespace Infomaterial
namespace Persistence.Aperiodic

open AperiodicCarrier Settle

/-! ## (A) The geometric MLD relation -/

/-- **Geometric mutual local derivability** on settlings: a settling bisimulation up to closure on the
aperiodic inflation-stage coalgebra relates `v` and `v'` (embedded at inflation stage `0`). Unlike
`CohEquiv` (equal `cl-inv`), this is **morphism-existence** — `∃ R, BisimUTC R ∧ R (v,0) (v',0)` — the
invertible settling-morphism the corpus's MLD names, realized as the witnessing bisimulation. -/
def geometricMld (v v' : Settling) : Prop :=
  aperiodicFrame.GeoMld (v, 0) (v', 0)

/-- **The geometric MLD coincides with cohomological equivalence.** A settling bisimulation up to
closure exists iff the classifying invariants agree — the cross-base converse (`geoMld_iff_settleEq`,
idempotence-free) on the aperiodic carrier, read through `aperiodic_geoMld_iff_cohEquiv`. The forward
direction is Step 3 (the morphism preserves `cl-inv`); the converse constructs the settled-value
kernel as the morphism. -/
theorem geometricMld_iff_cohEquiv (v v' : Settling) :
    geometricMld v v' ↔ CohEquiv v v' :=
  aperiodic_geoMld_iff_cohEquiv (v, 0) (v', 0)

/-- `geometricMld` is reflexive — the identity (diagonal) bisimulation. -/
theorem geometricMld_refl (v : Settling) : geometricMld v v :=
  aperiodicFrame.geoMld_refl (v, 0)

/-- `geometricMld` is symmetric — the bisimulation inverts. -/
theorem geometricMld_symm {v v' : Settling} (h : geometricMld v v') : geometricMld v' v :=
  aperiodicFrame.geoMld_symm h

/-- `geometricMld` is transitive — bisimulations compose. -/
theorem geometricMld_trans {v v' v'' : Settling}
    (h : geometricMld v v') (h' : geometricMld v' v'') : geometricMld v v'' :=
  aperiodicFrame.geoMld_trans h h'

/-- **Step 3 for the geometric MLD.** A settling bisimulation up to closure preserves the classifying
invariant: `geometricMld v v' → cl-inv(v) = cl-inv(v')`. The forward direction of
`geometricMld_iff_cohEquiv`. -/
theorem geometricMld_preserves_clInv {v v' : Settling} (h : geometricMld v v') :
    v.clInv = v'.clInv :=
  (geometricMld_iff_cohEquiv v v').1 h

/-! ## (B) The geometric local-derivability structure -/

/-- **The geometric `LocalDerivability`**: the abstract MLD structure whose relation `Mld` is the
*geometric* MLD (`geometricMld`), carrying the coalgebraic morphism data rather than being defined as
`cl-inv`-equality. Its groupoid laws and Step 3 come from the cross-base classification on the
aperiodic frame. This is the structure `ClassificationReduction` named as the open bridge — now
exhibited. -/
def geometricLocalDerivability : LocalDerivability where
  Mld := geometricMld
  mld_refl := geometricMld_refl
  mld_symm := geometricMld_symm
  mld_trans := geometricMld_trans
  preserves_clInv := geometricMld_preserves_clInv

/-! ## (C) Completeness — Step 4 for the geometric structure -/

/-- **The geometric MLD is complete (Step 4).** Equal classifying invariant yields a geometric
settling-morphism: `CohEquiv v v' → geometricMld v v'`. The morphism is **constructed** — the
settled-value kernel `bisimUTC_settleKernel` is the witnessing bisimulation up to closure (the converse
of `geometricMld_iff_cohEquiv`), not assumed. So completeness holds for the *geometric* structure with
morphism data, not only for the coarsest `cohEquivLocalDerivability` where `Mld := CohEquiv`. -/
theorem geometricLocalDerivability_complete : Complete geometricLocalDerivability :=
  fun v v' hc => (geometricMld_iff_cohEquiv v v').2 hc

/-- **The geometric MLD is classified by cohomology.** `geometricLocalDerivability.Mld v v' ↔ CohEquiv
v v'` — both directions, via `classification_iff_complete` applied to the geometric structure's
completeness. The genuine classification statement for the geometric MLD, not the coarsest model. -/
theorem geometric_classification (v v' : Settling) :
    geometricLocalDerivability.Mld v v' ↔ CohEquiv v v' :=
  (classification_iff_complete geometricLocalDerivability).mpr
    geometricLocalDerivability_complete v v'

/-! ## (D) The headline -/

/-- **The geometric MLD is complete — the coalgebraic resolution of the reduction.** The geometric
mutual-local-derivability relation (existence of a settling bisimulation up to closure on the aperiodic
inflation-stage coalgebra — genuine morphism data) is a `LocalDerivability`, is **complete** (Step 4:
equal `cl-inv` yields the constructed settled-value-kernel morphism), and coincides with cohomological
equivalence. This discharges the named bridge of `ClassificationReduction.aperiodic_mld_classification_reduction`:
completeness is realized by the *geometric* structure, not only by the coarsest `cohEquivLocalDerivability`.

The residue of `thm:aperiodic-mld-classification` narrows to a single purely-definitional hair: that the
aperiodic frame's `settle` (which reads the realized fixed point as its `cl-inv` class — the corpus's own
identification) coincides with an independent primitive transfinite `closureOp : Settling → Settling`
iterated to `κ ≥ ω₁`. -/
theorem geometric_mld_complete :
    Complete geometricLocalDerivability
    ∧ (∀ v v' : Settling, geometricLocalDerivability.Mld v v' ↔ CohEquiv v v')
    ∧ (∀ v v' : Settling, geometricMld v v' → v.clInv = v'.clInv) :=
  ⟨geometricLocalDerivability_complete,
   geometric_classification,
   fun _ _ h => geometricMld_preserves_clInv h⟩

end Persistence.Aperiodic
end Infomaterial
