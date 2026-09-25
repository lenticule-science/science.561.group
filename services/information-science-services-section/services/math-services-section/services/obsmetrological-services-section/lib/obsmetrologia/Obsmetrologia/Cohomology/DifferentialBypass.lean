import Obsmetrologia.Closure.Coalgebra
import Obsmetrologia.Closure.Ordinal
import Obsmetrologia.Cohomology.SettlingCohomologyH1

/-!
# Differential bypass

The differential bypass is the checked carrier for the phrase "route the
algebra/coalgebra gap through κ."  In this file the two sides are the existing
closure algebra and settling coalgebra over valuations:

* the algebra side is a `Cl`-algebra, equivalently a closure fixed point
  `closureOp E = E`;
* the coalgebra side is the zero-increment settling endofunctor target
  `F_U(E) = Cl(E)`;
* the bypass certificate records that the closure ordinal `κ` refines the
  Boolean regime classifier.

The proved content is deliberately finite: a bypass certificate collapses the
zero-increment μ/ν gap, routes the ordinal to its regime, and uses the existing
regime table to identify exactly where `H¹` is valued rather than vanished.

## Main definitions

* `MuNuAgreement` and `MuNuDifferential` name the agreement and disagreement of
  the zero-increment algebra/coalgebra sides.
* `DifferentialBypass` is the certificate: a closure-algebra witness plus a
  `κ`-to-regime alignment.

## Main results

* `differential_bypass_sound` bundles three facts: μ/ν agreement,
  κ-regime routing, and the non-vanishing obstruction table.
* `differential_bypass_h1_vanishes` transports the existing `H¹` gluing theorem
  through the bypass in strict/Scott regimes.
* `mu_nu_differential_no_bypass` records the obstruction direction: a remaining
  nonzero μ/ν differential forbids such a bypass certificate.

## References

This module is generated from the local settling coalgebra, ordinal regime, and
settling cohomology carriers.
-/

namespace Obsmetrologia
namespace Cohomology

open Valuation Valuation.ModalFrame
open Obsmetrologia.AssocSheaf

/-- Agreement of the closure algebra and settling coalgebra sides at zero increment. -/
def MuNuAgreement (M : ModalFrame) (E : Valuation) : Prop :=
  Coalgebra.settlingEndofunctor M Valuation.knowledgeLeast E = E

/-- A nonzero differential between the closure algebra and settling coalgebra sides. -/
def MuNuDifferential (M : ModalFrame) (E : Valuation) : Prop :=
  Coalgebra.settlingEndofunctor M Valuation.knowledgeLeast E ≠ E

/-- A differential bypass certificate routes the algebra side through the closure ordinal.

The algebra field supplies the μ-side fixed point.  The ordinal field says the
real ordinal shape of `κ` refines the `finiteBase` flag of the regime data, so
`Ord.regimeOfOrd` agrees with `classify`.
-/
structure DifferentialBypass (M : ModalFrame) (E : Valuation)
    (d : ClosureRegimeData) (κ : Ord) : Prop where
  /-- The μ-side closure-algebra witness. -/
  algebra : ClAlgebraStructure M E
  /-- The κ-side alignment with the regime-data finite flag. -/
  ordinal : κ.isFinite = d.finiteBase

/-- A bypass certificate collapses the zero-increment coalgebra target onto the algebra. -/
theorem differential_bypass_agreement {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord} (B : DifferentialBypass M E d κ) :
    MuNuAgreement M E := by
  unfold MuNuAgreement
  rw [Coalgebra.settlingEndofunctor_zero]
  exact isClAlgebra_of_structure M B.algebra

/-- A bypass certificate rules out a nonzero μ/ν differential. -/
theorem differential_bypass_not_differential {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord} (B : DifferentialBypass M E d κ) :
    ¬ MuNuDifferential M E := by
  intro h
  exact h (differential_bypass_agreement B)

/-- If a nonzero μ/ν differential remains, no bypass certificate exists. -/
theorem mu_nu_differential_no_bypass {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord} (h : MuNuDifferential M E) :
    ¬ DifferentialBypass M E d κ := by
  intro B
  exact differential_bypass_not_differential B h

/-- A closure fixed point and a κ-alignment produce a bypass certificate. -/
theorem differential_bypass_of_fixed {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord}
    (hE : M.closureOp E = E) (hκ : κ.isFinite = d.finiteBase) :
    DifferentialBypass M E d κ where
  algebra := structure_of_isClAlgebra M hE
  ordinal := hκ

/-- A quiescent valuation and a κ-alignment produce a bypass certificate. -/
theorem differential_bypass_of_quiescent {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord}
    (hE : Quiescent M E) (hκ : κ.isFinite = d.finiteBase) :
    DifferentialBypass M E d κ :=
  differential_bypass_of_fixed ((quiescent_iff_fixed M E).1 hE) hκ

/-- The bypass routes the ordinal side to the regime classifier. -/
theorem differential_bypass_regime {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord} (B : DifferentialBypass M E d κ) :
    Ord.regimeOfOrd κ d.scottContinuous d.countableCofinality = classify d :=
  Ord.regime_of_ord_refines_classify d κ B.ordinal

/-- Non-vanishing cohomology is exactly the valued non-strict, non-Scott side. -/
theorem obstruction_valued_iff (r : ClosureRegime) :
    cohomologyVanishes r = false ↔
      r = ClosureRegime.transfiniteBounded ∨ r = ClosureRegime.aperiodic := by
  cases r <;> simp [cohomologyVanishes]

/-- In a vanishing regime, the bypass inherits the existing `H¹` gluing theorem. -/
theorem differential_bypass_h1_vanishes {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord} (_B : DifferentialBypass M E d κ)
    (h : cohomologyVanishes (classify d) = true) :
    (cohomologyVanishes (classify d) = true ↔
        classify d = ClosureRegime.strict ∨ classify d = ClosureRegime.scott)
    ∧ (classify d = ClosureRegime.strict ∨ classify d = ClosureRegime.scott)
    ∧ (∀ D : Cech1, Cocycle D →
        (∃ g : Cochain, Coboundary D g)
          ∧ (∀ g g' : Cochain, Coboundary D g → Coboundary D g' → g = g'))
    ∧ (∀ (n : Nat), 2 ≤ n → ∀ x y : Hn n, x = y) :=
  settling_cohomology_h1_vanishes (classify d) h

/-- The bypass package gives agreement, κ-regime routing, and the obstruction table. -/
theorem differential_bypass_sound {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord} (B : DifferentialBypass M E d κ) :
    MuNuAgreement M E
    ∧ Ord.regimeOfOrd κ d.scottContinuous d.countableCofinality = classify d
    ∧ (cohomologyVanishes (classify d) = false ↔
        classify d = ClosureRegime.transfiniteBounded ∨ classify d = ClosureRegime.aperiodic) :=
  ⟨differential_bypass_agreement B, differential_bypass_regime B,
    obstruction_valued_iff (classify d)⟩

end Cohomology
end Obsmetrologia
