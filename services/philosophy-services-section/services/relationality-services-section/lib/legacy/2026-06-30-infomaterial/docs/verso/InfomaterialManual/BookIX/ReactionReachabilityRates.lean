import InfomaterialManual.DocSetup
import Infomaterial.Relational.Reaction.Reachability
import Infomaterial.Relational.Reaction.MassActionRate
import Infomaterial.Relational.Reaction.DetailedBalance

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Reaction

/-!
A teaching chapter for reaction reachability, conservation, and rates.
-/

#doc (Manual) "Reaction reachability and rates" =>

# Reaction Reachability And Rates

Reaction networks have already appeared as Datalog support projections and
thermodynamic diagnostics. This page carries the bridge between those readings:
finite count-state reachability, balanced mass conservation, support
coverability, internal-real mass-action rates, and detailed-balance fixedness.

The claim-site carried here is:

* claim-site: reaction systems as finite count reachability plus generated rate
  and equilibrium witnesses;
* phase: relational physical phases after support closure, finite probability,
  and generated calculus are lawful;
* generating sites: count states, reaction firing, balanced stoichiometry,
  reachability closure, support coverability, internal reals, and Euler settling;
* downstream uses: Datalog support projections, catabolic Lyapunov descent, entropy
  diagnostics, detailed balance, chemical-frontier entries, and comparison-atlas
  repair paths;
* Lean declarations: `Infomaterial.Relational.Reaction.Network`,
  `Infomaterial.Relational.Reaction.Reach`,
  `Infomaterial.Relational.Reaction.reach_conserves_mass`,
  `Infomaterial.Relational.Reaction.Coverable`,
  `Infomaterial.Relational.Reaction.propensity`,
  `Infomaterial.Relational.Reaction.equilibrium_is_fixed`;
* Blueprint/proof-tree nodes: no dedicated reaction Blueprint node is promoted
  here; the phase page is justified by current Lean declarations;
* provenance: reaction-network, Datalog support projection, mass-action, entropy, and
  detailed-balance notes;
* familiar mathematical comparison: chemical reaction network, reachability,
  mass conservation, mass-action kinetics, Euler step, and detailed balance;
* reader closure: distinguish count firing from support projection and rate
  dynamics before using chemical language;
* frontier status: stochastic chemical master equations, continuum limits,
  ODE existence theory, thermodynamic integration, and detailed balance for
  measured real rates remain missing carriers.

The governing sentence is:

> A reaction theorem must say whether it lives on counts, support, rates, or
> equilibrium.

## Count Firing And Conservation

The finite count-state carrier is:

{docstring Infomaterial.Relational.Reaction.State}

The reaction carrier is:

{docstring Infomaterial.Relational.Reaction.Reaction}

and firing is only mass-conserving under a balanced reaction:

{docstring Infomaterial.Relational.Reaction.mass_conserved}

A network step inherits the same condition:

{docstring Infomaterial.Relational.Reaction.step_conserves_mass}

Checked:

```lean
example {Species : Type} (N : Network Species)
    (hbal : forall r, r ∈ N.reactions ->
      Balanced N.univ r)
    {s s' : State Species} (h : Step N s s') :
    total N.univ s' = total N.univ s :=
  step_conserves_mass N hbal h
```

The condition matters. The page must not say "reaction networks conserve mass"
unless balanced stoichiometry is part of the claim-site.

## Reachability And Coverability

Reachability is the transitive closure of finite network steps:

{docstring Infomaterial.Relational.Reaction.Reach}

Balanced reachability preserves total count:

{docstring Infomaterial.Relational.Reaction.reach_conserves_mass}

Support coverability records when a target is dominated by a reachable state:

{docstring Infomaterial.Relational.Reaction.Coverable}

{docstring Infomaterial.Relational.Reaction.reach_imp_coverable}

Checked:

```lean
example {Species : Type} {N : Network Species}
    (hbal : forall r, r ∈ N.reactions ->
      Balanced N.univ r)
    {s s' : State Species} (h : Reach N s s') :
    total N.univ s' = total N.univ s :=
  reach_conserves_mass hbal h

example {Species : Type}
    (N : Network Species) (s : State Species) :
    Coverable N s s :=
  coverable_self N s
```

This is the lawful bridge to the earlier Datalog page. Support can over-approximate
count firing; reachability and coverability name the count-level carrier.

## Mass-Action Rates

Rates enter only after generated internal reals are available:

{docstring Infomaterial.Relational.Reaction.Conc}

The propensity carrier is:

{docstring Infomaterial.Relational.Reaction.propensity}

Zero rate gives zero propensity, and nonnegative data give nonnegative
propensity:

{docstring Infomaterial.Relational.Reaction.propensity_zero_of_zero_rate}

{docstring Infomaterial.Relational.Reaction.propensity_nonneg}

Checked:

```lean
example {Species : Type} (univ : List Species)
    (r : Reaction Species) (c : Conc Species) :
    propensity univ Real.Internal.RReal.zero r c
      = Real.Internal.RReal.zero :=
  propensity_zero_of_zero_rate univ r c
```

The familiar mass-action word is now lawful as an internal-real rate expression.
It still does not supply analytic ODE theory.

## Equilibrium And Detailed Balance

An Euler step is fixed at equilibrium:

{docstring Infomaterial.Relational.Reaction.eulerStep}

{docstring Infomaterial.Relational.Reaction.IsEquilibrium}

{docstring Infomaterial.Relational.Reaction.equilibrium_is_fixed}

Detailed balance is a stronger reversible-carrier condition:

{docstring Infomaterial.Relational.Reaction.DetailedBalance}

{docstring Infomaterial.Relational.Reaction.detailedBalance_is_equilibrium}

Checked:

```lean
example {Species : Type}
    (V : Conc Species -> Species -> Real.Internal.RReal)
    (dt : Real.Internal.RReal) {c : Conc Species}
    (h : IsEquilibrium V c) :
    eulerStep V dt c = c :=
  equilibrium_is_fixed V dt h
```

The frontier boundary is exact: this proves fixedness for the generated Euler
carrier. It does not prove convergence of continuous flows or stochastic
thermodynamic limits.

## Reader Closure

When a later page says "reaction", ask which layer it means:

* count firing and reachability;
* support and Datalog support projection;
* Lyapunov or entropy diagnostics;
* internal-real rate expression;
* equilibrium or detailed balance.

Confusing those layers is a phase error, even when the familiar chemical
language is the same.
