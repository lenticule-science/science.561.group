import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Calculus.Optimization.FixedPoint
import Obsmetrologia.Calculus.Real.Logarithm
import Obsmetrologia.Calculus.Real.Internal
import Obsmetrologia.Calculus.Algebra.Interfaces

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for the calculus neighborhood as generated projection.
-/

#doc (Manual) "Generated calculus" =>

# Generated Calculus

Calculus is not a new foundation in this manual. It appears when closure,
order, value, algebraic projection, and constructive completion have already become
lawful. This page is a phase map for the large `Obsmetrologia.Calculus`
neighborhood.

The claim-site carried here is:

* claim-site: generated calculus as recovered order/value/completion machinery;
* phase: closure phase, with later value and physical uses;
* generating sites: closure operators, value categories, finite algebraic
  projections, constructive rationals and reals, and fixed-point settling;
* downstream uses: optimization, stochastic intervals, physical free energies,
  spacetime operators, dense-matter bounds, reaction rates, and entropy;
* Lean carriers: `Obsmetrologia.Calculus.Order`,
  `Obsmetrologia.Calculus.Algebra`, `Obsmetrologia.Calculus.Real`,
  `Obsmetrologia.Calculus.Probability`,
  `Obsmetrologia.Calculus.LinearAlgebra`, and
  `Obsmetrologia.Calculus.Optimization`;
* Blueprint/proof-tree nodes: scattered Blueprint coverage for finite gauge,
  dense matter, action, and physical diagnostics depends on these carriers;
* provenance: older received-math notes on optimization, real completion,
  algebra, probability, and linear algebra are refit only through Lean claims;
* familiar comparison: order theory, algebra, real analysis, probability,
  optimization, and finite linear algebra;
* reader closure: ask which generated carrier makes each analytic word lawful;
* frontier status: full measure theory, differential calculus, PDEs,
  functional analysis, smooth manifolds, and Hilbert spaces remain missing
  carriers.

The governing sentence is:

> Calculus is admitted as settled behavior, not as an ambient substrate.

## Optimization Is Settling

The fixed-point optimization carrier proves the received-math specialization directly:

{docstring Obsmetrologia.Optimization.FixedPoint.settling_is_optimization}

Checked:

```lean
example (V : Positing.Value.ValueCategory)
    (T : Positing.Value.VClosure V)
    (seed : V.carrier) :
    (Optimization.FixedPoint.ofSettling V T).optimum seed
      = T.settle seed :=
  Optimization.FixedPoint.ofSettling_optimum V T seed
```

The word "optimum" becomes lawful because improvement is a monotone,
inflationary, idempotent closure. No separate optimization primitive is added.

## Internal Reals As Scott Completion

Constructive reals enter as a completion claim:

{docstring Obsmetrologia.Real.Internal.RReal.reals_are_the_scott_continuous_settling_completion}

and they close the value-settling hub:

{docstring Obsmetrologia.Real.Internal.RReal.reals_close_the_value_settling_hub}

A small logarithmic witness is:

{docstring Obsmetrologia.Real.Internal.logNat_two_eq}

Checked:

```lean
example :
    Real.Internal.logNat 2 2 (by decide) (by decide)
      = Real.Internal.RReal.ofRat 1 :=
  Real.Internal.logNat_two_eq
```

This is not an import of classical real analysis. It is the manual point where
the rational approximation process reaches a Scott-continuous completion and
then acts as a value carrier.

## Algebraic Projections

Algebra appears as a projection of generated order, residuation, and gauge:

{docstring Obsmetrologia.Algebra.meetMonoid}

{docstring Obsmetrologia.Algebra.fuseMonoid}

{docstring Obsmetrologia.Algebra.kleinFour_right_inv}

Checked:

```lean
example (g : Positing.Gauge.K4) :
    Positing.Gauge.K4.mul g g =
      Positing.Gauge.K4.id :=
  Algebra.kleinFour_right_inv g
```

The algebraic names are useful because laws have been carried by Lean. They are
not license to restart the book from algebra as first principle.

## Reader Closure

When a later page says "rate", "entropy", "field", "operator", "probability",
"rank", or "energy", return here and ask which calculus carrier is in force. If
the carrier is absent, the claim is frontier. If the carrier is present, the
ordinary mathematical word is a projection of the generated phase that produced it.
