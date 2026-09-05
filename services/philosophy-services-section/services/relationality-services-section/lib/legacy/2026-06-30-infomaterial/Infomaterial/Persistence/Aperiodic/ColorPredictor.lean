import Infomaterial.Persistence.Aperiodic.StepN.SalemRegime
import Infomaterial.Persistence.Aperiodic.MetallizationDichotomy

/-!
# Predictor-level color evidence

This module packages the algebraic color predictor at the level currently
earned by the library: Salem trace evidence, Pisot contraction evidence, the
settling-regime split, and the metallization dichotomy. It does not construct a
Fourier-dual diffraction atom.

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

namespace Infomaterial
namespace Persistence.Aperiodic

open Infomaterial.Persistence.Aperiodic.StepN
open Infomaterial.Real.Internal
open Infomaterial.Persistence.Aperiodic.ChromaticLorentzian

/-- Integer sign evidence that a polynomial changes sign across a named trace interval. -/
structure TraceSignChange (p : List Int) (left right : Int) : Prop where
  left_pos : 0 < StepN.evalIntPoly p left
  right_neg : StepN.evalIntPoly p right < 0

/-- The predictor-level color evidence currently earned in Lean.

The Salem side carries trace evidence in `(-2, 0)`, the golden/Pisot side carries
contracting trace evidence in `(-1, 0)`, the regime classifier separates
aperiodic from strict settling, and metallization separates the finite metallic
power lens from the chromatic omega-settling residue. -/
structure PredictorLevelColorEvidence : Prop where
  salem_high_angle_trace : TraceSignChange StepN.salemTrace (-2) 0
  golden_contracting_trace : TraceSignChange (StepN.charPolyMetallic 1) (-1) 0
  salem_is_aperiodic : StepN.inflationRegime true = ClosureRegime.aperiodic
  golden_is_strict : StepN.inflationRegime false = ClosureRegime.strict
  metallic_family_expands_finitely :
    ∀ (n k : Nat),
      zpow (StepN.metallicZ n) k =
        (StepN.coef n k).1 * StepN.metallicZ n + (StepN.coef n k).2
  chromatic_step_not_idempotent : step (step mark0) ≠ step mark0
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
  · exact ⟨StepN.salemTrace_unit_circle.1, StepN.salemTrace_unit_circle.2⟩
  · exact ⟨by decide, by decide⟩
  · exact metallization_dichotomy.1
  · exact metallization_dichotomy.2.1
  · exact metallization_dichotomy.2.2

end Persistence.Aperiodic
end Infomaterial
