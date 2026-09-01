---
name: getting
gerund: getting
agent-noun: getter
imperative: get
description: Returning a value to the caller; reading without side effect.
---

A read-only transformer. The caller receives the requested value; nothing in the substrate is altered by the act of getting.

## Domain and codomain

- **Domain:** a query — a specification of what to read. Typically a tuple of coordinates (e.g., `(subject, predicate, object)` for reading a [predication-cell](../structures/predication-cell.md); `(slug)` for reading a substrate entity; etc.). The query's shape depends on what is being gotten.
- **Codomain:** the value at the addressed location, or `bottom` (no value) if the addressed location has no value, or an error if the query is malformed.

## Preservation conditions

- **Idempotency.** Two successive `getting` invocations with the same query and the same substrate state return the same value.
- **No side effect.** A `getting` invocation does not modify the substrate. Witness emission may occur (a record of the read) but does not alter the predication-graph.
- **Knowledge-monotonicity.** If the substrate evolves under the knowledge-order $\leq_k$ — i.e., evidence is added — then a later `getting` invocation returns a value $\geq_k$ the earlier value. New evidence can refine the answer but not invalidate it.

## Morphological forms in naming grammar

- `gerund: getting` heads skills built on this transformer: `getting-the-current-time`, `getting-a-predication-cell`, etc.
- `agent-noun: getter` heads agents that invoke such skills: `getter-of-the-current-time`, `getter-of-predication-cells`, etc.
- `imperative: get` heads scripts that body such skills: `get-the-current-time.mjs`, etc.
