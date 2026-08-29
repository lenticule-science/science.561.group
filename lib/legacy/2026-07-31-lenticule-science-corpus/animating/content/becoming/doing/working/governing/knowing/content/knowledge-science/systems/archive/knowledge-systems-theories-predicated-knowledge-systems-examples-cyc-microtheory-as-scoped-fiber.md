---
title: "Cyc Microtheories as Scoped Fibers"
type: example
status: sketch
---

## What is being instantiated

The [discourse-community-as-fiber](teaching/explanations/discourse-community-as-fiber.md) concept and the [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) substrate, exemplified by Cyc's *microtheory* construct ([@lenat-guha1990]).

## What Cyc microtheories are

A Cyc microtheory is a named *context* within which assertions are taken to hold. Microtheories form a lattice under a *genlMt* (generalisation-microtheory) relation: if $M_1 \,\text{genlMt}\, M_2$, then every assertion in $M_2$ is *liftable* to $M_1$ (every consequence holding in the more general context also holds in the more specific). Distinct microtheories may contain mutually-contradictory assertions without inconsistency: the assertion `(WeatherToday Sunny)` may hold in `(MtSpace SanFranciscoMt)` while `(WeatherToday Rainy)` holds in `(MtSpace LondonMt)` — the two microtheories partition the assertions so that no inferential contradiction arises at the global level.

Cyc uses microtheories for at least four engineering purposes: (i) *temporal scoping* (assertions about the present versus the past versus the future), (ii) *spatial scoping* (assertions about San Francisco versus London), (iii) *modal scoping* (assertions about the actual world versus a fiction), (iv) *theory scoping* (assertions in a Newtonian-mechanics microtheory versus a quantum-mechanics microtheory).

## How they map onto the framing

The framing reads each Cyc microtheory as a *fiber* in the predication-fibration. The genlMt lattice is the *base category* indexing the fibration: $M_1 \,\text{genlMt}\, M_2$ corresponds to a [specialize](../morphisms/specialize.md) morphism in the base, and the contravariant functor sending $M$ to its fiber algebra $A_M$ recovers Cyc's *lifting* operation as the algebra-morphism induced by the base morphism. Cyc's four scoping uses are recovered as four *kinds* of fibration index: temporal, spatial, modal, theoretical — each is a sub-axis of the full fibration index.

The crucial point is that Cyc *already* commits to the predication-fibration structure, but only at the engineering layer (microtheories as a programmer-managed namespacing tool) rather than at the semantic layer (microtheories as fibers with algebraic structure). The framing makes Cyc's engineering commitment a structural one: the microtheory lattice *is* the fibration base, microtheory inheritance *is* fiber specialization, and inter-microtheory reasoning *is* federation across fibers.

## What this surfaces about Cyc

Three observations emerge from reading Cyc through the framing:

1. **Cyc's contradiction tolerance is bilattice-shaped, but undeclared.** Cyc allows `(P)` in $M_1$ and `(not P)` in $M_2$ without inconsistency by *partitioning the contexts*. The framing recognises this as: each microtheory has its own bilattice-valued fiber algebra, and the *contradiction* between $M_1$ and $M_2$ would only arise if both were federated into a single fiber. By keeping them as separate fibers, Cyc avoids the $\top$ value at the fiber level — at the cost of having to manually choose which microtheory to query when the user asks about $P$.
2. **Cyc's microtheory lattice is rigid; the framing's fibration base is open.** Cyc's microtheory lattice is built and maintained by Cyc engineers; users select from the existing lattice. The framing's predicate-category base admits any small category; users may construct new fibers without engineering intervention. This is the framing's structural opening to the [discipline-vs-school-as-fibers](questions/discipline-vs-school-as-fibers.md) flexibility Cyc lacks.
3. **Cyc's lifting protocol is procedural, not algebraic.** Cyc's lifting rules (when an assertion in $M_2$ implies an assertion in $M_1$) are specified procedurally via CycL axioms. The framing makes lifting algebraic: it is the action of the fibration functor on a base morphism, with [federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md) characterising what cross-microtheory aggregation looks like in general.

## Failure modes

Treating Cyc microtheories as merely a *namespacing convenience* — as is common in critiques of Cyc — misses the structural commitment they encode. The framing's reading is the more generous one: Cyc *anticipates* the predication-fibration, but stops short of making it algebraic. Conversely, treating the framing's fibration as *just Cyc microtheories with extra steps* understates the bilattice value-domain extension and the federation-as-colimit construction — both of which Cyc handles procedurally rather than structurally.
