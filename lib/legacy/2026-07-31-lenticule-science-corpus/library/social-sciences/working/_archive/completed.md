---
title: Completed
description: "A unit of work whose goal has been achieved — the terminal state of successful work."
instance-of: state
state-of: [task, plan, project]
precedes: null
next-via: null
follows: in-progress
follows-via: [finish, complete, done]
can-become: []
terminal: true
contributes-to-whole: complete
date-created: 2026-04-06
---

Completed is the terminal state of successful [work](./work.md). The [task](./task.md)'s goal has been achieved. No further action is needed or possible on this unit of work.

When a task reaches completed, the [part-of](../../../../philosophy/terms/relation.md) relation entails consequences for the whole: a completed part contributes `complete` to its container. When ALL parts of a [plan](./plan.md) are completed, the plan's state is constituted as completed — not by notification but by the mereological fact that the whole is constituted by its parts.

Completed follows [in-progress](./in-progress.md) via an act of finishing. It is terminal — `can-become` is empty. A completed task cannot reopen. If the work needs to be redone, a NEW task is created (per Policy 005: accrete, don't replace).
