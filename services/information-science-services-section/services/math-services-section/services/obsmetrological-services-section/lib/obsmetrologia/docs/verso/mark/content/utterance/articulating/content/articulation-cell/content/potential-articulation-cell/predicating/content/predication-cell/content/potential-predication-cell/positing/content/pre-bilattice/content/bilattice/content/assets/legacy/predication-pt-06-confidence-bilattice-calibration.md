---
kind: task
title: "pt-06 — Per-model-family confidence ↔ bilattice calibration spec"
description: "Calibration-cell schema, monotonicity requirement, historical-stability requirement (recorded scores survive future re-calibrations because the calibration cell is content-addressed)."
slug: "task:pt-06-confidence-bilattice-calibration"
of-goal: "goal:v0.2b-stdlib-and-dispatch-shell"
of-milestone: "milestone:v0.2b-drivers-observability-packaging"
kind-of-task: engineering
status: open
owned-by-office: "office:engineering"
assigned-to-personnel: null
priority: 3
estimated-effort-hours: null
actual-effort-hours: null
deadline-by-ord: null
depends-on-tasks: []
area: engineering
horizon: soon
folds-into: t02-204
migrated-from: tasks/project-tasks.md#pt-06
migrated-at: 2026-05-03
---

## Owning records

- Milestone: [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md). Tracked under v0.2b as task family `t02-204` (renumbered from the obsolete combined-plan ID `t02-201`).
- Goal: [goals/v0.2b-stdlib-and-dispatch-shell.md](../../goals/v0.2b-stdlib-and-dispatch-shell.md).
- Owning spec: [specs/agential/non-lm-models.md](../../specs/agential/non-lm-models.md) §"confidence calibration" (the spec already references this in line 58 and line 128; the calibration cell shape needs full specification) plus [specs/scheduling/tier-routing.md](../../specs/scheduling/tier-routing.md) §5 cross-link.

## Grounding

[`bilattice-as-the-value-domain`](../../decisions/bilattice-as-the-value-domain.md). Confidence calibration is a monotone map from $[0,1]$ (or whatever the family's native confidence space is) into the Belnap 2⊗2 bilattice, pinned per family per office; the map must commute with the bilattice's $\le_k$ ordering so escalation decisions are deterministic.

## Description

OPEN-SPEC. Spec must pin:

- The calibration-cell schema: `(model-family:<f>, confidence-calibration, <calibration-spec>) = t`.
- The monotonicity requirement.
- The historical-stability requirement (recorded scores survive future re-calibrations because the calibration cell is content-addressed).

## Acceptance

- Spec section authored and normative.
- Fixture deliverable: `tests/fixtures/tier-routing/calibration-binding.jsonl`.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md). Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-06-confidence-bilattice-calibration, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-06-confidence-bilattice-calibration, horizon, soon, true)` — recorded 2026-05-03 on migration.
