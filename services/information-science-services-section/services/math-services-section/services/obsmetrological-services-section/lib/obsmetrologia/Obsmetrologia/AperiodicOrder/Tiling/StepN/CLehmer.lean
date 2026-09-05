import Obsmetrologia.AperiodicOrder.Tiling.Diffraction

/-!
# C-Lehmer reduction over the StepN Salem spine

This module records the finite carrier currently available for the Lehmer-side
question.  The existing StepN Salem spine supplies the reciprocal Salem witness,
the non-reciprocal metallic/Pisot witness, the strict/aperiodic regime split, and
the finite Fourier-side diffraction readout.  Here those data are repackaged as a
small decidable reduction: on the present carrier, the only side that can carry
the "approaches the unit circle" obligation is the Salem side.

## Main definitions

* `CLehmerSide` is the current two-point carrier: Pisot or Salem.
* `cLehmerMahlerFace` is only a finite label for the Mahler-side role that the
  current Obsmetrologia Lean carrier can distinguish.
* `CLehmerStatement` is the finite C-Lehmer claim for a chosen approach
  predicate.
* `SalemRootRegimeGap` is the named open Salem-root-regime gap, parallel to
  Collatz's named residue/modular inequality.
* `CLehmerFiniteReduction` names the finite reduction with the Salem-root
  regime gap left as an explicit field.

## Main results

* `cLehmerApproachClassifier_spec` identifies the approach classifier with the
  Salem side.
* `cLehmerMahlerFace_dominantRoot_iff_pisot` and
  `cLehmerMahlerFace_pisotObstruction_iff_salem` align the Mahler receipt face
  with the StepN side.
* `cLehmer_green_skeleton` bundles the settled classifier, Mahler-face, regime,
  and finite diffraction readings.
* `salemRootRegimeStatement_iff_gap` identifies the classifier form of the gap
  with the Salem-inflation form.
* `salemRootRegimeGap_iff_noSalemApproach` reduces the named gap to the single
  Salem side of the finite carrier.
* `cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap` is the finite
  reduction: C-Lehmer on the current carrier is exactly the Pisot receipt plus
  the named Salem-root-regime gap.
* `cLehmer_of_finiteReduction` and `cLehmer_of_mahlerSalemReduction` are the
  reduction theorems: once the explicit Salem-root-regime gap is supplied, no
  current StepN side approaches.

## Tags

Lehmer, Mahler measure, Salem, Pisot, finite reduction
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace StepN

/-- The current C-Lehmer carrier side. -/
abbrev CLehmerSide : Type := Bool

/-- The Pisot side of the C-Lehmer carrier. -/
def cLehmerPisot : CLehmerSide := false

/-- The Salem side of the C-Lehmer carrier. -/
def cLehmerSalem : CLehmerSide := true

/-- The Boolean classifier for the finite "can approach the unit circle" obligation.
On the present carrier, only the Salem side carries that obligation. -/
def cLehmerApproachClassifier (s : CLehmerSide) : Bool := s

/-- Mahler-side receipt faces visible to the current finite Lean carrier.  These
are labels, not real-valued Mahler measures in Lean. -/
inductive CLehmerMahlerFace where
  /-- A self-reciprocal all-on-circle unit receipt. -/
  | unit
  /-- A Pisot dominant-root receipt. -/
  | dominantRoot
  /-- A receipt obstructed because the polynomial is not Pisot. -/
  | pisotObstruction
  /-- A receipt obstructed by dominant-root convergence. -/
  | convergenceObstruction
  deriving DecidableEq, Repr

/-- The finite Mahler receipt face for the current StepN side. -/
def cLehmerMahlerFace (s : CLehmerSide) : CLehmerMahlerFace :=
  if s then CLehmerMahlerFace.pisotObstruction else CLehmerMahlerFace.dominantRoot

/-! ## The finite C-Lehmer statement and the named Salem gap -/

/-- The C-Lehmer statement over the current finite carrier for a chosen approach
predicate: no visible StepN side approaches the unit-circle obstruction. -/
def CLehmerStatement (approaches : CLehmerSide → Prop) : Prop :=
  ∀ s : CLehmerSide, ¬ approaches s

/-- The named **Salem-root-regime gap**. For a chosen approach predicate, every
Salem side of the current carrier is separated from the approach. This is the
Lehmer/Mahler analogue of Collatz's named modular/residue inequality: the
surrounding reduction is already proved, while this proposition is the open analytic
obligation to be supplied by a stronger Salem-root apparatus. -/
def SalemRootRegimeGap (approaches : CLehmerSide → Prop) : Prop :=
  ∀ s : CLehmerSide, AperiodicOrder.Tiling.IsSalemInflation s → ¬ approaches s

/-- The same Salem-root-regime gap read through the finite approach classifier. -/
def SalemRootRegimeStatement (approaches : CLehmerSide → Prop) : Prop :=
  ∀ s : CLehmerSide, cLehmerApproachClassifier s = true → ¬ approaches s

/-- On the present two-point carrier, the Salem-root-regime gap is decidable as
soon as the chosen approach predicate is decidable. This is a finite-regime
decidability statement, not a proof of the analytic gap. -/
instance instDecidableSalemRootRegimeGap (approaches : CLehmerSide → Prop)
    [∀ s : CLehmerSide, Decidable (approaches s)] :
    Decidable (SalemRootRegimeGap approaches) := by
  by_cases htrue : approaches true
  · exact isFalse (by
      intro hgap
      exact hgap true rfl htrue)
  · exact isTrue (by
      intro s hs
      cases s
      · intro hfalse
        cases hs
      · exact htrue)

/-- The classifier presentation of the gap is also decidable for decidable
approach predicates. -/
instance instDecidableSalemRootRegimeStatement (approaches : CLehmerSide → Prop)
    [∀ s : CLehmerSide, Decidable (approaches s)] :
    Decidable (SalemRootRegimeStatement approaches) := by
  by_cases htrue : approaches true
  · exact isFalse (by
      intro hgap
      exact hgap true rfl htrue)
  · exact isTrue (by
      intro s hs
      cases s
      · intro hfalse
        cases hs
      · exact htrue)

/-- The approach classifier is true exactly on the Salem side. -/
theorem cLehmerApproachClassifier_spec (s : CLehmerSide) :
    cLehmerApproachClassifier s = true ↔
      AperiodicOrder.Tiling.IsSalemInflation s := by
  cases s <;> constructor <;> intro h <;> first | rfl | cases h

/-- The approach classifier is false exactly on the Pisot side. -/
theorem cLehmerApproachClassifier_false_spec (s : CLehmerSide) :
    cLehmerApproachClassifier s = false ↔
      AperiodicOrder.Tiling.IsPisotInflation s := by
  cases s <;> constructor <;> intro h <;> first | rfl | cases h

/-- The dominant-root Mahler receipt face is exactly the Pisot side. -/
theorem cLehmerMahlerFace_dominantRoot_iff_pisot (s : CLehmerSide) :
    cLehmerMahlerFace s = CLehmerMahlerFace.dominantRoot ↔
      AperiodicOrder.Tiling.IsPisotInflation s := by
  cases s <;> constructor <;> intro h <;> first | rfl | cases h

/-- The Pisot-obstruction Mahler receipt face is exactly the Salem side. -/
theorem cLehmerMahlerFace_pisotObstruction_iff_salem (s : CLehmerSide) :
    cLehmerMahlerFace s = CLehmerMahlerFace.pisotObstruction ↔
      AperiodicOrder.Tiling.IsSalemInflation s := by
  cases s <;> constructor <;> intro h <;> first | rfl | cases h

/-- The classifier form and the Salem-inflation form of the named gap are
identical on the current C-Lehmer carrier. -/
theorem salemRootRegimeStatement_iff_gap (approaches : CLehmerSide → Prop) :
    SalemRootRegimeStatement approaches ↔ SalemRootRegimeGap approaches := by
  constructor
  · intro h s hs
    exact h s ((cLehmerApproachClassifier_spec s).mpr hs)
  · intro h s hs
    exact h s ((cLehmerApproachClassifier_spec s).mp hs)

/-- On the present finite carrier, the named Salem-root-regime gap is exactly
the single statement that the Salem side does not approach. This is the explicit
decidable Salem-root regime left by the reduction. -/
theorem salemRootRegimeGap_iff_noSalemApproach (approaches : CLehmerSide → Prop) :
    SalemRootRegimeGap approaches ↔ ¬ approaches cLehmerSalem := by
  constructor
  · intro hgap
    exact hgap cLehmerSalem rfl
  · intro hsalem s hs
    cases s
    · cases hs
    · exact hsalem

/-- On the C-Lehmer carrier, the finite diffraction component is pure-point
exactly on the Pisot side. -/
theorem cLehmer_finiteFourierDualKind_purePoint_iff_pisot (s : CLehmerSide) :
    AperiodicOrder.Tiling.finiteFourierDualKind s =
        AperiodicOrder.Tiling.FiniteDiffractionKind.purePoint ↔
      AperiodicOrder.Tiling.IsPisotInflation s :=
  AperiodicOrder.Tiling.finiteFourierDualKind_purePoint_iff_pisot s

/-- On the C-Lehmer carrier, the finite diffraction component is
singular-continuous exactly on the Salem side. -/
theorem cLehmer_finiteFourierDualKind_singularContinuous_iff_salem (s : CLehmerSide) :
    AperiodicOrder.Tiling.finiteFourierDualKind s =
        AperiodicOrder.Tiling.FiniteDiffractionKind.singularContinuous ↔
      AperiodicOrder.Tiling.IsSalemInflation s :=
  AperiodicOrder.Tiling.finiteFourierDualKind_singularContinuous_iff_salem s

/-- The current C-Lehmer green skeleton: the approach classifier, Mahler receipt
face, closure regime, and finite diffraction readout all select the same
Pisot/Salem split. -/
theorem cLehmer_green_skeleton :
    (∀ s : CLehmerSide,
      cLehmerApproachClassifier s = true ↔
        AperiodicOrder.Tiling.IsSalemInflation s)
    ∧ (∀ s : CLehmerSide,
      cLehmerMahlerFace s = CLehmerMahlerFace.dominantRoot ↔
        AperiodicOrder.Tiling.IsPisotInflation s)
    ∧ (∀ s : CLehmerSide,
      cLehmerMahlerFace s = CLehmerMahlerFace.pisotObstruction ↔
        AperiodicOrder.Tiling.IsSalemInflation s)
    ∧ (inflationRegime true = ClosureRegime.aperiodic
      ∧ inflationRegime false = ClosureRegime.strict)
    ∧ (∀ s : CLehmerSide,
      AperiodicOrder.Tiling.finiteFourierDualKind s =
          AperiodicOrder.Tiling.FiniteDiffractionKind.purePoint ↔
        AperiodicOrder.Tiling.IsPisotInflation s)
    ∧ (∀ s : CLehmerSide,
      AperiodicOrder.Tiling.finiteFourierDualKind s =
          AperiodicOrder.Tiling.FiniteDiffractionKind.singularContinuous ↔
        AperiodicOrder.Tiling.IsSalemInflation s) := by
  exact ⟨cLehmerApproachClassifier_spec,
    cLehmerMahlerFace_dominantRoot_iff_pisot,
    cLehmerMahlerFace_pisotObstruction_iff_salem,
    ⟨inflation_salem, inflation_pisot⟩,
    cLehmer_finiteFourierDualKind_purePoint_iff_pisot,
    cLehmer_finiteFourierDualKind_singularContinuous_iff_salem⟩

/-- A finite reduction of the C-Lehmer claim to an explicit Salem-root-regime gap
for a chosen approach predicate. -/
structure CLehmerFiniteReduction (approaches : CLehmerSide → Prop) : Prop where
  /-- The Pisot side is already separated from the unit-circle approach. -/
  pisot_separated :
    ∀ s : CLehmerSide, AperiodicOrder.Tiling.IsPisotInflation s → ¬ approaches s
  /-- The named analytic gap: Salem-root regimes do not approach the unit circle. -/
  salem_analytic_gap : SalemRootRegimeGap approaches

/-- A Mahler/Salem reduction package: the already-separated Pisot receipt plus
the named Salem-root-regime gap. -/
structure MahlerSalemReduction (approaches : CLehmerSide → Prop) : Prop where
  /-- The Pisot/dominant-root face is already separated from the approach predicate. -/
  pisot_receipt :
    ∀ s : CLehmerSide, AperiodicOrder.Tiling.IsPisotInflation s → ¬ approaches s
  /-- The named open gap: Salem-root regimes are separated from the approach predicate. -/
  salem_root_regime_gap : SalemRootRegimeGap approaches

/-- The original finite-reduction structure is exactly the Mahler/Salem package. -/
theorem cLehmerFiniteReduction_iff_mahlerSalemReduction
    (approaches : CLehmerSide → Prop) :
    CLehmerFiniteReduction approaches ↔ MahlerSalemReduction approaches := by
  constructor
  · intro h
    exact ⟨h.pisot_separated, h.salem_analytic_gap⟩
  · intro h
    exact ⟨h.pisot_receipt, h.salem_root_regime_gap⟩

/-- The C-Lehmer statement reduces to the finite Pisot receipt and the named
Salem-root-regime gap. This is the Mahler/Salem apparatus over the
current StepN carrier: all settled work is finite and decidable once the chosen
approach predicate is decidable; the only analytic frontier is
`SalemRootRegimeGap`. -/
theorem cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap
    (approaches : CLehmerSide → Prop) :
    CLehmerStatement approaches ↔
      (∀ s : CLehmerSide, AperiodicOrder.Tiling.IsPisotInflation s → ¬ approaches s)
        ∧ SalemRootRegimeGap approaches := by
  constructor
  · intro h
    exact ⟨fun s _ => h s, fun s _ => h s⟩
  · rintro ⟨hpisot, hsalem⟩ s
    cases s
    · exact hpisot false rfl
    · exact hsalem true rfl

/-- The same reduction with the finite Salem-root-regime gap collapsed to the
single Salem side. This is the decidable finite statement produced by the
Mahler/Salem reduction once the chosen approach predicate is decidable. -/
theorem cLehmerStatement_iff_pisotReceipt_and_noSalemApproach
    (approaches : CLehmerSide → Prop) :
    CLehmerStatement approaches ↔
      (∀ s : CLehmerSide, AperiodicOrder.Tiling.IsPisotInflation s → ¬ approaches s)
        ∧ ¬ approaches cLehmerSalem := by
  constructor
  · intro h
    exact ⟨fun s _ => h s, h cLehmerSalem⟩
  · rintro ⟨hpisot, hsalem⟩ s
    cases s
    · exact hpisot false rfl
    · exact hsalem

/-- C-Lehmer on the present carrier follows once the explicit Salem-root-regime
gap field is supplied. -/
theorem cLehmer_of_finiteReduction (approaches : CLehmerSide → Prop)
    (h : CLehmerFiniteReduction approaches) :
    CLehmerStatement approaches := by
  exact (cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap approaches).mpr
    ⟨h.pisot_separated, h.salem_analytic_gap⟩

/-- C-Lehmer on the present carrier follows from the Mahler/Salem reduction
package. -/
theorem cLehmer_of_mahlerSalemReduction (approaches : CLehmerSide → Prop)
    (h : MahlerSalemReduction approaches) :
    CLehmerStatement approaches := by
  exact (cLehmerStatement_iff_pisotReceipt_and_salemRootRegimeGap approaches).mpr
    ⟨h.pisot_receipt, h.salem_root_regime_gap⟩

end StepN
end AperiodicOrder.Tiling
end Obsmetrologia
