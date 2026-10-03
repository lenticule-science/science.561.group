import Obsmetrologia.Closure.Scott
import Obsmetrologia.Closure.Ordinal
import Obsmetrologia.Cohomology.DifferentialBypass

/-!
# Scott face

This module packages the checked `κ = ω` corner as the meeting point of the
finite-antecedent Scott-continuity theorem and the settling `H¹` regime table.

The carrier is intentionally narrow:

* the base stages are `Nat`, with no terminal stage;
* the finite approximations are `Ord.ofNat n`;
* the closure-ordinal coordinate is `Ord.omega`;
* finite-antecedent firing reuses `Closure.Scott.finite_antecedent_scott_continuous`;
* the cohomological reading reuses `settling_cohomology_h1_vanishes`.

The module proves the Scott face itself.  The larger comparison among Landauer,
Collatz, and Zeta-star remains a downstream frontier unless another module
supplies a common carrier for those readings.

## Main definitions

* `Base` is the unbounded finite-stage index.
* `approximation n` is the finite ordinal approximation at stage `n`.
* `closureOrdinal` is the `ω` coordinate of this face.
* `regimeData` is the Scott, non-finite, countable-cofinality regime datum.

## Main results

* `closureOrdinal_lub_of_finite_approximations` says `ω` is the least upper
  bound of the finite approximations.
* `finite_antecedent_closure_scott_continuous` transports the finite-antecedent
  firing theorem to the face.
* `h1_vanishes` and `differential_bypass_h1_vanishes` place the face on the
  reversible, cohomology-vanishing side of the regime ledger.
-/

namespace Obsmetrologia
namespace Cohomology
namespace ScottFace

open Obsmetrologia.Closure.Scott
open Obsmetrologia.Reading
open Obsmetrologia.AssocSheaf

/-! ## The `ω`-indexed carrier -/

/-- The Scott face is indexed by ordinary finite stages. -/
abbrev Base := Nat

/-- The finite ordinal approximation at stage `n`. -/
def approximation (n : Base) : Ord := Ord.ofNat n

/-- The closure-ordinal coordinate of the Scott face. -/
def closureOrdinal : Ord := Ord.omega

/-- The regime datum for the Scott face: Scott-continuous, non-finite base,
and countable cofinality. -/
def regimeData : ClosureRegimeData where
  scottContinuous := true
  finiteBase := false
  countableCofinality := true
  fin_scott := by intro _; rfl
  fin_cof := by intro _; rfl

/-- The stage base has no last finite stage. -/
theorem base_unbounded (n : Base) : ∃ m : Base, n < m :=
  ⟨n + 1, Nat.lt_succ_self n⟩

/-- Every approximation is a finite ordinal. -/
theorem finite_approximation_is_finite (n : Base) :
    (approximation n).isFinite = true :=
  Ord.ofNat_isFinite n

/-- Every finite approximation lies below the `ω` coordinate. -/
theorem finite_approximation_below_omega (n : Base) :
    Ord.Le (approximation n) closureOrdinal :=
  Ord.ofNat_le_omega n

/-- The closure-ordinal coordinate is exactly `ω`. -/
theorem closureOrdinal_eq_omega : closureOrdinal = Ord.omega := rfl

/-- `ω` is the least upper bound of the finite ordinal approximations. -/
theorem closureOrdinal_lub_of_finite_approximations (b : Ord)
    (hb : ∀ n : Base, Ord.Le (approximation n) b) :
    Ord.Le closureOrdinal b :=
  Ord.limit_isLUB Ord.ofNat b hb

/-! ## The Scott regime and finite-antecedent continuity -/

/-- Reading the Scott-face ordinal through the ordinal-regime classifier yields
the Scott regime. -/
theorem regime_is_scott :
    Ord.regimeOfOrd closureOrdinal regimeData.scottContinuous
        regimeData.countableCofinality = ClosureRegime.scott :=
  Ord.omega_scott_is_scott _

/-- The Boolean regime classifier also reads the face as Scott. -/
theorem classify_regime_is_scott : classify regimeData = ClosureRegime.scott := rfl

/-- The Scott face is on the cohomology-vanishing side of the regime table. -/
theorem cohomology_vanishes : cohomologyVanishes (classify regimeData) = true := rfl

/-- Finite-antecedent firing remains Scott-continuous at the face. -/
theorem finite_antecedent_closure_scott_continuous (ante concl : Reading)
    (S : DirectedFamily) :
    fire ante concl (sup S.elems) = sup (S.elems.map (fire ante concl)) :=
  finite_antecedent_scott_continuous ante concl S

/-! ## The reversible `H¹` side -/

/-- The Scott face inherits the strict/Scott `H¹`-vanishing theorem. -/
theorem h1_vanishes :
    (cohomologyVanishes (classify regimeData) = true ↔
        classify regimeData = ClosureRegime.strict ∨ classify regimeData = ClosureRegime.scott)
    ∧ (classify regimeData = ClosureRegime.strict ∨ classify regimeData = ClosureRegime.scott)
    ∧ (∀ D : Cech1, Cocycle D →
        (∃ g : Cochain, Coboundary D g)
          ∧ (∀ g g' : Cochain, Coboundary D g → Coboundary D g' → g = g')) :=
  settling_cohomology_h1_vanishes (classify regimeData) cohomology_vanishes

/-- Any differential bypass whose ordinal route is the Scott face inherits
`H¹`-vanishing. -/
theorem differential_bypass_h1_vanishes {M : Valuation.ModalFrame} {E : Valuation}
    (B : DifferentialBypass M E regimeData closureOrdinal) :
    (cohomologyVanishes (classify regimeData) = true ↔
        classify regimeData = ClosureRegime.strict ∨ classify regimeData = ClosureRegime.scott)
    ∧ (classify regimeData = ClosureRegime.strict ∨ classify regimeData = ClosureRegime.scott)
    ∧ (∀ D : Cech1, Cocycle D →
        (∃ g : Cochain, Coboundary D g)
          ∧ (∀ g g' : Cochain, Coboundary D g → Coboundary D g' → g = g')) :=
  Cohomology.differential_bypass_h1_vanishes B cohomology_vanishes

end ScottFace
end Cohomology
end Obsmetrologia
