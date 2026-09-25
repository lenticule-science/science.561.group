import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Cohomology.DifferentialBypass

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Cohomology
open Obsmetrologia.AssocSheaf
open Obsmetrologia.Valuation
open Obsmetrologia.Valuation.ModalFrame

/-!
A teaching chapter for the differential bypass as the proved mediator between
closure algebra, settling coalgebra, and the closure-ordinal regime.
-/

#doc (Manual) "Differential bypass" =>

# Differential Bypass

The differential bypass is the current checked machine for the phrase "route
the algebra/coalgebra gap through \(\kappa\)."  It is not yet a general theorem
about arbitrary initial algebras and final coalgebras.  In the present library
the lawful carrier is narrower and stronger: closure algebra, zero-increment
settling coalgebra, closure ordinal, and the \(H^1\) regime table.

The claim-site carried here is:

* claim-site: differential bypass as the mediator of the zero-increment
  algebra/coalgebra differential through \(\kappa\);
* phase: fibered and cohomological matter, after closure, regime, and
  settling \(H^1\) are already lawful;
* generating sites: settling endofunctor, closure-algebra fixed point,
  ordinal regime projection, and \(H^1\) vanishing/non-vanishing;
* downstream uses: holes, defect pages, contextuality pages, and
  phase diagnostics that need an obstruction carrier rather than a metaphor;
* Lean carriers: `Obsmetrologia.Cohomology.DifferentialBypass`,
  `Obsmetrologia.Cohomology.differential_bypass_sound`, and
  `Obsmetrologia.Cohomology.obstruction_valued_iff`;
* Blueprint/proof-tree nodes: the differential-bypass nodes in the sheaf and
  cohomology chapter; the contextuality identification remains red frontier;
* provenance: the local discussion of \(H^1\), held-\(\top\), contextuality,
  and holes as the gap between building from below and observing from above;
* familiar comparison: initial algebra/final coalgebra language appears here
  only as comparison.  The proved local words are closure algebra, settling
  coalgebra, and closure ordinal;
* reader closure: distinguish the proved bypass from the open stronger claim
  that every contextual obstruction is exactly this differential;
* frontier status: the bypass is proved; its universal contextuality consumer
  theorem is not.

The governing sentence is:

> A differential bypass is a closure-algebra certificate whose coalgebraic
> zero-increment target collapses at \(\mu/\nu\) agreement and whose obstruction
> side is routed through the closure ordinal's regime.

## The Two Sides

The zero-increment agreement predicate is:

{docstring Obsmetrologia.Cohomology.MuNuAgreement}

and the remaining gap is:

{docstring Obsmetrologia.Cohomology.MuNuDifferential}

The bypass certificate itself carries exactly the data that Lean can presently
justify:

{docstring Obsmetrologia.Cohomology.DifferentialBypass}

Checked:

```lean
example {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord}
    (B : DifferentialBypass M E d κ) :
    MuNuAgreement M E :=
  differential_bypass_agreement B
```

This is the point of the name.  The coalgebraic side is not ignored; it is
made computable by passing through the algebra fixed-point witness and the
ordinal regime route.

## When The Gap Collapses

The main collapse theorem is:

{docstring Obsmetrologia.Cohomology.differential_bypass_agreement}

If the gap is still nonzero, no bypass certificate exists:

{docstring Obsmetrologia.Cohomology.mu_nu_differential_no_bypass}

Checked:

```lean
example {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord}
    (h : MuNuDifferential M E) :
    ¬ DifferentialBypass M E d κ :=
  mu_nu_differential_no_bypass h
```

So "bypass" does not mean pretending the obstruction vanished.  It means that a
specific fixed-point certificate has collapsed the zero-increment differential.

## The Ordinal Route

The ordinal side is:

{docstring Obsmetrologia.Cohomology.differential_bypass_regime}

and the valued side of the regime table is:

{docstring Obsmetrologia.Cohomology.obstruction_valued_iff}

Checked:

```lean
example (r : ClosureRegime) :
    cohomologyVanishes r = false <->
      r = ClosureRegime.transfiniteBounded
        ∨ r = ClosureRegime.aperiodic :=
  obstruction_valued_iff r
```

This is the precise place where the \(H^1\) reading enters.  The bypass does
not assert that every obstruction has been classified.  It proves that the
non-vanishing side of the existing regime table is exactly the
transfinite-bounded or aperiodic side.

## The Package

The headline theorem is:

{docstring Obsmetrologia.Cohomology.differential_bypass_sound}

and in strict/Scott regimes the bypass transports the already proved gluing
theorem:

{docstring Obsmetrologia.Cohomology.differential_bypass_h1_vanishes}

Checked:

```lean
example {M : ModalFrame} {E : Valuation}
    {d : ClosureRegimeData} {κ : Ord}
    (B : DifferentialBypass M E d κ) :
    MuNuAgreement M E
      ∧ Ord.regimeOfOrd κ d.scottContinuous
          d.countableCofinality = classify d
      ∧ (cohomologyVanishes (classify d) = false <->
          classify d = ClosureRegime.transfiniteBounded
            ∨ classify d = ClosureRegime.aperiodic) :=
  differential_bypass_sound B
```

This is now the safe manual sentence: the differential bypass mediates the
closure-algebra and settling-coalgebra readings by a \(\kappa\)-route, and it
identifies the valued obstruction side of the regime table.  The universal
contextuality theorem remains a frontier node until a common carrier is built.
