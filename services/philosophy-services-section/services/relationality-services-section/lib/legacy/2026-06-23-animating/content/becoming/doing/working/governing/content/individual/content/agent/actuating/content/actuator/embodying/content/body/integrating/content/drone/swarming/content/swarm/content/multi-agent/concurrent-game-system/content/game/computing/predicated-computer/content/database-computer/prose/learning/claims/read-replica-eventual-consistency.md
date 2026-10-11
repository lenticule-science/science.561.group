---
type: theorem
class: engineering-claim
status: proved
depends-on: [read-replica, federation-convergence, settlement-determinism, replica-cover, replica-mayer-vietoris, cohomological-calm, husainov-acyclicity]
see-also: [oltp-vs-olap]
---

# Read replicas eventually converge with the write-master

**Claim.** For any [read-replica](teaching/explanations/read-replica.md) configuration with asynchronous replication, the replica's substrate state eventually converges with the master's per [federation-convergence](../../../theorems/federation-convergence.md) — bounded by the replication lag.

For synchronous replication, the convergence is immediate (master commits only after replica acks). For quorum-based replication, convergence is immediate for the quorum side and eventual for non-quorum replicas.

## Why this holds

Per [federation-convergence](federation-convergence.md), substrates federating via CRDT-shaped operations (which includes the substrate's normal merge discipline) converge on the same state regardless of arrival order. Read replicas are federated peers of the master; the only differences are:

1. **Topology.** Master receives writes; replicas receive forwarded writes from master.
2. **Direction.** Replication is one-way master → replicas (replicas don't write back).

These are special cases of federation, not new mechanisms. Per [federation-convergence](../../../theorems/federation-convergence.md), the convergence claim applies.

**Cohomological framing.** Master $M$ and replica $R$ form a two-element [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) of the federated database region. Per the [replica Mayer–Vietoris sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), the connecting homomorphism $\delta^0 : H^0(M \cap R, \mathcal{F}) \to H^1(M \cup R, \mathcal{F})$ on the substrate's settling-associated sheaf measures the obstruction to gluing the master's sections and the replica's sections into a coherent federated section. Per [cohomological CALM](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/cohomological-calm.md), the substrate's normal merge discipline makes $\delta^0$ vanish identically — there is no obstruction class encoding "the master and replica disagree about a value that neither side individually decides." The replication lag bounds *how stale the replica's $H^0$ section is*, not whether there is any cohomological obstruction to convergence. Eventual consistency is the engineering surface of $\delta^0 = 0$.

**Materialized-view freshness.** Where a read replica also serves materialized views computed by the closure-rule system, the relevant cohomology computation reduces to Čech cohomology on the database's predicate-category Alexandrov topology. Per [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md), the Čech computation agrees with the derived-functor sheaf cohomology on the nose for posets satisfying the Dedekind–MacNeille cut condition. Database-platform query planners that rely on materialized-view freshness can therefore compute view staleness with finite Čech cochains rather than approximating it; the freshness bound is exact, not a worst-case estimate.

## Engineering consequence

- **Read scaling.** Read replicas can serve reads independently; the master is the write bottleneck.
- **Read-after-write awareness.** Applications must handle the case where a write to master is not immediately visible on replicas (read-your-own-writes pattern: read from master, or wait briefly, or check replica is caught up).
- **Replica failure tolerance.** A failed replica doesn't affect the master; the master continues serving writes; replicas can be re-bootstrapped from master.

## What the theorem requires

- The replication mechanism is reliable (per [transport-tolerance-of-federation](../../../theorems/transport-tolerance-of-federation.md), eventual delivery).
- The master's write events are replayable on replicas (per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md)).
- Per [settlement-determinism](settlement-determinism.md), substrate operations are deterministic.
