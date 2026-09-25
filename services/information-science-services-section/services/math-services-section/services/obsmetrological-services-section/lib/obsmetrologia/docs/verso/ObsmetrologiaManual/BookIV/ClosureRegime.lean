import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Closure.Regime

open Verso.Genre Manual InlineLean
open Obsmetrologia

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
* generating sites: reading closure, closure ordinal, finite base, Scott behavior;
* Lean carrier: `Obsmetrologia.Closure.Regime`;
* familiar comparison: finite convergence, domain-theoretic Scott behavior,
  transfinite iteration, and aperiodicity;
* danger: treating the four regimes as labels rather than phase matter.

The governing sentence is:

> The closure ordinal stratifies settling into strict, Scott,
> transfinite-bounded, and aperiodic regimes.

## The Four Regimes

The regime object is {name Obsmetrologia.ClosureRegime}`ClosureRegime`: strict,
Scott, transfinite-bounded, and aperiodic.

The decidable data used by the classifier is:

{docstring Obsmetrologia.ClosureRegimeData}

The classifier reads those flags in the generated order:

{docstring Obsmetrologia.classify}

This is not a taxonomy pasted on the side. It is a measurement of the closure
phase: finite base first, then Scott-continuity, then countable cofinality, then
aperiodic failure of the earlier controls.

## The Dichotomy

The classification lemmas give the four cases:

{docstring Obsmetrologia.classify_strict}

{docstring Obsmetrologia.classify_scott}

{docstring Obsmetrologia.classify_transfiniteBounded}

{docstring Obsmetrologia.classify_aperiodic}

and the bundled theorem is:

{docstring Obsmetrologia.four_regime_dichotomy}

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

{docstring Obsmetrologia.ClosureRegime.toCorner}

{docstring Obsmetrologia.ClosureRegime.ofCorner}

The round-trip theorem is:

{docstring Obsmetrologia.regime_is_four_corner}

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

The finite reading spine supplies canonical regime data:

{docstring Obsmetrologia.spineData}

and classifies as strict:

{docstring Obsmetrologia.spine_is_strict}

The operational content is settling by step three:

{docstring Obsmetrologia.spine_settles_by_three}

Checked:

```lean
example : classify spineData = ClosureRegime.strict :=
  spine_is_strict

example (f : Reading -> Reading)
    (hf : forall a, Reading.KLE a (f a))
    (x : Reading) :
    Reading.SettlesBy f x 3 :=
  spine_settles_by_three f hf x
```

This is why the finite reading lattice is not merely an example. It is the strict
base case of the regime story. Later non-Scott and aperiodic phenomena are read
against this strict spine.

## Cohomology Appears As Regime-Dependent Projection

The cohomology table belongs here because gluing obstruction depends on regime:

{docstring Obsmetrologia.cohomologyVanishes}

{docstring Obsmetrologia.cohomologyVanishes_iff}

The strict spine has vanishing cohomology:

{docstring Obsmetrologia.spine_cohomology_vanishes}

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

1. Read `Obsmetrologia.Closure.Operator` for closure operators on readings.
2. Read `Obsmetrologia.Closure.Ordinal.Finite` for the strict finite settling bound.
3. Read `Obsmetrologia.Closure.Regime` for the four-way classifier.
4. Read `Obsmetrologia.Closure.Scott` for the Scott-continuous side of the split.
5. Read cohomological chapters only after the regime dependency is visible.

The next closure chapter is Scott-continuity: why one of these regimes is the
omega-limit preservation projection.
