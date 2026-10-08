---
title: Procedure Task Decomposition via Subtasks
description: Proposes decomposing multi-capability procedure tasks into ordered subtasks, each dispatchable to a single agent based on work-type and capability.
date-created: 2026-04-30
type: note
name: workflow-task-decomposition
keywords:
  - task-decomposition
  - procedure-task
  - agent-dispatch
  - subtask
  - coordinator-dispatch
  - work-type
specialization: plan
horizon: week
work-type: procedure
serves: [operations-loop, dispatch]
depends-on: [operational-records-as-dag, dispatch-graph-completion]
contributes-to: [agentic-orchestration]
produces: dispatchable-procedure-tasks-via-decomposition
status: draft
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

A procedure-type task with multiple required capabilities cannot be dispatched to a single agent — by definition it is conditional and composite. The library's `task.md` already says this: "A task can contain any of the four work types. A task with conditional subtasks is a procedure." But the operational records don't capture the subtask structure as queryable data.

The fix: procedure tasks declare `subtasks:` — an ordered (or DAG-structured) list of atomic work-type tasks. Each subtask has its own `work-type`, `requires-capabilities`, `assigned-to`. Dispatch of the parent procedure is dispatch-to-coordinator (planner or first-officer) who emits the subtasks; dispatch of subtasks proceeds normally.

Concrete: `achievement-system` (work-type: procedure, requires writing+review) decomposes as:

```
achievement-system (procedure, owned by harness-optimizer)
├─ design-achievement-data-model (derivation, architect)
├─ implement-achievement-trigger-hook (procedure, harness-optimizer)
├─ review-achievement-implementation (derivation, code-reviewer)
└─ document-achievement-system (process, doc-updater)
```

Each of the four subtasks dispatches to a single agent matching its atomic work-type and capability.

## Tasks

- `workflow-add-subtasks-field-to-task-term` — extend `library/.../work/terms/task.md` to define `subtasks:` schema and document the parent-as-coordinator pattern
- `workflow-decompose-achievement-system-task` — convert `achievement-system` from a single task with `requires: [writing, review]` to a parent with 4 subtasks
- `workflow-update-dispatch-script-for-procedures` — when a task has work-type=procedure AND subtasks, dispatch returns the coordinator agent + the next-ready subtask
- `workflow-audit-existing-procedure-tasks-for-decomposition` — sweep the 200+ procedure-typed tasks; flag those that need explicit subtasks vs. those that are atomic procedures (e.g., "run-cargo-build" is procedure but atomic)
- `workflow-document-task-vs-plan-boundary` — add a section to the task term explaining when something is a task-with-subtasks vs. a plan-with-tasks (currently fuzzy)

## Acceptance

- `dispatch.py achievement-system` returns the coordinator + first ready subtask, not "0 eligible agents"
- The task term in the library has a `subtasks:` field documented with example
- At least 5 existing procedure-tasks in the corpus are decomposed into explicit subtasks
