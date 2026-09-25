import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Closure.Operator

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for settling as closure operator before regime and
Scott-continuity.
-/

#doc (Manual) "Closure operator" =>

# Closure Operator

Settling is the point where value becomes order and order becomes fixed-point
motion.

The claim-site carried here is:

* claim-site: closure operator and settling step;
* phase: closure;
* generating sites: reading, knowledge order, joins, fixed points;
* Lean carrier: `Obsmetrologia.Language.Settling` and `Obsmetrologia.Closure.Operator`;
* familiar comparison: closure operators, Knaster-Tarski, KZ monads;
* danger: treating order theory as prior background instead of generated
  closure behavior.

The governing sentence is:

> A closure operator is settling's operational engine: it adds knowledge,
> preserves order, and stops at the least fixed point above the seed.

## Order Is Generated Here

The knowledge order becomes a `Prop` relation in settling:

{docstring Obsmetrologia.Reading.KLE}

It is reflexive, transitive, and antisymmetric:

{docstring Obsmetrologia.Reading.kle_refl}

{docstring Obsmetrologia.Reading.kle_trans}

{docstring Obsmetrologia.Reading.kle_antisymm}

Checked:

```lean
example (a : Reading) : Reading.KLE a a :=
  Reading.kle_refl a

example (a b : Reading)
    (hab : Reading.KLE a b)
    (hba : Reading.KLE b a) :
    a = b :=
  Reading.kle_antisymm a b hab hba
```

This is where order theory appears as generated mathematics. The reading object
already had a knowledge comparison as data; settling turns it into the order on
which closure can move.

## Joining Knowledge

Knowledge join is the least upper bound:

{docstring Obsmetrologia.Reading.joinK_le}

Checked:

```lean
example (a b : Reading) :
    Reading.KLE a (Reading.joinK a b) :=
  Reading.le_joinK_left a b

example (a b c : Reading)
    (ha : Reading.KLE a c)
    (hb : Reading.KLE b c) :
    Reading.KLE (Reading.joinK a b) c :=
  Reading.joinK_le a b c ha hb
```

The closure phase therefore does not merely "use" a lattice. It shows why the
knowledge lattice is the right carrier for settling: joining knowledge is the
operation that lets new evidence accumulate without forgetting old evidence.

## Closure And Fixed Point

The closure object is {name Obsmetrologia.Reading.Closure}`Reading.Closure`: a reading
endomap with inflation, monotonicity, and idempotence.

The fixed-point theorem is:

{docstring Obsmetrologia.Reading.Closure.op_fixed}

and the least-fixed-point theorem is:

{docstring Obsmetrologia.Reading.Closure.op_least}

The canonical example closes toward a knowledge bound:

{docstring Obsmetrologia.Reading.joinClosure}

Settling is applying the closure to a seed:

{docstring Obsmetrologia.Reading.settle}

{docstring Obsmetrologia.Reading.settle_fixed}

{docstring Obsmetrologia.Reading.settle_least}

Checked:

```lean
example (c : Reading.Closure) (seed : Reading) :
    c.op (Reading.settle c seed) = Reading.settle c seed :=
  Reading.settle_fixed c seed

example (k : Reading) :
    Reading.settle (Reading.joinClosure k) Reading.kBot = k :=
  Reading.settle_kBot k
```

This is the closure-phase form of Knaster-Tarski: a settled value is fixed, and
it is least among the fixed points above the seed.

## The Settling Step

The closure monad page names the operational step:

{docstring Obsmetrologia.Reading.settleStep}

The step is inflationary:

{docstring Obsmetrologia.Reading.settleStep_infl}

and, over the finite reading carrier, it settles by step three:

{docstring Obsmetrologia.Reading.settleStep_settles}

Checked:

```lean
example (c : Reading.Closure) (u v : Reading) :
    Reading.iter (Reading.settleStep c u) 3 v
      = Reading.iter (Reading.settleStep c u) 4 v :=
  Reading.settleStep_settles c u v
```

The step reads: saturate under the closure, then merge the new increment by
knowledge join. This is why the closure phase is not passive. It is the dynamics
of adding consequences until the process stops changing.

## KZ Reduction

The KZ and monad language is a projection of closure behavior on a thin order.

{docstring Obsmetrologia.Reading.kz_iff_strict}

The unit is inflation:

{docstring Obsmetrologia.Reading.unit}

and multiplication is nested-closure collapse:

{docstring Obsmetrologia.Reading.mult}

Checked:

```lean
example (c : Reading.Closure) (v : Reading) :
    Reading.KLE v (c.op v) :=
  Reading.unit c v

example (c : Reading.Closure) (v : Reading) :
    c.op (c.op v) = c.op v :=
  Reading.mult c v
```

In a poset, lax idempotence collapses to strict idempotence by antisymmetry. The
full KZ diamond becomes visible later where the regime is not strict.

## Pointwise Lift To Valuations

The bridge to fibered matter is the pointwise lift:

{docstring Obsmetrologia.Valuation.liftOp}

It preserves the three closure laws:

{docstring Obsmetrologia.Valuation.liftOp_infl}

{docstring Obsmetrologia.Valuation.liftOp_mono}

{docstring Obsmetrologia.Valuation.liftOp_idem}

and packages the pointwise family:

{docstring Obsmetrologia.Valuation.CNaturalFamily}

{docstring Obsmetrologia.Valuation.pointwiseFamily}

Checked:

```lean
example (c : Reading.Closure) (v : Valuation) :
    Valuation.liftOp c.op v = fun phi => c.op (v phi) :=
  rfl

example (c : Reading.Closure) :
    Valuation.CNaturalFamily :=
  Valuation.pointwiseFamily c
```

This is the local bridge from Book IV to Book VI. The closure operator first
lives over readings; then it lifts pointwise to the valuation fiber. The reader
should not jump straight to fiber algebra before seeing this transport.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Language.Positing.Reading` for the reading carrier and joins.
2. Read `Obsmetrologia.Language.Settling` for `Reading.KLE`, `Reading.Closure`, and
   `Reading.settle`.
3. Read `Obsmetrologia.Closure.Monad` for `settleStep`, unit, and multiplication.
4. Read `Obsmetrologia.Closure.Operator` for the pointwise valuation lift.
5. Then read closure regimes and Scott-continuity.

The next closure chapter is the regime classifier: what kind of closure matter
the settling process has produced.
