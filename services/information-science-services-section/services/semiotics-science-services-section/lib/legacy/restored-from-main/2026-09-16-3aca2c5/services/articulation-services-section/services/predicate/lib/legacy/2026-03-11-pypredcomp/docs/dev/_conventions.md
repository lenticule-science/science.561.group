---
title: "Dev-project conventions"
description: "Where records go and what status/horizon fields mean. Authoritative schema lives in specs/work-orchestration/."
kind: conventions
status: active
opened: 2026-05-03
authority: "specs/work-orchestration/"
---

# Conventions

Where records go and what their `status` and `horizon` mean.
The full per-record schema lives in [`specs/work-orchestration/`](specs/work-orchestration/); use the `fars-work-*` skills to create or update records — they enforce it.

## Hierarchy

```
objective → campaign → milestone → goal → task
```

| Dir | Kind | What it is |
|---|---|---|
| [objectives/](objectives/) | `objective` | Multi-year outcomes (one: "run the 561 group's OS"). |
| [campaigns/](campaigns/) | `campaign` | Multi-month initiatives (`ship-pypredcomp`). |
| [milestones/](milestones/) | `milestone` | One per OS release, v0.1 → v1.0. |
| [goals/](goals/) | `goal` | Outcomes under a milestone. |
| [tasks/&lt;area&gt;/](tasks/) | `task` | Leaf executable units. `<area>` ∈ {engineering, research, governance, operational, personnel, financial, external}. |
| [backlog/&lt;horizon&gt;/](backlog/) | `task` | Tasks not currently scheduled. |

## Status (lifecycle)

| Kind | Allowed values |
|---|---|
| `task` | `open \| dispatched \| in-progress \| blocked \| review \| done \| abandoned` |
| `goal` | `planning \| active \| partially-met \| met \| abandoned` |
| `milestone` | `planning \| active \| blocked \| completed \| cancelled` |
| `campaign` | `planning \| active \| paused \| completed \| cancelled` |
| `objective` | `planning \| active \| partially-met \| met \| abandoned` |

Supersession is a `superseded-by:` pointer alongside a terminal status (`cancelled` for milestones, `abandoned` otherwise).
`superseded` is not a status value.

Lifecycle transitions for tasks are validated per [specs/work-orchestration/task.md](specs/work-orchestration/task.md) §2 — the same table the [`fars-work-advance-task-state`](../../../../../../../.agents/skills/fars-work-advance-task-state/SKILL.md) skill enforces.

## Horizon (scheduling)

Orthogonal to status.
`status` is where in the lifecycle; `horizon` is when it's scheduled.

| Horizon | Meaning | Lives under |
|---|---|---|
| `doing` | committed and in-flight | `tasks/<area>/` |
| `soon` | next-milestone candidate | `tasks/<area>/` if owned, `backlog/soon/` if unowned |
| `later` | 3–9 months out | `backlog/later/` |
| `captured` | ≥9 months out | `backlog/captured/` |
| `done` / `abandoned` | terminal, kept as record | `backlog/done/` or `backlog/abandoned/` |

A task with horizon `later`/`captured`/`done`/`abandoned` lives under `backlog/<horizon>/`, not `tasks/<area>/`.

Active cadence at 2026-05: **v0.2a (~3 weeks) → v0.2b (~4 weeks after v0.2a ships)**.
Everything from v0.3 on is `later` or `captured`.

## Task body

Three required sections per [specs/work-orchestration/task.md](specs/work-orchestration/task.md) §1:

- `## Description` — what it is and why; cite the owning spec and any decision it depends on.
- `## Acceptance` — checklist for `status: done`.
- `## Progress cells` — chronological predcat-aware `(s, p, o, v)` observations per [specs/work-orchestration/progress-tracking.md](specs/work-orchestration/progress-tracking.md).

## Tooling

`fars-work-*` is the authoritative scaffold and update surface: `open-{objective,campaign,milestone,goal,task}`, `advance-task-state`, `block-task`, `unblock-task`, `assign-task`, `record-progress-cell`, `rollup-progress`.
See [`.agents/skills/fars-work-*`](../../../../../../../.agents/skills/).
