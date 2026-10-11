---
kind: task
title: "pt-11 — GitHub Issues round-trip conformance fixture"
description: "Already owned by t04-51; closed as done. Fixture path: tests/fixtures/drivers/github-issues-round-trip.jsonl. Cross-language replay (Python and Rust) is a stated ship condition."
of-goal: goal:v0.4-federate-two-nodes
of-milestone: milestone:v0.4-federation
kind-of-task: engineering
status: done
owned-by-office: office:engineering
assigned-to-personnel: null
priority: 3
estimated-effort-hours: null
actual-effort-hours: null
deadline-by-ord: null
depends-on-tasks: []
area: engineering
horizon: done
folds-into: t04-51
migrated-from: tasks/project-tasks.md#pt-11
migrated-at: 2026-05-03
---


## Owning records

- Milestone: [milestones/v0.4-federation.md](../../milestones/v0.4-federation.md).
  External-system drivers — already exists as `t04-51`.
- Goal: [goals/v0.4-federate-two-nodes.md](../../goals/v0.4-federate-two-nodes.md).
- Owning spec: [specs/conformance-vectors.md](../../specs/conformance-vectors.md) (the round-trip vector) and [specs/drivers/github-issues-driver.md](../../specs/drivers/github-issues-driver.md).

## Grounding

[`external-systems-get-drivers-peers-get-federation`](../../decisions/external-systems-get-drivers-peers-get-federation.md) and the driver-model spec.

## Description

CLOSED — owned by `t04-51`.
Fixture path: `tests/fixtures/drivers/github-issues-round-trip.jsonl`.
Cross-language replay (Python and Rust) is a stated ship condition.
This entry confirms the project task is owned by an existing v0.4 task family and no extension is needed.

## Status

`done` — work owned by `t04-51`; this entry is the records-only confirmation.

## Acceptance

Met on migration; this record is the records-only confirmation.

- The conformance fixture exists at `tests/fixtures/drivers/github-issues-round-trip.jsonl` per the v0.4 driver-model ship target.
- Cross-language replay (Python and Rust) is a stated ship condition for the owning task `t04-51`.
- The work is owned by an existing v0.4 task family (`t04-51`); no extension is needed.
- See [`milestones/v0.4-federation.md`](../../milestones/v0.4-federation.md) §"External-system drivers" for the ship-target context.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-11-github-issues-round-trip-fixture, status, done, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-11-github-issues-round-trip-fixture, horizon, done, true)` — recorded 2026-05-03 on migration.
