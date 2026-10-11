---
title: "Runtime cycles"
description: "Operational cycles a node implements: storage, respond, heartbeat, federation sync, shutdown."
kind: spec
status: normative
version: "0.1"
---


A node in `ready` state runs the cycles below.
Each is described by its preconditions, ordered steps, and side effects.
Concrete APIs (functions, MCP tools, HTTP endpoints) MAY vary; the cycle semantics MUST be preserved.

## 0. Entrypoint and boot wiring

The canonical Python entrypoint per [decisions/pypredcomp-package-location.md](../../decisions/pypredcomp-package-location.md) is `substrate.runtime:main` (`pypredcomp/src/substrate/runtime.py`).
It walks the boot phases per [init-boot/boot-sequence.md](../init-boot/boot-sequence.md): Phase 0 (runtime checks) → Phase 1 (persistent-set attach) → Phase 2 (identity activation) → Phase 3 (bootstrap load, including bootstrap-users and fiber-cache reconcile per [boot-sequence.md](../init-boot/boot-sequence.md) §4.1–§4.2) → Phase 4 (rule activation) → Phase 5 (driver attach) → Phase 6 (federation join) → Phase 7 (heartbeat start) → Phase 8 (ready).

After Phase 8, `substrate.runtime:main` enters the heartbeat loop (§3 below).
Shutdown signals trigger the §5 shutdown cycle.

The Rust sibling entrypoint (planned per [decisions/engine-language-rust.md](../../decisions/engine-language-rust.md)) honours the same phase ordering and the same cycle semantics; conformance is per the same fixtures.

## 1. Storage cycle

Three operations: `put_record`, `get_record`, `has_record`.
Apply identically to cells, rules, and other content-addressed records.

### `put_record(canonical_bytes) → record_id | error`

1. Validate canonical bytes parse as JSON.
2. Validate against the relevant record schema ([cell-record.md](cell-record.md), [closure-rule-record.md](closure-rule-record.md)).
3. Re-canonicalize per [canonicalization.md](canonicalization.md).
  If input is non-canonical, re-canonicalize before hashing.
4. Compute SHA-256; verify equals the embedded `id` field.
  Mismatch → `PCC_ID_MISMATCH`.
5. Compute path `$ROOT/<dir>/<pp>/<id>.json` per [storage-layout.md](storage-layout.md).
6. If file exists: read bytes; verify hash matches; if so, return `id` without rewriting.
  Else `PCS_CORRUPT_STORE`.
7. If file missing: write to `<id>.json.tmp`; fsync; atomic rename to `<id>.json`.
8. Return `id`.

Records are immutable.
`put_record` is idempotent.

### `get_record(record_id) → canonical_bytes | error`

1. Validate `record_id` is 64-hex-char (else `PCS_INVALID_ID_FORMAT`).
2. Compute path; read file; verify SHA-256 equals `record_id` (else `PCS_CORRUPT_STORE`).
3. Return bytes verbatim.
  MUST NOT reformat or re-serialize.

### `has_record(record_id) → bool`

1. Validate `record_id` format.
2. Check file existence and hash agreement; return true/false.
  Corrupted file → `PCS_CORRUPT_STORE` (not silent false).

## 2. Respond cycle

The substrate's primary primitive.
See [respond.md](respond.md) for the full spec.
In summary:

```
respond(target, payload, sender?) →
  Phase 1: structural validation
  Phase 2: payload composition (sender ⇒ payload, then ⊙ target's fiber)
  Phase 3: closure to fixed point (rules fire, repair log accretes)
  Phase 4: append `cell` events for moved cells; append `settle` event with repair log; update fiber cache; return.
```

## 3. Heartbeat cycle

The heartbeat is a continuous loop the runtime spawns at `ready`.
It is **event-driven**, not wall-clock-driven (see [decisions/time-is-event-ordinal.md](../decisions/time-is-event-ordinal.md)).

```
loop {
  wait for one of: { new event in log, federation peer message, scheduled wakeup }
  match cause {
    NewEvent(ord) =>
      // catch up: rebuild affected fiber slices, re-fire any rules whose premises now match
      rebuild_affected_fibers(ord)
      fire_pending_rules()
    PeerMessage(peer, msgs) =>
      respond(target=peer_target, payload=msgs, sender=peer)
    Scheduled(rule_id) =>
      // some closure rules schedule themselves on a wall-clock cadence (e.g., decay)
      fire_rule(rule_id)
  }
}
```

The heartbeat:

- Holds the in-memory fiber map.
  Updates atomically via $\odot$.
- Owns the rule-pattern compiler cache.
- Drains the federation inbox queue.
- Schedules timer-based rules (rare; mostly for decay or periodic instinct evaluation).
- Surfaces metrics: events/sec, respond latency, fuel-exceeded rate, federation peer health.

Stops on `draining`.
Resumes on next `ready`.

## 4. Federation sync cycle (optional profile)

Per peer:

1. Open peer connection (default: HTTP/2 long-poll on `/federation/sync`).
2. Exchange `peer_known_window` (last seen `ord` from this peer) and remote's same.
3. Pull events with `ord` greater than our cursor; verify signatures (if the peer signs); apply via `respond` with `sender = peer:<peer-id>`.
4. Push our own events past their cursor.
5. On disconnect: backoff and retry.
  Network failures surface as `PCF_PEER_UNREACHABLE` in metrics; do not crash the heartbeat.

See [federation-protocol.md](federation-protocol.md) for wire format.

## 5. Shutdown cycle

`ready` or `degraded` → `draining` → `stopped`.
See [runtime-state.md](runtime-state.md) §7.

## 6. Concurrency

Multiple cycles may run concurrently:

- Respond invocations against disjoint target entities run in parallel.
- The heartbeat fires rules concurrently with respond invocations.
- Storage reads are unconstrained; storage writes serialize via the log append lock.
- Federation sync runs in its own thread/task per peer.

The single serialization point is the event-log append.
Everything else is concurrency-safe by virtue of the immutability of past events and the monotonicity of fiber updates.

## 7. Resource bounds

Conforming nodes MUST honor:

- **Closure fuel**: default 16 layers per `respond`; configurable per-invocation.
  Exceeding → `PCR_SIGMA_FUEL_EXCEEDED` (per [sigma-delta-passes.md](sigma-delta-passes.md) §4) or `PCR_SIGMA_DELTA_DIVERGED` for outer-fuel exhaustion.
  The fuel ceiling is **part of the respond's input** and is persisted with the settle event so replay reproduces fuel-exhaustion deterministically (per [respond.md](respond.md) §3.1).
- **Memory ceiling**: configurable in node config; exceeded → `PCH_NOT_READY` and refuse new respond.
  Heartbeat continues servicing reads.
- **Concurrency cap**: max concurrent respond invocations; defaults to CPU count.

The full fuel composition (σ_fuel, Δ_fuel, outer_fuel, payload-reduction fuel, top-level ceiling F) is specified in [fuel-composition.md](fuel-composition.md), which records the Lawvere-quantale composition law per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md).

These bounds are surfaced in `/health/ready` so orchestrators can decide to scale or rotate.
