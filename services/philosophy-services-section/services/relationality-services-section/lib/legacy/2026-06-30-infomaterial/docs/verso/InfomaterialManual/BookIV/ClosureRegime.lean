import InfomaterialManual.DocSetup
import Infomaterial.Closure.Regime

open Verso.Genre Manual InlineLean
open Infomaterial

/-!
A teaching chapter for the four closure regimes.
-/

#doc (Manual) "Closure regimes" =>

# Closure Regimes

Closure does not merely say whether a process stops. It stratifies relational
matter by how settling behaves.

The claim-site carried here is:

* claim-site: closure-regime classifier;
* phase: closure;
* generating sites: charge closure, closure ordinal, finite base, Scott behavior;
* Lean carrier: `Infomaterial.Closure.Regime`;
* familiar comparison: finite convergence, domain-theoretic Scott behavior,
  transfinite iteration, and aperiodicity;
* danger: treating the four regimes as labels rather than phase matter.

The governing sentence is:

> The closure ordinal stratifies settling into strict, Scott,
> transfinite-bounded, and aperiodic regimes.

## The Four Regimes

The regime object is {name Infomaterial.ClosureRegime}`ClosureRegime`: strict,
Scott, transfinite-bounded, and aperiodic.

The decidable data used by the classifier is:

{docstring Infomaterial.ClosureRegimeData}

The classifier reads those flags in the generated order:

{docstring Infomaterial.classify}

This is not a taxonomy pasted on the side. It is a measurement of the closure
phase: finite base first, then Scott-continuity, then countable cofinality, then
aperiodic failure of the earlier controls.

## The Dichotomy

The classification lemmas give the four cases:

{docstring Infomaterial.classify_strict}

{docstring Infomaterial.classify_scott}

{docstring Infomaterial.classify_transfiniteBounded}

{docstring Infomaterial.classify_aperiodic}

and the bundled theorem is:

{docstring Infomaterial.four_regime_dichotomy}

Checked:

```lean
example (d : ClosureRegimeData) :
    (classify d = ClosureRegime.strict
      \/ classify d = ClosureRegime.scott
      \/ classify d = ClosureRegime.transfiniteBounded
      \/ classify d = ClosureRegime.aperiodic)
    /\ (classify d = ClosureRegime.strict
        <-> d.finiteBase = true)
    /\ (classify d = ClosureRegime.scott
        <-> (d.scottContinuous = true
             /\ d.finiteBase = false))
    /\ (classify d = ClosureRegime.transfiniteBounded
        <-> (d.scottContinuous = false
             /\ d.countableCofinality = true))
    /\ (classify d = ClosureRegime.aperiodic
        <-> (d.scottContinuous = false
             /\ d.countableCofinality = false)) :=
  four_regime_dichotomy d
```

This is the closure-phase version of "four" as a real partition. The regimes are
jointly exhaustive and each one has its own generated condition.

## The Regime Is Another Four-Corner Reading

The regimes are transported to the articulation corner object:

{docstring Infomaterial.ClosureRegime.toCorner}

{docstring Infomaterial.ClosureRegime.ofCorner}

The round-trip theorem is:

{docstring Infomaterial.regime_is_four_corner}

Checked:

```lean
example :
    (forall r : ClosureRegime,
        ClosureRegime.ofCorner
          (ClosureRegime.toCorner r) = r)
    /\ (forall c : Articulating.Corner,
        ClosureRegime.toCorner
          (ClosureRegime.ofCorner c) = c) :=
  regime_is_four_corner
```

This is not license to identify every four-point object with every other
four-point object. It is a specific transport: strict, Scott,
transfinite-bounded, and aperiodic are pinned to specific corners by explicit
maps.

## The Spine Is Strict

The finite charge spine supplies canonical regime data:

{docstring Infomaterial.spineData}

and classifies as strict:

{docstring Infomaterial.spine_is_strict}

The operational content is settling by step three:

{docstring Infomaterial.spine_settles_by_three}

Checked:

```lean
example : classify spineData = ClosureRegime.strict :=
  spine_is_strict

example (f : Charge -> Charge)
    (hf : forall a, Charge.KLE a (f a))
    (x : Charge) :
    Charge.SettlesBy f x 3 :=
  spine_settles_by_three f hf x
```

This is why the finite charge lattice is not merely an example. It is the strict
base case of the regime story. Later non-Scott and aperiodic phenomena are read
against this strict spine.

## Cohomology Appears As Regime-Dependent Projection

The cohomology table belongs here because gluing obstruction depends on regime:

{docstring Infomaterial.cohomologyVanishes}

{docstring Infomaterial.cohomologyVanishes_iff}

The strict spine has vanishing cohomology:

{docstring Infomaterial.spine_cohomology_vanishes}

Checked:

```lean
example :
    cohomologyVanishes (classify spineData) = true :=
  spine_cohomology_vanishes
```

The familiar phrase "H1 vanishes" is therefore not free-standing. It is a projection
of where the closure process lands. Strict and Scott regimes have vanishing
cohomological obstruction; transfinite-bounded and aperiodic regimes are where
the obstruction becomes live.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Infomaterial.Closure.Operator` for closure operators on charges.
2. Read `Infomaterial.Closure.Ordinal.Finite` for the strict finite settling bound.
3. Read `Infomaterial.Closure.Regime` for the four-way classifier.
4. Read `Infomaterial.Closure.Scott` for the Scott-continuous side of the split.
5. Read cohomological chapters only after the regime dependency is visible.

The next closure chapter is Scott-continuity: why one of these regimes is the
omega-limit preservation projection.
