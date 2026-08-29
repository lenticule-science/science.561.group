---
kind: task
title: "pt-02 — Per-stratum capability fiber so retraction can carry authority"
description: "A retraction asserts ⊥_t at a given stratum; the capability that licensed it must be addressable at that stratum so audit can answer 'by what authority was this saturated cell retracted?'."
slug: task:pt-02-per-stratum-capability-fiber-retraction
of-goal: goal:v0.2a-kernel-frozen
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
folds-into: t02-126
fixture-pair: t02-126f
migrated-from: tasks/project-tasks.md#pt-02
migrated-at: 2026-05-03
---

# pt-02 — Per-stratum capability fiber so retraction can carry authority

## Owning records

- Milestone: [milestones/v0.2a-multi-user-single-node.md](../../milestones/v0.2a-multi-user-single-node.md).
  Capability fibers slice.
- Goal: [goals/v0.2a-kernel-frozen.md](../../goals/v0.2a-kernel-frozen.md).
- Owning spec: extension to [specs/security/capability-model.md](../../specs/security/capability-model.md) and cross-link in [specs/kernel/stratified-facts.md](../../specs/kernel/stratified-facts.md) §"capability stratum tag".

## Grounding

Predicated-computing theory's [`authorization-is-modal-restriction`](../../decisions/authorization-is-modal-restriction.md) and [`regime-classification-is-load-bearing`](../../decisions/regime-classification-is-load-bearing.md).
A retraction asserts $\bot_t$ at a given stratum; the capability that licensed it must be addressable at *that* stratum so audit can answer "by what authority was this saturated cell retracted?".
The current `authorization.py` $\Box_R$ evaluator is stratum-agnostic; the per-stratum projection lives one functor over.

## Description

OPEN-SPEC. v0.2a takes a new task family `t02-126` (per-stratum capability fiber): extend the boundary projection per [specs/security/user-as-boundary.md](../../specs/security/user-as-boundary.md) §4 with a `at-stratum` parameter; thread it through `respond` Phase 2 (capability check); record the licensing capability's stratum on every retraction-emit `audit-log` cell per [specs/security/tool-risk-scoring.md](../../specs/security/tool-risk-scoring.md) §3.

## Acceptance

- `boundary` projection accepts an `at-stratum` parameter.
- `respond` Phase 2 capability check threads the stratum.
- Retraction-emit `audit-log` cells record the licensing capability's stratum.
- Paired fixture `t02-126f` covers the retract-at-saturated and retract-at-settled paths.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-02-per-stratum-capability-fiber-retraction, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-02-per-stratum-capability-fiber-retraction, horizon, doing, true)` — recorded 2026-05-03 on migration.
