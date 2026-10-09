import Obsmetrologia.AperiodicOrder.Tiling.ClassificationReduction

/-!
# Incompleteness of local-derivability structures finer than `cl-inv`

`ClassificationReduction` reduced `thm:aperiodic-mld-classification` to `Complete D` and
exhibited complete structures; `GeometricMldComplete` proved the geometric model complete.
This module proves the other half of the dichotomy: a structure whose `Mld` preserves data
the rank-1 `cl-inv` coordinate discards is not complete. Two witness pairs, both with
`cl-inv = ⟨1⟩`:

* **regime axis** — `tbUnitSettling` (`transfiniteBounded`) vs `aperiodicUnitSettling`
  (`aperiodic`): `eqLocalDerivability` and the regime-refined structure
  `regimeLocalDerivability` both fail completeness;
* **carrier-class axis** — `b3Settling` vs `q0LoopSettling`, whose carrier cocycles `b3` and
  `q0Loop` are distinct classes of the rank-5 marker-ring `H¹` (they differ at `q0`; the
  complex is one-vertex, so `δ⁰ = 0` and distinct cocycles are distinct classes).

## Main definitions

`tbUnitSettling`, `aperiodicUnitSettling`, `regimeLocalDerivability`, `b3Settling`,
`q0LoopSettling`.

## Main results

`not_complete_of_separating`, `eqLocalDerivability_not_complete`,
`regimeLocalDerivability_not_complete`, `classification_incompleteness` (bundled headline).

## References

`content/.../aperiodic-regime-classification` (Step 4, incompleteness side).

## Tags

aperiodic classification, mutual local derivability, completeness, separation witness
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

/-! ## (A) The separation principle -/

/-- A `CohEquiv`-related pair that a structure's `Mld` does not relate refutes that
structure's completeness. -/
theorem not_complete_of_separating (D : LocalDerivability) {v v' : Settling}
    (hc : CohEquiv v v') (hm : ¬ D.Mld v v') : ¬ Complete D :=
  fun h => hm (h v v' hc)

/-! ## (B) The regime-axis witness pair -/

/-- The transfinite-bounded settling at `cl-inv` coordinate `1`. Its `vanishing` constraint
is vacuous (`cohomologyVanishes transfiniteBounded = false`). -/
def tbUnitSettling : Settling where
  regime := ClosureRegime.transfiniteBounded
  carrier := coordCarrier 1
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- The aperiodic settling at `cl-inv` coordinate `1`. -/
def aperiodicUnitSettling : Settling where
  regime := ClosureRegime.aperiodic
  carrier := coordCarrier 1
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- The regime-axis pair is cohomologically equivalent — both have `cl-inv = ⟨1⟩`. -/
theorem cohEquiv_tbUnit_aperiodicUnit : CohEquiv tbUnitSettling aperiodicUnitSettling := rfl

/-- The regime-axis pair is not equal — the regimes differ. -/
theorem tbUnitSettling_ne_aperiodicUnitSettling : tbUnitSettling ≠ aperiodicUnitSettling :=
  fun h => ClosureRegime.noConfusion (congrArg Settling.regime h)

/-- `eqLocalDerivability` is not complete: `tbUnitSettling` and `aperiodicUnitSettling` are
`CohEquiv` but not equal. -/
theorem eqLocalDerivability_not_complete : ¬ Complete eqLocalDerivability :=
  not_complete_of_separating eqLocalDerivability cohEquiv_tbUnit_aperiodicUnit
    tbUnitSettling_ne_aperiodicUnitSettling

/-- The regime-refined local-derivability structure: `Mld` is `CohEquiv` together with
equality of regimes. -/
def regimeLocalDerivability : LocalDerivability where
  Mld v v' := CohEquiv v v' ∧ v.regime = v'.regime
  mld_refl v := ⟨cohEquiv_refl v, rfl⟩
  mld_symm h := ⟨cohEquiv_symm h.1, h.2.symm⟩
  mld_trans h h' := ⟨cohEquiv_trans h.1 h'.1, h.2.trans h'.2⟩
  preserves_clInv h := h.1

/-- `regimeLocalDerivability` is not complete: the regime-axis pair is `CohEquiv` but its
regimes differ. -/
theorem regimeLocalDerivability_not_complete : ¬ Complete regimeLocalDerivability :=
  not_complete_of_separating regimeLocalDerivability cohEquiv_tbUnit_aperiodicUnit
    (fun hm => ClosureRegime.noConfusion hm.2)

/-! ## (C) The carrier-class-axis witness pair -/

/-- The aperiodic settling carrying the marker-ring core class `b3`, read at `q1`. -/
def b3Settling : Settling where
  regime := ClosureRegime.aperiodic
  carrier :=
    { K := Witness.markerRingComplex
      cochain := Witness.b3
      gen := Witness.QEdge.q1
      closed := Witness.b3_closed }
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- The aperiodic settling carrying the `q0` one-edge loop class, read at `q0`. -/
def q0LoopSettling : Settling where
  regime := ClosureRegime.aperiodic
  carrier :=
    { K := Witness.markerRingComplex
      cochain := Witness.q0Loop
      gen := Witness.QEdge.q0
      closed := Witness.q0Loop_closed }
  vanishing := fun h => by simp [cohomologyVanishes] at h

/-- The carrier-class pair is cohomologically equivalent — both cocycles read `1` at their
generator, so both settlings have `cl-inv = ⟨1⟩`. -/
theorem cohEquiv_b3Settling_q0LoopSettling : CohEquiv b3Settling q0LoopSettling := rfl

/-- The carrier-class pair is not equal — the carrier cocycles differ
(`Witness.b3_ne_q0Loop`). -/
theorem b3Settling_ne_q0LoopSettling : b3Settling ≠ q0LoopSettling := by
  intro h
  have hcar : b3Settling.carrier = q0LoopSettling.carrier := congrArg Settling.carrier h
  exact Witness.b3_ne_q0Loop (congrArg
    (fun c : { c : H1Carrier // c.K = Witness.markerRingComplex } =>
      c.2 ▸ c.1.cochain) (Subtype.ext (p := fun c => c.K = Witness.markerRingComplex)
        (a1 := ⟨b3Settling.carrier, rfl⟩) (a2 := ⟨q0LoopSettling.carrier, rfl⟩) hcar))

/-! ## (D) The bundled headline -/

/-- Bundles `eqLocalDerivability_not_complete`, `regimeLocalDerivability_not_complete`, and
the carrier-class separation: a `CohEquiv` pair whose carrier cocycles are distinct nonzero
`H¹` classes of the rank-5 marker-ring group. -/
theorem classification_incompleteness :
    (¬ Complete eqLocalDerivability)
    ∧ (¬ Complete regimeLocalDerivability)
    ∧ (CohEquiv b3Settling q0LoopSettling
        ∧ b3Settling ≠ q0LoopSettling
        ∧ Witness.b3 ≠ Witness.q0Loop
        ∧ Witness.markerRingComplex.NonzeroH1Class Witness.b3
        ∧ Witness.markerRingComplex.NonzeroH1Class Witness.q0Loop) :=
  ⟨eqLocalDerivability_not_complete,
   regimeLocalDerivability_not_complete,
   cohEquiv_b3Settling_q0LoopSettling,
   b3Settling_ne_q0LoopSettling,
   Witness.b3_ne_q0Loop,
   Witness.markerRing_b3_nonzero_h1_class,
   Witness.markerRing_q0Loop_nonzero_h1_class⟩

end AperiodicOrder.Tiling
end Obsmetrologia
