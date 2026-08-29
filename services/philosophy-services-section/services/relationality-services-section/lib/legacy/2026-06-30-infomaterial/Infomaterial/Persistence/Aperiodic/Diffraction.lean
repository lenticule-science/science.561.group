import Infomaterial.Persistence.Aperiodic.FiniteAutocorrelation
import Infomaterial.Calculus.Probability.Measure
import Infomaterial.Language.Positing.BigradedCohomology
import Infomaterial.Persistence.Aperiodic.Classification
import Infomaterial.Persistence.Aperiodic.StepN.SalemRegime

/-!
# Finite diffraction measure

This module promotes finite autocorrelation into the measure carrier already
available in the probability layer. A Boolean pattern on the cyclic carrier
`Fin (n + 1)` has a counting measure over displacements; pushing that measure
forward along `autocorr n w` gives a finite intensity measure.

This is still the finite core. It does not construct Fourier transforms,
translation-bounded measures, or a Lebesgue decomposition. It does prove that
homometric patterns have the same measured boundary residue for every intensity
event.

## Main definitions

* `displacementSpace` is the finite sample space of cyclic displacements.
* `finiteDiffractionMass` is the counting-measure pushforward along finite
  autocorrelation.
* `FiniteDiffractionKind` and `FiniteDiffractionDecomposition` are the finite
  component classifier and its three measured event faces.

## Main results

* `finiteDiffractionMass_empty`, `finiteDiffractionMass_univ`, and
  `finiteDiffractionMass_mono` give the inherited finite measure laws.
* `homometric_finiteDiffractionMass_eq` proves homometry preserves the finite
  measured residue.
* `finiteDiffractionDecomposition_mass` decomposes total finite mass into the
  pure-point, singular-continuous, and absolutely-continuous component counts.
* `finite_diffraction_classifier_agreement` records the finite agreement of the
  charge, closure-regime, Pisot/Salem, and `H¹` witnesses.

## Tags

diffraction, autocorrelation, homometry, finite measure, boundary residue
-/

namespace Infomaterial
namespace Persistence.Aperiodic

open Infomaterial.Discrete
open Infomaterial.Probability.Measure

/-! ## Displacement sample space -/

/-- The finite displacement sample space for a cyclic pattern on `n + 1` sites. -/
def displacementSpace (n : Nat) : SampleSpace (Fin (n + 1)) where
  outcomes := List.finRange (n + 1)

/-! ## Finite diffraction mass -/

/-- The finite diffraction mass of an intensity event: the pushforward of the
counting measure on displacements along the finite autocorrelation function. -/
def finiteDiffractionMass (n : Nat) (w : Fin (n + 1) → Bool)
    (A : Event Nat) : Nat :=
  (displacementSpace n).measure (fun d => A (autocorr n w d))

/-- The finite diffraction mass has zero mass on the empty intensity event. -/
theorem finiteDiffractionMass_empty (n : Nat) (w : Fin (n + 1) → Bool) :
    finiteDiffractionMass n w Set.empty = 0 := by
  unfold finiteDiffractionMass
  exact SampleSpace.measure_empty (displacementSpace n)

/-- The finite diffraction mass has total mass `n + 1` on the universal
intensity event. -/
theorem finiteDiffractionMass_univ (n : Nat) (w : Fin (n + 1) → Bool) :
    finiteDiffractionMass n w Set.univ = n + 1 := by
  unfold finiteDiffractionMass
  have hEvent :
      (fun d : Fin (n + 1) => (Set.univ : Event Nat) (autocorr n w d)) =
        (Set.univ : Event (Fin (n + 1))) := rfl
  rw [hEvent]
  unfold displacementSpace
  rw [SampleSpace.measure_univ]
  unfold SampleSpace.total
  rw [List.length_finRange]

/-- The finite diffraction mass is monotone in the intensity event. -/
theorem finiteDiffractionMass_mono (n : Nat) (w : Fin (n + 1) → Bool)
    {A B : Event Nat} (h : Set.subset A B) :
    finiteDiffractionMass n w A ≤ finiteDiffractionMass n w B := by
  unfold finiteDiffractionMass
  apply SampleSpace.measure_mono
  intro d hd
  exact h (autocorr n w d) hd

/-- Homometric patterns have the same finite diffraction mass for every
intensity event. -/
theorem homometric_finiteDiffractionMass_eq {n : Nat}
    {w w' : Fin (n + 1) → Bool} (h : Homometric n w w') (A : Event Nat) :
    finiteDiffractionMass n w A = finiteDiffractionMass n w' A := by
  unfold finiteDiffractionMass Homometric at *
  rw [h]

/-! ## Finite component decomposition -/

/-- The finite component label used by the decidable diffraction classifier.
These are component faces of the finite counting measure, not an analytic
Lebesgue decomposition. -/
inductive FiniteDiffractionKind where
  | purePoint
  | singularContinuous
  | absolutelyContinuous
  deriving DecidableEq, Repr

/-- A finite three-component decomposition of a sample space into pure-point,
singular-continuous, and absolutely-continuous event faces. -/
structure FiniteDiffractionDecomposition (Ω : Type) where
  /-- The pure-point component event. -/
  pp : Event Ω
  /-- The singular-continuous component event. -/
  sc : Event Ω
  /-- The absolutely-continuous component event. -/
  ac : Event Ω
  /-- The pure-point and singular-continuous components are disjoint. -/
  pp_sc_disjoint : Set.inter pp sc = Set.empty
  /-- The first two components are jointly disjoint from the absolutely-continuous component. -/
  pp_sc_ac_disjoint : Set.inter (Set.union pp sc) ac = Set.empty
  /-- The three components cover the sample space. -/
  cover : Set.union (Set.union pp sc) ac = Set.univ

/-- Select a component event from a finite diffraction decomposition. -/
def FiniteDiffractionDecomposition.component {Ω : Type}
    (D : FiniteDiffractionDecomposition Ω) : FiniteDiffractionKind → Event Ω
  | .purePoint => D.pp
  | .singularContinuous => D.sc
  | .absolutelyContinuous => D.ac

/-- The event cut out by a finite diffraction classifier and one component label. -/
def componentEvent {Ω : Type} (c : Ω → FiniteDiffractionKind)
    (k : FiniteDiffractionKind) : Event Ω :=
  fun x => decide (c x = k)

/-- Every finite component classifier induces a disjoint, covering decomposition. -/
def decompositionOfClassifier {Ω : Type} (c : Ω → FiniteDiffractionKind) :
    FiniteDiffractionDecomposition Ω where
  pp := componentEvent c .purePoint
  sc := componentEvent c .singularContinuous
  ac := componentEvent c .absolutelyContinuous
  pp_sc_disjoint := by
    apply Set.ext
    intro x
    unfold Set.inter Set.empty
    generalize hk : c x = k
    cases k <;> simp [componentEvent, hk]
  pp_sc_ac_disjoint := by
    apply Set.ext
    intro x
    unfold Set.inter Set.union Set.empty
    generalize hk : c x = k
    cases k <;> simp [componentEvent, hk]
  cover := by
    apply Set.ext
    intro x
    unfold Set.union Set.univ
    generalize hk : c x = k
    cases k <;> simp [componentEvent, hk]

/-- A finite component decomposition splits total counting mass into its three
component masses. -/
theorem finiteDiffractionDecomposition_mass {Ω : Type}
    (S : SampleSpace Ω) (D : FiniteDiffractionDecomposition Ω) :
    S.measure Set.univ = S.measure D.pp + S.measure D.sc + S.measure D.ac := by
  rw [← D.cover]
  rw [SampleSpace.measure_union_disjoint S (Set.union D.pp D.sc) D.ac
    D.pp_sc_ac_disjoint]
  rw [SampleSpace.measure_union_disjoint S D.pp D.sc D.pp_sc_disjoint]

/-! ## Agreement with the existing classifiers -/

/-- The finite diffraction component read from the four-valued charge regime. -/
def chargeDiffractionKind : Regime → FiniteDiffractionKind
  | .consistent => .purePoint
  | .paraconsistent => .singularContinuous
  | .mixed => .absolutelyContinuous
  | .trivial => .absolutelyContinuous

/-- The finite diffraction component read from the closure-ordinal regime. -/
def closureDiffractionKind : ClosureRegime → FiniteDiffractionKind
  | .strict => .purePoint
  | .scott => .purePoint
  | .transfiniteBounded => .absolutelyContinuous
  | .aperiodic => .singularContinuous

/-- The consistent charge face reads as finite pure-point. -/
theorem regimeOf_purePoint :
    chargeDiffractionKind (regimeOf true false) = FiniteDiffractionKind.purePoint := rfl

/-- The paraconsistent charge face reads as finite singular-continuous. -/
theorem regimeOf_singularContinuous :
    chargeDiffractionKind (regimeOf false true) =
      FiniteDiffractionKind.singularContinuous := rfl

/-- The mixed charge face reads as finite absolutely-continuous. -/
theorem regimeOf_absolutelyContinuous :
    chargeDiffractionKind (regimeOf true true) =
      FiniteDiffractionKind.absolutelyContinuous := rfl

/-- The Pisot side of the StepN split reads as finite pure-point. -/
theorem pisot_diffractionKind :
    closureDiffractionKind (StepN.inflationRegime false) =
      FiniteDiffractionKind.purePoint := rfl

/-- The Salem side of the StepN split reads as finite singular-continuous. -/
theorem salem_diffractionKind :
    closureDiffractionKind (StepN.inflationRegime true) =
      FiniteDiffractionKind.singularContinuous := rfl

/-- In strict and Scott regimes, vanishing `H¹` agrees with the finite pure-point face. -/
theorem settling_vanishing_diffractionKind (v : Settling)
    (h : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) :
    closureDiffractionKind v.regime = FiniteDiffractionKind.purePoint ∧
      v.clInv = H1Class.zero := by
  constructor
  · cases h with
    | inl hs =>
        rw [hs]
        rfl
    | inr hs =>
        rw [hs]
        rfl
  · exact clinv_zero_of_settles v h

/-- The exhibited nonzero aperiodic witness agrees with the finite
singular-continuous face. -/
theorem aperiodicWitness_singularContinuous :
    closureDiffractionKind aperiodicWitness.regime =
        FiniteDiffractionKind.singularContinuous ∧
      aperiodicWitness.clInv ≠ H1Class.zero := by
  exact ⟨rfl, aperiodicWitness_clinv_nonzero⟩

/-- The finite diffraction classifier agrees with the already-proved charge,
closure-regime, Pisot/Salem, and `H¹` witnesses. -/
theorem finite_diffraction_classifier_agreement :
    chargeDiffractionKind (regimeOf true false) = FiniteDiffractionKind.purePoint ∧
      chargeDiffractionKind (regimeOf false true) =
        FiniteDiffractionKind.singularContinuous ∧
        chargeDiffractionKind (regimeOf true true) =
          FiniteDiffractionKind.absolutelyContinuous ∧
          closureDiffractionKind (StepN.inflationRegime false) =
            FiniteDiffractionKind.purePoint ∧
            closureDiffractionKind (StepN.inflationRegime true) =
              FiniteDiffractionKind.singularContinuous ∧
              closureDiffractionKind aperiodicWitness.regime =
                FiniteDiffractionKind.singularContinuous ∧
                aperiodicWitness.clInv ≠ H1Class.zero := by
  exact ⟨regimeOf_purePoint, regimeOf_singularContinuous,
    regimeOf_absolutelyContinuous, pisot_diffractionKind, salem_diffractionKind,
    aperiodicWitness_singularContinuous.1, aperiodicWitness_singularContinuous.2⟩

end Persistence.Aperiodic
end Infomaterial
