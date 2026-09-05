import InfomaterialManual.DocSetup
import Infomaterial.Language.Positing.FiberAlgebra

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Positing.FiberAlgebra

/-!
A real teaching chapter for the fiber algebra phase. This page is intentionally
not a wrapper over the old atlas. It explains one Infomaterial object from prose to
Lean to mathematical projection.
-/

#doc (Manual) "The valuation fiber" =>

# The Valuation Fiber

This chapter is about the first place where the phrase "fiber algebra" becomes a
lawful Infomaterial phrase.

The phrase is dangerous if it is read as ordinary subject classification. A
reader trained on algebra may hear "fiber algebra" and expect a general algebra
chapter. That is not what is happening. In Infomaterial, the valuation fiber is a
phase-local object. It lives after predicating and positing, and before the
later cohomological and material readings that use it.

The site carried by this chapter is:

* claim-site: valuation fiber algebra;
* phase: language-to-closure interface;
* generating sites: predication cell, charge, valuation, truth order;
* Lean carrier: `Infomaterial.Positing.FiberAlgebra`;
* familiar comparison: Heyting algebra, nucleus, nuclear quartet;
* danger: treating algebra as the top-level subject rather than as the projection
  of a posited valuation fiber.

## What Was Not Lawful Before This Phase

Before predicating, there is no predication cell. There are marks, utterances,
and articulation status, but no oriented site at which a value can live.

Before positing, there is no valuation. A predication cell is a position, not a
truth and not evidence. It can be valued only after positing supplies the
four-valued charge object.

Before the truth order is selected, there is no truth-order Heyting algebra on
the valuation fiber. The same charge object also has a knowledge order. Those
orders are not interchangeable.

So the valuation fiber is generated in four steps:

1. predicating gives the oriented cell;
2. positing gives charges;
3. valuation assigns a charge to each cell;
4. the truth order on charges lifts pointwise to the valuation fiber.

Only after those steps does the algebraic projection appear.

## The Carrier

The predication cell is the site where value can later live. In Lean it is
{name Infomaterial.PredicationCell}`PredicationCell`, with subject, predicate, and
object coordinates. Those coordinates matter because a valuation is not attached
to marks in isolation; it is attached to oriented predication positions.

The valuation is the assignment of a charge to every predication cell.

{docstring Infomaterial.Valuation}

The definition is small, but the gutter is large. `Valuation` is not an arbitrary
function space chosen because function spaces are convenient. It is the fiber of
posited standing over the predication base:

```lean
example : Valuation = (PredicationCell -> Charge) := rfl
```

This is the first repair locator. If a later page speaks about a fiber algebra
but cannot say "fiber over which base?" the missing answer is here: the base is
the predication cell, and the fiber value is charge.

## The Truth-Order Fiber

`Infomaterial.Positing.FiberAlgebra` builds the algebra directly on the concrete
valuation fiber. It does not import a generic algebra package and then declare
the fiber to be an instance. It proves the laws pointwise from the four-charge
truth-order facts.

The fiber truth order is:

{docstring Infomaterial.Positing.FiberAlgebra.fLeT}

The order says `v <=_t w` exactly when the pointwise truth-meet absorbs `v`.
Meet, join, implication, top, and bottom are all lifted pointwise from charges.
The Heyting structure is then packaged as a local structure:

{docstring Infomaterial.Positing.FiberAlgebra.FiberHeyting}

and the actual valuation fiber inhabits it:

{docstring Infomaterial.Positing.FiberAlgebra.fiberHeyting}

The checked Lean witness is short:

```lean
example : FiberHeyting Valuation := fiberHeyting
```

The prose meaning is not short. This says:

* the algebra lives on valuations;
* the order is the truth order, lifted pointwise;
* implication is the truth-order implication, lifted pointwise;
* the laws are proved from the finite charge object;
* the algebra is local to this phase.

This is why "Heyting algebra" is a projection here. The familiar object appears only
after the generated carrier and generated order exist.

## The Two Nuclei

The next object is not "two arbitrary closure operators." It is a pair of
truth-order nuclei on the valuation fiber.

The module first defines a schema:

{docstring Infomaterial.Positing.FiberAlgebra.nucleusToward}

Then it names the two phase readings:

{docstring Infomaterial.Positing.FiberAlgebra.sigma}

{docstring Infomaterial.Positing.FiberAlgebra.delta}

The important theorem is that these two nuclei commute:

{docstring Infomaterial.Positing.FiberAlgebra.sigma_delta_comm}

The checked witness:

```lean
example (v : Valuation) :
    sigma (delta v) = delta (sigma v) :=
  sigma_delta_comm v
```

This is the algebraic face of a relational fact: the two operations can be
applied in either order without changing the resulting valuation. At this phase,
that is the concrete commutating square.

## The Nuclear Quartet

The commuting nuclei generate four corners on the fiber:

* do nothing;
* apply `sigma`;
* apply `delta`;
* apply both, as the composite `pi`.

The module packages this as a concrete nuclear square:

{docstring Infomaterial.Positing.FiberAlgebra.FiberNuclearSquare}

and then as the truth-order nuclear quartet:

{docstring Infomaterial.Positing.FiberAlgebra.FiberTruthQuartet}

The actual theorem-bearing object is:

{docstring Infomaterial.Positing.FiberAlgebra.fiber_truth_nuclear_quartet}

Again the checked witness is small:

```lean
example : FiberTruthQuartet := fiber_truth_nuclear_quartet
```

What it carries is not small. It carries:

* `sigma` and `delta` commute;
* the composite is inflationary;
* the composite is idempotent;
* the composite preserves fiber meet;
* being fixed by the composite is the same as being fixed by both nuclei;
* the four corner operators are exhaustive;
* there are exactly four corners.

This is one of the places where the recurring FOUR becomes algebraic matter. It
is not merely the same number of cases. It is the four-corner coherence cell met
inside the truth-order valuation fiber.

## The Cross-Order Warning

The most important warning in the chapter is negative.

The truth-order nuclei do not also form knowledge-order nuclei on the same
algebra. The knowledge order is an orthogonal grade. It is not a second nucleus
on the truth-order Heyting algebra.

The module proves this sharply:

{docstring Infomaterial.Positing.FiberAlgebra.cross_order_not_knowledge_nucleus}

Checked:

```lean
example :
    ∃ v : Valuation,
      ¬ fLeK v
        (fun phi =>
          Infomaterial.Charge.joinT
            Infomaterial.Charge.kBot
            (v phi)) :=
  cross_order_not_knowledge_nucleus
```

This theorem is a documentation anchor because it prevents a plausible but wrong
reading. A reader might try to put the truth and knowledge orders into one
ordinary algebraic square. Infomaterial refuses that collapse. The truth-order
quartet lives inside one fiber algebra. The knowledge order is the other grade
of the bigraded situation.

That is the difference between a local projection and the phase that casts it.

## How To Use This Chapter

If you are reading a later page and see "fiber algebra," ask:

* What is the base? Here it is `PredicationCell`.
* What is the fiber value? Here it is `Charge`.
* Which order is being used? Here the algebra is truth-order.
* Which structure is projection? The Heyting algebra and nuclei.
* What is not allowed? Treating the knowledge order as another nucleus on the
  same truth-order algebra.

If you are an agent trying to write or repair documentation, use this route:

1. Read `Infomaterial.Language.Predicating.Cell` for the base.
2. Read `Infomaterial.Language.Positing.Charge` for the four-valued charge.
3. Read `Infomaterial.Language.Positing.Valuation` for valuation as fiber.
4. Read `Infomaterial.Language.Positing.TruthOrder` for the selected order.
5. Read `Infomaterial.Language.Positing.FiberAlgebra` for the algebraic projection.

Do not start from "Heyting algebra." Start from the phase that makes the
Heyting algebra visible.

## What This Chapter Does Not Yet Explain

This chapter does not yet teach the full bigraded cohomology story. It only
establishes the local fiber-algebra object that later cohomological matter uses.

It also does not yet teach the global sheaf story. The transition from a
valuation fiber to sheaves, gluing, H1, and obstruction is the next chapter of
fibered and cohomological matter.
