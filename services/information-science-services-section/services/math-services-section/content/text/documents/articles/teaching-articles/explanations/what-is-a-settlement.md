---
title: What is a settlement?
description: "A site is a bare place with a rule: a carrier, and a law saying what content that carrier will admit."
---
# What is a settlement?

A **site** is a bare place with a rule: a carrier, and a law saying what
content that carrier will admit. A **settlement** is that site actually
inhabited — real accreted content, together with the fact that the site's
own law admits it. Site and settlement are two different things, and the
distinction is the whole point: a rule with nothing laid over it settles
nothing, and content with no admission law is not settled, only present.

## The theorem-locus

`Obsmetrologia/Settlement.lean` is a top-level module of the Lean library —
a sibling of `Cohomology/`, `CausalSets/`, `AperiodicOrder/`, not nested
under any of them. It abstracts the shape:

```lean
structure Settlement {Base : Type u} (Content : Base → Type v)
    (Admits : (b : Base) → Content b → Prop) (base : Base) where
  content : Content base
  admits  : Admits base content
```

Three parameters and two fields. `Base` is the kind of place; `Content` is
what a place of that kind can carry, indexed by the place; `Admits` is the
place's own law. A value of the structure is content plus a proof the law
admits it.

The module's own claim for why this abstraction is worth having is
`tiles_beads_hole_cech1_are_settlements`, which shows four constructions,
none built with the others in mind, are each an instance of it:

- **Tiles** — a finite local rule (a graph) with a listed pattern proven to
  be a path in it.
- **Beads** — a lenticule carrier with a routed thread proven legal under
  the hole-transition rule.
- **Hole** — a causal substrate and readout region with an effect relation
  whose every source lies on the shroud.
- **Čech1** — a cover with local sections, and a glued global section
  proven to be a coboundary of an agreeing family.

## What this section's code is

This section is **not** a JavaScript transcription of that structure, and
it does not carry the four instances. The Lean structure says what a
settlement *is*. This section supplies the operational half a proof does
not need: given a base whose cells each carry a knowledge-ordered fiber,
and a step that accretes content, **iterate the step to its least fixed
point** — the point at which the step adds nothing further — so that a
settlement-shaped value is actually in hand rather than merely specified.

The parameterization tracks the Lean shape one for one:

| Lean | here |
| --- | --- |
| `Base` | the key set of the settling — its cells |
| `Content` | the cell algebra `{ join, equal, bottom }`, the fiber over each cell |
| `Admits` | quiescence under the caller's step: `equal(state, merge(state, step(state)))` |

Nothing about a particular four-valued representation is baked into the
generic operations. A caller supplies its own cell algebra;
`settlementAlgebra` lifts it to the settling level, producing the pointwise
join (a semilattice: commutative, associative, idempotent), the fixed-point
combinator, the monotonicity gate, and the per-cell tracker. The one bound
instance the section ships, `chargeSettlement`, is bound to
`@lenticule-science/articulating`'s bilattice-charge — the house's single
Charge/FOUR implementation — and computes no join, order, or equality of
its own.

## Why iteration terminates, and what refuses it

If the step is **knowledge-monotone** (more input knowledge never yields
less output knowledge) and **inflationary** (`x ≤ step(x)`), then over a
bounded fiber the orbit only climbs and cannot climb forever, so it
reaches a least fixed point. Both conditions are the caller's to hold;
neither is checked. What *is* checked, by a separate and deliberate gate,
is that a finite orbit handed to it never moves backward:
`orbitMonotone`, `assertSettlingMonotone`, `guardSettlingMonotone`. The
gate holds on any orbit, whether or not that orbit came from the
combinator, and `CellSettlement` runs it on every write against its own
accumulated state rather than against whatever the writer claims its
"before" was.

## Honest grading

**Proved.** The Lean structure and `tiles_beads_hole_cech1_are_settlements`
are proved and elaborate clean (checked 2026-09-10 through the Lean
language server: no errors, no `sorry`). Charge/FOUR's bilattice laws are
enumerated and self-verified by `articulating`, and its Klein-four gauge is
tied to `RelMath.KleinFour.K4.isGroup`.

**Implemented.** The knowledge-order fixed-point iteration; the pointwise
join semilattice over the cells and its fold; the settling-monotonicity
gate in orbit, assertion, and single-step forms; the per-cell
committed-knowledge tracker; a JSON reading of a settling and two scripts
over it.

**Documented.** The correspondence in the table above — base to key set,
content to cell fiber, admission to quiescence — is a stated reading, not a
theorem. It is the reason the code seats at this locus, and it is how a
reader should understand the parameters.

**Open.**

- There is no proof that this combinator computes the *least* fixed point
  in general. It does when the caller's step is monotone and inflationary
  and the fiber is bounded; nothing at runtime establishes any of those
  three, and a step that is not inflationary simply exhausts the budget.
- There is no correspondence theorem between the JavaScript combinator and
  the Lean structure. Quiescence is offered as the admission law for the
  settlings this code builds; that identification is not formalized.
- The four Lean instances — tiles, beads, holes, Čech cocycles — are not
  realized here. This section carries the operational combinator only.
- Whether the settling this code reaches agrees with
  `Cohomology.SettlingCohomologyH1`'s reading of the same settling (its
  firing structure, its `H¹`) is unaddressed. That reading lives in
  `@lenticule-science/metrologic/obstruction/settling`, over a different
  presentation of a settling entirely; the two have not been related.
