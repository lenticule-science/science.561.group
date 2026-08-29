---
name: finding-work-by-deadline
description: Walks open work-items and returns them sorted by has-deadline cell, ascending (soonest first).
specializing: abstaining-positing-morphism
status: stub
---

A **finding-work-by-deadline** call is the abstaining positing that reads (e, has-deadline, d) cells over the open work-item subspace, sorts by d ascending, and returns the ranked list.
Useful for spotting time-pressured work.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
