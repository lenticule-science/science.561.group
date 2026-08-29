---
kind: task
title: "pt-03 — Diagnostic projection: surface why a saturated cell exists"
description: "Expose project_derivation(cell_id) -> WitnessChain on substrate.projection; render at /cells/<id>/why in the web GUI shell; ship the H¹-audit dashboard panel."
slug: task:pt-03-diagnostic-projection
of-goal: goal:v0.2b-observability-dashboards
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
folds-into: t02-75
migrated-from: tasks/project-tasks.md#pt-03
migrated-at: 2026-05-03
---

# pt-03 — Diagnostic projection: surface why a saturated cell exists

## Owning records

- Milestone: [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md).
  Observability slice.
- Goal: [goals/v0.2b-observability-dashboards.md](../../goals/v0.2b-observability-dashboards.md).
- Owning spec: new section in [specs/observability/error-investigation.md](../../specs/observability/error-investigation.md) plus a one-paragraph cross-link in [specs/kernel/sigma-delta-passes.md](../../specs/kernel/sigma-delta-passes.md) §"diagnostic projection".
  Source surface: `substrate/projection.py` (already has `project_stratum` / `project_peer` / `project_at_ord`; the `project_derivation` projection is the missing one).

## Grounding

[`projection-naturality.md`](../../specs/kernel/projection-naturality.md) — the diagnostic projection is a natural transformation from the saturated-stratum presheaf to the witness-chain presheaf, sending each `(s,p,o,v)` cell at stratum `"saturated"` to its `(derived_from, derived_via)` chain back to `"asserted"` antecedents.
Already proved coherent under the kernel's presheaf functoriality.

## Description

v0.2b takes task family `t02-75` (diagnostic projection): expose `project_derivation(cell_id) -> WitnessChain` on `substrate.projection`; render as a `/cells/<id>/why` route in the web GUI shell per [specs/shell/web-gui-shell.md](../../specs/shell/web-gui-shell.md); ship the H¹-audit dashboard panel per the v0.2b observability gate.

## Acceptance

- `substrate.projection.project_derivation(cell_id)` returns a `WitnessChain`.
- `/cells/<id>/why` route renders the chain in the web GUI shell.
- H¹-audit dashboard panel surfaces the cohomology summary derived from the projection.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-03-diagnostic-projection, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-03-diagnostic-projection, horizon, soon, true)` — recorded 2026-05-03 on migration.
