---
kind: task
title: "pt-08 — Personnel → boundary migration on first boot"
description: "Boot Phase 3 (Bootstrap load) detects legacy personnel-record cells, emits boundary records via respond, writes the migration audit cell, recovers the v0.1 fiber via inverse projection, and re-runs idempotently. Promoted from thin task per workflows recipe 10 on 2026-05-03."
of-goal: goal:v0.2a-multi-user-authoring
of-milestone: milestone:v0.2a-multi-user-single-node
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
folds-into: t02-127
fixture-pair: t02-127f
migrated-from: tasks/project-tasks.md#pt-08
migrated-at: 2026-05-03
authored-at: 2026-05-03
authority: "milestones/v0.2a-multi-user-single-node.md, decisions/identity-is-boundary-projection.md"
---


## Owning records

- Milestone: [milestones/v0.2a-multi-user-single-node.md](../../milestones/v0.2a-multi-user-single-node.md).
  Init/boot slice.
- Goal: [goals/v0.2a-multi-user-authoring.md](../../goals/v0.2a-multi-user-authoring.md).
- Owning spec: new section in [specs/init-boot/boot-sequence.md](../../specs/init-boot/boot-sequence.md) §"Personnel-to-boundary migration" plus cross-link in [specs/security/user-as-boundary.md](../../specs/security/user-as-boundary.md) §"Migration from v0.1 personnel records".
- Source surface: [`src/init_boot/personnel_migration.py`](../../../../src/init_boot/personnel_migration.py) is implemented and wired into [`src/init_boot/boot.py`](../../../../src/init_boot/boot.py) Phase 3 (Bootstrap load) as `_phase_personnel_migration`. **Sequencing in code: BEFORE `_phase_bootstrap_users` and BEFORE `_phase_runlevel_promote`** (PHASES indices 9 then 10), matching this task record's original prescription.
  Ratified by [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../../decisions/personnel-migration-sequenced-before-bootstrap-users.md) on 2026-05-03; documented at [boot-sequence.md §4.0](../../specs/init-boot/boot-sequence.md).
  (An earlier revision of this task record claimed the code sequenced AFTER bootstrap-users; that was a misreading of `boot.py` — superseded.)

## Description

v0.2a's L1 landing per [implementation/next-stretch-now.md §L1](../../implementation/next-stretch-now.md#l1--personnel--boundary-migration-pt-08).
Boot Phase 3 (Bootstrap load) detects legacy `personnel-record` cells without a `migrated-to-boundary-at-ord` predicate, emits the boundary records (and four projection cells), writes the migration audit cell as a witness chain, exposes an inverse-projection helper that reconstructs the v0.1 personnel-record shape for backwards-compat reads, and re-runs idempotently against an already-migrated store.
The migration step runs *inside* Phase 3 *before* the bootstrap-users sub-step ([specs/init-boot/boot-sequence.md §4.1](../../specs/init-boot/boot-sequence.md), per `t02-140`).

The migration is *not* a data-shape change: per [`identity-is-boundary-projection`](../../decisions/identity-is-boundary-projection.md) and the captain-trove [`user-as-boundary`](../../references/ideas-trove.md#architecture) discipline, personnel was *always* a projection of the boundary; v0.1 simply hadn't named the boundary yet.
The migration realises that recognition.

## Spec citations

- [specs/init-boot/boot-sequence.md](../../specs/init-boot/boot-sequence.md) — extend with §"Personnel-to-boundary migration": detection predicate, emission contract, audit-cell shape, inverse-projection clause, idempotency contract.
- [specs/security/user-as-boundary.md](../../specs/security/user-as-boundary.md) — cross-link the migration section.
- [decisions/identity-is-boundary-projection.md](../../decisions/identity-is-boundary-projection.md) — each user is a boundary entity with four projection fibers.
- [decisions/single-respond-primitive.md](../../decisions/single-respond-primitive.md) — the migration writes through `respond`; never mutating personnel cells in place.

## Theorem grounding

- [`predication-fiber-functor`](../../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) — the migration is a natural transformation between the personnel-record fiber and the boundary fiber over the same base; functoriality across the migration ordinal authorises the inverse projection.
- [`bootstrap-determinism`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md) — the migration is a deterministic function of (legacy personnel set, boundary scheme version).
- [`witness-chain-as-proof-object`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) — the migration audit cell is a proof object, not a log line.
- Theory→code: row 13 (self-representation) and row 9 (witness chains) of [references/theory-for-developers.md](../../references/theory-for-developers.md).

## Imaginative grounding

- [`user-as-boundary`](../../references/ideas-trove.md#architecture) (captain trove) — the design rationale for personnel-as-projection-of-boundary rather than the reverse.
  Reduction to on-disk theorem: `predication-fiber-functor` plus the identity-is-boundary-projection decision.
- [`unified-record-sketch`](../../references/ideas-trove.md#records--accounting) (captain trove) — the σ/Δ universal-record discipline.
  The migration audit cell IS a unified record (σ side: settled boundary identity; Δ side: the migration event).
  Reduction: `witness-chain-as-proof-object`.

## Modules to touch

- [`src/init_boot/personnel_migration.py`](../../../../src/init_boot/personnel_migration.py) — primary implementation.
  The module file exists; it needs detection-and-emission and the inverse-projection helper.
- [`src/init_boot/boot.py`](../../../../src/init_boot/boot.py) — `_phase_personnel_migration` is registered in Phase 3, sequenced BEFORE `_phase_bootstrap_users` (PHASES entries 9 then 10) per the [BEFORE-ordering decision](../../decisions/personnel-migration-sequenced-before-bootstrap-users.md).
  Boundaries are canonical *at* `bootstrap_users` entry, not merely by Phase 3 close, so L2's per-user capability fibers attach functorially to a single record-kind with no conditional branch on "is this manifest entry's boundary already provisioned."
- [`src/process/user.py`](../../../../src/process/user.py) — boundary-entity construction site (the migration writes through this entity via `respond`).
- [`src/substrate/error_codes.py`](../../../../src/substrate/error_codes.py) — propose a new error code for divergent boundary-scheme detection (re-boot against a persistent set whose recorded boundary scheme disagrees with the current code's scheme); confirm exact code name with captain before raising.
- [`tests/conformance/`](../../../../tests/conformance/) — extend [`test_bootstrap_users_manifest.py`](../../../../tests/conformance/test_bootstrap_users_manifest.py) and add a sibling test asserting the migration discipline.
- Bootstrap-user manifest schema: finalise the shape when L2 picks up the manifest (relevant only to the divergence-detection branch in this task; the manifest itself is L2's surface).

## Procedure

Follow [implementation/workflows.md recipe 1](../../implementation/workflows.md#1-landing-a-v02a-task-end-to-end).
Pay special attention to recipe 6 (projection divergence — the migration is the canonical site where projection-cache divergence between personnel and boundary surfaces) and recipe 7 (deterministic replay — boot phases are where determinism bugs surface fastest).

Ordered moves per [implementation/next-stretch-now.md §L1 procedural steps](../../implementation/next-stretch-now.md#procedural-steps):

1. Spec extension first (boot-sequence.md §"Personnel-to-boundary migration"; cross-link from user-as-boundary.md).
2. Wire `personnel_migration.run` into `boot.py` Phase 3 (Bootstrap load) before `bootstrap_users.run` (the spec's §4.1 sub-step).
3. Implement detection (legacy `personnel-record` cells lacking `migrated-to-boundary-at-ord`) and emission (boundary cell + four `projects-*` cells + audit cell, all via `respond`; append `migrated-to-boundary-at-ord` predication on the personnel cell — never mutate).
4. Add `personnel_migration.legacy_view(boundary_slug) -> personnel_dict` that walks the four projection cells and reconstructs the v0.1 personnel-record shape for backwards-compat reads.
5. Idempotency proof — second invocation finds zero candidates, emits zero events.
6. Author paired fixture `t02-127f` (workflows recipe 2).
7. Conformance test extending `test_bootstrap_users_manifest.py`.

## Ship-target role

This task contributes to v0.2a ship target 3 (bootstrap-users + fiber-cache reconcile divergence-free against a multi-user manifest of ≥3 users) and gate 4 (multi-user respond fixtures pass: admin asserts, member retracts, observer reads).
The L1 landing is *prerequisite* for L2's gates 3-4 work; without it, the multi-user authoring scaffolding has two identity record-kinds and the modal-restriction algebra cannot enforce non-amplification consistently.
Confirm exact gate wording against [milestones/v0.2a-multi-user-single-node.md §Ship targets](../../milestones/v0.2a-multi-user-single-node.md#ship-targets) when picking up.

## Depends on

- Nothing under v0.2a strictly blocks pt-08; it is the head of the L1→L2 dependency chain in [implementation/next-stretch-now.md](../../implementation/next-stretch-now.md).
- pt-08 *unblocks* `t02-140` (bootstrap-users) cleanly: under the ratified BEFORE ordering, the boundary is the canonical identity surface at `bootstrap_users` entry, so `t02-140`'s capability-fiber emission is functorially attached to a single record-kind.
- Coordinate with [pt-02 — per-stratum capability fiber for retraction](pt-02-per-stratum-capability-fiber-retraction.md): pt-02's spec extension to the capability-model belongs alongside the role-definition pass that follows L1.

## Acceptance

The items below are checkable acceptance items per [implementation/workflows.md recipe 10](../../implementation/workflows.md#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan); confirm exact file paths, fixture names, test names, and any new error code with the captain.

- [specs/init-boot/boot-sequence.md](../../specs/init-boot/boot-sequence.md) §"Personnel-to-boundary migration" exists and is normative; cross-linked from [specs/security/user-as-boundary.md](../../specs/security/user-as-boundary.md) §"Migration from v0.1 personnel records".
- [`src/init_boot/personnel_migration.py`](../../../../src/init_boot/personnel_migration.py) implements `run(persistent_set)` and `legacy_view(boundary_slug)`.
  Module docstring cites the spec section.
- [`src/init_boot/boot.py`](../../../../src/init_boot/boot.py) Phase 3 (Bootstrap load) invokes `personnel_migration.run` before `bootstrap_users.run` (the spec's §4.1 sub-step).
- For each detected legacy cell, the routine emits via `respond`: `(boundary:<slug>, kind, user) = t`; the four `projects-*` cells per [decisions/identity-is-boundary-projection.md](../../decisions/identity-is-boundary-projection.md); the migration audit cell with witness chain pointing at source personnel cell + produced boundary cell; appends `(personnel:<slug>, migrated-to-boundary-at-ord, <ord>) = t` (never mutates the personnel cell).
- `personnel_migration.legacy_view(slug)` round-trips against a v0.1 fixture's personnel-record shape — backwards-compat reads cost zero re-author.
- On re-boot against an already-migrated store, the routine is a no-op (proven by event-log byte-comparison across two boot cycles).
- A re-boot against a persistent set whose recorded boundary scheme disagrees with the current code's scheme surfaces a divergence error in the repair log.
  (Propose a new error code in [`src/substrate/error_codes.py`](../../../../src/substrate/error_codes.py); pick the code name when you wire it.)
- Paired fixture `t02-127f` authored under `tests/fixtures/init-boot/personnel-migration/` (created if absent) per [workflows.md recipe 2](../../implementation/workflows.md#2-writing-a-paired-fixture-tnn-nnf); fixture path lands with the work.
- A conformance test under [`tests/conformance/`](../../../../tests/conformance/) — extending or paralleling [`test_bootstrap_users_manifest.py`](../../../../tests/conformance/test_bootstrap_users_manifest.py) — replays the fixture and asserts: (a) all expected boundary + projection + audit cells exist after Phase 3; (b) re-boot is a no-op (event-log byte-comparison); (c) `legacy_view` round-trips against the v0.1 fixture; (d) divergent boundary-scheme detection fires with the new error code.
- A re-run of [`tests/conformance/test_boot_determinism.py`](../../../../tests/conformance/test_boot_determinism.py) passes before *and* after the migration ordinal — i.e. migrated and unmigrated stores replay byte-identically up to and forward from the migration ordinal.
- Progress cell `(task:pt-08-personnel-to-boundary-migration, status, done, true)` appended with witnesses to the source files, spec section, fixture, and conformance test.

## Cross-cutting threads

L1 in particular is the canonical site where two threads from [implementation/next-stretch.md §"Cross-cutting threads"](../../implementation/next-stretch.md#cross-cutting-threads) get tested:

- **Thread B (everything is a cell).** The migration audit cell, the boundary cell, the projection cells, and the `migrated-to-boundary-at-ord` predication are all substrate cells — none of them is a Python dict, registry, or class hierarchy.
- **Thread E (witness chains are proof objects).** The audit cell's witness chain is a structured cell whose canonical-JSON serialisation round-trips byte-identically.
  A witness-as-string regression here would propagate into v0.2b's incident-management spec.

## Progress cells

Predcat-aware progress observations on this task per [specs/work-orchestration/progress-tracking.md](../../specs/work-orchestration/progress-tracking.md).
Each entry is a substrate cell `(s, p, o, v)` recording one observation; appended in chronological order.

- `(task:pt-08-personnel-to-boundary-migration, status, open, true)` — recorded 2026-05-03 on migration from `tasks/project-tasks.md`.
- `(task:pt-08-personnel-to-boundary-migration, horizon, doing, true)` — recorded 2026-05-03 on migration.
- `(task:pt-08-personnel-to-boundary-migration, description-promoted, true, true)` — recorded 2026-05-03; thin task record promoted to procedural plan per [implementation/workflows.md recipe 10](../../implementation/workflows.md#10-promoting-a-thin-t02-nn-task-record-into-a-procedural-plan); aligned with [implementation/next-stretch-now.md §L1](../../implementation/next-stretch-now.md#l1--personnel--boundary-migration-pt-08).
- `(task:pt-08-personnel-to-boundary-migration, sequencing-ratified, before-bootstrap-users, true)` — recorded 2026-05-03; [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../../decisions/personnel-migration-sequenced-before-bootstrap-users.md) ratifies the BEFORE ordering already shipped in `boot.py` PHASES (entries 9 then 10) and documented at [boot-sequence.md §4.0](../../specs/init-boot/boot-sequence.md).
  Supersedes the prior `(boot.py, sequencing, after-bootstrap-users, true)` claim recorded in an intermediate revision of this record (which was a misreading of the code).
- `(task:pt-08-personnel-to-boundary-migration, status, done, true)` — recorded 2026-05-03; all acceptance items satisfied: spec §4.0 authored, `personnel_migration.run` and `legacy_view` shipped, `boot.py` Phase 3 wires both, divergent-scheme detection fires `PCB_BOUNDARY_SCHEME_DIVERGED`, fixture `t02-127f` paired, and `tests/conformance/test_t02_127f_personnel_migration.py` (11 cases including `test_migration_replay_is_byte_identical`) passes.
  Witnesses: [`src/init_boot/personnel_migration.py`](../../../../src/init_boot/personnel_migration.py), [`src/init_boot/boot.py`](../../../../src/init_boot/boot.py), [`docs/dev/specs/init-boot/boot-sequence.md`](../../specs/init-boot/boot-sequence.md) §4.0, [`docs/dev/decisions/personnel-migration-sequenced-before-bootstrap-users.md`](../../decisions/personnel-migration-sequenced-before-bootstrap-users.md), [`tests/conformance/test_t02_127f_personnel_migration.py`](../../../../tests/conformance/test_t02_127f_personnel_migration.py).
