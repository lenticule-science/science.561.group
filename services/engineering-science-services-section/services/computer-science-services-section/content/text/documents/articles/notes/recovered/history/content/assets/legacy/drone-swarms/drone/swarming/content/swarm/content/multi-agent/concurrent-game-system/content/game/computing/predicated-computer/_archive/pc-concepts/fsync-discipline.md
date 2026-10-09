---
type: concept
class: persistence-discipline
depends-on: [storage-backend, witness, settlement-determinism]
see-also: [persistent-set]
---

# Fsync discipline

The *substrate's commitment that writes acknowledged-as-committed are durable across host crashes*. fsync (or its backend-equivalent: S3 PutObject acknowledgment, RocksDB WAL flush, Spanner Paxos quorum) is the boundary between "the substrate believes this is written" and "the substrate has proof from the storage backend."

The substrate's invariant: a [witness](../objects/witness.md) recording an admitted operation is *not committed* until the underlying storage's fsync (or equivalent) returns success. Until fsync, the witness is in volatile memory; a crash before fsync loses the witness.

Per [settlement-determinism](../theorems/settlement-determinism.md), the substrate's correctness depends on the event log surviving crashes. Without fsync discipline, replay after crash may differ from the substrate's pre-crash state — violating determinism.

Common fsync patterns:

- **Per-write fsync.** Every event-log append is fsync'd before the witness is acknowledged. Strongest durability, slowest throughput.
- **Group commit.** Multiple writes are batched, then fsync'd together. Trades a small latency for higher throughput.
- **Periodic fsync.** Writes are buffered, fsync'd every N milliseconds. Acknowledges writes before durability; recent writes may be lost on crash. Admissible only when the substrate's policy explicitly accepts this trade-off.
- **Asynchronous replication.** Writes acknowledged after appending to local log; replicated to other replicas asynchronously. The substrate's federation discipline must handle the (rare) case of a replica losing acknowledged-but-unreplicated writes.

Per [storage-backend](storage-backend.md), the choice of fsync pattern depends on the backend's durability properties and the substrate's tolerance for write-loss-on-crash.

Per [federation-convergence](../theorems/federation-convergence.md), fsync discipline composes with replication: a substrate that fsyncs locally and replicates asynchronously has *eventually-durable* writes — the local fsync survives a host crash; the replica is updated soon after; the federation's eventual-consistency holds.
