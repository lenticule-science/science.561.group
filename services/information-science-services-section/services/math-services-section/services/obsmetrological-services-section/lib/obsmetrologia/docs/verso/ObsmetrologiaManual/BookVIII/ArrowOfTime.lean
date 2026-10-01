import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.CausalSets.Causal.ArrowOfTime

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.CausalSets.Causal.ArrowOfTime

/-!
A teaching chapter for the arrow of time as causal no-return with ordinal
staging.
-/

#doc (Manual) "Arrow of time" =>

# Arrow Of Time

Time appears here after causal settling. The direct-link seed has already closed
to reachability; only then can the book say that one event is in another event's
future.

The claim-site carried here is:

* claim-site: the arrow of time as settled causal no-return with optional
  ordinal staging;
* phase: relational spacetime;
* generating sites: causal settling, directed reachability, acyclicity, ordinal
  closure flow;
* Lean carrier: `Obsmetrologia.CausalSets.Causal.ArrowOfTime`;
* familiar comparisons: causal orientation, temporal precedence, ordinal clock,
  irreversibility;
* danger: importing thermodynamic entropy or continuum time before the causal
  and ordinal carriers exist.

The governing sentence is:

> The arrow of time is causal no-return, and an ordinal clock is extra structure
> that must prove successor advance.

## Future And Past

The future relation is settled reachability:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.Future}

The past relation is the same reachability read in the opposite direction:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.Past}

Future reachability composes:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.future_trans}

It has no self-step:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.future_irrefl}

and no reverse:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.future_asymm}

Checked:

```lean
example {E : Type} (C : CausalSet E) {a b : E}
    (hab : Future C a b) :
    Not (Past C a b) :=
  future_not_past C hab
```

This is the first formal arrow. It does not say that entropy increases, that a
continuum parameter has been recovered, or that every temporal carrier already
has a global clock. It says that causal settling has generated an asymmetric
future relation.

## Ordinal Clocks

The ordinal-staged carrier is:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.OrdinalArrowOfTime}

It packages a directed relation, an `Ord` stage map, a proof that every step
advances at least to the successor stage, and a no-return law. From those fields,
Lean exposes the two local arrow laws:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.OrdinalArrowOfTime.irrefl}

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.OrdinalArrowOfTime.asymm}

Checked:

```lean
example {E : Type} (T : OrdinalArrowOfTime E) (a : E) :
    Not (T.before a a) :=
  OrdinalArrowOfTime.irrefl T a
```

This is where "time" becomes ordinal-shaped. The stage values are not natural
numbers in disguise. They live in the project's `Ord` carrier, so successor and
limit stages can be expressed by the same vocabulary as transfinite closure
flow.

## Causal Ordinal Arrow

A causal set becomes an ordinal arrow when a stage map is supplied and causal
reachability advances that stage:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.causalOrdinalArrow}

The relation in the attached arrow is exactly causal reachability:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.causalOrdinalArrow_before}

and the no-return law still comes from causal settling:

{docstring Obsmetrologia.CausalSets.Causal.ArrowOfTime.causalOrdinalArrow_no_return}

Checked:

```lean
example {E : Type} (C : CausalSet E) (stage : E -> Ord)
    (hstage :
      forall {a b : E},
        C.reaches a b ->
          Ord.Le (Ord.succ (stage a)) (stage b))
    {a b : E}
    (hab : (causalOrdinalArrow C stage hstage).before a b)
    (hba : (causalOrdinalArrow C stage hstage).before b a) :
    False :=
  causalOrdinalArrow_no_return C stage hstage hab hba
```

The supplied `hstage` is the important boundary. A page may not claim that a
causal set has an ordinal clock merely because it has a causal order. It must
construct the stage map and prove successor advance, or leave the claim in the
Blueprint as an open ordinal-clock obligation.

## Repair Path

If this page fails for a reader, use this route:

1. Return to `CausalSet.reaches` and its transitive/asymmetric laws.
2. Read `Ord`, `Ord.Le`, successor stages, and limit stages.
3. Read transfinite closure flow for `OrdFlow` and limit-continuity language.
4. Return here and attach an ordinal clock only with an explicit successor
   advance proof.

The next pages may use "before", "after", and "future" as causal words. They may
use "clock" only after the ordinal stage map has been supplied.
