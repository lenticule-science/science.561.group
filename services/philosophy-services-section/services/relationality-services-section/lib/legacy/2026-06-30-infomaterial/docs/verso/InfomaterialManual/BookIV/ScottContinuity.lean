import InfomaterialManual.DocSetup
import Infomaterial.Closure.Scott

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Closure.Scott

/-!
A teaching chapter for Scott-continuity as a closure-regime phenomenon.
-/

#doc (Manual) "Scott-continuity as a regime" =>

# Scott-Continuity As A Closure Regime

Scott-continuity is not a top-level topic in this book. It is a condition inside
the closure phase.

The claim-site carried here is:

* claim-site: Scott-continuous closure;
* phase: closure;
* generating sites: charge, knowledge order, closure operator, directed join;
* Lean carrier: `Infomaterial.Closure.Scott`;
* familiar comparison: Scott-continuity from domain theory;
* danger: treating Scott-continuity as imported background instead of as a
  regime condition on settling.

The chapter's job is to make one sentence precise:

> A closure is Scott-continuous when it preserves the directed joins that the
> settling phase uses as limits.

## Why This Belongs To Closure

Before settling, there is no closure orbit whose limit behavior can be measured.
Before the knowledge order, there is no directed knowledge-join for a closure to
preserve. Before positing, there is no charge lattice on which this finite projection
can be checked.

So Scott-continuity is not an imported property of an ambient category. It is a
phase-local measurement of closure behavior:

* does the closure commute with directed joins?
* does a rule fire at a limit because it already fired at some finite stage?
* does the closure remain in the strict/Scott regimes, or does it expose a
  non-Scott obstruction?

That is why this chapter belongs in the closure phase.

## Directed Families

The finite model starts with directed families of charges.

{docstring Infomaterial.Closure.Scott.DirectedFamily}

The directed family has a supremum:

{docstring Infomaterial.Closure.Scott.DirectedFamily.sup}

and, over the finite charge carrier, that supremum is attained by an element of
the family:

{docstring Infomaterial.Closure.Scott.DirectedFamily.sup_mem}

This theorem is the finite heart of the chapter. In the finite carrier, directed
joins are not mysterious completed infinities; the join is already present in the
directed family. That is why every finite charge-closure is Scott-continuous.

## The Scott Equation

The Scott-continuity predicate is the equation:

{docstring Infomaterial.Closure.Scott.IsScottContinuous}

The finite theorem is:

{docstring Infomaterial.Closure.Scott.finite_scott_continuous}

Checked:

```lean
example (c : Charge.Closure) : IsScottContinuous c :=
  finite_scott_continuous c
```

The theorem says: for this finite charge model, every closure operator preserves
directed joins. This is not the full transfinite story. It is the strict finite
projection. But it is not a toy either: it is exactly the finite base case against
which non-Scott behavior will later be recognized.

## Finite Antecedents

The operational reading is rule firing.

The module defines a finite-antecedent firing operator:

{docstring Infomaterial.Closure.Scott.fire}

and proves that finite-antecedent rules commute with directed joins:

{docstring Infomaterial.Closure.Scott.finite_antecedent_scott_continuous}

Checked:

```lean
example (ante concl : Charge) (S : DirectedFamily) :
    fire ante concl (sup S.elems)
      = sup (S.elems.map (fire ante concl)) :=
  finite_antecedent_scott_continuous ante concl S
```

This is the usable intuition. A finite-antecedent rule fires at the directed join
only because the finite antecedent was already covered at some member of the
directed family. The limit adds no surprise.

When a rule needs an infinitary antecedent, this argument breaks. That failure is
where non-Scott firing and curvature enter.

## Regime Classification

Scott-continuity is tied to the closure-regime classifier.

{docstring Infomaterial.Closure.Scott.scott_continuous_iff_omega_regime}

The finite charge closure lands in the strict regime:

{docstring Infomaterial.Closure.Scott.finite_charge_strict}

Checked:

```lean
example (c : Charge.Closure) (x : Charge) :
    classify spineData = ClosureRegime.strict
      ∧ Charge.SettlesBy c.op x 3
      ∧ IsScottContinuous c :=
  finite_charge_strict c x
```

This proves the local phase relationship:

* finite base implies strict behavior;
* strict behavior implies finite settling;
* finite charge closure is Scott-continuous;
* cohomological obstruction vanishes in the strict/Scott side.

Scott-continuity is therefore a regime condition, not a subject heading.

## Projection Discipline

The familiar comparison is domain-theoretic Scott-continuity. The Infomaterial claim is
not "we imported domain theory." The Infomaterial claim is that the closure phase
generates a condition with the Scott-continuity shape: preservation of directed
joins.

Use the projection only after the phase is visible. A page that starts with
"Scott-continuous category" before explaining the closure operator, directed
family, and regime classifier is importing the projection too early.

## Repair Path

If this chapter fails for a reader, use this route:

1. Read `Infomaterial.Language.Positing.Charge` for the four-charge carrier.
2. Read `Infomaterial.Closure.Operator` for closure operators on charges.
3. Read `Infomaterial.Closure.Regime` for the four-regime classifier.
4. Read `Infomaterial.Closure.Scott` for directed families and the Scott equation.
5. Then read non-Scott firing and curvature as failures of this preservation.

The next chapter in the closure phase should teach non-Scott firing: the point at
which the limit does add surprise.
