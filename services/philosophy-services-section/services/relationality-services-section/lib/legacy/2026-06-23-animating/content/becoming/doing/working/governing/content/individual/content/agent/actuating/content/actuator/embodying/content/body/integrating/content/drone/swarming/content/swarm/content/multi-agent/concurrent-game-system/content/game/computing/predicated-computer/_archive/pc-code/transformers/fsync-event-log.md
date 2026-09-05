---
type: morphism
class: persistence-operation
realizes: [fsync-discipline, persistent-set]
depends-on: [fsync-discipline, storage-backend, event-log, witness]
see-also: [evict]
---

# Fsync event log

The substrate operation that *flushes pending event-log writes to durable storage*. Fsync is the boundary between "the substrate believes this operation is committed" and "the substrate has proof from the storage backend that it's committed."

## Signature

`fsync-event-log() → fsync-witness | fsync-failure-witness`

Outputs:

- **`fsync-witness`** — on success, records that all event-log writes prior to the fsync call are durable.
- **`fsync-failure-witness`** — on failure (storage backend error, disk full, etc.), records the failure; pending writes may not be durable.

## Operational semantics

1. Identify pending event-log writes that have not yet been fsync'd.
2. Issue the storage backend's durability call (POSIX `fsync()`, S3 PutObject + read-back-verification, RocksDB `WAL flush`, etc.).
3. Per the backend's discipline, wait for acknowledgment.
4. Mark all included writes as durable; subsequent witnesses can be considered committed.
5. Per [witness](../objects/witness.md), emit fsync-witness.

Per [fsync-discipline](teaching/explanations/fsync-discipline.md), the substrate's fsync pattern (per-write, group-commit, periodic, async-replication) determines how often this operation runs and how much latency it adds.

## Engineering invariants

- **Durable-on-success.** Per [fsync-discipline](teaching/explanations/fsync-discipline.md), fsync-witness means "these writes survive a host crash."
- **Backend-respects.** The substrate trusts the backend's acknowledgment; if the backend lies (claims durability without delivering), the substrate's correctness depends on the backend's actual behavior.
- **Failure-explicit.** Fsync failures produce explicit witnesses; the substrate doesn't silently treat failed fsyncs as successful.

## Position in the substrate

Fsync-event-log is the substrate's *durability primitive*. Per [settlement-determinism](../theorems/settlement-determinism.md), substrate replay after host crash recovers writes up to the most recent successful fsync; writes after that are lost. The substrate's fsync discipline determines the recovery window.
