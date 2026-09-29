---
type: concept
class: distribution-discipline
depends-on: [federation-graph, sharding, federation-convergence, replica-cover]
see-also: [oltp-vs-olap, read-replica-eventual-consistency, transaction-isolation-level]
---

# Read replica

A *substrate-instance dedicated to read queries*, federated from a write-master substrate-instance. Read replicas distribute read load without taking on write coordination overhead.

The discipline:

- **Write-master.** A single substrate-instance handles all writes for a particular partition / data range.
- **Read replicas.** Multiple substrate-instances receive write events from the master via federation; serve read queries locally.
- **Eventual consistency.** Reads from replicas may be slightly behind the master (consistent with master's history, but possibly milliseconds-to-seconds lag).
- **Read scaling.** Adding replicas increases read throughput linearly.

Per [federation-convergence](../../../theorems/federation-convergence.md), read replicas converge on the same state as the master per CRDT discipline. The "lag" is just the federation propagation time.

Structurally, the (master, replica) pair is a two-element [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) of the federated database region per [read-replica-eventual-consistency](../theorems/read-replica-eventual-consistency.md): the read-replica configuration is *the engineering surface of the predication-categories' replica-cover*, and the replication-lag witness is the cover's Mayer–Vietoris connecting class restricted to the gap between master and replica $\leq_k$-positions. A read at a lagged replica is, per [transaction-isolation-as-knowledge-order-position](../theorems/transaction-isolation-as-knowledge-order-position.md), a read at an earlier $\leq_k$-position; the application's chosen isolation level determines whether that lag is admissible.

A read-replica configuration has:

- **Master substrate-instance** — reference to the write-handler.
- **Replica substrate-instances** — references to read-handlers.
- **Replication policy** — `synchronous` (master waits for replica acks before committing — strong consistency, slower writes), `asynchronous` (master commits, replicates in background — eventual consistency, faster writes).
- **Read routing** — how clients pick a replica (round-robin, least-loaded, geo-nearest).

Per [self-representation](../../teaching/explanations/self-representation.md), the read-replica configuration is substrate content. Per [witness](../../../objects/witness.md), write events on master are witnessed; replica receipt of those events is also witnessed; the lag between master-write-witness and replica-receipt-witness is the replication lag.

Read replicas compose with [oltp-vs-olap](oltp-vs-olap.md): typically, OLTP master + OLTP read replicas + OLAP-only replica for heavy analytical queries.

Trade-offs:

- **Asynchronous**: faster writes; reads may be stale; requires application-level "read your own writes" handling.
- **Synchronous**: stronger consistency; slower writes (limited by slowest replica).
- **Quorum-based**: per [quorum-consensus](../../distributed-coordination-platform/concepts/quorum-consensus.md), waits for K of N replicas to ack — between sync and async.
