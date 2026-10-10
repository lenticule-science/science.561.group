---
kind: task
title: "pt-14 — Per-agent skill scope projection spec"
description: "Cell shape for (agent:<id>, skill-scope, <projection-spec>) = t; composes with select-skill-for-task; tie-breaking remains lexicographic on skill-name for replay determinism."
of-goal: goal:v0.8-agential-runtime
of-milestone: milestone:v0.8-agential-layer
kind-of-task: engineering
status: open
owned-by-office: office:engineering
assigned-to-personnel: null
priority: 3
estimated-effort-hours: null
actual-effort-hours: null
deadline-by-ord: null
depends-on-tasks: []
area: engineering
horizon: captured
folds-into: t08-49c
migrated-from: tasks/project-tasks.md#pt-14
migrated-at: 2026-05-03
---


## Owning records

- Milestone: [milestones/v0.8-agential-layer.md](../../milestones/v0.8-agential-layer.md).
  Skill registry consumption slice.
  Currently deferred per `t08-49b` ("per-agent projection-axis manifest fragments remain deferred"); this entry promotes the deferred slice into a tracked v0.8 spec deliverable.
- Goal: [goals/v0.8-agential-runtime.md](../../goals/v0.8-agential-runtime.md).
- Owning spec: new section in [specs/agential/skill-registry.md](../../specs/agential/skill-registry.md) §"Per-agent scope projection" plus cross-link in [specs/security/persona-and-personnel.md](../../specs/security/persona-and-personnel.md).

## Grounding

[`identity-is-boundary-projection`](../../decisions/identity-is-boundary-projection.md) and the agential-orchestration-platform's office × agent dispatch surface.
The per-agent projection restricts the candidate skill set to the intersection of (office permits-tier × agent capability fiber × agent skill-affinity); it is a presheaf restriction over the agent's projection plane.

## Description

OPEN-SPEC. v0.8 takes task family `t08-49c`: spec defines the `(agent:<id>, skill-scope, <projection-spec>) = t` cell shape; the projection composes with `select-skill-for-task` per [specs/agential/skill-registry.md](../../specs/agential/skill-registry.md) §6; tie-breaking remains lexicographic on `skill-name` for replay determinism.
No source change at v0.2; spec gates the v0.8 implementation.

## Acceptance

- Spec section authored and normative.
- Composes with `select-skill-for-task` per §6.
- Tie-breaking remains lexicographic on `skill-name`.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-14-per-agent-skill-scope-projection, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-14-per-agent-skill-scope-projection, horizon, captured, true)` — recorded 2026-05-03 on migration.
