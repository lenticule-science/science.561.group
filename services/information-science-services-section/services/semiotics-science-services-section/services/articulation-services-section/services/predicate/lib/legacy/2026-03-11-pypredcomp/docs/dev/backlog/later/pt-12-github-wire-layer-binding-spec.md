---
kind: task
title: "pt-12 — GitHub REST + webhooks wire-layer binding spec"
description: "REST resources, webhook event types, HMAC-SHA-256 signature verification, rate-limit handling, replay-idempotency keyed on X-GitHub-Delivery."
slug: task:pt-12-github-wire-layer-binding-spec
of-goal: goal:v0.4-federate-two-nodes
of-milestone: milestone:v0.4-federation
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
horizon: later
gates: t04-50
migrated-from: tasks/project-tasks.md#pt-12
migrated-at: 2026-05-03
---

# pt-12 — GitHub REST + webhooks wire-layer binding spec

## Owning records

- Milestone: [milestones/v0.4-federation.md](../../milestones/v0.4-federation.md).
  External-system drivers — gated by `t04-50`.
- Goal: [goals/v0.4-federate-two-nodes.md](../../goals/v0.4-federate-two-nodes.md).
- Owning spec: [specs/drivers/github-issues-driver.md](../../specs/drivers/github-issues-driver.md) §"REST binding" and §"webhook ingestion" (currently described in plan task `t04-50`; the spec section needs full surface authoring).

## Grounding

[`external-systems-get-drivers-peers-get-federation`](../../decisions/external-systems-get-drivers-peers-get-federation.md) (drivers, not federation).
The wire-layer binding is the faithful interfacer functor from the GitHub REST + webhook surface to the substrate's `gh-issue:*` cells per [`drivers-are-substrate-entities`](../../decisions/drivers-are-substrate-entities.md) and the v0.2b-frozen driver-model spec.

## Description

OPEN-SPEC.
Spec must pin:

- REST resources (`/repos/{owner}/{repo}/issues`, `/issues/comments`, `/issues/labels`).
- Webhook event types (`issues`, `issue_comment`, `label`).
- HMAC-SHA-256 signature verification using `X-Hub-Signature-256`.
- Rate-limit handling using `X-RateLimit-*` headers and conditional-request `If-None-Match`/`ETag`.
- Replay-idempotency keyed on `X-GitHub-Delivery`.

## Acceptance

- Spec sections authored and normative in `specs/drivers/github-issues-driver.md`.
- Spec gates the implementation in `t04-50`.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-12-github-wire-layer-binding-spec, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-12-github-wire-layer-binding-spec, horizon, later, true)` — recorded 2026-05-03 on migration.
