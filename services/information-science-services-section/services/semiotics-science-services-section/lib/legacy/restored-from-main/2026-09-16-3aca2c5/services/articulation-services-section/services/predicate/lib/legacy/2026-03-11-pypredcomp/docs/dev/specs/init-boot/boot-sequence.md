---
title: "Boot sequence"
description: "The OS's boot phases. From cold runtime to ready state. Implements predicated-computing's 9-phase boot."
kind: spec
status: normative
version: "0.2"
---


The OS comes up through nine boot phases per `predicated-computing/concepts/boot-sequence`.
Each phase has preconditions, ordered steps, and a transition.
Failure in any phase transitions the runtime to `degraded` rather than crashing.

## Grounded in

- [`predicated-computing/theorems/boot-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/boot-determinism.md) — the boot sequence is a deterministic function of the deployment image plus the persistent set; the conformance claim "cold boot reaches `ready` in deterministic time given the same event log" (§10 step 1) is exactly the boot-determinism theorem applied to the v0.2 nine-phase decomposition.
  Cross-implementation reproducibility (§10 step 4) is structural.
- [`predicated-computing/theorems/hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — the phase-3 spot-check (§4 step 4) of cell-record file hashes is structural: same content → same hash → matching cell-id.
  Mismatch is necessarily corruption.
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Phase 0 — Container/runtime checks

**Preconditions:** The OS process is starting (cold).

**Steps:**

1. Verify host environment: required filesystem permissions, network availability, disk capacity.
2. Verify Python (or Rust) runtime version.
3. Verify required packages are installed (per the deployed Nix flake or Guix manifest).
4. Check for existing `$ROOT` directory; create if absent.

**Transition:** `cold → initializing` if all checks pass.

## 2. Phase 1 — Persistent-set attach

**Preconditions:** `initializing` state.

**Steps:**

1. Open `$ROOT/events.jsonl` for read.
2. Verify the genesis event is well-formed.
3. Walk the chain to the current tail; verify hash linkage.
4. Index cells by id, by entity, by predicate (in-memory indices).

## 3. Phase 2 — Identity activation

**Steps:**

1. Load this node's keypair (from `$ROOT/config.json` and the host keystore).
2. Verify node-id matches the genesis event's node-id.
3. Compute this node's public key cell.
4. Initialize signing infrastructure.

## 4. Phase 3 — Bootstrap load

**Steps:**

1. Replay the event log to build current substrate state.
2. Materialize cell records, rule records, alias mappings, fiber caches.
3. Verify settling-monotonicity invariants.
4. Spot-check (configurable percent) of cell-record file hashes.

### 4.0. Personnel-to-boundary migration

Per [`init_boot/personnel_migration.py`](../../../../src/init_boot/personnel_migration.py), [pt-08](../../tasks/engineering/pt-08-personnel-to-boundary-migration.md), and the [identity-is-boundary-projection decision](../../decisions/identity-is-boundary-projection.md), Phase 3 first promotes any v0.1 `personnel:*` records inherited from a prior event log onto the v0.2 [boundary](../security/user-as-boundary.md) scheme.
The migration is sequenced **before** §4.1 bootstrap-users — see the [personnel-migration-sequenced-before-bootstrap-users decision](../../decisions/personnel-migration-sequenced-before-bootstrap-users.md) — so that bootstrap provisioning never sees two parallel identity universes (legacy personnel + fresh boundary) on the same `$ROOT`.
The routine:

1. Enumerates `personnel:*` slugs from the event log; for each, inspects the personnel fiber for the `kind-personnel-record` predicate (the v0.1 marker) and the absence of any `migrated-to-boundary-at-ord:<ord>` audit predicate.
2. For each un-migrated legacy record, emits the boundary cell `(boundary:<bare>, kind-user) = t`, the four canonical projection cells (`projects-auth-fiber`, `projects-authz-fiber`, `projects-attention-fiber`, `projects-history-fiber`), and carries forward each `role-*` and `granted:*` cell whose value is `True`.
  Bookkeeping predicates (`kind-personnel-record`, `migrated-*`, `provisioned`) are *not* carried — they describe the personnel record, not the boundary.
3. Writes the audit cell `(personnel:<bare>, migrated-to-boundary-at-ord:<ord>) = t` on the personnel side, where `<ord>` is the event-log height at the moment of audit (folded into the predicate name so the marker survives projection rebuilds).
4. Pins the boundary-scheme version with `(personnel:<bare>, migrated-with-scheme:<version>) = t`.
  The current version is `v0.2-four-fiber`.
  On a subsequent boot, a migrated personnel record carrying a *different* recorded version raises `PCB_BOUNDARY_SCHEME_DIVERGED` and the boot transitions to `degraded` rather than silently re-deriving against incompatible code.

Idempotence: a re-boot on a fully-migrated store appends zero events.
A fresh `$ROOT` with no personnel records is a no-op (`scanned=0`).
The read-side natural transformation is exposed as `personnel_migration.legacy_view(boundary_slug=...)
`, which reconstructs the v0.1 personnel-record dict from the migrated boundary fiber for call sites still speaking v0.1 vocabulary.

### 4.1. Bootstrap users

Per [`init_boot/bootstrap_users.py`](../../../../src/init_boot/bootstrap_users.py) and [`specs/init-boot/bootstrap-manifest.md`](bootstrap-manifest.md) (canonical schema, canonical-byte form, hashing recipe), Phase 3 also ensures the **bootstrap user set** exists in the substrate.
On a freshly-initialised `$ROOT` (no prior event-log content), the bootstrap routine:

1. Reads the deployment's bootstrap-user manifest per [bootstrap-manifest.md](bootstrap-manifest.md) (per [decisions/identity-is-boundary-projection.md](../../decisions/identity-is-boundary-projection.md), each user is a boundary entity that projects four fibers).
2. For each manifest entry, emits the boundary cell `(boundary:<slug>, kind, user) = t` and the four projection cells (`projects-auth`, `projects-authz`, `projects-attention`, `projects-history`).
3. Emits per-user capability fibers from the manifest's per-user role declarations (admin, member, observer).
4. Records the bootstrap-user manifest hash as a substrate cell `(deployment, bootstrap-user-manifest-hash:<hash>, t)` — the `<hash>` is the canonical SHA-256 hex digest per [bootstrap-manifest.md §3.3](bootstrap-manifest.md), and is folded into the predicate name (not the object slot) so that successive recorded hashes are addressable as distinct predicates on the deployment fiber.
  Re-bootstrap with a different manifest first asserts the audit-trail marker `(deployment, bootstrap-user-manifest-changed, t)` then asserts the new hash predicate, per [bootstrap-manifest.md §4](bootstrap-manifest.md).

On a re-boot against an existing event log, the bootstrap-user routine is a no-op — the users exist in the replayed state.
The routine never modifies an existing user; user lifecycle changes go through `respond` per [decisions/single-respond-primitive.md](../../decisions/single-respond-primitive.md).

### 4.2. Fiber-cache reconcile

Per [`init_boot/fiber_reconcile.py`](../../../../src/init_boot/fiber_reconcile.py), Phase 3 step 2's fiber-cache materialisation is structurally **rebuild-from-truth**, not "load existing caches and trust them."
The routine:

1. Replays the full event log into per-entity cell histories (the canonical truth per [decisions/event-log-is-the-truth.md](../../decisions/event-log-is-the-truth.md)).
2. For each entity touched by the replay, rebuilds the in-memory `FiberSnapshot` and the on-disk by-stratum projection files (per [specs/kernel/projection-naturality.md](../kernel/projection-naturality.md)).
3. Compares the rebuilt projection files against any existing on-disk files; mismatch is `PCC_PROJECTION_DIVERGED` (the boot transitions to `degraded` rather than trusting potentially-stale cache).
4. Discards the in-memory fiber map of any entity whose projection diverged from truth; subsequent reads rebuild on demand.

This is the structural ground for the cache-coherence guarantee: caches are *recomputable from history*, never authoritative against history.
See [filesystem/presheaf-storage.md](../filesystem/presheaf-storage.md) §10 for the gate, and [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) for the engineering theorem.

## 5. Phase 4 — Rule activation

**Steps:**

1. Activate all rules with `kind = "rule"` and `retired = false`.
2. Compile rule patterns; populate the closure-rule engine cache.
3. Run an empty respond cycle to verify the engine is wired correctly.

## 6. Phase 5 — Driver attach

**Steps:**

1. For each driver with `auto-attach-at-boot, t`, attach per [drivers/attach-detach.md](../drivers/attach-detach.md).
2. Wait for each driver to reach `operating` state (with timeout).
3. Failed driver attachment doesn't block boot; the driver is marked `failed` and supervisor retries per policy.

## 7. Phase 6 — Federation join

**Steps:**

1. For each peer in the peer table, open federation sync connections.
2. Pull events since last-known-ord.
3. Resolve any cell disagreements via $\odot$-merge.

Federation join is best-effort; unreachable peers don't block boot.

## 8. Phase 7 — Heartbeat start

**Steps:**

1. Start the heartbeat loop (per [scheduling/heartbeat.md](../scheduling/heartbeat.md)).
2. Begin processing the inbox queue.
3. Begin scheduled rule firings.

## 9. Phase 8 — Ready

**Transition:** `initializing → ready`.

The OS is operational.
Sessions can open; respond invocations can happen; all subsystems are alive.

## 10. Conformance

Boot sequence passes:

1. Cold boot reaches `ready` in deterministic time given the same event log.
2. Each phase's transition is recorded as a substrate event.
3. Failed phase transitions to `degraded`; subsequent phases skip.
4. Both Python and Rust implementations produce identical phase transitions.

## 11. Plan 9 / Unix analogue

| Unix concept | Boot phase analogue |
|---|---|
| BIOS / UEFI | Container/runtime checks |
| `init` (PID 1) | The boot session |
| Mounting filesystems | Persistent-set attach |
| `/etc/passwd` load | Identity activation |
| Service start | Driver attach |
| `runlevel 3` | Phase 8 (ready) |
