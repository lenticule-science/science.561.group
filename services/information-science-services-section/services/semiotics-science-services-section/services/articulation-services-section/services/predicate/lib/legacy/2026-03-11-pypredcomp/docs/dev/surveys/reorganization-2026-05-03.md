---
title: "Dev-project reorganization — 2026-05-03"
description: "Audit record of the 2026-05-03 reorganization that moved this dev project from a flat plans/ + project-tasks.md ledger into the work-orchestration scaffold (objectives, campaigns, milestones, goals, tasks, backlog by horizon)."
kind: audit
opened: 2026-05-03
authority: "specs/work-orchestration/"
---

# Dev-project reorganization — 2026-05-03

On 2026-05-03 the dev project was migrated from a flat `plans/v0.
X-*.md` + `project-tasks.md` ledger into the work-orchestration scaffold defined in [`specs/work-orchestration/`](../specs/work-orchestration/).
This audit records what moved and how the new structure is laid out.

## New structure

```
objectives/   campaigns/   milestones/   goals/   tasks/<area>/   backlog/<horizon>/
```

Per [_conventions.md](../_conventions.md):

- `objectives/` — multi-year outcomes (one: "run the 561 group's OS").
- `campaigns/` — multi-month initiatives (`ship-pypredcomp`).
- `milestones/` — one per OS release v0.1 → v1.0.
- `goals/` — outcomes under a milestone.
- `tasks/<area>/` — leaf executable units, owned (`of-goal` + `of-milestone`), horizon `doing` or `soon`.
- `backlog/<horizon>/` — items with `horizon: later \| captured \| done \| abandoned`, regardless of ownership.

## What moved

| Old location | New location |
|---|---|
| `plans/v0.1-substrate-boots.md` | [`milestones/v0.1-substrate-boots.md`](../milestones/v0.1-substrate-boots.md) |
| `plans/v0.2a-multi-user-single-node.md` | [`milestones/v0.2a-multi-user-single-node.md`](../milestones/v0.2a-multi-user-single-node.md) |
| `plans/v0.2b-drivers-observability-packaging.md` | [`milestones/v0.2b-drivers-observability-packaging.md`](../milestones/v0.2b-drivers-observability-packaging.md) |
| `plans/v0.2-os-class.md` | [`milestones/v0.2-os-class.md`](../milestones/v0.2-os-class.md) (`status: superseded`) |
| `plans/v0.3` … `plans/v1.0` | [`milestones/v0.3` … `milestones/v1.0`](../milestones/) |
| `plans/research-sidebar.md` | [`milestones/research-sidebar.md`](../milestones/research-sidebar.md) |
| `tasks/project-tasks.md` (flat ledger) | per-task records under [`tasks/<area>/`](../tasks/) |

The `plans/` directory has been deleted.
Inbound references should point at `milestones/`.

## Active cadence

**v0.2a (~3 weeks) → v0.2b (~4 weeks after v0.2a ships).** Everything from v0.3 on is `later` or `captured` until v0.2a ships.

## Boundaries

- `tasks/admin/` (sysadmin runbooks, `kind: runbook`) and `tasks/mining/` (triage-lifting tasks) predate the work-orchestration scaffold and are excluded from strict work-graph audits.
- `surveys/` continues to hold periodic state-of-the-project audits including this one.
