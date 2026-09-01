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
* generating sites: charge, knowledge order, joins, fixed points;
* Lean carrier: `Obsmetrologia.Language.Settling` and `Obsmetrologia.Closure.Operator`;
* familiar comparison: closure operators, Knaster-Tarski, KZ monads;
* danger: treating order theory as prior background instead of generated
  closure behavior.

The governing sentence is:

> A closure operator is settling's operational engine: it adds knowledge,
> preserves order, and stops at the least fixed point above the seed.

## Order Is Generated Here

The knowledge order becomes a `Prop` relation in settling:

{docstring Obsmetrologia.Charge.KLE}

It is reflexive, transitive, and antisymmetric:

{docstring Obsmetrologia.Charge.kle_refl}

{docstring Obsmetrologia.Charge.kle_trans}

{docstring Obsmetrologia.Charge.kle_antisymm}

Checked:

```lean
example (a : Charge) : Charge.KLE a a :=
  Charge.kle_refl a

example (a b : Charge)
    (hab : Charge.KLE a b)
    (hba : Charge.KLE b a) :
    a = b :=
  Charge.kle_antisymm a b hab hba
```

This is where order theory appears as generated mathematics. The charge object
already had a knowledge comparison as data; settling turns it into the order on
which closure can move.

## Joining Knowledge

Knowledge join is the least upper bound:

{docstring Obsmetrologia.Charge.joinK_le}

Checked:

```lean
example (a b : Charge) :
    Charge.KLE a (Charge.joinK a b) :=
  Charge.le_joinK_left a b

example (a b c : Charge)
    (ha : Charge.KLE a c)
    (hb : Charge.KLE b c) :
    Charge.KLE (Charge.joinK a b) c :=
  Charge.joinK_le a b c ha hb
```

The closure phase therefore does not merely "use" a lattice. It shows why the
knowledge lattice is the right carrier for settling: joining knowledge is the
operation that lets new evidence accumulate without forgetting old evidence.

## Closure And Fixed Point

The closure object is {name Obsmetrologia.Charge.Closure}`Charge.Closure`: a charge
endomap with inflation, monotonicity, and idempotence.

The fixed-point theorem is:

{docstring Obsmetrologia.Charge.Closure.op_fixed}

and the least-fixed-point theorem is:

{docstring Obsmetrologia.Charge.Closure.op_least}

The canonical example closes toward a knowledge bound:

{docstring Obsmetrologia.Charge.joinClosure}

Settling is applying the closure to a seed:

{docstring Obsmetrologia.Charge.settle}

{docstring Obsmetrologia.Charge.settle_fixed}

{docstring Obsmetrologia.Charge.settle_least}

Checked:

```lean
example (c : Charge.Closure) (seed : Charge) :
    c.op (Charge.settle c seed) = Charge.settle c seed :=
  Charge.settle_fixed c seed

example (k : Charge) :
    Charge.settle (Charge.joinClosure k) Charge.kBot = k :=
  Charge.settle_kBot k
```

This is the closure-phase form of Knaster-Tarski: a settled value is fixed, and
it is least among the fixed points above the seed.

## The Settling Step

The closure monad page names the operational step:

{docstring Obsmetrologia.Charge.settleStep}

The step is inflationary:

{docstring Obsmetrologia.Charge.settleStep_infl}

and, over the finite charge carrier, it settles by step three:

{docstring Obsmetrologia.Charge.settleStep_settles}

Checked:

```lean
example (c : Charge.Closure) (u v : Charge) :
    Charge.iter (Charge.settleStep c u) 3 v
      = Charge.iter (Charge.settleStep c u) 4 v :=
  Charge.settleStep_settles c u v
```

The step reads: saturate under the closure, then merge the new increment by
knowledge join. This is why the closure phase is not passive. It is the dynamics
of adding consequences until the process stops changing.

## KZ Reduction

The KZ and monad language is a projection of closure behavior on a thin order.

{docstring Obsmetrologia.Charge.kz_iff_strict}

The unit is inflation:

{docstring Obsmetrologia.Charge.unit}

and multiplication is nested-closure collapse:

{docstring Obsmetrologia.Charge.mult}

Checked:

```lean
example (c : Charge.Closure) (v : Charge) :
    Charge.KLE v (c.op v) :=
  Charge.unit c v

example (c : Charge.Closure) (v : Charge) :
    c.op (c.op v) = c.op v :=
  Charge.mult c v
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
example (c : Charge.Closure) (v : Valuation) :
    Valuation.liftOp c.op v = fun phi => c.op (v phi) :=
  rfl

example (c : Charge.Closure) :
    Valuation.CNaturalFamily :=
  Valuation.pointwiseFamily c
```

This is the local bridge from Book IV to Book VI. The closure operator first
lives over charges; then it lifts pointwise to the valuation fiber. The reader
should not jump straight to fiber algebra before seeing this transport.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Obsmetrologia.Language.Positing.Charge` for the charge carrier and joins.
2. Read `Obsmetrologia.Language.Settling` for `Charge.KLE`, `Charge.Closure`, and
   `Charge.settle`.
3. Read `Obsmetrologia.Closure.Monad` for `settleStep`, unit, and multiplication.
4. Read `Obsmetrologia.Closure.Operator` for the pointwise valuation lift.
5. Then read closure regimes and Scott-continuity.

The next closure chapter is the regime classifier: what kind of closure matter
the settling process has produced.
