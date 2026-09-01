---
name: dispatching-a-task-to-an-assignee
description: Writes (target, assigned-to, <actor>) on a work-item, optionally transitioning open to in-progress if the actor accepts the dispatch.
specializing: asserting-positing-morphism
status: stub
---

A **dispatching-a-task-to-an-assignee** call is the asserting positing that adds an entry to the work-item's assigned-to set (cell #4 of the predication-shape).
May compose with transitioning-a-work-items-state to advance the lifecycle from open to in-progress if the assignee accepts immediately.

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
