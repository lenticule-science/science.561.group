import Obsmetrologia.Closure.ClosureMonad
import Obsmetrologia.Closure.ClosureOrdinalRegime

/-!
# LearningClosure — the learning cycle is a closure, and depth is its regime

> **Home & verification.** Recorded in `content/` as the formal artifact of the
> `learning-cycle` node (`../learning-cycle.md`), beside the paper it witnesses
> (`../docs/explanations/learning-as-closure.md`). Written against the `Obsmetrologia` Lean
> library; checked there with `LearningOperator.no_cycle` axiom-free and `four_depths`
> using only `propext` (a logical-core axiom). It does not build in place. To re-check:
> copy this file into the Obsmetrologia lake project (e.g. `Obsmetrologia/Closure/`), add it to
> the import root, and run `lake build` / `lean_diagnostic_messages`.

Witness for the paper *The learning cycle is a closure*. A learning step is a monotone,
inflationary operator on the knowledge lattice. Two facts:

* **The spiral.** Its orbit ascends and has no nontrivial periodic orbit
  (`LearningOperator.no_cycle`): a return to a previous total state is a fixed point.
  Kolb's *cycle* is a *spiral*.
* **Four depths.** The closure ordinal stratifies into the four regimes
  (`ClosureRegime`) at the boundaries `ω`, `ω₁` — rote / automatization / conceptual
  change / adaptive expertise — mutually exclusive and jointly exhaustive
  (`four_depths`), a four-element classification (`depth_is_four`).

Everything reuses the existing closure/regime development; the spiral needs only
inflationariness (monotonicity is part of the learning-operator data but not used).
-/

namespace Obsmetrologia
namespace Charge

/-- A **learning operator** on the knowledge lattice: monotone and inflationary (a
single learning step; no idempotence assumed). -/
structure LearningOperator where
  /-- The step. -/
  f : Charge → Charge
  /-- Inflationary: a step never forgets. -/
  infl : ∀ a, KLE a (f a)
  /-- Monotone: more known in, more known out. -/
  mono : ∀ a b, KLE a b → KLE (f a) (f b)

namespace LearningOperator
variable (L : LearningOperator)

/-- **The orbit ascends.** `iter f m v ≤ₖ iter f (m+d) v`. -/
theorem ascends (v : Charge) (m d : Nat) :
    KLE (iter L.f m v) (iter L.f (m + d) v) :=
  iter_le_add L.f L.infl v m d

/-- **No nontrivial periodic orbit — the spiral.** If iterating the learning step
returns to the start, the start was already a fixed point: learning strictly ascends
and cannot loop. -/
theorem no_cycle (v : Charge) {k : Nat} (hk : 1 ≤ k) (h : iter L.f k v = v) :
    L.f v = v := by
  have hge : KLE v (L.f v) := L.infl v
  have hle : KLE (L.f v) v := by
    obtain ⟨d, rfl⟩ := Nat.le.dest hk
    have h1 := iter_le_add L.f L.infl v 1 d
    rw [h] at h1; exact h1
  exact kle_antisymm _ _ hle hge

end LearningOperator

/-! ## Depth of learning = closure-ordinal regime -/

/-- **Depth of learning** is the closure-ordinal regime of the learning closure:
finite (rote), Scott-continuous (automatization), bounded-transfinite (conceptual
change), uncountable (adaptive expertise). -/
abbrev LearningDepth := ClosureRegime

/-- **The four depths.** For any closure data the depth classifies into exactly one of
the four regimes, each by its own analytic condition (finite base / Scott-continuous,
infinite / non-Scott, countable cofinality / non-Scott, uncountable) — mutually
exclusive and jointly exhaustive. -/
theorem four_depths (d : ClosureRegimeData) :
    (classify d = ClosureRegime.strict ∨ classify d = ClosureRegime.scott
      ∨ classify d = ClosureRegime.transfiniteBounded ∨ classify d = ClosureRegime.aperiodic)
    ∧ (classify d = ClosureRegime.strict ↔ d.finiteBase = true)
    ∧ (classify d = ClosureRegime.scott ↔ (d.scottContinuous = true ∧ d.finiteBase = false))
    ∧ (classify d = ClosureRegime.transfiniteBounded ↔
        (d.scottContinuous = false ∧ d.countableCofinality = true))
    ∧ (classify d = ClosureRegime.aperiodic ↔
        (d.scottContinuous = false ∧ d.countableCofinality = false)) :=
  four_regime_dichotomy d

/-- The four depths are exactly four (a bijection with the four-corner object). -/
def depth_is_four : Bij LearningDepth Corner := regime_is_four_corner

end Charge
end Obsmetrologia
