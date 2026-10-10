---
kind: task
title: "pt-13 — First batch of operational skill packs against the new manifest contract"
description: "Identify the minimum set of skills needed by the v0.2b operations + observability + governance work; author them under .local/skills/ and operations/engineering/skills/; each conforms to the v1 schema; each survives lint-skills."
of-goal: goal:v0.2b-stdlib-and-dispatch-shell
of-milestone: milestone:v0.2b-drivers-observability-packaging
kind-of-task: operational
status: open
owned-by-office: office:engineering
assigned-to-personnel: null
priority: 3
estimated-effort-hours: null
actual-effort-hours: null
deadline-by-ord: null
depends-on-tasks: []
area: operational
horizon: soon
folds-into: t02-205
migrated-from: tasks/project-tasks.md#pt-13
migrated-at: 2026-05-03
---


## Owning records

- Milestone: [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md).
  Stdlib slice.
- Goal: [goals/v0.2b-stdlib-and-dispatch-shell.md](../../goals/v0.2b-stdlib-and-dispatch-shell.md).
- Owning spec: [specs/stdlib/skill-manifest.md](../../specs/stdlib/skill-manifest.md) and [specs/agential/skill-registry.md](../../specs/agential/skill-registry.md).
  Schema: `boot/schemas/skill-spec-v1.schema.json` per `t02-23`.

## Grounding

[`skills-have-manifest-contracts`](../../decisions/skills-have-manifest-contracts.md).
The "first batch" is content authoring (a set of `SKILL.md` files), not protocol design; the protocol ships at `t02-22..
24`.

## Description

v0.2b takes task family `t02-205` (operational skill-pack first batch):

- Identify the minimum set of skills needed by the v0.2b operations + observability + governance work (a working list lives in [references/triage-backlog-os-level.md](../../references/triage-backlog-os-level.md) and [implementation/python.md](../../implementation/python.md)).
- Author them under `.local/skills/` and `operations/engineering/skills/`.
- Each conforms to the v1 schema.
- Each survives `lint-skills` (the v0.6 `t06-25` machinery, available out-of-band as a Python script before v0.6 ships).

Output is a substrate cell stream installed by `build-skill-manifest` at runlevel 2.

## Acceptance

- The minimum viable set is enumerated and authored.
- Each pack passes `lint-skills` with no errors.
- `build-skill-manifest` aggregates them at runlevel 2.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-13-operational-skill-packs-first-batch, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-13-operational-skill-packs-first-batch, horizon, soon, true)` — recorded 2026-05-03 on migration.
