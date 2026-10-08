---
type: concept
class: operation-kind
depends-on: [operation-kinds]
see-also: [traversal, mutation, view]
title: Query
description: "The platform's read-without-mutate operation kind: an operation that reads substrate state and produces a structured response without changing any predications."
---

# Query

The platform's *read-without-mutate* operation kind: an operation that reads substrate state and produces a structured response without changing any predications.
Queries are the most common operation kind; they are how agents and runtime components observe the substrate.

A query is structurally distinct from a [mutation](../memory/mutation/mutation.md): the query produces only output content, never state change.
It is also distinct from a [guard](../governance/guard/guard.md): the guard produces a verdict (admissibility), the query produces content (the requested data).

## Three classes of query

- **Cell query.** "What's the value of this predication?" — a one-step lookup against the [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md).
  Resolved via [traversal](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md).
- **Neighborhood query.** "What entities does this entity relate to under this predicate?" or "what entities relate to this one?" — a forward or backward [traversal](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) at bounded radius.
- **Composed query.** A structured composition of cell and neighborhood queries, possibly with shape-based filtering, ordering, aggregation.
  The composition's body is itself substrate-content (a [skill record](../objects/skill-record.md) or a query expression entity).

## Engineering properties

- **Read-only.** No predication insertion, no value upgrade, no event-log mutation (beyond the query's own witness, which is a separate substrate event).
- **Bounded radius per the query's declaration.** A composed query declares its match-radius; the substrate enforces it.
  Queries that scan unbounded radii are not admissible.
- **Witness-recorded as part of audit.** A query invocation is a witnessed event: who queried, with what input, at what substrate state.
  The query's *result* is not necessarily persisted (it may be returned to the caller without storage), but the *invocation* is.
  This is what makes "what has the agent looked at?" answerable from substrate.
- **Cacheable.** Per [hash discipline](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-discipline.md), a query result for a particular substrate state has a content-hash.
  Identical queries against unchanged substrate state return identical results; caching by content-hash is admissible.

## Position in the platform

Queries are the platform's most volume-heavy operation kind: most of what agents do, most of what runtime checks require, most of what views display reduces to query operations.
The platform's economy depends on cheap query: a query against substrate-resident content (no inference, no external service) operates at near-zero marginal cost.

Particular query patterns:

- **Look-at-entity.** Render the predications visible at the agent's current [view](../scope/view/view.md)'s `location`.
- **Find-by-predicate.** Return entities carrying a particular predicate, optionally filtered by value-shape.
- **Render-snapshot.** Read a snapshot of a region's substrate state at a particular event-log position.
- **Audit-trace.** Read the witness chain for a particular entity or operation.
