---
title: "Should PyPredComp payloads use typed predication terms?"
description: "Decision fork reframing binary mode around typed predicate-shape declarations for unary-diagonal, relational, event-record, and future n-ary PyPredComp payload terms."
kind: question
date: "2026-05-03"
status: open
---

# Should PyPredComp payloads use typed predication terms?

## Question

The real PyPredComp design fork is not:

> Should `respond` grow binary mode?

The real PyPredComp design fork is:

> Should PyPredComp adopt a typed predication-term payload discipline whose terms may be unary-diagonal, relational/binary, event-record, or later n-ary, with shape declarations checked before settlement?

`respond` growing a binary-cell form may be one implementation outcome.
It is not the prior documentation artifact.
The prior artifact is a PyPredComp-local predicate-shape discipline that says what each payload term means, which object coordinates are lawful, which closure rules may consume or emit it, which stratum may carry it, and which capabilities authorize it.

## Why the old question is too shallow

`respond` currently emits payload-derived cells as unary-diagonal cells.
Binary cells currently enter through a bounded sibling primitive for inter-session messaging.
From this fact, an implementation agent can incorrectly infer that the next task is to add a second branch called `binary_cells`.

That branch alone would not answer the load-bearing questions:

- What shape does each payload term have?
- Is a timestamp an object coordinate, an event witness, or instrumentation?
- Are state flags still diagonal?
- Can a closure rule emit a relational cell?
- Does an emitted binary cell enter sigma/Delta closure?
- How does a projection expose cells whose object axis is not the subject?
- Which sender capabilities authorize each shape?

Without those answers, `binary_cells` becomes a side channel rather than a lawful predication-category surface.

## Candidate resolutions

### A. Keep unary payloads plus bounded sibling binary primitives

This preserves the v0.2 engineering split.
It is acceptable only if the sibling primitive remains narrow, audited, replay-deterministic, and documented as a bridge rather than a mathematical exception.

This does not solve typed event-record, predicate registry, or future closure-output questions by itself.
If chosen, PyPredComp still needs a refactor plan for shape declarations and validators.

### B. Extend `respond` with shape-specific payload fields

A possible spelling:

```jsonc
{
  "predicates": {"is-open": "True"},
  "binary_cells": [{"p": "depends-on", "o": "task:bar", "v": "True"}],
  "event_records": [{"p": "completed-at", "o": "2026-05-04T12:00:00Z", "v": "True"}]
}
```

This is explicit but risks teaching implementation agents that shape equals field name.
It also leaves future n-ary work awkward unless the schema grows again.

### C. Adopt typed predication terms

A possible spelling:

```jsonc
{
  "terms": [
    {"shape": "state-flag", "p": "is-open", "v": "True"},
    {"shape": "relational", "p": "depends-on", "o": "task:bar", "v": "True"},
    {"shape": "event-record", "p": "completed-at", "o": "2026-05-04T12:00:00Z", "v": "True"}
  ]
}
```

This keeps the discipline in one grammar.
The grammar can require `o = target` for state flags, meaningful object slugs for relational predicates, event witnesses for event records, and a future arity-indexed structure for n-ary predication.

This is the most faithful option, but it requires every PyPredComp surface that accepts payloads to learn the term language and every validator to consult PyPredComp's predicate-shape declarations.

## Required refactor before further payload development

Before adding new payload, closure, federation, or projection behavior, PyPredComp should refactor its current implementation surfaces so shape is explicit rather than implicit:

- add a PyPredComp-local predicate-shape registry or declaration surface;
- make legacy unary payloads resolve through that registry as state-flag terms;
- route both `respond` asserted-cell emission and the inter-session binary sibling path through a shared shape-validating cell-construction layer;
- add closure-rule premise and conclusion shape signatures before permitting relational or event-record closure outputs;
- make asserted, saturated, and settled stratum admission shape-aware;
- make subject-anchored and object-anchored projections explicit instead of relying on per-call conventions;
- make sender authorization and capabilities check shape as well as predicate slug.

This is a refactor plan, not permission to leave current implicit behavior in place indefinitely.
The v0.2 behavior can remain only as a bounded compatibility surface while the shape-aware layer is introduced underneath it.

## Default disposition

Default disposition: prefer option C as the target discipline, while allowing option A to remain as a bounded v0.2 bridge during the refactor.
Option B is a plausible transitional wire form but should not be treated as the conceptual model.

The next implementation-facing artifact should be a PyPredComp predicate registry / typed term grammar and refactor plan, not a direct runtime patch to `respond` that adds ad hoc binary handling.

## Cross-references

- `../specs/kernel/predicate-shape-discipline.md` — normative PyPredComp shape discipline.
- `../implementation/predicate-shape-refactor-plan.md` — PyPredComp refactor plan before further payload/closure development.
- `respond-binary-cell-mode.md` — older binary-mode question; should be read as subordinate to this fork.
- `../specs/kernel/binary-cell-emission.md` — current bounded sibling primitive.
