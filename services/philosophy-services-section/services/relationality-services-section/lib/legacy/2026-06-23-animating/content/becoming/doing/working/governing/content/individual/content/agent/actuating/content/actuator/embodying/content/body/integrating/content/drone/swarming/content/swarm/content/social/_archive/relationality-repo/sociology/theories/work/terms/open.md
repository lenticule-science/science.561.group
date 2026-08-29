---
extends: state
title: Open
description: "A unit of work that is available to begin — its preconditions are met but no agent has started acting on it."
defines: open
instance-of: state
state-of: [task, plan]
precedes: in-progress
next-via: [begin, assign, start]
follows: null
can-become: [in-progress, blocked, abandoned]
contributes-to-whole: not-yet-complete
date-created: 2026-04-06
---

Open is the state of a unit of [work](./work.md) whose preconditions are met but which no agent has begun.
An open [task](./task.md) is available — it can be picked up.
An open [plan](./plan.md) has been adopted but no tasks within it are active.

Open follows from either initial creation (a new task starts open) or from unblocking (a previously [blocked](./blocked.md) task whose dependencies are now met returns to open).
Open precedes [in-progress](./in-progress.md) — the transition happens when an [act](../../../../philosophy/terms/act.md) of beginning occurs.
