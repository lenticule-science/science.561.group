import Obsmetrologia.AperiodicOrder.Tiling.StepN.SalemRegime
import Obsmetrologia.AperiodicOrder.Tiling.MetallizationDichotomy

/-!
# Predictor-level color evidence

This module packages the algebraic color predictor at the level defined
in the library: Salem trace evidence, Pisot contraction evidence, the
settling-regime split, and the metallization dichotomy. The finite diffraction
module promotes this predictor to a finite readout; the analytic Fourier-dual
diffraction atom remains outside this carrier.

## Main definitions

* `TraceSignChange` records integer sign evidence for a trace interval.
* `PredictorLevelColorEvidence` bundles the predictor-level color axes already
  proved elsewhere.

## Main results

* `color_predictor_evidence` proves the current predictor bundle from the Salem,
  regime, and metallization carriers.

## Tags

color predictor, Salem, Pisot, metallization, diffraction frontier
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.AperiodicOrder.Tiling.StepN
open Obsmetrologia.Real.Internal
open Obsmetrologia.AperiodicOrder.Tiling.ChromaticLorentzian

/-- Integer sign evidence that a polynomial changes sign across a named trace interval. -/
structure TraceSignChange (p : List Int) (left right : Int) : Prop where
  /-- The polynomial evaluates positively at the left endpoint. -/
  left_pos : 0 < StepN.evalIntPoly p left
  /-- The polynomial evaluates negatively at the right endpoint. -/
  right_neg : StepN.evalIntPoly p right < 0

/-- The predictor-level color evidence.

The Salem side carries trace evidence in `(-2, 0)`, the golden/Pisot side carries
contracting trace evidence in `(-1, 0)`, the regime classifier separates
aperiodic from strict settling, and metallization separates the finite metallic
power lens from the chromatic omega-settling residue. -/
structure PredictorLevelColorEvidence : Prop where
  /-- The Salem trace has high-angle sign-change evidence in `(-2, 0)`. -/
  salem_high_angle_trace : TraceSignChange StepN.salemTraceResolvent (-2) 0
  /-- The golden/Pisot trace has contracting sign-change evidence in `(-1, 0)`. -/
  golden_contracting_trace : TraceSignChange (StepN.charPolyMetallic 1) (-1) 0
  /-- The Salem side lands in the aperiodic closure regime. -/
  salem_is_aperiodic : StepN.inflationRegime true = ClosureRegime.aperiodic
  /-- The golden/Pisot side lands in the strict closure regime. -/
  golden_is_strict : StepN.inflationRegime false = ClosureRegime.strict
  /-- Metallic powers expand through the finite coefficient lens. -/
  metallic_family_expands_finitely :
    ∀ (n k : Nat),
      zpow (StepN.metallicZ n) k =
        (StepN.coef n k).1 * StepN.metallicZ n + (StepN.coef n k).2
  /-- The chromatic step has a non-idempotent residue. -/
  chromatic_step_not_idempotent : step (step mark0) ≠ step mark0
  /-- The exponential sequence has the omega-settling upper bound. -/
  exponential_settles_at_omega :
    ∀ (N M : Nat), 1 ≤ N → expSeq (N + M) ≤ expSeq N + (expTerm N + expTerm N)

/-- The current color predictor bundle: Salem has the high-angle trace evidence,
golden/Pisot has contracting trace evidence, Salem/Pisot is the aperiodic/strict
regime split, and metallization is the finite-metallic versus chromatic-omega
split. -/
theorem color_predictor_evidence : PredictorLevelColorEvidence := by
  refine
    ⟨?_, ?_, StepN.inflation_salem, StepN.inflation_pisot,
      ?_, ?_, ?_⟩
  · exact ⟨StepN.salemTraceResolvent_unit_circle.1, StepN.salemTraceResolvent_unit_circle.2⟩
  · exact ⟨by decide, by decide⟩
  · exact metallization_dichotomy.1
  · exact metallization_dichotomy.2.1
  · exact metallization_dichotomy.2.2

end AperiodicOrder.Tiling
end Obsmetrologia
