---
title: "Add jurisdiction filter to dispatch.py"
specialization: task
date-created: 2026-04-30
plan: dispatch-script-evolution
status: open
work-type: procedure
priority: 1
requires-capabilities: [code-edit, dispatch]
touches: [operations/engineering/triage/operations/engineering/services/dispatch/triage/dispatch.py]
---

Add a function `task_in_jurisdiction(task, agent)` that compares the task's target paths (from `touches:`, falling back to `produces:`) against `agent.jurisdiction.write`.
A task that writes to a path outside an agent's write jurisdiction is rejected with a specific reason citing the jurisdictional gap.

Acceptance: a task touching `library/` is rejected for an agent whose write jurisdiction is `.claude/` only; the rejection reason names the conflict.
