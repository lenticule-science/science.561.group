import Infomaterial.Persistence.Aperiodic.Classification
import Infomaterial.Dynamics.Flow.CurvatureRegime

/-!
# Defect as cohomological obstruction

A **defect** in a crystal, quasicrystal, or glass — a vacancy, dislocation, grain boundary, or any
local incompatibility that cannot be ironed out globally — is, abstractly, a nonzero local-to-global
obstruction. Infomaterial already carries that obstruction theory: the classifying invariant
`Settling.clInv ∈ H1Class`, zero exactly in the flat (strict/Scott) regimes and nonzero in the curved
(transfinite-bounded/aperiodic) ones. This module names the defect vocabulary on top of it.

A defect is `v.clInv ≠ 0`. The point is that this predicate is **inhabited** — `aperiodicWitness` is a
genuine defect (`aperiodicWitness_hasDefect`) — so the theory is not vacuous. That distinguishes it
from the finite strict/Scott Čech datum `Cohomology.Cech1`, where every cocycle glues
(`h1_vanishes`): on the flat sheaf there are no defects at all, which is precisely why the defect
predicate belongs at the regime-classified `Settling` level, where curvature can be nonzero.

The bridge to curvature: a defect forces a curved regime (`hasDefect_curved`) and hence non-vanishing
cohomology (`hasDefect_nonvanishing`); conversely, a settled (flat / cohomology-vanishing) regime is
defect-free (`no_defect_of_settles`, `no_defect_of_vanishing`). The converse "curved ⇒ defect" does
**not** hold — a curved regime may still carry the zero invariant — so only the one direction is
stated.

## Main definitions
* `HasDefect` — a settling carries a defect when its classifying invariant is nonzero.

## Main results
* `no_defect_of_settles` / `no_defect_of_vanishing` — flat / cohomology-vanishing regimes are defect-free.
* `hasDefect_curved` / `hasDefect_nonvanishing` — a defect forces a curved regime with non-vanishing H¹.
* `aperiodicWitness_hasDefect`, `defect_exists` — defects exist (the predicate is inhabited).

## References
Corpus: `aperiodic-classification`, the curvature–regime correspondence. The crystal/glass defect
memos (defect = local-to-global obstruction); built on `Aperiodic.Classification` and
`Flow.CurvatureRegime`.

## Tags
defect, dislocation, cohomological obstruction, classifying invariant, curvature, H1
-/

namespace Infomaterial
namespace Cohomology.Defect

open Infomaterial.Flow.CurvatureRegime
open Infomaterial.Persistence.Aperiodic

/-- **A settling carries a defect** when its classifying invariant is nonzero — a nonzero
local-to-global obstruction (the abstract form of a vacancy / dislocation / grain boundary). -/
def HasDefect (v : Settling) : Prop := v.clInv ≠ H1Class.zero

/-- **A settled (flat) regime is defect-free.** In the strict/Scott regimes the classifying invariant
is zero (`clinv_zero_of_settles`), so no defect can be carried. -/
theorem no_defect_of_settles (v : Settling)
    (hr : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) :
    ¬ HasDefect v := fun hd => hd (clinv_zero_of_settles v hr)

/-- **Cohomology-vanishing regimes are defect-free** — the `H¹ = 0` form of `no_defect_of_settles`,
via `vanishes_iff_flat`. -/
theorem no_defect_of_vanishing (v : Settling) (h : cohomologyVanishes v.regime = true) :
    ¬ HasDefect v :=
  fun hd => hd (clinv_zero_of_settles v ((vanishes_iff_flat v.regime).mp h))

/-- **A defect forces a curved regime.** The contrapositive of `clinv_zero_of_settles`: a nonzero
classifying invariant rules out the flat regimes, leaving transfinite-bounded or aperiodic. -/
theorem hasDefect_curved (v : Settling) (h : HasDefect v) : IsCurved v.regime := by
  rw [curved_iff_not_flat]
  intro hflat
  exact h (clinv_zero_of_settles v hflat)

/-- **A defect forces non-vanishing cohomology** (`H¹ ≠ 0`): `hasDefect_curved` read through
`nonvanishes_iff_curved`. The defect is a genuine curvature event. -/
theorem hasDefect_nonvanishing (v : Settling) (h : HasDefect v) :
    cohomologyVanishes v.regime = false :=
  (nonvanishes_iff_curved v.regime).mpr (hasDefect_curved v h)

/-- **The aperiodic witness is a genuine defect** — the defect predicate is inhabited, so the theory
is not vacuous (unlike the flat Čech datum, where `h1_vanishes` kills every defect). -/
theorem aperiodicWitness_hasDefect : HasDefect aperiodicWitness :=
  aperiodicWitness_clinv_nonzero

/-- **Defects exist**: a settling in the aperiodic regime carrying a nonzero invariant. -/
theorem defect_exists : ∃ v : Settling, v.regime = ClosureRegime.aperiodic ∧ HasDefect v :=
  ⟨aperiodicWitness, rfl, aperiodicWitness_hasDefect⟩

end Cohomology.Defect
end Infomaterial
