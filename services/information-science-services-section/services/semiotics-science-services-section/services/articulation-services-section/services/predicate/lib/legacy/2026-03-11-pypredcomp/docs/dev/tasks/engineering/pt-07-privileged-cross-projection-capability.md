---
kind: task
title: "pt-07 — privileged-cross-projection capability spec"
description: "The capability cell that licenses a respond authored under projection P_1 to read the operating boundary's P_2 sub-fiber."
slug: task:pt-07-privileged-cross-projection-capability
of-goal: goal:v0.2a-multi-user-authoring
of-milestone: milestone:v0.2a-multi-user-single-node
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
horizon: doing
gates: t02-125
migrated-from: tasks/project-tasks.md#pt-07
migrated-at: 2026-05-03
---

# pt-07 — privileged-cross-projection capability spec

## Owning records

- Milestone: [milestones/v0.2a-multi-user-single-node.md](../../milestones/v0.2a-multi-user-single-node.md).
  Security slice.
  The implementation task already exists as `t02-125` per the superseded [milestones/v0.2-os-class.md](../../milestones/v0.2-os-class.md).
  This entry tracks the *spec* obligation that gates `t02-125`.
- Goal: [goals/v0.2a-multi-user-authoring.md](../../goals/v0.2a-multi-user-authoring.md).
- Owning spec: [specs/security/persona-and-personnel.md](../../specs/security/persona-and-personnel.md) (already cited in `t02-125`) plus a new dedicated spec [specs/security/privileged-cross-projection.md](../../specs/security/privileged-cross-projection.md) (to be written).

## Grounding

[`identity-is-boundary-projection`](../../decisions/identity-is-boundary-projection.md) and [`authorization-is-modal-restriction`](../../decisions/authorization-is-modal-restriction.md).
The capability is a $\Box_R$-restriction that licenses a respond authored under projection $P_1$ to read the operating boundary's $P_2$ sub-fiber; the capability cell carries the source projection, target projection, and licensing scope.

## Description

OPEN-SPEC.
Spec must pin:

- The capability's cell shape.
- The audit cell emitted on every cross-projection read (per [specs/security/tool-risk-scoring.md](../../specs/security/tool-risk-scoring.md)).
- The `PCB_PRIVACY_PROJECTION_VIOLATION` error path.
- The failure mode when the capability is missing.

## Acceptance

- New spec [specs/security/privileged-cross-projection.md](../../specs/security/privileged-cross-projection.md) is normative.
- v0.2a ship target adds a dedicated ship item: persona-projected respond reading operating-boundary state without the capability returns the documented error.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-07-privileged-cross-projection-capability, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-07-privileged-cross-projection-capability, horizon, doing, true)` — recorded 2026-05-03 on migration.
