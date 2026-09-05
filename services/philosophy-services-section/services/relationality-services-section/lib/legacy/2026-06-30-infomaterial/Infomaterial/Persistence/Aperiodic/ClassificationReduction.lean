import Infomaterial.Persistence.Aperiodic.Classification

/-!
# The aperiodic MLD classification, reduced to its exact obstruction

`Classification` proves Step 3 (an invertible settling-morphism preserves `cl-inv`, so `Mld ⟹
CohEquiv`) and leaves Step 4 — the converse `CohEquiv ⟹ Mld` — open (`thm:aperiodic-mld-classification`).
The converse is **not** provable for an arbitrary `LocalDerivability`: `eqLocalDerivability` (where
`Mld` is literal equality) is strictly finer than `CohEquiv`, so it fails the converse. The content
is therefore a statement about the *specific* geometric MLD relation.

This module does not fake that construction (the abstract `LocalDerivability.Mld` carries no morphism
data to build). Instead it **reduces** the classification to a single named condition —
**completeness** (Step 4 for a given structure) — proving the classification's entire content is that
condition, and that the condition is **realizable**: a complete local-derivability structure exists.
So the open part of `thm:aperiodic-mld-classification` is precisely *whether the geometric MLD is
complete*, not whether completeness is consistent. The remaining bridge is the Hermida–Jacobs /
Bonchi fibered-coinduction "up to closure" construction of the morphism — a genuinely richer
(coalgebraic) settling model than the abstract `Mld : Prop` here.

## Main definitions

* `Complete` — a local-derivability structure for which equal `cl-inv` already yields `Mld` (Step 4).

## Main results

* `classification_iff_complete` — `Mld ⟺ CohEquiv` holds for `D` iff `D` is complete.
* `exists_complete_localDerivability` — a complete structure exists (the classification is realizable).
* `aperiodic_mld_classification_reduction` — the bundled headline.

## References

`content/.../aperiodic-regime-classification`, `content/.../mutually-locally-derivable`. Built on
`Infomaterial.Persistence.Aperiodic.Classification`.

## Tags

aperiodic classification, mutual local derivability, cohomological equivalence, up-to closure
-/

namespace Infomaterial
namespace Persistence.Aperiodic

/-! ## (A) Completeness — Step 4 for a given structure -/

/-- A local-derivability structure is **cohomologically complete** when equal classifying invariant
already yields an invertible settling-morphism — i.e. the converse (Step 4) holds for it. -/
def Complete (D : LocalDerivability) : Prop :=
  ∀ v v' : Settling, CohEquiv v v' → D.Mld v v'

/-! ## (B) The reduction -/

/-- **The classification reduces exactly to completeness.** For any local-derivability structure,
`Mld` coincides with cohomological equivalence iff the structure is complete. Step 3 (`Mld ⟹
CohEquiv`) holds for every structure, so the *entire* content of the classification is the converse,
packaged as `Complete`. -/
theorem classification_iff_complete (D : LocalDerivability) :
    (∀ v v' : Settling, D.Mld v v' ↔ CohEquiv v v') ↔ Complete D := by
  constructor
  · intro h v v' hc
    exact (h v v').mpr hc
  · intro hcomp v v'
    exact ⟨fun hm => mld_refines_cohEquiv D hm, fun hc => hcomp v v' hc⟩

/-! ## (C) Realizability — a complete structure exists -/

/-- Cohomological equivalence is itself a local-derivability structure — the **coarsest** one, whose
`Mld` *is* `cl-inv`-equality (it satisfies the groupoid laws and Step 3 trivially). -/
def cohEquivLocalDerivability : LocalDerivability where
  Mld := CohEquiv
  mld_refl := cohEquiv_refl
  mld_symm := fun h => cohEquiv_symm h
  mld_trans := fun h h' => cohEquiv_trans h h'
  preserves_clInv := fun h => h

/-- The coarsest structure is complete (its `Mld` is `CohEquiv` itself). -/
theorem cohEquivLocalDerivability_complete : Complete cohEquivLocalDerivability :=
  fun _ _ hc => hc

/-- **A complete local-derivability structure exists** — the classification's logical form is
satisfiable. This is *not* the geometric resolution: it exhibits the coarsest structure (where `Mld`
is defined to be `CohEquiv`), witnessing consistency. The open question is whether the *geometric*
MLD (invertible settling-morphisms) is complete. -/
theorem exists_complete_localDerivability : ∃ D : LocalDerivability, Complete D :=
  ⟨cohEquivLocalDerivability, cohEquivLocalDerivability_complete⟩

/-! ## (D) The headline -/

/-- **The aperiodic MLD classification, reduced.** For every local-derivability structure the
classification `Mld ⟺ CohEquiv` is equivalent to a single condition — completeness (Step 4) — and a
complete structure exists, so the classification is realizable. This isolates the genuine open part
of `thm:aperiodic-mld-classification`: whether the geometric MLD relation is complete, to be settled
by a fibered-coinduction "up to closure" construction of the settling-morphism (the remaining
bridge), not by any presentation of the invariant. -/
theorem aperiodic_mld_classification_reduction :
    (∀ D : LocalDerivability, (∀ v v' : Settling, D.Mld v v' ↔ CohEquiv v v') ↔ Complete D)
    ∧ (∃ D : LocalDerivability, Complete D) :=
  ⟨classification_iff_complete, exists_complete_localDerivability⟩

end Persistence.Aperiodic
end Infomaterial
