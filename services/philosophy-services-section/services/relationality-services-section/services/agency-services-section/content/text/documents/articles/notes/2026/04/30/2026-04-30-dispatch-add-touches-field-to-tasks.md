---
name: dispatch-add-touches-field-to-tasks
specialization: task
date-created: 2026-04-30
plan: dispatch-script-evolution
status: open
work-type: derivation
priority: 1
requires-capabilities: [writing, taxonomy]
produces: tasks-with-jurisdiction-data
aliases:
  - Add touches field to tasks for jurisdiction matching
title: dispatch-add-touches-field-to-tasks
description: Sweep tasks under texts/tasks/.
---

Sweep tasks under `texts/tasks/`.
For each, infer the path(s) the task touches: prefer an explicit `touches: [paths]`, fall back to `produces:` if it names a path, fall back to body content scanning for path patterns.
Where a value is ambiguous, leave the field absent rather than guess.

Acceptance: at least 100 tasks have a `touches:` field; the dispatch jurisdiction filter (per `dispatch-add-jurisdiction-filter`) produces meaningful narrowing on these tasks.
