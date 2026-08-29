---
title: "Snapshots"
description: "Snapshot events with verifiable hashes of materialized state. Enables fast fork, fast catch-up, point-in-time queries."
kind: spec
status: normative
version: "0.2"
---

# Snapshots

A snapshot is an event recording the verifiable hash of the substrate's materialized state at an event-ordinal.
Optional optimization for fast catch-up and point-in-time queries.

The snapshot primitive is **complementary to compaction** in the discipline sense per the secondary-theory concept [`predicated-computing/concepts/compaction.md`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/compaction.md): a snapshot is a cache of $T^*(L)$ — verifiable hash roots for tampering detection — while compaction operates on the log itself.
Snapshots remain valid across compaction because compaction preserves $T^*(L)$.
The dev-doc engineering spec [`../kernel/compaction.md`](../kernel/compaction.md) is currently `status: draft` pending theory reconciliation.

## 1. Snapshot event

```jsonl
{
  "kind": "snapshot",
  "id": "<sha256>",
  "ord": 12345,
  "prev": "<previous-event-id>",
  "at-ord": 12340,
  "cells-root-hash": "<merkle-root-of-cells>",
  "rules-root-hash": "<merkle-root-of-rules>",
  "fiber-root-hash": "<merkle-root-of-fibers>"
}
```

`at-ord` is the ordinal whose state this snapshot captures; the snapshot event itself is at `ord = at-ord + N` (snapshots are written after their referenced state stabilizes).

## 2. Use cases

### Fast catch-up

A federation peer with a snapshot doesn't replay the entire log; it loads the snapshot, then replays events since `at-ord`.

### Fast fork

Forking a substrate creates a new event log starting from a snapshot; the original is preserved.

### Point-in-time query

`fiber/<entity>?at_ord=N` returns the entity's fiber as of ord N.
With snapshots near N, this is fast.

## 3. Verification

Re-replaying the log from the previous snapshot to `at-ord` must produce the same `cells-root-hash`, `rules-root-hash`, `fiber-root-hash` as the snapshot recorded.
Mismatch indicates substrate corruption.

## 4. Snapshot frequency

Configurable via `(system, snapshot-cadence, "every-N-ords", t)`.
Default: every 10000 ords.

## 5. Conformance

Snapshots pass:

1. Snapshot at ord N + replay from N → byte-identical state.
2. Federation peer with snapshot catches up faster than from genesis.
3. Snapshot verification correct against tampered logs.

## 6. v0.2a slice

The full snapshot surface in §1–§5 spans v0.2a (recording), v0.3 (point-in-time queries, configurable cadence cell), and v0.4 (fast catch-up, fast fork, replay-from-previous verification).
The v0.2a slice ships only the *recording* and *current-state verification* primitives; the replay-equivalence and federation forms ship with their owning milestones.

### 6.1 v0.2a primitives

Three pure-Python functions in `storage/snapshots.py`:

- `compute_state_roots(layout)` — derive `(cells_root_hash, rules_root_hash, fiber_root_hash)` over current on-disk state.
- `record_snapshot(layout, event_log, node_id, sess)` — gated by `signal:snapshot:record` per [capability-permissions.md](./capability-permissions.md) §6.1; appends a typed `snapshot` event whose body carries the three roots plus `at_ord` (= `event_log.height() - 1` at call time — the simplest cadence, with the snapshot event sitting one ord past the state it captures).
- `verify_snapshot(layout, snapshot_event)` — recompute roots, compare against the snapshot's body, return `bool`.

`list_snapshots(event_log)` is a convenience walker over the event log.

### 6.2 Root discipline

- `cells/` and `rules/` are content-addressed: every record's filename stem is the SHA-256 of the canonical bytes of the record without its `id` field per [storage-layout.md](./storage-layout.md) §1.
  A healthy substrate therefore satisfies `stem == sha256(canonical(file_bytes_without_id))` for every record.
  The kind-root nevertheless hashes `sha256(file_bytes)` of each record's full on-disk bytes alongside its stem — `sha256(canonical(sorted([[id, sha256(file_bytes)], ...])))
  ` — so that in-place byte tampering (a rewritten file keeping its stem) is detected.
  Hashing only the IDs would miss that attack: the stem is a property of the path, not of the bytes.
- `fibers/` are mutable per-entity caches (not content-addressed).
  The fiber-root is `sha256(canonical(sorted(pairs)))` where each pair is `[entity_slug, sha256(fiber_bytes)]`.
  Two substrates whose fiber caches differ on any entity produce different fiber-root hashes.

Empty kind-dirs (no records of that kind yet) hash to `sha256(canonical([]))` — a fixed deterministic value.

### 6.3 Gate ordering invariant

`record_snapshot` is a session-issued substrate action and obeys the same gate-ordering invariant [capability-permissions.md](./capability-permissions.md) §6.3 imposes on every cell-emission site: the capability check (`signal:snapshot:record`) fires before the first ord-stamp, so a denied call leaves zero on-disk side-effect.
After append, ord-coherence is asserted — the event's `ord` must equal the height observed before append.
The genesis-precedence guard rejects snapshot recording before any event has been appended.

### 6.4 Single-writer assumption

`compute_state_roots` walks the on-disk `cells/`, `rules/`, and `fibers/` directories without locking.
The v0.2a substrate is single-writer (one process per `$SUBSTRATE_ROOT`), so a snapshot's roots reflect a coherent point in time iff no other writer is mutating those directories during the walk.
The atomic `record_snapshot` boundary across the filesystem walk and the event-log append is **not** transactional in v0.2a: a concurrent writer in the same process could in principle interleave a cell or fiber write between the root computation and the event append.
Practically, the runtime serialises all session-issued substrate actions through one event-log thread, so this hazard does not materialise in v0.2a deployments.
Federation in v0.4 introduces multi-writer scenarios and will need an explicit snapshot boundary (per-snapshot lock or copy-on-write of the materialised state); the v0.2a snapshot semantics are intentionally not strengthened to handle that.

### 6.5 Conformance gates (v0.2a)

In addition to §5:

4. `compute_state_roots` is deterministic — the same on-disk state
   produces the same root triple across invocations and across
   processes.
5. Tamper-evidence — modifying any cell file, rule file, or fiber
   file changes the corresponding root.
6. `verify_snapshot` returns `True` against the unchanged state and
   `False` after any tampering or any state-advancing event.
7. `record_snapshot` raises `PCA_SCOPE_INSUFFICIENT` per
   [security/capability-model.md](../security/capability-model.md)
   §8 when the session does not hold `signal:snapshot:record` (or
   a wildcard covering it).
8. A denied `record_snapshot` advances neither the event log nor
   any fiber — the gate-ordering invariant from §6.3 holds.
9. Snapshot recording before genesis raises `PCM_PAYLOAD_INVALID`.
10. The empty substrate (no cells, no rules, no fibers — only
    genesis) admits a recorded snapshot whose three roots are
    each `sha256(canonical([]))`.
