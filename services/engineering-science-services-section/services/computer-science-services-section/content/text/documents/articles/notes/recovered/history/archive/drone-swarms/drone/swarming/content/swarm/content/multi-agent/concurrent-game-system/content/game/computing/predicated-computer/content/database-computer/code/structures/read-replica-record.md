---
type: definition
class: substrate-entity
realizes: [read-replica]
depends-on:
  - read-replica
  - deployment-record
  - federation-graph
  - replica-cover
  - settling-associated-sheaf
  - replica-mayer-vietoris
  - cohomological-calm
  - husainov-acyclicity
  - bilattice
see-also:
  - shard-record
  - read-replica-eventual-consistency
  - cluster-as-replica-cover
  - materialized-view-record
---

# Read replica record

A **read replica record** is the substrate-entity formal definition of a [read replica](teaching/explanations/read-replica.md) configuration: declares a substrate-instance as a read-replica of a write-master.

Per [read-replica-eventual-consistency](../theorems/read-replica-eventual-consistency.md), a read replica is not a bespoke replication primitive: master $M$ and replica $R$ form a two-element [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) of the federated database region, and the lag between them is the $H^0$ section-gap on the substrate's [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md), with eventual consistency identified as the engineering surface of $\delta^0 = 0$ on that cover. This record is the substrate-content surface of that cover-data.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`master-substrate`** — reference to the [deployment-record](../../../objects/deployment-record.md) of the write-master; structurally, the cover element $M$ in the two-element replica cover $\{M, R\}$ of the federated region.
- **`replica-substrate`** — reference to the deployment-record of this replica; structurally, the cover element $R$ in the same two-element cover. Per the read-replica-eventual-consistency framing, the cover is asymmetric (writes flow $M \to R$ only); the math construction is unchanged.
- **`replication-policy`** — `synchronous`, `asynchronous`, `quorum-K`. Structurally, the choice of when the master commits relative to the replica's section: synchronous = master commits only after $R$'s section is taken at $M$'s value (overlap is gap-free at commit); asynchronous = master commits at its own value and the replica's section catches up later (a transient $H^0$ section-gap is admitted); quorum-K = the same as asynchronous from $R$'s perspective but with a per-write threshold on the cover-discipline that admits the commit per [byzantine-cluster-as-finer-replica-cover](../../distributed-coordination-platform/theorems/byzantine-cluster-as-finer-replica-cover.md).
- **`replication-lag-budget`** — maximum acceptable lag (substrate ordinals or wall-clock duration). Structurally, a bound on $|s_\mathrm{lag}|$ — the section-gap weighted by the [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)'s $\leq_k$-grade of disagreement (mirroring the materialized-view staleness budget per [materialized-view-record](materialized-view-record.md)).
- **`current-lag`** — *derived* (not separately stored authoritative state) the section-gap $s_\mathrm{lag} = R\text{'s section} \ominus_k M\text{'s section}$ on the overlap region of the two-element cover. Per the math grounding below, this is the *content-addressed* lag measure; wall-clock lag is a proxy that is not federation-stable.
- **`read-routing-priority`** — for read-routing decisions (lower priority = less preferred). Substrate-policy declaration; the routing layer reads this together with `current-lag` and the request's freshness-tolerance to decide whether to serve from $R$ or fall back to $M$.
- **`closure-kind`** — `read-replica`.

## Invariants

- **Master-replica-coherent.** The master and replica reference valid, distinct deployment-records; the cover $\{M, R\}$ is non-degenerate.
- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), the master/replica references, replication-policy, and lag budget are queryable.
- **No structural disagreement obstruction.** Per [read-replica-eventual-consistency](../theorems/read-replica-eventual-consistency.md), the connecting homomorphism $\delta^0 = 0$ identically on the cover's settling-associated sheaf — there is no cohomological obstruction to convergence; the lag bounds *how stale* $R$'s section is, not whether convergence is reachable. A persistent non-vanishing $\delta^0$ would be a substrate-content coherence failure surfaced by audit per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), not a routine lag situation.
- **Direction is one-way.** Replication is $M \to R$; the replica does not write back. State-dependent routing of writes back through $R$ would break the cover's asymmetric discipline.

## Math grounding

The read replica record is the substrate-content surface of the two-element replica cover and the cohomological vanishing on it. Each structural field maps to a fixed math role:

- **`master-substrate` and `replica-substrate` ↔ the two-element cover $\{M, R\}$.** Per [read-replica-eventual-consistency](../theorems/read-replica-eventual-consistency.md), $M$ and $R$ form a two-element [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) of the federated database region. The cover is the unit on which the substrate's convergence theorems are computed; this record's two reference fields are the substrate-content witness of which two cover elements are paired.

- **`replication-policy` ↔ commit-discipline relative to the cover.** Synchronous = master commits at the cellwise $\bigvee_k$-merge of $M$'s and $R$'s sections (no transient gap); asynchronous = master commits at its own section and $R$'s section catches up via the [federation-convergence](../../../theorems/federation-convergence.md) discipline; quorum-K = master commits at the cellwise merge across $K$ replicas in the cover.

- **`current-lag` ↔ $H^0$ section-gap $s_\mathrm{lag}$ on the overlap.** Per the cohomological framing in [read-replica-eventual-consistency](../theorems/read-replica-eventual-consistency.md), the lag is the per-cell disagreement $s_\mathrm{lag} \in H^0(M \cap R, \mathcal{F})$ of the two sections on the cover overlap. The substrate computes it as $s_\mathrm{lag} = \sigma_R \ominus_k \sigma_M$ via the bilattice's $\leq_k$-difference; two replicas caught up to the same event-log position compute the same $s_\mathrm{lag}$ for the same master without coordination, because the Čech section is content-addressed.

- **Eventual consistency ↔ $\delta^0 = 0$ on the cover.** Per [cohomological CALM](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/cohomological-calm.md), the substrate's normal merge discipline makes the connecting homomorphism $\delta^0 : H^0(M \cap R, \mathcal{F}) \to H^1(M \cup R, \mathcal{F})$ vanish identically. There is no obstruction class encoding "the master and replica disagree about a value that neither side individually decides." Eventual consistency is the engineering surface of $\delta^0 = 0$ — the lag *can be closed* by replication catch-up, with no merge obstruction left over.

- **Husainov acyclicity ↔ exact freshness, not worst-case estimate.** Per [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md), the Čech computation of $s_\mathrm{lag}$ agrees with the derived-functor sheaf cohomology on the nose for posets satisfying the Dedekind–MacNeille cut condition (which all finite database covers do). The substrate's `current-lag` is therefore an *exact* measure on the cover, not an upper-bound approximation; freshness budgets can be precise.

- **`replication-lag-budget` ↔ structural threshold on $|s_\mathrm{lag}|$.** A "lag SLA" is a bound on the section-gap weighted by the bilattice's $\leq_k$-grade. Routing layers that compare `current-lag` to `replication-lag-budget` are operating on a content-addressed measure, federation-stable across peers; wall-clock lag thresholds are admissible but operate on a proxy that breaks under non-uniform admission, exactly mirroring the materialized-view freshness situation per [materialized-view-record](materialized-view-record.md).

## Position in the platform

Read replica records are the substrate's *replication-topology registry*. Per [federation-convergence](../../../theorems/federation-convergence.md), replicas converge on the master's state per CRDT. Per the math grounding, a read replica is not a bespoke replication primitive: it is the substrate-content surface of one fixed two-element replica cover with $\delta^0 = 0$. A platform that ships a separate replication subsystem alongside its federation discipline is duplicating substrate machinery the math identifies as one construction. Per [cluster-as-replica-cover](../../distributed-coordination-platform/concepts/cluster-as-replica-cover.md), the same construction generalizes from the two-element master/replica cover to the $N$-element cluster cover used by the distributed-coordination-platform; the platforms share one cohomological foundation.
