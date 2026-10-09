---
name: dispatch-add-plan-topological-sort
specialization: task
date-created: 2026-04-30
plan: dispatch-script-evolution
status: open
work-type: procedure
priority: 2
requires-capabilities: [code-edit, dispatch]
touches: [operations/engineering/triage/operations/engineering/services/dispatch/triage/dispatch.py]
aliases:
  - Add plan-topological-sort to dispatch.py
title: dispatch-add-plan-topological-sort
description: "Add dispatch.py --plan <plan-id>: walks all tasks where plan: <plan-id>, builds the depends-on DAG, returns the topological order with current-status annotation per task."
---

Add `dispatch.py --plan <plan-id>`: walks all tasks where `plan: <plan-id>`, builds the depends-on DAG, returns the topological order with current-status annotation per task.
Highlight the critical path (longest chain through the graph).

Acceptance: `dispatch.py --plan ops-dispatch-stage` produces a valid topological ordering with status annotations; tasks with cycles surface as errors.
