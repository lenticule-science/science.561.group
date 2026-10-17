import Obsmetrologia.Closure.Regime
import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.Dynamics.Flow.NSCFiring

/-!
# Closure-flow curvature labels on the declared regime profile

The corpus theorem

`content/mark/.../knowledge-least-valuation/settling/_archive/`
`predication-categorical-archive-predication-closure-flow-curvature-regime-correspondence.md`

(marked `status: proved`) reads the closure operator's iteration `σ ↦ v_σ` as a discrete flow
and says that the four-regime classification is a classification by total curvature type,
with `H¹` the curvature module, `rank H¹ = |L_ns(κ)|`.

## What this module proves

Nothing about curvature or `H¹`. It proves facts about two **labels** on the four
`ClosureRegime` values and one table:

* `DeclaredFlat r := r = strict ∨ r = scott` and `DeclaredCurved r := r = transfiniteBounded ∨
  r = aperiodic` are names for two sets of regimes, chosen to match the declared cohomology
  profile `cohomologyVanishes` (`Closure.Regime`), which is itself a table. That they
  partition the four regimes, and that `cohomologyVanishes` agrees with them, holds by the
  definitions (`cases r <;> simp`).
* `declaredTerminatesByOmega` is the same disjunction as `DeclaredFlat`; the "empty off-diagonal
  cell" `¬ (DeclaredCurved r ∧ declaredTerminatesByOmega r)` restates that the two sets are
  disjoint.
* `declaredCurvatureRank : ClosureRegime → Option Nat` is a table: `some 0` on the flat rows,
  `none` on the curved rows. It is not a rank of any module.
* `declaredCurved_row_beside_nsc_witness` places the curved row of the table beside the
  concrete NSC firing `NSCFiring.forallAnteOp_isNSC`. No map links the witness to the row
  (`NSCFiring.nscRegimeData` is a hand-set flag datum, not computed from `forallAnteOp`).
* `curvature_regime_table` bundles the label facts.

## What is open

-- OPEN: the corpus's identification of the regime classification with a classification by
-- curvature, of `H¹` with the curvature module, and `rank H¹ = |L_ns(κ)|`. Each needs a
-- cochain complex for the closure flow, a derivation of a regime from a closure's ordinal,
-- and a map from NSC firing ordinals to generators of `H¹`. None is constructed in this
-- package (see `SettlingCohomologyH1`: no complex is built above degree 1). The
-- evidence-status ledger (science note 2026-10-03) grades the claim "by definition".

The proved NSC content lives in `Flow.NSCFiring` (`IsNSC`, `scott_continuous_iff_no_nsc_firing`,
`no_nsc_firing_of_closure`, `forallAnteOp_isNSC`).
-/

namespace Obsmetrologia.Flow.CurvatureRegime

open Obsmetrologia

/-! ## (1) Two labels on the four regimes

A label names a set of regimes. Neither names a property of any closure flow: the
membership of each regime is fixed by the definition below, in the same four-row shape as
the declared profile `cohomologyVanishes`. -/

/-- **Declared flat.** The label for the `strict` and `scott` rows of the four-regime table.
A name chosen to match the rows where `cohomologyVanishes` is `true`; it is not a statement
that any closure flow has zero curvature. -/
def DeclaredFlat (r : ClosureRegime) : Prop :=
  r = ClosureRegime.strict ∨ r = ClosureRegime.scott

/-- **Declared curved.** The label for the `transfiniteBounded` and `aperiodic` rows. A name
chosen to match the rows where `cohomologyVanishes` is `false`; it is not a statement that any
closure flow has a curvature event. -/
def DeclaredCurved (r : ClosureRegime) : Prop :=
  r = ClosureRegime.transfiniteBounded ∨ r = ClosureRegime.aperiodic

/-- The two labels split the four rows: `DeclaredFlat r ↔ ¬ DeclaredCurved r`. Holds by the
definitions, by exhaustion over the four regimes. -/
theorem declaredFlat_iff_not_declaredCurved (r : ClosureRegime) :
    DeclaredFlat r ↔ ¬ DeclaredCurved r := by
  cases r <;> simp [DeclaredFlat, DeclaredCurved]

/-- The dual reading: `DeclaredCurved r ↔ ¬ DeclaredFlat r`. By the definitions. -/
theorem declaredCurved_iff_not_declaredFlat (r : ClosureRegime) :
    DeclaredCurved r ↔ ¬ DeclaredFlat r := by
  cases r <;> simp [DeclaredFlat, DeclaredCurved]

/-- No regime carries both labels. By the definitions. -/
theorem not_declaredFlat_and_declaredCurved (r : ClosureRegime) :
    ¬ (DeclaredFlat r ∧ DeclaredCurved r) := by
  cases r <;> simp [DeclaredFlat, DeclaredCurved]

/-! ## (2) The labels against the declared profile -/

/-- `cohomologyVanishes r = true ↔ DeclaredFlat r`. `DeclaredFlat` is the right-hand side of
`cohomologyVanishes_iff`, so this is that table lookup under the label's name. It does not
say that `H¹` vanishes on flat flows: `cohomologyVanishes` is a table and no `H¹` is computed. -/
theorem vanishes_iff_declaredFlat (r : ClosureRegime) :
    cohomologyVanishes r = true ↔ DeclaredFlat r :=
  cohomologyVanishes_iff r

/-- `cohomologyVanishes r = false ↔ DeclaredCurved r`: a table lookup, by exhaustion. -/
theorem nonvanishes_iff_declaredCurved (r : ClosureRegime) :
    cohomologyVanishes r = false ↔ DeclaredCurved r := by
  cases r <;> simp [cohomologyVanishes, DeclaredCurved]

-- OPEN: flat ⟺ `H¹ = 0` ⟺ no curvature events, as a statement about a closure flow. It needs
-- a cochain complex for the flow and a regime derived from the closure's ordinal.

/-! ## (3) The off-diagonal cell -/

/-- The label for the `strict` and `scott` rows, as the termination column of the corpus's
2×2 table. It is the same disjunction as `DeclaredFlat`; nothing here computes a closure
ordinal. -/
def declaredTerminatesByOmega (r : ClosureRegime) : Prop :=
  r = ClosureRegime.strict ∨ r = ClosureRegime.scott

/-- No regime is both `DeclaredCurved` and `declaredTerminatesByOmega`: the two sets are
disjoint by their definitions. -/
theorem no_declaredCurved_declaredTerminatesByOmega (r : ClosureRegime) :
    ¬ (DeclaredCurved r ∧ declaredTerminatesByOmega r) := by
  cases r <;> simp [DeclaredCurved, declaredTerminatesByOmega]

/-- `declaredTerminatesByOmega r → DeclaredFlat r`: the two labels name the same set. -/
theorem declaredTerminatesByOmega_is_declaredFlat (r : ClosureRegime) :
    declaredTerminatesByOmega r → DeclaredFlat r := by
  cases r <;> simp [declaredTerminatesByOmega, DeclaredFlat]

/-! ## (4) The declared rank table -/

/-- The **declared rank** table: `some 0` on the flat rows, `none` on the curved rows. It is
not the rank of any module. The corpus's `rank H¹ = |L_ns(κ)|` would need `H¹` and a count of
NSC firing ordinals. -/
def declaredCurvatureRank : ClosureRegime → Option Nat
  | ClosureRegime.strict => some 0
  | ClosureRegime.scott => some 0
  | ClosureRegime.transfiniteBounded => none
  | ClosureRegime.aperiodic => none

/-- `declaredCurvatureRank r = some 0 ↔ DeclaredFlat r`: a table lookup, by exhaustion. -/
theorem declaredRank_zero_iff_declaredFlat (r : ClosureRegime) :
    declaredCurvatureRank r = some 0 ↔ DeclaredFlat r := by
  cases r <;> simp [declaredCurvatureRank, DeclaredFlat]

/-- `declaredCurvatureRank r = none ↔ DeclaredCurved r`: a table lookup, by exhaustion. -/
theorem declaredRank_none_iff_declaredCurved (r : ClosureRegime) :
    declaredCurvatureRank r = none ↔ DeclaredCurved r := by
  cases r <;> simp [declaredCurvatureRank, DeclaredCurved]

/-- `declaredCurvatureRank r = some 0 ↔ cohomologyVanishes r = true`: two tables with the same
rows. -/
theorem declaredRank_zero_iff_vanishes (r : ClosureRegime) :
    declaredCurvatureRank r = some 0 ↔ cohomologyVanishes r = true := by
  cases r <;> simp [declaredCurvatureRank, cohomologyVanishes]

/-- **The curved row beside an NSC firing witness.** Three facts, unconnected by any map:
the hand-set datum `NSCFiring.nscRegimeData` classifies to a row whose declared profile is
non-vanishing (a table lookup); that row's declared rank is `none` (a table lookup); and
`forallAnteOp` has an NSC firing at `botTopPrefix` (proved by finite exhaustion, a real
witness). The datum is not computed from the operator, so this does not show that the
witness produces the row or any `H¹` generator. -/
theorem declaredCurved_row_beside_nsc_witness :
    cohomologyVanishes (classify NSCFiring.nscRegimeData) = false
    ∧ declaredCurvatureRank (classify NSCFiring.nscRegimeData) = none
    ∧ NSCFiring.IsNSC NSCFiring.forallAnteOp NSCFiring.botTopPrefix := by
  refine ⟨NSCFiring.nscRegimeData_profile_nonvanishing_table, ?_, NSCFiring.forallAnteOp_isNSC⟩
  rw [NSCFiring.nscRegimeData_transfiniteBounded]; rfl

-- OPEN: `rank H¹ = |L_ns(κ)|`, one `ℤ`-generator per NSC firing ordinal. It needs `H¹` of the
-- closure flow, a derivation of the regime from the flow, and a map from `L_ns` to generators.

/-! ## (5) The label facts, bundled -/

/-- The label facts of this module, for every regime `r`: the split, the two profile lookups,
the empty cell and the rank-table lookup. Each conjunct holds by the definitions; none is a
theorem about curvature or `H¹`. -/
theorem curvature_regime_table (r : ClosureRegime) :
    (DeclaredFlat r ↔ ¬ DeclaredCurved r)
    ∧ (cohomologyVanishes r = true ↔ DeclaredFlat r)
    ∧ (cohomologyVanishes r = false ↔ DeclaredCurved r)
    ∧ ¬ (DeclaredCurved r ∧ declaredTerminatesByOmega r)
    ∧ (declaredCurvatureRank r = some 0 ↔ DeclaredFlat r) :=
  ⟨declaredFlat_iff_not_declaredCurved r,
    vanishes_iff_declaredFlat r,
    nonvanishes_iff_declaredCurved r,
    no_declaredCurved_declaredTerminatesByOmega r,
    declaredRank_zero_iff_declaredFlat r⟩

end Obsmetrologia.Flow.CurvatureRegime
