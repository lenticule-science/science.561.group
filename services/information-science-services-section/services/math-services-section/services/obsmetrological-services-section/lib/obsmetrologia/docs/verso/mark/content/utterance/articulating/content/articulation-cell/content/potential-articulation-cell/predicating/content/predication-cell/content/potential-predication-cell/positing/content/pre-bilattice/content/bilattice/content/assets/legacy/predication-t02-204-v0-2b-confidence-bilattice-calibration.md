---
kind: task
title: "t02-204 — Per-model-family confidence ↔ bilattice calibration spec"
description: "Author the calibration-cell schema, monotonicity requirement, and historical-stability requirement (recorded scores survive future re-calibrations because the calibration cell is content-addressed). Folds in pt-06."
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
depends-on-tasks: [task:t02-42]
area: engineering
horizon: soon
authored-at: 2026-05-03
authority: "milestones/v0.2b-drivers-observability-packaging.md"
folds-in: "task:pt-06-confidence-bilattice-calibration"
---

## Owning records

- Milestone: [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md). Stdlib slice (renumbered from the obsolete combined-plan ID `t02-201`); folds in [pt-06](pt-06-confidence-bilattice-calibration.md).
- Goal: [goals/v0.2b-stdlib-and-dispatch-shell.md](../../goals/v0.2b-stdlib-and-dispatch-shell.md).
- Owning specs: new §"Confidence calibration" in [specs/agential/non-lm-models.md](../../specs/agential/non-lm-models.md) (the existing spec already references calibration on lines 58 and 128 but does not pin the cell shape) plus §5 cross-link in [specs/scheduling/tier-routing.md](../../specs/scheduling/tier-routing.md).

## Grounding

[decisions/bilattice-as-the-value-domain](../../decisions/bilattice-as-the-value-domain.md) — confidence calibration is a *monotone map* from each model family's native confidence space (typically $[0,1]$) into the Belnap $2 \otimes 2$ bilattice, pinned per family per office. The map must commute with the bilattice's $\le_k$ ordering so escalation decisions are deterministic across invocations of the same family. Library grounding:

- [`bilattice-operation-table-correctness`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bilattice-operation-table-correctness.md) — the calibration map's image must respect the bilattice operation tables; non-monotone calibrations break $\Rightarrow$-restriction.
- [`telemetry-as-continuous-valued-settling-projection`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/telemetry-as-continuous-valued-settling-projection.md) — confidence telemetry is a continuous-valued projection that settles; the calibration cell IS the projection's settled image.
- [`witness-lifecycle-trajectory-is-regime-conditional-federation-content`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-lifecycle-trajectory-is-regime-conditional-federation-content.md) — calibration is regime-conditional; the spec must name which regimes admit which calibration shapes.

## Description

OPEN-SPEC. The reflex implementation would store per-family thresholds as Python literals in the dispatch code. The substrate's discipline is that the calibration is a *content-addressed substrate cell* `(model-family:<f>, confidence-calibration, <calibration-spec>) = t`. Because the cell is content-addressed, recorded scores survive future re-calibrations: a v0.5 calibration produces a new cell with a new id, and old scores still resolve against the old calibration cell.

**What this consumes from v0.2a + v0.2b.**

- v0.2a `t02-42` (kernel-shipped bilattice ops + value domain) supplies the Belnap $2 \otimes 2$ target — the calibration's codomain.
- v0.2a content-addressing discipline (the cell-id derivation that froze in `t02-40`/`t02-43`) supplies the historical-stability mechanism.
- v0.2b `t02-203` (registry lookup) supplies the per-record calibration-cell-id reference; this spec defines the cell's shape, that one defines how it is referenced.

**Spec citations.**

- Non-LM-model authority: [specs/agential/non-lm-models.md](../../specs/agential/non-lm-models.md) — currently references calibration but does not pin shape.
- Tier-routing surface: [specs/scheduling/tier-routing.md](../../specs/scheduling/tier-routing.md) §5.
- Bilattice value domain: [decisions/bilattice-as-the-value-domain](../../decisions/bilattice-as-the-value-domain.md).
- Companion registry spec: [`task:t02-203`](t02-203-v0.2b-tier2-model-registry-lookup.md).
- Theory ground: row 1 (bilattice value domain — the Belnap $2 \otimes 2$ codomain the calibration maps into) of [references/theory-for-developers.md](../../references/theory-for-developers.md).

**Modules to touch.**

- [`specs/agential/non-lm-models.md`](../../specs/agential/non-lm-models.md) — new §"Confidence calibration" naming: (a) calibration-cell schema `(model-family:<f>, confidence-calibration, <spec>) = t`; (b) monotonicity requirement (the map is $\le_k$-monotone); (c) historical-stability requirement (cell is content-addressed, old scores resolve against old cell).
- [`specs/scheduling/tier-routing.md`](../../specs/scheduling/tier-routing.md) — §5 cross-link to the new calibration §.
- [`tests/fixtures/tier-routing/calibration-binding.jsonl`](../../../../tests/fixtures/tier-routing/) — paired fixture (`t02-204f`) covering: (a) calibration cell creation and its content-addressed id, (b) score recording against a calibration cell, (c) supersession by new calibration cell, (d) old-score replay against superseded calibration (still resolves against original cell), (e) attempted non-monotone calibration (rejected by the spec's monotonicity gate).

**Procedure.** Follow [implementation/workflows.md recipe 10](../../implementation/workflows.md#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan) for spec-authoring; coordinate with `t02-203` author on calibration-cell-id format (the registry record references this id).

**Ship-target role.** Pre-condition for any v0.8 Tier-2 invocation: until the calibration cell shape ships, recorded confidence scores cannot survive across releases. The cell shape is the historical-stability surface.

**Depends on.** [`task:t02-42`](t02-42-v0.2a-kernel-frozen.md). Coordinates closely with [`task:t02-203`](t02-203-v0.2b-tier2-model-registry-lookup.md).

## Acceptance

- §"Confidence calibration" exists in `specs/agential/non-lm-models.md` with the three requirements (cell schema, monotonicity, historical stability) fully specified.
- The cell schema names the canonical content-addressing function (the same one v0.2a shipped for substrate cells).
- The monotonicity requirement cites [`bilattice-operation-table-correctness`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bilattice-operation-table-correctness.md).
- §5 cross-link in `specs/scheduling/tier-routing.md` references the new §.
- Paired fixture `t02-204f` at `tests/fixtures/tier-routing/calibration-binding.jsonl` covers the five scenarios named above.
- Cross-link from [pt-06](pt-06-confidence-bilattice-calibration.md)'s `folds-into` is bidirectional.
- Progress cell `(task:t02-204, status, done, true)` appended.

## Progress cells

Predcat-aware progress observations per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).

- `(task:t02-204, status, open, true)` — recorded 2026-05-03.
- `(task:t02-204, horizon, soon, true)` — recorded 2026-05-03.
- `(task:t02-204, description-promoted, true, true)` — recorded 2026-05-03; authored as procedural plan from the start, folding in [pt-06](pt-06-confidence-bilattice-calibration.md).
