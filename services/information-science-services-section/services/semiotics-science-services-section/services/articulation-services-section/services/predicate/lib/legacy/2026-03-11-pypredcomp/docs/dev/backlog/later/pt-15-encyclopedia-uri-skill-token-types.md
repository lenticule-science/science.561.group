---
kind: task
title: "pt-15 — Encyclopedia-concept URI references for skill input/output token types"
description: "URI scheme (encyclopedia://<concept-slug>), resolver discipline (substrate-resident encyclopedia cells), type-compatibility predicate (concept reachability with attenuation). Composes with lint-skills."
slug: task:pt-15-encyclopedia-uri-skill-token-types
of-goal: goal:v0.6-third-party-app-workflow
of-milestone: milestone:v0.6-application-development
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
folds-into: t06-28
migrated-from: tasks/project-tasks.md#pt-15
migrated-at: 2026-05-03
---

# pt-15 — Encyclopedia-concept URI references for skill input/output token types

## Owning records

- Milestone: [milestones/v0.6-application-development.md](../../milestones/v0.6-application-development.md).
  SDK + skill-author workflow slice; gated by `t06-25..
  27`.
- Goal: [goals/v0.6-third-party-app-workflow.md](../../goals/v0.6-third-party-app-workflow.md).
- Owning spec: new section in [specs/stdlib/skill-manifest.md](../../specs/stdlib/skill-manifest.md) §"Token-type references" plus cross-link in the v0.6 doc-format spec ([specs/agential/skill-registry.md](../../specs/agential/skill-registry.md) is also a candidate cross-link).

## Grounding

[`single-respond-primitive`](../../decisions/single-respond-primitive.md) and the functional-runtime-platform theory's typed-effects surface.
Skill `inputs:`/`outputs:` token types resolve to encyclopedia-concept URIs (e.g., `library:concepts/<slug>`) so cross-skill type-compatibility checks reduce to encyclopedia-graph reachability rather than ad-hoc string match.

## Description

OPEN-SPEC. v0.6 takes task family `t06-28`: spec defines:

- The URI scheme (`encyclopedia://<concept-slug>` or equivalent).
- The resolver discipline (substrate-resident encyclopedia cells).
- The type-compatibility predicate (concept reachability with attenuation).

Composes with `lint-skills` from `t06-25` so manifest validation rejects unresolved URIs.

## Acceptance

- Spec section authored and normative.
- Composes with `lint-skills` (manifest validation rejects unresolved URIs).

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-15-encyclopedia-uri-skill-token-types, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-15-encyclopedia-uri-skill-token-types, horizon, later, true)` — recorded 2026-05-03 on migration.
