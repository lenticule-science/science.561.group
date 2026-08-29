---
type: concept
class: structure
depends-on: [predication-substrate, identity-by-relations, substrate-value-domain]
see-also: [closure-rule, wavefront, witness, read-discipline]
---

# Predication-fiber

The bundle of predications local to an entity under a chosen subdivision: most generally, *all* predications incident to the entity (its full fiber); more usefully in practice, the predications under a particular predicate, source, or subject (a *sub-fiber*). A fiber is the unit at which the substrate's local operations read: a [closure rule](closure-rule.md)'s match-radius is bounded by the fibers it reads; the [substrate's value-domain](substrate-value-domain.md) operations compose values within and across fibers; the [wavefront](wavefront.md) advances by extending fibers and triggering rules whose premises now match.

A fiber is not a separate substrate structure with its own storage. It is a *region* of the [predication substrate](predication-substrate.md) addressed by an entity (or an entity-and-predicate pair, or an entity-and-subject pair) and read by traversal under [identity-by-relations](identity-by-relations.md). A query for an entity's fiber is a traversal of the predications incident at that entity; the result is the configuration of cells the traversal visits.

## Three readings of "fiber"

The word "fiber" recurs across the corpus in three slightly different senses, all mathematically continuous with one another:

- **The full fiber at an entity.** Every predication the entity participates in, regardless of predicate or role. The full fiber is the engineering analog of the entity's "contents" — all the substrate has to say about the entity.
- **A predicate-fiber.** The predications at the entity under one named predicate. An entity's `authorization` fiber is the bundle of its authorization-related predications; its `depends-on` fiber is the bundle of its dependency declarations. Predicate-fibers are the granularity at which most closure rules operate: a rule reads "this entity's `authorization` fiber" and produces predications.
- **A subject-fiber.** The predications at the entity in a chosen role (subject, object, or witness). When an operator says "the fiber" without further qualification, the subject-fiber (the predications where this entity is the subject) is usually meant.

The three readings are projections of the same predication-graph region under different selection criteria. The substrate's local operators specify which projection they need; an operator that reads more than its specification declares is reading outside its declared radius, which violates locality.

## What fibers are made of

A fiber is composed of predications, each of which carries a value in the [substrate's value-domain](substrate-value-domain.md). The fiber is therefore a function (in the substrate's algebraic sense) from predicate-and-arguments to substrate-value-domain elements. A fiber is *thin* when most of its predicates carry $\bot$ (no information); a fiber is *rich* when most of its predicates carry $t$, $f$, or $\top$; a fiber is *contested* when one or more of its predicates carries $\top$.

The fiber's algebraic structure is inherited from the substrate's value-domain: the value-domain's truth-order, knowledge-order, and residuated pair $\odot \dashv \Rightarrow$ extend pointwise to fibers. Two fibers compose by composing their predicates' values predicate-wise; the fiber-level composition's properties are determined by the value-domain's algebraic properties.

## Width and bounds

A fiber's *width* is the count of predicates it carries. The [predication substrate](predication-substrate.md) note observes that a predicated computer's working memory is bounded by *active wavefront width* — the cumulative width of the fibers a closure rule's premise reads at — not by the substrate's total predication count. A substrate with 50 million predications and an active wavefront width of 50 (a typical closure-rule premise reads at most a few entities' fibers) consumes working memory proportional to 50, not 50 million.

The width-vs-graph-size distinction is what makes the substrate's locality discipline operational: the substrate's per-step cost depends on fiber width and rule match-radius, not on the graph size. A substrate that violates this — by reading the global graph rather than a bounded fiber — has lost the locality property and cannot scale beyond memory.

## Position in the substrate

The fiber concept does not introduce a new substrate primitive; it names the *unit of locality* the substrate's existing primitives are bounded by. Every substrate operation reads, writes, or composes some bounded fiber: [GetCell](../morphisms/get-cell.md) reads one cell from a content-addressed projection of fiber content; [closure-rule application](../morphisms/closure-rule-application.md) matches its premise against fibers visible at its match-radius; [merge](../morphisms/merge.md) composes fibers from divergent branches; [witness](witness.md) records the fibers it observed.

The fiber is what the substrate's [read-discipline](read-discipline.md) is *about*: lawful reads are output-producing walks at the I/O surface, where the walk traverses some bounded fiber and the result is the configuration of cells observed. Unlawful reads are reads that would require unbounded-fiber access to make a runtime decision; the discipline forecloses them by requiring the substrate's algebra to compute the decision instead, with the substrate-value-domain's join providing the answer.

The corpus uses "fiber" without the qualifier "predication-fiber" in most places where the qualifier would be redundant. The full term is used here as the canonical name; cross-references in the corpus may write "fiber" or "predication-fiber" interchangeably.
