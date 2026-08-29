---
name: surveying-open-work-by-assignee
description: Groups all open work-items by their assigned-to cells and returns a per-assignee summary.
specializing: abstaining-positing-morphism
status: stub
---

A **surveying-open-work-by-assignee** call walks the work-item cell space, partitions entities by their (e, assigned-to, *) cells, and returns a per-assignee count of open / in-progress / blocked items.
Useful for sprint planning and load-balancing.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
