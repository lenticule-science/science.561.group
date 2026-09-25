import ObsmetrologiaManual.DocSetup
import Obsmetrologia.KineticTheory.Gas.BoltzmannClosure
import Obsmetrologia.KineticTheory.Gas.MolecularChaosGluing
import Obsmetrologia.Thermodynamics.BoltzmannEntropy

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.KineticTheory.Gas
open Obsmetrologia.Thermodynamics

/-!
A teaching chapter for finite kinetic closure, molecular-chaos gluing, and
Boltzmann entropy as generated relational-physical witnesses.
-/

#doc (Manual) "Kinetic closure and entropy" =>

# Kinetic Closure, Gluing, And Entropy

The transport page teaches collision invariants as finite physical witnesses.
This page teaches the next gas-phase layer: collisions also generate closure
rules; molecular chaos is separated gluing of one-particle sections; connected
correlation is an obstruction; and Boltzmann's H-theorem is a finite
real-valued monotonicity theorem. None of this imports continuum kinetic theory.

The claim-site carried here is:

* claim-site: finite kinetic gas as closure, gluing, obstruction, and entropy;
* phase: relational physical phases after closure rules, sheaf/gluing language,
  and internal real logarithms are lawful;
* generating sites: finite collision lists, positive closure rules,
  least-fixed-point collision closure, two-particle joints, rank-one gluing,
  correlation minors, occupation configurations, and `logNat`;
* downstream uses: gas/liquid/plasma diagnostics, reaction free-energy pages,
  transport pages, physical entropy projections, and frontier PDE entries;
* Lean declarations: `collisionRule`, `collisionRuleSystem`,
  `collisionClosure`, `finite_boltzmann_collision_lfp`,
  `finite_collision_invariants_preserved`, `Joint`, `Factorizes`, `corr`,
  `Decorrelated`, `glue`, `epr_not_factorizes`, `cellH`, `configH`,
  `htheorem_pair`, `htheorem_evolution`;
* Blueprint/proof-tree nodes: kinetic-gas frontier and molecular-chaos gluing
  nodes are promoted here only as finite Lean witnesses; continuum Boltzmann and
  Lanford-style nodes remain red;
* provenance: finite discrete-velocity collision notes, Boltzmann closure notes,
  molecular-chaos-as-gluing notes, and Boltzmann entropy notes;
* familiar mathematical comparison: Boltzmann collision operator, collision
  invariants, Stosszahlansatz, connected two-point function, H-theorem, entropy
  production, and propagation of chaos;
* reader closure: ask whether the claim is conservation, closure, factorization,
  obstruction, or entropy monotonicity before importing continuum intuition;
* frontier status: Boltzmann PDEs, measure-valued distributions, Lanford's
  theorem, continuum entropy production, and hydrodynamic limits are missing
  carriers.

The governing sentence is:

> Kinetic theory enters here as finite closure and gluing, not as a continuum
> equation.

## Collision Rules As Closure

A collision can be read as a positive closure rule: when the incoming pair is
present, assert the outgoing pair.

{docstring Obsmetrologia.KineticTheory.Gas.collisionAntecedent}

{docstring Obsmetrologia.KineticTheory.Gas.collisionRule}

{docstring Obsmetrologia.KineticTheory.Gas.collisionRuleSystem}

{docstring Obsmetrologia.KineticTheory.Gas.collisionClosure}

The closure-theoretic theorem is the least-fixed-point statement inherited from
the finite rule-system engine:

{docstring Obsmetrologia.KineticTheory.Gas.finite_boltzmann_collision_lfp}

Checked:

```lean
example {V : Type}
    (pairCell : V -> V -> PredicationCell)
    (cs : List (Collision V)) (seed : Valuation)
    (hfix : Obsmetrologia.ClosureRule.SClosed
      (collisionRuleSystem pairCell cs)
      (collisionClosure pairCell cs seed)) :
    collisionTstep pairCell cs
        (collisionClosure pairCell cs seed)
      = collisionClosure pairCell cs seed
    /\ Valuation.leK seed
        (collisionClosure pairCell cs seed)
    /\ (forall x, Valuation.leK seed x ->
      collisionTstep pairCell cs x = x ->
      Valuation.leK
        (collisionClosure pairCell cs seed) x) :=
  finite_boltzmann_collision_lfp
    pairCell cs seed hfix
```

This is the lawful Boltzmann-closure claim. It is not a PDE collision integral.
It is a closure rule system with a least fixed point.

## Invariants Survive Closure Evolution

The transport page already teaches one-step and list-evolution invariants. This
page records the closure-system formulation: shared collision invariants are
preserved along finite collision evolutions.

{docstring Obsmetrologia.KineticTheory.Gas.finite_collision_invariants_preserved}

Checked:

```lean
example {V : Type} {cs : List (Collision V)}
    {w : V -> Int}
    (hcs : forall c, c ∈ cs -> c.Conserves w)
    {p q : Population V} (h : Evolves cs p q) :
    total w p = total w q :=
  finite_collision_invariants_preserved hcs h
```

The reader closure is that conservation and closure are separate claims. A rule
may close evidence; an invariant must still be named and proved.

## Molecular Chaos As Gluing

Molecular chaos is not a primitive probabilistic slogan here. It is a gluing
claim: a joint two-particle distribution factorizes into two one-particle
sections.

{docstring Obsmetrologia.KineticTheory.Gas.Joint}

{docstring Obsmetrologia.KineticTheory.Gas.Factorizes}

{docstring Obsmetrologia.KineticTheory.Gas.glue}

{docstring Obsmetrologia.KineticTheory.Gas.glue_factorizes}

Checked:

```lean
example {V : Type} (p q : V -> Int) :
    Factorizes (glue p q) :=
  glue_factorizes p q
```

This is exactly the Page Law in miniature. The physical word is admitted only
after the generating site supplies the carrier: here, a rank-one gluing of
sections.

## Correlation As Obstruction

The connected-correlation minor is the finite obstruction to molecular chaos.
Factorization forces all such minors to vanish; a maximally correlated joint
does not factorize.

{docstring Obsmetrologia.KineticTheory.Gas.corr}

{docstring Obsmetrologia.KineticTheory.Gas.Decorrelated}

{docstring Obsmetrologia.KineticTheory.Gas.factorizes_imp_decorrelated}

{docstring Obsmetrologia.KineticTheory.Gas.corr_swap_particles}

{docstring Obsmetrologia.KineticTheory.Gas.epr_not_factorizes}

Checked:

```lean
example {V : Type} (J : Joint V)
    (h : Factorizes J) :
    Decorrelated J :=
  factorizes_imp_decorrelated J h

example :
    ¬ Factorizes eprJoint :=
  epr_not_factorizes
```

The frontier line is sharp. The module proves obstruction and one correlated
counterexample. The converse reconstruction from all vanishing minors, and any
continuum propagation-of-chaos theorem, remain promotion tasks.

## Boltzmann H-Theorem

The entropy layer is also finite. Occupation numbers form a list; each cell
contributes the internal real logarithm of a factorial; and an equilibrating
exchange does not increase `H`.

{docstring Obsmetrologia.Thermodynamics.cellH}

{docstring Obsmetrologia.Thermodynamics.configH}

{docstring Obsmetrologia.Thermodynamics.Exchange}

{docstring Obsmetrologia.Thermodynamics.htheorem_pair}

{docstring Obsmetrologia.Thermodynamics.htheorem_evolution}

Checked:

```lean
example (a b : Nat) (hab : b ≤ a) :
    cellH a + cellH (b + 1)
      ≤ cellH (a + 1) + cellH b :=
  htheorem_pair a b hab

example {p q : List Nat} (h : Relaxes p q) :
    configH q ≤ configH p :=
  htheorem_evolution h
```

This is real-valued entropy, but still finite. The library has internal
logarithms for natural counts; it does not thereby get measure-theoretic
Boltzmann entropy or hydrodynamic limiting arguments.

## Reader Closure

When later pages say gas, kinetic, Boltzmann, molecular chaos, or entropy,
perform this closure:

* collision closure means a finite rule system and least fixed point;
* conservation means a named balanced weight;
* molecular chaos means factorized gluing of a joint;
* correlation means a finite minor obstruction;
* H-theorem means monotone `configH` along finite relaxation.

Anything beyond those carriers must be marked frontier and supplied by new Lean.
