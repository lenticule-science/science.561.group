import Obsmetrologia.Cohomology.ScottFace
import Obsmetrologia.Cohomology.AntiLandauerEntropy
import Obsmetrologia.AperiodicOrder.Tiling.CollatzTwoAdicLock
import Obsmetrologia.AperiodicOrder.Tiling.ArithmeticZetaStar

/-!
# κ-stratification interface

This module wires together the interfaces around the Scott
face.  It does not prove that Landauer, Collatz, and Zeta-star are already one
common object.  It packages the ports such a common object must consume:

* Landauer cost is the `H¹` rank of a cover nerve;
* the Scott face classifies as `κ = ω` and lies on the `H¹`-vanishing side;
* the Collatz two-adic cylinder-lift face supplies a strict finite
  κ-package once the one-lock hypothesis is present;
* Zeta-star supplies the observed coalgebraic residual interface currently
  available for analytic promotion.

## Main definitions

* `Interface` is the bundled κ-stratification port.
* `interface` is the current checked instance.

## Main results

* `landauer_cost_is_h1` records the Landauer/H¹ ledger identity.
* `scott_face_is_vanishing_bridge` records the `κ = ω` reversible face.
* `collatz_cylinder_lift_kappa_package` records the Collatz strict package on
  the inverse-hull cylinder-lift face.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace KappaStratification

open Obsmetrologia.Cohomology
open Obsmetrologia.Closure.Collatz

/-- The checked ports of the current κ-stratified bridge. -/
structure Interface where
  /-- Landauer cost is the cover nerve's `H¹` rank. -/
  landauerCostIsH1 : ∀ N : CoverNerve, Landauer.landauerBits N = N.H1rank
  /-- Landauer cost vanishes exactly on reversible cover nerves. -/
  landauerZeroIffReversible :
    ∀ N : CoverNerve, Landauer.landauerBits N = 0 ↔ N.entities = N.cells + N.components
  /-- The Scott face classifies as the Scott regime. -/
  scottRegime : classify ScottFace.regimeData = ClosureRegime.scott
  /-- The Scott face lies on the `H¹`-vanishing side. -/
  scottH1Vanishes : cohomologyVanishes (classify ScottFace.regimeData) = true
  /-- The Collatz cylinder-lift face supplies the strict κ-package under one-lock. -/
  collatzCylinderLiftKappaPackage :
    ParentBarrierTwoAdicCylinderLiftGap →
      ParentBarrierOneLockCollapse →
        ∀ seed : PositiveSeed, PositiveSeed.KappaPackage seed
  /-- Zeta-star's current observed coalgebraic residual interface. -/
  zetaStarResidualInterface : ZetaStarAnalyticRichnessRecovery

/-- Landauer cost is exactly the cover nerve's `H¹` rank. -/
theorem landauer_cost_is_h1 (N : CoverNerve) :
    Landauer.landauerBits N = N.H1rank := rfl

/-- The Scott face is the `κ = ω` reversible bridge: it classifies as Scott and
its settling cohomology vanishes. -/
theorem scott_face_is_vanishing_bridge :
    classify ScottFace.regimeData = ClosureRegime.scott ∧
      cohomologyVanishes (classify ScottFace.regimeData) = true :=
  ⟨ScottFace.classify_regime_is_scott, ScottFace.cohomology_vanishes⟩

/-- On the Collatz inverse-hull cylinder-lift face, one-lock gives the strict
finite κ-package: terminal reachability, a closure-ordinal stage, and a total
stopping stage. -/
theorem collatz_cylinder_lift_kappa_package
    (hlift : ParentBarrierTwoAdicCylinderLiftGap)
    (hlock : ParentBarrierOneLockCollapse) :
    ∀ seed : PositiveSeed, PositiveSeed.KappaPackage seed := by
  intro seed
  exact kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock
    hlift hlock seed.value seed.positive

/-- Zeta-star's current observed coalgebraic residual interface. -/
def zeta_star_residual_interface : ZetaStarAnalyticRichnessRecovery :=
  zetaStar_analyticRichnessRecovery

/-- The bundled κ-stratification interface. -/
def interface : Interface where
  landauerCostIsH1 := landauer_cost_is_h1
  landauerZeroIffReversible := Landauer.landauer_zero_iff_reversible
  scottRegime := ScottFace.classify_regime_is_scott
  scottH1Vanishes := ScottFace.cohomology_vanishes
  collatzCylinderLiftKappaPackage := collatz_cylinder_lift_kappa_package
  zetaStarResidualInterface := zeta_star_residual_interface

end KappaStratification
end AperiodicOrder.Tiling
end Obsmetrologia
