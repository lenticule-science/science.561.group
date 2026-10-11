---
kind: task
title: "pt-09 — Decide: inbox as top-level OS surface vs. per-session widget"
description: "Captain's choice gates the v0.3 inbox UI work (t03-90, t03-91). v0.2a inter-session-messaging plumbing (t02-140..145) is unaffected."
of-goal: goal:v0.2a-multi-user-authoring
of-milestone: milestone:v0.2a-multi-user-single-node
kind-of-task: governance
status: blocked
blocker: "questions/inbox-as-os-surface-vs-widget.md"
owned-by-office: office:captain
assigned-to-personnel: null
priority: 3
estimated-effort-hours: null
actual-effort-hours: null
deadline-by-ord: null
depends-on-tasks: []
area: governance
horizon: doing
gates: "t03-90, t03-91"
migrated-from: tasks/project-tasks.md#pt-09
migrated-at: 2026-05-03
---


## Owning records

- Open question: [questions/inbox-as-os-surface-vs-widget.md](../../questions/inbox-as-os-surface-vs-widget.md).
  Captain's choice between "inbox is its own OS-level shell surface (route `/inbox`, focusable independently of any session)" and "inbox is a per-session widget rendered in `/sessions/<id>/inbox` only" gates the v0.3 inbox UI work (`t03-90`, `t03-91`).
- v0.2a inter-session-messaging plumbing (`t02-140..
  145`) is unaffected.

## Description

Captain's choice gates the v0.3 inbox UI work (t03-90, t03-91). v0.2a inter-session-messaging plumbing (t02-140..
145) is unaffected.

## Status

`blocked` — awaiting captain decision on the open question.
No implementation task.

## Acceptance

- Captain decision recorded under [decisions/](../../decisions/).
- Owning question file marked `resolved` with forward pointer to the new decision.
- Downstream tasks `t03-90` / `t03-91` unblocked.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-09-inbox-os-surface-vs-widget, status, blocked, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-09-inbox-os-surface-vs-widget, horizon, doing, true)` — recorded 2026-05-03 on migration.
