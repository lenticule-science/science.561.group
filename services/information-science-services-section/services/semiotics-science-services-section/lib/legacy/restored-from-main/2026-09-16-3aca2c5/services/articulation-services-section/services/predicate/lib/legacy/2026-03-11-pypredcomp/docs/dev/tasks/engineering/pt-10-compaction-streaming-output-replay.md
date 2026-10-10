---
kind: task
title: "pt-10 — Compaction-on-archive ↔ streaming-output replay interaction spec"
description: "Which stream-chunk cells survive compaction, replay-equivalence guarantee for subscribed shells, and the failure-mode error code if a subscriber requests a chunk-seq that fell off compaction."
of-goal: goal:v0.2a-kernel-frozen
of-milestone: milestone:v0.2a-multi-user-single-node
kind-of-task: engineering
status: blocked
blocked-from-status: open
blocked-by: "Depends on compaction shape, blocked by pt-04."
owned-by-office: office:engineering
folds-into: t02-117
fixture-pair: t02-117f
---


## Owning records

- Milestone: [milestones/v0.2a-multi-user-single-node.md](../../milestones/v0.2a-multi-user-single-node.md).
  Process + kernel boundary.
- Goal: [goals/v0.2a-kernel-frozen.md](../../goals/v0.2a-kernel-frozen.md).
- Owning spec: new section in [specs/process/session-output-streaming.md](../../specs/process/session-output-streaming.md) §"Interaction with compaction" plus cross-link in pt-04's compaction spec.

## Grounding

Same presheaf-stratum grounding as [pt-04](pt-04-stratum-preserving-compaction.md) plus [`session-output-streams-over-websocket`](../../decisions/session-output-streams-over-websocket.md).
Streaming chunks are `stream-chunk` cells in the event log; the chunk-seq ordering must survive compaction so subscribers reconstructing scrollback see exit reasons in the right order.

## Description

OPEN-SPEC.
Spec must pin:

- Which `stream-chunk` cells survive compaction (the exit-reason `stream-end` cell always; intermediate chunks per a configurable retention predicate).
- The replay-equivalence guarantee (subscribed shells see the same logical chunk sequence whether replaying from raw or compacted log).
- The failure-mode error code if a subscriber requests a chunk-seq that fell off compaction.

## Acceptance

- Spec section authored and normative.
- v0.2a takes task family `t02-117`, paired fixture `t02-117f`.
