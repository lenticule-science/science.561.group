---
page-title: "Causal intervals and the distinctions a map can lose"
title: "Causality from intervals: what survives a change of representation?"
summary: "A worked construction from Obsmetrologia's kinematic research: order intervals by sequencing, transport them through strict causal maps, and exhibit the independent activity a valid map can still forget."
date-created: 2026-10-31
type: article
status: draft
visibility: public
math: true
tags: [relationality, obsmetrologia, causality, kinematics, causal-sets, information]
keywords: [causal intervals, kinematic space, causal order, strict order preservation, Myrheim Meyer dimension, projection loss]
---

## An event can be a relation between events

Suppose a record distinguishes events and tells us which can precede which. We can ask about an interval of activity: its beginning, its end, and whether a second interval can follow it. The interval is now something we can identify and relate in its own right.

Obsmetrologia's kinematic research makes this move explicit. Its native route starts with an articulation and its witnessed continuations. The prefixes of that articulation provide a strict causal order. A pair of strictly related events becomes an interval, and the intervals acquire their own order through their endpoints.

The construction is useful before an interval is assigned a duration or placed on a spacetime diagram. It gives a precise language for sequences of transformations, including proof activity and computation. Physical geometry becomes a further interpretation whose assumptions can be stated and tested.

This article develops the finite order construction in ordinary mathematical notation. It then shows a limitation that is also a design result: **preserving every causal relation in the source does not ensure that a change of representation preserves independence**.

## Constructing the interval carrier

Let C be a finite set of events equipped with a strict order ≺. Here “strict” means irreflexive and transitive: nothing precedes itself, and a≺b together with b≺c implies a≺c. Write a≤b when a=b or a≺b.

Form the interval carrier

$$K(C)=\{(a,b):a\prec b\}.$$

An element of K(C) records two actual events and a strict precedence relation. It is not every possible pair of coordinates. The endpoints may have many events between them or none.

Now define **sequencing**:

$$ (a,b)\prec_K(c,d)\quad\text{exactly when}\quad b\le c. $$

One interval precedes another when its end is at or before the other's beginning. Equality at the shared endpoint is allowed; the intervals themselves still have distinct beginning and end.

Why is this a strict order? An interval cannot precede itself: a≺b rules out b≤a. For transitivity, if b≤c and d≤e, the middle interval (c,d) supplies c≺d, so b≤e. Thus (a,b) preceding (c,d), and (c,d) preceding (e,f), makes (a,b) precede (e,f).

This is the argument carried by the source declarations `sequencing_lt_irrefl` and `sequencing_lt_trans`. The formal source also constructs the finite list of intervals without duplicates. We inspected these definitions and proof terms; this publication does not claim a fresh whole-library Lean build.

### Why nesting answers a different question

Containment compares where intervals sit inside one another:

$$ (a,b)\preceq_{\mathrm{nest}}(c,d)\quad\text{when}\quad c\le a\;\text{and}\;b\le d. $$

Every interval contains itself. This reflexive nesting relation therefore cannot be used unchanged as the strict causal order above. Strict containment can be defined separately, but it would still answer containment rather than sequencing. The choice changes the mathematics; a drawing of overlapping diamonds cannot make the two relations interchangeable.

## The transport theorem

Let f:C→D be a total map between two finite strict orders. We would like to send each source interval to the pair of its images:

$$ K(f)(a,b)=(f(a),f(b)). $$

**Finite transport result.** This assignment produces a valid target interval for every source interval exactly when f preserves every strict causal pair:

$$ a\prec_C b\quad\Longrightarrow\quad f(a)\prec_D f(b). $$

The necessity is immediate but informative. Every strict source pair is a source interval. If f collapses its endpoints, or sends them to incomparable target events, its image is not an interval in K(D).

For sufficiency, strict preservation ensures that every image is a valid interval. It also preserves sequencing. If (a,b) precedes (c,d), then b≤c. A function preserves equality, and our hypothesis preserves strict precedence, so f(b)≤f(c). The image intervals therefore sequence in the target.

Identity maps and composition are preserved simply by applying them to both endpoints. These statements give the finite interval construction a functorial reading on this **specified class of maps**. They do not assert functoriality for arbitrary quotients, partial relations or functions that are merely non-strictly monotone.

A minimal refusal example is the two-event chain a≺b mapped to a single event u. The map is non-strictly monotone, but (u,u) is not a strict target interval. A correct transport must refuse it.

## A lawful map can still manufacture apparent sequencing

Consider four source events with only two strict relations:

**a≺b and c≺d.**

The two activities are independent in the specified order. In particular, neither b≤c nor d≤a holds, so their intervals do not sequence.

Now take a target chain u≺v≺w and define

**f(a)=u, f(b)=v, f(c)=v, f(d)=w.**

Both strict source relations survive. The map passes the theorem's admission condition. But its interval images are (u,v) and (v,w), which do sequence because they share the endpoint v.

![Two independent source intervals a to b and c to d map to u to v and v to w. The map identifies the incomparable source events b and c. It preserves both source arrows, while the two image intervals acquire a sequencing relation absent from the source.](/figures/causal-interval-projection.svg)

*Figure 1. A constructed finite counterexample, not measured spacetime data. The new sequencing is a property of the target representation. It is not evidence that the two original activities causally followed one another.*

| Property | Source | Image in target |
| --- | --- | --- |
| Listed source events / distinct image events | 4 | 3 |
| Selected intervals | (a,b), (c,d) | (u,v), (v,w) |
| Are these two intervals comparable by sequencing? | No | Yes |
| Does f preserve every strict source pair? | Yes | Yes |

This counterexample uses a conventional finite order supplied for the transport test. It does not claim that every branching order has already been generated from a single native articulation, whose prefixes form a chain.

### What stronger condition would preserve the distinction?

An **order embedding** is sufficient: require f to be injective and to preserve and reflect strict order. If image endpoints satisfy f(b)≤f(c), injectivity handles the equality case and reflection handles the strict case. We recover b≤c, so the interval sequencing was already present in the source.

That stronger condition may be unsuitable for a deliberate compression. If a quotient is desired, the alternative is to retain a witness of the identified source events and report the new comparabilities. A downstream consumer can then decide whether the lost independence matters to its calculation.

The practical consequence is concrete. A planner must not infer that concurrent source activities require serial execution merely because a summary sequences their images. A proof viewer must not treat a compact target path as a certificate of the original dependencies. The result tells an implementation exactly which invariant it must preserve or explicitly report as lost.

## When does causal order become physical geometry?

Causal-set physics offers a relevant comparison. Bombelli, Lee, Meyer and Sorkin's 1987 proposal studies causal order together with counting as a route toward spacetime geometry. Its continuum and faithful-embedding conditions include more than the existence of a finite acyclic graph: the causal structure, volume density and relevant length scales have to fit the proposed spacetime interpretation.

One useful diagnostic is the Myrheim–Meyer dimension estimate. For N sampled events, let R count all distinct comparable pairs, including transitive relations. An ordering fraction is

$$ r=\frac{2R}{N(N-1)}. $$

Under the appropriate flat-spacetime interval sampling model, its theoretical counterpart is

$$ r_{\mathrm{model}}(d)=\frac{\Gamma(d+1)\Gamma(d/2)}{2\Gamma(3d/2)}. $$

This gives r=1/2 for d=2 and r=1/10 for d=4. Reid's account also uses a convention based on the comparable-pair count divided by the squared expected event count, whose formula has 4 rather than 2 in the denominator. The convention must accompany the number.

Even an exact ordering fraction does not identify the order. A three-event chain plus one isolated event has N=4 and R=3. A four-event star a≺b, a≺c, a≺d also has N=4 and R=3. Their ordering fractions agree, but their heights and connectivity differ. These tiny examples demonstrate information lost by the statistic; they do not establish the physical dimension of either graph.

The useful research task is therefore to compare several structural and scale-dependent observations under a declared physical sampling model. A dimension readout can help discriminate candidate models. It cannot supply a metric, dynamics or manifold interpretation by itself.

## What this establishes for the larger program

The native construction supplies intervals and their sequencing. The finite theorem identifies the maps that transport those intervals. The counterexample identifies a property that those maps can lose. Together they provide a usable specification for the next layer of research and software.

The harder continuation is to carry more of the native structure through the map: evidence values, incompatible witnesses, local sections, closure rules, and the distinctions needed by a particular consumer. Preserving endpoints is one earned step. Preserving the semantic or physical meaning attached to them is a further theorem or test.

Continue with [information at a boundary](/information-boundaries-and-physical-records/) to measure an observation's remaining ambiguity, or [quantum contexts and probability](/quantum-contexts-and-probability/) to see why preserving possible outcomes can still lose decisive probability constraints. The [relational physics guide](/relational-physics/) explains how these questions fit the research program.

### Sources and reproduction

- **Native construction:** [Obsmetrologia's kinematic curriculum, revision a0d8d072](https://github.com/lenticule-science/obsmetrologia/blob/a0d8d07226b57f04c088d96e4d7f91a00c785f9d/docs/verso/ObsmetrologiaManual/Curricula/IntroductionToInformationalMathematics/FromPredicationToKinematicSpace.lean) and [HoleDiamondCausalSet.lean at the same revision](https://github.com/lenticule-science/obsmetrologia/blob/a0d8d07226b57f04c088d96e4d7f91a00c785f9d/Obsmetrologia/CausalSets/BlackHoles/HoleDiamondCausalSet.lean). Source access requires authorization. The finite K(f) argument and its limits are maintained in the existing [kinetic research question, K1](https://github.com/lenticule-science/obsmetrologia/issues/24).
- **Causal-set comparison:** Bombelli, Lee, Meyer and Sorkin (1987), [Space-time as a causal set](https://doi.org/10.1103/PhysRevLett.59.521), *Physical Review Letters* 59, 521–524; [author-hosted paper](https://mathweb.ucsd.edu/~dmeyer/research/publications/SpacetimeCausalSet/SpacetimeCausalSet.pdf).
- **Dimension estimator:** Reid (2003), [Manifold dimension of a causal set: Tests in conformally flat spacetimes](https://arxiv.org/abs/gr-qc/0207103), *Physical Review D* 67, 024034, especially equation (5) and the multi-scale comparison of estimators.
- **Public finite reproduction:** [relational-examples.py](https://github.com/lenticule-science/science.561.group/blob/main/examples/relational-examples.py) enumerates the stated orders, interval relations, refusal case and dimension-statistic counterexample. It is a transparent teaching calculation, not a replacement for Metrologic's production implementation or a fresh native proof audit.

*Research status:* existing mathematical construction and finite argument, with independently executable teaching examples. The physical interpretation remains conditional on additional observations and models. Prepared with AI assistance; no new physical experiment or external peer review is claimed.

*Reuse terms:* no additional reuse license is granted by this page. Cited works and linked source repositories retain their own terms.
