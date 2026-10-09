import Obsmetrologia.AperiodicOrder.Tiling.AperiodicSettleFrame
import Obsmetrologia.AperiodicOrder.Tiling.ClassificationReduction

/-!
# The geometric MLD is complete

`ClassificationReduction` reduced `thm:aperiodic-mld-classification` to completeness of the
*geometric* MLD (`CohEquiv ⟹ Mld`), realizable only by the coarsest structure
`cohEquivLocalDerivability` (`Mld := CohEquiv`, no morphism data). This module supplies the
geometric model: `geometricMld v v'` is the coalgebraic relation of `AperiodicSettleFrame`,
`∃ R, BisimUTC R ∧ R (v,0) (v',0)` (morphism-existence, not invariant-equality), and proves
`geometricLocalDerivability` (`Mld := geometricMld`) is `Complete`. The witnessing morphism for
`CohEquiv v v' ⟹ geometricMld v v'` is constructed as the settled-value kernel
(`bisimUTC_settleKernel`) via the idempotence-free `geoMld_iff_settleEq`.

The remaining residue of `thm:aperiodic-mld-classification`: `AperiodicSettleFrame`'s `settle`
reads `cl-inv` off the realized fixed point by definition; identifying it with an independent
primitive `closureOp : Settling → Settling` iterated to `κ ≥ ω₁` is not yet done.

## Main definitions

`geometricMld`, `geometricLocalDerivability`.

## Main results

`geometricMld_iff_cohEquiv`, `geometricLocalDerivability_complete`, `geometric_mld_complete`
(bundled headline).

## References

`content/.../aperiodic-regime-classification` (Step 4, geometric MLD).
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open AperiodicCarrier Settle

/-! ## (A) The geometric MLD relation -/

/-- A settling bisimulation up to closure relates `v` and `v'` at inflation stage `0`:
`∃ R, BisimUTC R ∧ R (v,0) (v',0)`. -/
def geometricMld (v v' : Settling) : Prop :=
  aperiodicFrame.GeoMld (v, 0) (v', 0)

/-- `geometricMld` at `v, v'` holds exactly when `v` and `v'` are `CohEquiv`. -/
theorem geometricMld_iff_cohEquiv (v v' : Settling) :
    geometricMld v v' ↔ CohEquiv v v' :=
  aperiodic_geoMld_iff_cohEquiv (v, 0) (v', 0)

theorem geometricMld_refl (v : Settling) : geometricMld v v :=
  aperiodicFrame.geoMld_refl (v, 0)

theorem geometricMld_symm {v v' : Settling} (h : geometricMld v v') : geometricMld v' v :=
  aperiodicFrame.geoMld_symm h

theorem geometricMld_trans {v v' v'' : Settling}
    (h : geometricMld v v') (h' : geometricMld v' v'') : geometricMld v v'' :=
  aperiodicFrame.geoMld_trans h h'

theorem geometricMld_preserves_clInv {v v' : Settling} (h : geometricMld v v') :
    v.clInv = v'.clInv :=
  (geometricMld_iff_cohEquiv v v').1 h

/-! ## (B) The geometric local-derivability structure -/

def geometricLocalDerivability : LocalDerivability where
  Mld := geometricMld
  mld_refl := geometricMld_refl
  mld_symm := geometricMld_symm
  mld_trans := geometricMld_trans
  preserves_clInv := geometricMld_preserves_clInv

/-! ## (C) Completeness — Step 4 for the geometric structure -/

theorem geometricLocalDerivability_complete : Complete geometricLocalDerivability :=
  fun v v' hc => (geometricMld_iff_cohEquiv v v').2 hc

theorem geometric_classification (v v' : Settling) :
    geometricLocalDerivability.Mld v v' ↔ CohEquiv v v' :=
  (classification_iff_complete geometricLocalDerivability).mpr
    geometricLocalDerivability_complete v v'

/-! ## (D) The headline -/

/-- Bundles `geometricLocalDerivability_complete`, `geometric_classification`,
`geometricMld_preserves_clInv`. -/
theorem geometric_mld_complete :
    Complete geometricLocalDerivability
    ∧ (∀ v v' : Settling, geometricLocalDerivability.Mld v v' ↔ CohEquiv v v')
    ∧ (∀ v v' : Settling, geometricMld v v' → v.clInv = v'.clInv) :=
  ⟨geometricLocalDerivability_complete,
   geometric_classification,
   fun _ _ h => geometricMld_preserves_clInv h⟩

end AperiodicOrder.Tiling
end Obsmetrologia
