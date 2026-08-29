---
title: "Personnel migration sequenced before bootstrap-users"
description: "On first boot, the v0.1→v0.2 personnel→boundary migration runs as the substrate-only Phase-3 sub-step that immediately precedes bootstrap-users. The substrate never holds two parallel identity universes at once."
kind: decision
date: "2026-05-03"
status: committed
---

# Personnel migration sequenced before bootstrap-users

## What

Phase 3 of the boot sequence runs the personnel-to-boundary migration **before** the bootstrap-users routine.
In `boot.py`'s `PHASES` list, `personnel_migration` is entry index 9 and `bootstrap_users` is entry index 10; in [specs/init-boot/boot-sequence.md](../specs/init-boot/boot-sequence.md) the migration is documented at §4.0, immediately before §4.1 bootstrap-users.
This decision ratifies that ordering.

The two routines share the boundary-projection machinery established by [identity-is-boundary-projection](identity-is-boundary-projection.md): every user is a boundary entity that projects four canonical fibers.
The migration is the natural transformation from the v0.1 `personnel-record` presheaf to the v0.2 `boundary` presheaf; bootstrap-users is the routine that materialises the deployment manifest's user set onto that same boundary scheme.

## Why

The substrate must never hold two parallel identity universes on the same `$ROOT`.
A re-boot whose event log carries inherited v0.1 `personnel:*` records *and* whose deployment manifest carries v0.2 `boundary:*` entries would, under the AFTER ordering, expose the bootstrap-users routine to a substrate state where some identities are addressable as boundaries and some are still addressable only as personnel records.
The bootstrap-users invariant (per [bootstrap-manifest.md §4](../specs/init-boot/bootstrap-manifest.md)) — that the manifest is the canonical authority for the user set on its first read — would then have to pattern-match between two record kinds, which is the exact bifurcation the boundary discipline was introduced to eliminate.

Sequencing migration first restores the invariant: by the time bootstrap-users executes, every identity slug the substrate has ever seen is addressable as a boundary.
The bootstrap manifest can then be read against a single record-kind universe, and per-user capability fibers attach functorially to a single shape (see [predication-fiber-functor](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md)).

The pt-08 task record's acceptance language already required BEFORE ordering ("any v0.1 personnel records must be promoted onto the v0.2 boundary scheme before the bootstrap-user routine starts provisioning `boundary:*` entities").
The shipped code matches; the spec's §4.0 matches; this decision closes the loop by recording the ratification rather than leaving it implicit in three places.

## What it rules out

- **AFTER ordering.** Sequencing bootstrap-users before personnel-migration is rejected.
  The argument for AFTER (that bootstrap-users could seed personnel records on first boot for the migration to sweep) is unsound: the bootstrap manifest's schema is *boundary-shaped*, not personnel-shaped, so there are no personnel records to seed in the AFTER world that the BEFORE world is missing.
- **Lazy migration.** The migration is a Phase-3 boot step, not an on-demand projection at first read.
  Any read path that wants the v0.1 personnel-record shape goes through `personnel_migration.legacy_view(boundary_slug=...)
  ` against the already-migrated boundary, not against an un-migrated personnel fiber.
- **Concurrent migration.** The migration runs at runlevel 1 (substrate-only, before `runlevel_promote` brings the substrate to runlevel 3).
  No external respond invocations are accepted while the migration is in flight.
- **Silent re-derivation under a bumped scheme.** A migrated personnel record carrying `migrated-with-scheme:<v>` for some `<v> ≠ BOUNDARY_SCHEME_VERSION` (currently `v0.2-four-fiber`) raises `PCB_BOUNDARY_SCHEME_DIVERGED` and the boot transitions to `degraded`.
  Bumping the scheme requires a captain decision plus a re-migration pass, not a code-only change.

## What it does not constrain

- The audit-cell encoding (the `<ord>` suffix folded into the predicate name, vs. an `(predicate=migrated-to-boundary-at-ord, value=<ord>)` shape) — this decision pins ordering, not the predicate value-encoding.
  The encoding question is tracked separately in [next-stretch-now.md §L1 risks](../implementation/next-stretch-now.md).
- The carry-forward set on the boundary side (`role-*` and `granted:*` cells whose value is `True`) is governed by `personnel_migration._carry_forward_predicates`, not this decision.
  Extensions to that set go through their own decisions.
- The driver-attach phase (Phase 5) and federation join (Phase 6) are unaffected; they operate on boundaries, and by Phase 5 entry every identity is canonically a boundary.

## Concrete consequences

- L2 (`bootstrap_users` and `fiber_reconcile` boot-phase routines, per [v0.2a milestone gate 3](../milestones/v0.2a-multi-user-single-node.md)) can statically assume the persistent set contains only boundary records when the manifest is loaded.
  No conditional branch on "is this manifest entry's boundary already provisioned, or is its personnel-record-shaped predecessor still in the log."
- The v0.2a deterministic-replay claim (per [`bootstrap-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/bootstrap-determinism.md)) is computed against the BEFORE-ordering event tail.
  Switching ordering later silently invalidates every fixture-replay artefact captured under v0.2a; this decision pins the ordering so that pinning is explicit.
- The conformance test `test_migration_replay_is_byte_identical` in [`tests/conformance/test_t02_127f_personnel_migration.py`](../../../tests/conformance/test_t02_127f_personnel_migration.py) is the structural witness: two fresh substrates seeded identically produce byte-identical migration event tails, and that byte-identity is what fixture replay relies on.
- The driver-model spec ([drivers/driver-model.md](../specs/drivers/driver-model.md)) treats every sender as an authenticated boundary-fiber.
  With BEFORE ratified, no driver-side branch is needed for "what if this respond's sender is still a v0.1 personnel record."
