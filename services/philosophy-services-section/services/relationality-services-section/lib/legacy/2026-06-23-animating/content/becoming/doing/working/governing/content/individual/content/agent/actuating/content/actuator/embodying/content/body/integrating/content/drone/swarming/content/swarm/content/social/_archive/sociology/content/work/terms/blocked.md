---
title: Blocked
description: "A unit of work that cannot proceed because a precondition is unmet — a dependency is incomplete, a resource is unavailable, or an external condition prevents progress."
defines: blocked
instance-of: state
state-of: [task, plan]
precedes: [open, abandoned]
next-via: [unblock, resolve]
follows: [open, in-progress]
follows-via: [block, dependency-fails]
can-become: [open, abandoned]
contributes-to-whole: incomplete
date-created: 2026-04-06
---

Blocked is the state of a unit of [work](./work.md) that cannot proceed.
Something it [depends on](../../../../philosophy/terms/relation.md) is not yet met — another task is incomplete, a resource is unavailable, an external condition prevents progress.

Blocked can follow either [open](./open.md) (a task that was available but became blocked when a dependency regressed) or [in-progress](./in-progress.md) (work that was underway but hit an obstacle).
It precedes [open](./open.md) — when the blocking condition resolves, the task returns to open.
The transition happens when the dependency is met, which is itself a settlement event: the depended-on entity reaching [completed](./completed.md) settles the blocker.

When a task is blocked, its container (the [plan](./plan.md) it is part-of) may also become blocked — but only if the blocked task is on the critical path.
A plan with one blocked task and nine open tasks is not itself blocked; it has available work.
