---
name: finding-work-by-priority
description: Walks open work-items and returns them sorted by has-priority cell, descending.
specializing: abstaining-positing-morphism
status: stub
---

A **finding-work-by-priority** call is the abstaining positing that reads (e, has-priority, p) cells over the open work-item subspace, sorts by p in priority-ordering descending, and returns the ranked list.
Useful for picking the next thing to work on.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
