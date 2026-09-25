---
name: Failed
description: "A unit of work whose goal has become impossible or was not achieved — the terminal state of unsuccessful work."
instance-of: state
state-of: [task]
precedes: null
next-via: null
follows: in-progress
follows-via: [fail, timeout, error]
can-become: []
terminal: true
contributes-to-whole: incomplete
date-created: 2026-04-06
---

Failed is the terminal state of unsuccessful [work](work.md).
The [task](task.md)'s goal became impossible or was not achieved.
Unlike [blocked](blocked.md), failed is terminal — the work will not resume.

A failed part contributes `incomplete` to its container.
A [plan](plan.md) with a failed task may itself fail (if the task was necessary) or may continue (if the task was not on the critical path and the plan can adapt).
Whether plan failure follows from task failure depends on the plan's structure, not on a propagation rule.

If the work needs to be retried, a new task is created.
The failed task remains as a record (per Policy 005: accrete, don't replace) and as a source of learning (per the continuous learning pipeline).
