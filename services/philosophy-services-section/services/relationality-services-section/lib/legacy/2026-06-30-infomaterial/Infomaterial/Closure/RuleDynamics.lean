import Infomaterial.Closure.RuleSystem

/-!
# Dynamics on closure-rule generators

This module adds the second-order closure layer: the rules that generate a
first-order closure operator can themselves be the carrier of a settling dynamic.

`Closure.RuleSystem` already proves that a fixed closure-rule system `S` generates
an immediate-consequence operator `T_S` whose reached fixed point is least above a
seed. Here the carrier is `RuleSystem` itself. A `RuleDynamics` rewrites rule
systems, has an orbit, and has fixed rule generators. Once the generator has
settled, first-order closure under that settled generator is exactly the existing
least-fixed-point theorem.

## Main definitions

* `ClosureRule.RuleDynamics`: an endomap on `RuleSystem`.
* `ClosureRule.RuleDynamics.orbit`: meta-time iteration of the rule generator.
* `ClosureRule.RuleDynamics.FixedRules`: a rule generator fixed by the dynamic.
* `ClosureRule.RuleDynamics.RuleResidue`: non-fixedness of a rule generator.
* `ClosureRule.RuleDynamics.rewriteTo`: the one-step replacement dynamic.

## Main results

* `fixedAt_orbit_add`: after a generator is fixed, its future orbit is constant.
* `settled_rules_closure_lfp`: first-order closure at a settled generator inherits
  `immediate_consequence_lfp`.
* `rewriteTo_fixedAt_one`: one-step replacement settles after one meta-step.
* `rewriteTo_closure_lfp`: closure under the rewritten generator is the ordinary
  immediate-consequence least fixed point.
-/

namespace Infomaterial
namespace ClosureRule

/-- A second-order rule dynamic: an endomap on the carrier of closure-rule systems. -/
structure RuleDynamics where
  /-- One meta-step rewrites the current rule system. -/
  step : RuleSystem → RuleSystem

namespace RuleDynamics

/-- The orbit of a rule system under a second-order rule dynamic. -/
def orbit (D : RuleDynamics) (seed : RuleSystem) : Nat → RuleSystem
  | 0 => seed
  | n + 1 => D.step (orbit D seed n)

/-- A rule system is fixed for a second-order dynamic when the dynamic no longer
rewrites it. -/
def FixedRules (D : RuleDynamics) (S : RuleSystem) : Prop :=
  D.step S = S

/-- A seed has settled at meta-time `n` when the rule system at that time is fixed. -/
def FixedAt (D : RuleDynamics) (seed : RuleSystem) (n : Nat) : Prop :=
  D.FixedRules (D.orbit seed n)

/-- Rule-level residue: the generator still changes under the second-order dynamic. -/
def RuleResidue (D : RuleDynamics) (S : RuleSystem) : Prop :=
  D.step S ≠ S

@[simp] theorem orbit_zero (D : RuleDynamics) (seed : RuleSystem) :
    D.orbit seed 0 = seed :=
  rfl

@[simp] theorem orbit_succ (D : RuleDynamics) (seed : RuleSystem) (n : Nat) :
    D.orbit seed (n + 1) = D.step (D.orbit seed n) :=
  rfl

/-- Rule-level residue is exactly non-fixedness of the rule generator. -/
theorem ruleResidue_iff_not_fixed (D : RuleDynamics) (S : RuleSystem) :
    D.RuleResidue S ↔ ¬ D.FixedRules S :=
  Iff.rfl

/-- A fixed rule generator has no rule-level residue. -/
theorem no_ruleResidue_of_fixed (D : RuleDynamics) (S : RuleSystem)
    (h : D.FixedRules S) : ¬ D.RuleResidue S := by
  intro hr
  exact hr h

/-- Once the rule generator is fixed, its future orbit is constant. -/
theorem fixedAt_orbit_add (D : RuleDynamics) (seed : RuleSystem) (n : Nat)
    (h : D.FixedAt seed n) :
    ∀ k, D.orbit seed (n + k) = D.orbit seed n
  | 0 => by simp
  | k + 1 => by
      rw [Nat.add_succ, orbit_succ]
      rw [fixedAt_orbit_add D seed n h k]
      exact h

/-- First-order closure computed at a settled rule generator inherits the
immediate-consequence least-fixed-point theorem for that generator. -/
theorem settled_rules_closure_lfp (D : RuleDynamics) (seed : RuleSystem) (n : Nat)
    (_hmeta : D.FixedAt seed n) (v : Valuation)
    (hfix : SClosed (D.orbit seed n) (clS (D.orbit seed n) v)) :
    Tstep (D.orbit seed n) (clS (D.orbit seed n) v) = clS (D.orbit seed n) v ∧
    Valuation.leK v (clS (D.orbit seed n) v) ∧
    (∀ x, Valuation.leK v x → Tstep (D.orbit seed n) x = x →
      Valuation.leK (clS (D.orbit seed n) v) x) :=
  immediate_consequence_lfp (D.orbit seed n) v hfix

/-- A rewrite dynamic that replaces any current rule generator by a target generator. -/
def rewriteTo (target : RuleSystem) : RuleDynamics where
  step := fun _ => target

@[simp] theorem rewriteTo_orbit_one_eq (target seed : RuleSystem) :
    (rewriteTo target).orbit seed 1 = target :=
  rfl

/-- The replacement dynamic is settled after one meta-step. -/
theorem rewriteTo_fixedAt_one (target seed : RuleSystem) :
    (rewriteTo target).FixedAt seed 1 :=
  rfl

/-- After a rule rewrite settles, first-order closure is the least fixed point for
the rewritten rules. -/
theorem rewriteTo_closure_lfp (target seed : RuleSystem) (v : Valuation)
    (hfix : SClosed target (clS target v)) :
    Tstep ((rewriteTo target).orbit seed 1) (clS ((rewriteTo target).orbit seed 1) v)
      = clS ((rewriteTo target).orbit seed 1) v ∧
    Valuation.leK v (clS ((rewriteTo target).orbit seed 1) v) ∧
    (∀ x, Valuation.leK v x → Tstep ((rewriteTo target).orbit seed 1) x = x →
      Valuation.leK (clS ((rewriteTo target).orbit seed 1) v) x) := by
  change Tstep target (clS target v) = clS target v ∧
    Valuation.leK v (clS target v) ∧
    (∀ x, Valuation.leK v x → Tstep target x = x →
      Valuation.leK (clS target v) x)
  exact immediate_consequence_lfp target v hfix

end RuleDynamics
end ClosureRule
end Infomaterial
