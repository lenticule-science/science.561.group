---
title: "Engineering tasks"
description: "Engineering work items in the work-orchestration kind: task shape per specs/work-orchestration/task.md. Holds horizon: doing and horizon: soon items only; later/captured/done items live under backlog/."
kind: index
---

# Engineering tasks

Engineering work items in the work-orchestration `kind: task` shape per [specs/work-orchestration/task.md](../../specs/work-orchestration/task.md).
Each is a leaf executable unit with full lifecycle frontmatter (`kind`, `slug`, `of-goal`, `of-milestone`, `kind-of-task`, `status`, `owned-by-office`, `assigned-to-personnel`, `priority`, `estimated-effort-hours`, `actual-effort-hours`, `deadline-by-ord`, `depends-on-tasks`) and the required body sections `## Description`, `## Acceptance`, and `## Progress cells`.

Per [_conventions.md](../../_conventions.md), `tasks/<area>/` holds only `horizon: doing` and `horizon: soon` items.
Items with horizon `later`/`captured`/`done`/`abandoned` live under `backlog/<horizon>/`.

## pt-NN entries

### v0.2a (horizon: doing) - [pt-02-per-stratum-capability-fiber-retraction.md](pt-02-per-stratum-capability-fiber-retraction.md) — `open`.
Folds into `t02-126`. - [pt-04-stratum-preserving-compaction.md](pt-04-stratum-preserving-compaction.md) — `open`.
Folds into `t02-116`. - [pt-07-privileged-cross-projection-capability.md](pt-07-privileged-cross-projection-capability.md) — `open`.
Gates `t02-125`. - [pt-08-personnel-to-boundary-migration.md](pt-08-personnel-to-boundary-migration.md) — `open`.
Folds into `t02-127`. - [pt-10-compaction-streaming-output-replay.md](pt-10-compaction-streaming-output-replay.md) — `open`.
Folds into `t02-117`.

### v0.2b (horizon: soon) - [pt-01-federation-peer-share-fixture-replay.md](pt-01-federation-peer-share-fixture-replay.md) — `open`.
Folds into `t02-202`. - [pt-03-diagnostic-projection.md](pt-03-diagnostic-projection.md) — `open`.
Folds into `t02-75`. - [pt-05-tier2-model-registry-lookup.md](pt-05-tier2-model-registry-lookup.md) — `open`.
Folds into `t02-203`. - [pt-06-confidence-bilattice-calibration.md](pt-06-confidence-bilattice-calibration.md) — `open`.
Folds into `t02-204`.

### Redirects to backlog (horizon: later / captured / done) - [pt-11-github-issues-round-trip-fixture.md](pt-11-github-issues-round-trip-fixture.md) → [`backlog/done/pt-11-...
`](../../backlog/done/pt-11-github-issues-round-trip-fixture.md).
`done` (already owned by `t04-51`). - [pt-12-github-wire-layer-binding-spec.md](pt-12-github-wire-layer-binding-spec.md) → [`backlog/later/pt-12-...
`](../../backlog/later/pt-12-github-wire-layer-binding-spec.md). v0.4 (`later`). - [pt-14-per-agent-skill-scope-projection.md](pt-14-per-agent-skill-scope-projection.md) → [`backlog/captured/pt-14-...
`](../../backlog/captured/pt-14-per-agent-skill-scope-projection.md). v0.8 (`captured`). - [pt-15-encyclopedia-uri-skill-token-types.md](pt-15-encyclopedia-uri-skill-token-types.md) → [`backlog/later/pt-15-...
`](../../backlog/later/pt-15-encyclopedia-uri-skill-token-types.md). v0.6 (`later`).

## t02-NN per-family records (v0.2a / v0.2b plan-slice families)

Per the work-orchestration contract, every plan-slice family enumerated in the v0.2a / v0.2b milestones is also a dispatchable task record so rollup/dispatch are structurally complete.
Most records below are thin dispatch shells: they cite the owning milestone for full ship-target context.
Authored 2026-05-03 alongside the dev-project reorganization.

**Before picking up a thin t02-NN record**, follow [implementation/workflows.md recipe 10 — Promoting a thin `t02-NN` task record into a procedural plan](../../implementation/workflows.md#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan).
The promoted shape names the spec citation, the modules to touch, the ship target the task contributes to, the depends-on relationships, and a procedural Acceptance checklist.
See [`t02-30`](t02-30-v0.2a-multi-user-authoring.md) and [`t02-140`](t02-140-v0.2a-multi-user-authoring.md) for canonical promoted bodies.

### v0.2a families (horizon: doing) — owned by [milestones/v0.2a-multi-user-single-node.md](../../milestones/v0.2a-multi-user-single-node.md) - Multi-user authoring (goal: [v0.2a-multi-user-authoring](../../goals/v0.2a-multi-user-authoring.md)): [t02-30](t02-30-v0.2a-multi-user-authoring.md), [t02-31](t02-31-v0.2a-multi-user-authoring.md), [t02-32](t02-32-v0.2a-multi-user-authoring.md), [t02-33](t02-33-v0.2a-multi-user-authoring.md), [t02-34](t02-34-v0.2a-multi-user-authoring.md), [t02-140](t02-140-v0.2a-multi-user-authoring.md), [t02-141](t02-141-v0.2a-multi-user-authoring.md), [t02-142](t02-142-v0.2a-multi-user-authoring.md), [t02-143](t02-143-v0.2a-multi-user-authoring.md), [t02-144](t02-144-v0.2a-multi-user-authoring.md), [t02-145](t02-145-v0.2a-multi-user-authoring.md). - Kernel-frozen (goal: [v0.2a-kernel-frozen](../../goals/v0.2a-kernel-frozen.md)): [t02-40](t02-40-v0.2a-kernel-frozen.md), [t02-41](t02-41-v0.2a-kernel-frozen.md), [t02-42](t02-42-v0.2a-kernel-frozen.md), [t02-43](t02-43-v0.2a-kernel-frozen.md), [t02-110](t02-110-v0.2a-kernel-frozen.md), [t02-111](t02-111-v0.2a-kernel-frozen.md), [t02-112](t02-112-v0.2a-kernel-frozen.md), [t02-113](t02-113-v0.2a-kernel-frozen.md), [t02-114](t02-114-v0.2a-kernel-frozen.md), [t02-115](t02-115-v0.2a-kernel-frozen.md), [t02-120](t02-120-v0.2a-kernel-frozen.md), [t02-121](t02-121-v0.2a-kernel-frozen.md), [t02-122](t02-122-v0.2a-kernel-frozen.md), [t02-123](t02-123-v0.2a-kernel-frozen.md), [t02-124](t02-124-v0.2a-kernel-frozen.md).

Note: `t02-116`, `t02-117`, `t02-125`, `t02-126`, `t02-127` are already covered by `pt-04`, `pt-10`, `pt-07`, `pt-02`, `pt-08` respectively (see "pt-NN entries" above) and are not duplicated as separate t02-NN records.

### v0.2b families (horizon: soon) — owned by [milestones/v0.2b-drivers-observability-packaging.md](../../milestones/v0.2b-drivers-observability-packaging.md) - Stdlib + dispatch shell (goal: [v0.2b-stdlib-and-dispatch-shell](../../goals/v0.2b-stdlib-and-dispatch-shell.md)): [t02-23](t02-23-v0.2b-stdlib-and-dispatch-shell.md), [t02-93](t02-93-v0.2b-stdlib-per-verb-regime-addenda.md), [t02-100](t02-100-v0.2b-stdlib-and-dispatch-shell.md), [t02-102](t02-102-v0.2b-stdlib-and-dispatch-shell.md). - Driver model + three drivers (goal: [v0.2b-driver-model-and-three-drivers](../../goals/v0.2b-driver-model-and-three-drivers.md)): [t02-50](t02-50-v0.2b-driver-model-and-three-drivers.md), [t02-53](t02-53-v0.2b-driver-model-and-three-drivers.md), [t02-60](t02-60-v0.2b-driver-model-and-three-drivers.md), [t02-64](t02-64-v0.2b-driver-model-and-three-drivers.md), [t02-65](t02-65-v0.2b-drivers-lossy-counit-discipline.md), [t02-70](t02-70-v0.2b-driver-model-and-three-drivers.md). - Observability dashboards (goal: [v0.2b-observability-dashboards](../../goals/v0.2b-observability-dashboards.md)): [t02-71](t02-71-v0.2b-dashboard-as-fiber-subscription.md), [t02-72](t02-72-v0.2b-heartbeat-fiber-subscription-pattern.md), [t02-73](t02-73-v0.2b-cross-shell-coherence.md), [t02-74](t02-74-v0.2b-observability-dashboards.md), [t02-80](t02-80-v0.2b-observability-dashboards.md), [t02-81](t02-81-v0.2b-observability-dashboards.md), [t02-82](t02-82-v0.2b-admin-workflow-witness-citation.md), [t02-83](t02-83-v0.2b-pattern-cross-citation-discipline.md). - Packaging skeleton (goal: [v0.2b-packaging-skeleton](../../goals/v0.2b-packaging-skeleton.md)): [t02-90](t02-90-v0.2b-packaging-skeleton.md), [t02-91](t02-91-v0.2b-deployment-config-as-cell.md), [t02-92](t02-92-v0.2b-dr-test-as-replay.md), [t02-94](t02-94-v0.2b-packaging-skeleton.md). - Network stubs (goal: [v0.2b-network-stubs](../../goals/v0.2b-network-stubs.md)): [t02-150](t02-150-v0.2b-network-stubs.md), [t02-155](t02-155-v0.2b-network-stubs.md), [t02-170](t02-170-v0.2b-network-stubs.md), [t02-175](t02-175-v0.2b-network-stubs.md).

Note: `t02-75`, `t02-202`, `t02-203`, `t02-204`, `t02-205` are already covered by `pt-03`, `pt-01`, `pt-05`, `pt-06`, `pt-13`.
`t02-200` and `t02-201` are obsolete superseded ids per the milestone authority.

## Other engineering tasks

- [expose-fars-mcp-over-http.md](expose-fars-mcp-over-http.md) — pre-existing engineering task, not part of the pt-NN ledger; preserved untouched by the 2026-05-03 reorganization.
