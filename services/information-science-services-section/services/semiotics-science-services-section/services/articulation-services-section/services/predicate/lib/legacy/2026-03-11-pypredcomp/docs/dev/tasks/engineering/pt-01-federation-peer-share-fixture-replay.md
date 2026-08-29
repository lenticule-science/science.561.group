---
kind: task
title: "pt-01 — Federation peer-share fixture-replay surface"
description: "Two substrates seeded from disjoint fixture slices reach byte-identical fibers after ⊙-merging each other's event log. The v0.2-shaped surrogate for live peering. Wire format ships at v0.4."
slug: task:pt-01-federation-peer-share-fixture-replay
of-goal: goal:v0.2b-network-stubs
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
folds-into: t02-202
fixture-pair: t02-202f
migrated-from: tasks/project-tasks.md#pt-01
migrated-at: 2026-05-03
---

# pt-01 — Federation peer-share fixture-replay surface

## Owning records

- Milestone: [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md).
  Network-stubs slice; full federation lives in [milestones/v0.4-federation.md](../../milestones/v0.4-federation.md).
- Goal: [goals/v0.2b-network-stubs.md](../../goals/v0.2b-network-stubs.md).
- Owning specs: [specs/network/federation-protocol.md](../../specs/network/federation-protocol.md) (currently a stub per [decisions/network-spec-defer-until-implementer-named.md](../../decisions/network-spec-defer-until-implementer-named.md)) and [specs/ipc/fed-merge-as-ipc.md](../../specs/ipc/fed-merge-as-ipc.md).

## Grounding

[`distributed-coordination-platform`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/distributed-coordination-platform/README.md) — fixture-replay is the v0.2-shaped surrogate for live peering, deriving from the platform's witness-replay discipline.
Federation algebra is grounded in [`federation-by-construction`](../../decisions/federation-by-construction.md) (citing the $\odot$-merge confluence theorem).

## Description

v0.2b extends [`tests/conformance/test_fixture_replay.py`](../../../../tests/conformance/test_fixture_replay.py) with a peer-share variant: two substrates seeded from disjoint fixture slices reach byte-identical fibers after $\odot$-merging each other's event log.
No wire format is shipped at v0.2; that is the v0.4 work owned by `t04-01`/`t04-03`.

## Plan-slice tag

v0.2b owns this as task family `t02-202` (federation-peer-share fixture-replay surface), paired with `t02-202f` per the fixture-authoring-paired-task discipline.

## Acceptance

- The peer-share fixture-replay test exists, runs in CI, and demonstrates byte-identical fiber convergence after cross-merge of two disjoint fixture slices.
- Conformance vectors document the fixture's expected outputs.
- Paired fixture `t02-202f` is authored alongside per [decisions/fixture-authoring-paired-task.md](../../decisions/fixture-authoring-paired-task.md).

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-01-federation-peer-share-fixture-replay, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-01-federation-peer-share-fixture-replay, horizon, soon, true)` — recorded 2026-05-03 on migration.
