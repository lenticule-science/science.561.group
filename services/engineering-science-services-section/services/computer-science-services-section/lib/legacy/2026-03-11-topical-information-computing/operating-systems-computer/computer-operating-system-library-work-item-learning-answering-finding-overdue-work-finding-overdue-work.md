---
name: finding-overdue-work
description: Walks all work-items with has-deadline cells and returns those whose deadline is in the past and status is not done/abandoned.
specializing: abstaining-positing-morphism
status: stub
---

A **finding-overdue-work** call walks the work-item cell space for entities with (e, has-deadline, d) where d < today and (e, has-status, s) with s ∉ {done, abandoned}.
Returns the overdue set sorted by how-far-past-deadline descending.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
