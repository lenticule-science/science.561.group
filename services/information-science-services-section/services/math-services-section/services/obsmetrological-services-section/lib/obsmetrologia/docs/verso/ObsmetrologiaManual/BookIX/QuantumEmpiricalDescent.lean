import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.QuantumContextuality.EmpiricalModel
import ObsmetrologiaPhysicalScience.QuantumContextuality.HardyEmpiricalModel

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.QuantumContextuality

/-!
A teaching chapter for probabilistic empirical models as finite support descent.
-/

#doc (Manual) "Quantum empirical descent" =>

# Quantum Empirical Descent

The first quantum page teaches contextuality as support gluing failure. This
page teaches the probabilistic refinement: a context can carry a finite weighted
distribution, the marginals can be no-signaling, and the support of that
probabilistic model can still witness the gluing obstruction.

The claim-site carried here is:

* claim-site: probabilistic empirical models as finite weighted descent data
  whose support returns to the contextuality carrier;
* phase: relational physical phases after finite probability and sheaf gluing
  are lawful;
* generating sites: measurement scenario, support model, finite weighted
  distribution, marginal count, no-signaling, support projection, and local
  extension obstruction;
* downstream uses: PR-box diagnostics, Hardy middle-rung contextuality,
  comparison-atlas quantum entries, and frontier Bell/Fine promotion tasks;
* Lean declarations: `Obsmetrologia.QuantumContextuality.PModel`,
  `Obsmetrologia.QuantumContextuality.NoSignaling`,
  `Obsmetrologia.QuantumContextuality.globalDist_implies_noSignaling`,
  `Obsmetrologia.QuantumContextuality.prBoxP_noSignaling`,
  `Obsmetrologia.QuantumContextuality.hardyBoxP_support_logical_not_strong`;
* Blueprint/proof-tree nodes: contextuality has relational-physics Blueprint
  coverage; this page records the Lean probabilistic refinement as a phase page;
* provenance: Abramsky-Brandenburger empirical-model notes, probability-theory
  notes, PR-box notes, and Hardy-contextuality notes;
* familiar mathematical comparison: empirical model, marginal, no-signaling,
  PR box, Hardy paradox, and Bell/Fine obstruction;
* reader closure: distinguish weighted no-signaling from support-level
  contextuality and say which projection is being used;
* frontier status: real-valued probability, convex polytopes, Bell inequalities,
  Hilbert-space realization, and Fine's theorem are missing carriers.

The governing sentence is:

> No-signaling is a finite marginal law; contextuality is still a gluing law.

## Weighted Contexts

A probabilistic empirical model uses finite weighted distributions:

{docstring Obsmetrologia.QuantumContextuality.WDist}

The marginal carrier is:

{docstring Obsmetrologia.QuantumContextuality.singleMarginal}

The model carrier is {name Obsmetrologia.QuantumContextuality.PModel}`PModel`,
which assigns a weighted distribution to each context.

The no-signaling predicate is:

{docstring Obsmetrologia.QuantumContextuality.NoSignaling}

This is still finite and dependency-free: weights are `Nat` counts, not an
imported measure theory.

## Global Distribution Gives No-Signaling

The noncontextual probabilistic case is one global distribution read by every
context:

{docstring Obsmetrologia.QuantumContextuality.inducedModel}

and the no-signaling theorem is:

{docstring Obsmetrologia.QuantumContextuality.globalDist_implies_noSignaling}

Checked:

```lean
example (S : Scenario Nat) (G : WDist Nat Bool) :
    NoSignaling (inducedModel S G) :=
  globalDist_implies_noSignaling S G
```

The phase lesson is the same as ordinary sheaf restriction. One global table
restricts compatibly to every local context.

## PR Box Is No-Signaling But Support-Obstructed

The probabilistic PR carrier is:

{docstring Obsmetrologia.QuantumContextuality.prBoxP}

Its marginal law is checked:

{docstring Obsmetrologia.QuantumContextuality.prBoxP_noSignaling}

Checked:

```lean
example : NoSignaling prBoxP :=
  prBoxP_noSignaling
```

Book IX may therefore say the PR box is no-signaling at the finite weighted
level and strongly contextual at the support level. It may not claim Hilbert
space quantum realizability; the PR box is a super-quantum projection.

## Hardy As Probabilistic Middle Rung

Hardy's finite weighted model is:

{docstring Obsmetrologia.QuantumContextuality.hardyBoxP}

It is no-signaling:

{docstring Obsmetrologia.QuantumContextuality.hardyBoxP_noSignaling}

Its support has a global section, but one supported local section fails to
extend:

{docstring Obsmetrologia.QuantumContextuality.hardyBoxP_witness_not_extends}

The theorem packaging the middle rung is:

{docstring Obsmetrologia.QuantumContextuality.hardyBoxP_support_logical_not_strong}

Checked:

```lean
example : NoSignaling hardyBoxP :=
  hardyBoxP_noSignaling

example :
    Noncontextual (toSupport hardyBoxP)
      /\ LogicallyContextual (toSupport hardyBoxP)
      /\ Not (StronglyContextual (toSupport hardyBoxP)) :=
  hardyBoxP_support_logical_not_strong

example :
    Not (Extends (toSupport hardyBoxP)
      [(false, true), (true, true)] hardyWitness) :=
  hardyBoxP_witness_not_extends
```

This is why the manual must not collapse contextuality into one slogan. Strong,
logical, and probabilistic no-signaling claims live at different claim-sites.

## Promotion Boundary

A later theorem may promote this layer only by adding the missing carrier: real
probability values, convex geometry of empirical models, Bell inequalities,
operator or Hilbert-space realization, or a finite proof of Fine's theorem. Until
then, the lawful claim is the finite one: weighted local distributions can be
no-signaling, and their support can still fail local-to-global extension.
