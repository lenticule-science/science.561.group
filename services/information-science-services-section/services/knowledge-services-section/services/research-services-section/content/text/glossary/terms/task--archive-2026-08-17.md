---

specialization:
  - command-term
  - task
  - library/domains/humanities/domains/sociology/domains/work/terms/task.md
description: "How a command structure uses a task — the operational predicates a task carries beyond its library definition."
defines: task
status-values: [open, in-progress, blocked, completed, failed, abandoned, archived]
assigned-to-takes: office
work-type-takes: [inquiry, derivation, procedure, process]
department-takes: [command, science, engineering]
plan-takes: plan
depends-on-takes: task
produces-takes: [term, text, function, tool, record]
requires-takes: [term, tool, capability]
contributes-to-milestone-takes: milestone
date-created: 2026-04-12
---

A task in a command context carries the library definition's predicates (status, priority, goal, requires-concepts) plus operational predicates: who it's assigned to, what plan it belongs to, what it depends on, what it produces, and which milestone it contributes to.

The `task-done` predicate records completion date. It is distinct from `status: completed` — `task-done` is the timestamp, `status` is the state. A task can be `completed` without a recorded `task-done` (historical gap) or have a `task-done` while status is still `in-progress` (recording error to fix).

The `plan` predicate names the plan this task belongs to by slug. Every task belongs to exactly one plan. A task without a plan is orphaned — it exists but has no home in the work hierarchy.
