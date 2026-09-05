import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Closure.RuleDynamics

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for second-order dynamics on closure-rule generators.
-/

#doc (Manual) "Rule generator dynamics" =>

# Rule Generator Dynamics

The first closure-rule theorem fixes a rule system and lets valuations settle
under it. That proves the physics-like face: a state descends to closure under
given rules.

The second-order move lives one carrier higher. A rule system is already reified
as `RuleSystem`; therefore it can be the state of a dynamic. The law is no
longer only beneath the motion. The law-carrier can move, reach residue, and
settle.

The claim-site carried here is:

* claim-site: dynamics on closure-rule generators;
* phase: closure;
* generating sites: closure-rule systems and immediate-consequence fixed points;
* Lean carrier: `Obsmetrologia.Closure.RuleDynamics`;
* familiar comparison: adaptive rule update, meta-dynamics, learning as rule
  revision;
* danger: claiming a learning principle beyond the proved rule-carrier dynamics.

The governing sentence is:

> Rule dynamics is settling on the generator of closure, and first-order closure
> is recovered only after that generator settles.

## The Rule Carrier Moves

A second-order dynamic is an endomap on the existing rule-system carrier:

{docstring Obsmetrologia.ClosureRule.RuleDynamics}

Its orbit is meta-time iteration:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.orbit}

Checked:

```lean
namespace Obsmetrologia.ClosureRule

example (D : RuleDynamics) (seed : RuleSystem) :
    D.orbit seed 0 = seed :=
  RuleDynamics.orbit_zero D seed

example (D : RuleDynamics) (seed : RuleSystem) (n : Nat) :
    D.orbit seed (n + 1) = D.step (D.orbit seed n) :=
  RuleDynamics.orbit_succ D seed n

end Obsmetrologia.ClosureRule
```

This is the formal boundary. A fixed `RuleSystem` generates a closure operator.
A moving `RuleSystem` is the generator itself becoming matter.

## Residue At The Rule Level

The fixedness predicate is:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.FixedRules}

and rule residue is:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.RuleResidue}

The bridge is exact:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.ruleResidue_iff_not_fixed}

Checked:

```lean
namespace Obsmetrologia.ClosureRule

example (D : RuleDynamics) (S : RuleSystem) :
    D.RuleResidue S <-> ¬ D.FixedRules S :=
  RuleDynamics.ruleResidue_iff_not_fixed D S

end Obsmetrologia.ClosureRule
```

This proves only the accountable site: residue is non-fixedness of the rule
generator under its dynamic. It does not claim a metric, free-energy functional,
or semantic adequacy principle.

## Settled Generators Stay Settled

At meta-time `n`, the generator has settled when it is fixed:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.FixedAt}

After that point, the generator orbit is constant:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.fixedAt_orbit_add}

Checked:

```lean
namespace Obsmetrologia.ClosureRule

example (D : RuleDynamics) (seed : RuleSystem)
    (n : Nat) (h : D.FixedAt seed n) (k : Nat) :
    D.orbit seed (n + k) = D.orbit seed n :=
  RuleDynamics.fixedAt_orbit_add D seed n h k

end Obsmetrologia.ClosureRule
```

The rule dynamic can change the closure landscape. Fixedness says it has stopped
changing that landscape.

## First-Order Closure Is Recovered Afterward

Once a rule generator has settled, valuation closure is read under that settled
generator:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.settled_rules_closure_lfp}

Checked:

```lean
namespace Obsmetrologia.ClosureRule

example (D : RuleDynamics) (seed : RuleSystem)
    (n : Nat) (hmeta : D.FixedAt seed n) (v : Valuation)
    (hfix : SClosed (D.orbit seed n)
      (clS (D.orbit seed n) v)) :
    Tstep (D.orbit seed n) (clS (D.orbit seed n) v)
      = clS (D.orbit seed n) v
    /\ Valuation.leK v (clS (D.orbit seed n) v)
    /\ (forall x, Valuation.leK v x ->
      Tstep (D.orbit seed n) x = x ->
      Valuation.leK (clS (D.orbit seed n) v) x) :=
  RuleDynamics.settled_rules_closure_lfp
    D seed n hmeta v hfix

end Obsmetrologia.ClosureRule
```

This is the proved relation between the layers. Second-order dynamics chooses
which generator has settled; the existing closure-rule theorem then supplies the
least fixed point for valuations under that generator.

## One-Step Rewrite

The minimal example is replacement by a target rule system:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.rewriteTo}

It settles after one meta-step:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.rewriteTo_fixedAt_one}

and closure under the rewritten generator is again the immediate-consequence
least fixed point:

{docstring Obsmetrologia.ClosureRule.RuleDynamics.rewriteTo_closure_lfp}

Checked:

```lean
namespace Obsmetrologia.ClosureRule

example (target seed : RuleSystem) :
    (RuleDynamics.rewriteTo target).FixedAt seed 1 :=
  RuleDynamics.rewriteTo_fixedAt_one target seed

example (target seed : RuleSystem) (v : Valuation)
    (hfix : SClosed target (clS target v)) :
    Tstep target (clS target v) = clS target v
    /\ Valuation.leK v
        (clS target v)
    /\ (forall x, Valuation.leK v x ->
      Tstep target x = x ->
      Valuation.leK
        (clS target v) x) := by
  simpa [RuleDynamics.rewriteTo, RuleDynamics.orbit] using
    RuleDynamics.rewriteTo_closure_lfp target seed v hfix

end Obsmetrologia.ClosureRule
```

This example is small by design. It proves the carrier boundary without pretending
to formalize every adaptive or biological reading of rule revision.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Closure.RuleSystem` for fixed closure-rule systems.
2. Read `immediate_consequence_lfp` as the first-order theorem.
3. Read `RuleDynamics.orbit` as meta-time over rule generators.
4. Read `settled_rules_closure_lfp` as the bridge back to first-order closure.
5. Treat stronger learning claims as frontier until their update law and
   adequacy predicate are stated.

The next closure pages can use this carrier to state richer update laws, but the
present theorem proves only the second-order settling layer itself.
