---
kind: task
title: "pt-05 — Tier-2 model registry lookup spec"
description: "Deterministic resolution from (predicate-signature, sender-fiber-capacity) to model-record:<id>; substrate-resident registry cell shape; supersession discipline."
of-goal: goal:v0.2b-stdlib-and-dispatch-shell
of-milestone: milestone:v0.2b-drivers-observability-packaging
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
horizon: soon
folds-into: t02-203
migrated-from: tasks/project-tasks.md#pt-05
migrated-at: 2026-05-03
---


## Owning records

- Milestone: [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md).
  Tracked under v0.2b as task family `t02-203` (renumbered from the obsolete combined-plan ID `t02-200`); the numbering collision between the superseded combined plan ([milestones/v0.2-os-class.md](../../milestones/v0.2-os-class.md)) and v0.2b is recorded here.
- Goal: [goals/v0.2b-stdlib-and-dispatch-shell.md](../../goals/v0.2b-stdlib-and-dispatch-shell.md).
- Owning spec: [specs/scheduling/tier-routing.md](../../specs/scheduling/tier-routing.md) §"registry lookup" (to be added) plus [specs/agential/non-lm-models.md](../../specs/agential/non-lm-models.md) §"registry lookup contract".

## Grounding

[`cheapest-sufficient-computation-tier`](../../decisions/cheapest-sufficient-computation-tier.md) and the `agential-orchestration-platform` theory's dispatch surface.
The registry is the Tier-2 analogue of the office × task dispatch table at Tier 1.

## Description

OPEN-SPEC.
The spec must answer:

- Deterministic resolution from `(predicate-signature, sender-fiber-capacity)` to `model-record:<id>`.
- Substrate-resident registry cell shape.
- Supersession discipline.

Implementation owned by the v0.8 invocation surface (`t08-40` / `t08-41`); the spec is a v0.2b precondition because the registry cell shape must be stable before any Tier-2 invocation can be replayed.

## Acceptance

- Spec section authored and normative in `specs/scheduling/tier-routing.md` and `specs/agential/non-lm-models.md`.
- Fixture deliverable: `tests/fixtures/tier-routing/registry-lookup.jsonl` per the v0.2-os-class fixture-deliverables table.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-05-tier2-model-registry-lookup, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-05-tier2-model-registry-lookup, horizon, soon, true)` — recorded 2026-05-03 on migration.
