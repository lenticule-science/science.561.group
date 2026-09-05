---
type: concept
class: pattern
depends-on: [merge, two-store-coherence, topology, multi-observer-system, bilattice-network-sheaf-consensus, network-sheaf-consensus-on-agent-graphs, crdt-convergence]
see-also: [provenance, witness, replication-consistency-via-network-sheaf]
---

# Replication

The pattern by which a predicated computer's predication graph is held consistently across multiple substrate instances. In the substrate's hyperdoctrine setting, replication is *a [multi-observer system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) on the replica graph* — each replica is an observer node carrying its own settling, channels are edges, and the replicas' agreement is the [bilattice network-sheaf consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) on the replica graph's incidence poset.

Replication is structurally distinct on the predication substrate from on a Boolean substrate: because the substrate's value-domain admits a commutative-associative-idempotent join (the substrate's [merge](../morphisms/merge.md) operator is a CRDT-style operation), replicas converge automatically on agreement, with no centralized coordinator required. Per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), the convergence is *structural* — a property of the value-domain's join, not a protocol layered on top.

## Hyperdoctrinal structure

Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the replication discipline is exactly:

- **Replica graph as multi-observer system.** Let $G = (V_G, E_G)$ be the substrate's replica graph: vertices are replicas, edges are sync channels. Per [multi-observer-system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md), this carries a functor $V_G : \hat G \to \mathrm{Settlings}_B$ from the incidence poset to per-replica settlings.
- **Per-replica settling.** Each replica's predication state is its settling $V_G(v)$ in the substrate's predication fiber-algebra.
- **Channel structure.** Each sync channel $e$ between replicas $v_1, v_2$ carries a settling $V_G(e)$ — typically the bilattice $\wedge_k$ consensus of the two endpoints' settlings.
- **D-frame consensus.** Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the categorical limit $\mathbb{F}_{V_G}^{\mathrm{cons}}$ of the per-replica d-frames is the *consensus* — the substrate-wide agreed state across all replicas.
- **Disagreement as $\top$-witness.** When two replicas hold contradictory values for a cell, the cellwise $\vee_k$ produces a $\top$-witness at that cell — a structural record of disagreement, not an exception.

Per [replication-consistency-via-network-sheaf](../theorems/replication-consistency-via-network-sheaf.md), the substrate's replication-consistency check is *exactly* the network-sheaf consensus computation: replicas agree iff the consensus d-frame's projection to each replica equals the replica's own d-frame.

## Three engineering structures

- **Replica membership.** A set of substrate instances declared as replicas of a particular [scope](scope.md) or substrate region. Membership is itself substrate content: predications on a replica-membership entity declare which instances are members, what their roles are (primary, secondary, witness-only), what their declared coverage obligations are. In the multi-observer framing, membership is the vertex set $V_G$. Adding a replica is inserting predications (extending $V_G$); removing a replica is recording a retraction declared as such.
- **Sync.** The operation by which replicas exchange events from their [event logs](../objects/event-log.md) and apply each other's events to converge on a shared settled state. Sync is itself a substrate operator producing witnesses; the witness records what events were exchanged, in what order, and what hashes were reached. In the multi-observer framing, sync is the channel-edge $E_G$ activity — replicas exchanging settling content across the channel and updating their per-replica settlings $V_G(v)$.
- **Failover and rebalance.** When a replica becomes unavailable, the substrate's policy determines which other replicas take over its role. The decision is itself a substrate operation: it reads replica health predications (telemetry — see [telemetry](telemetry.md)), the topology constraints, and the membership rules, and produces predications declaring the new role assignments. The operation produces a witness; an audit can replay the failover decision.

## Three properties of replication on the predication substrate

- **Convergence is structural.** Per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), two replicas with identical event log contents have identical predication graphs (per [two-store coherence](two-store-coherence.md)). Two replicas that have exchanged each other's events and re-settled have the same merged state. Convergence is not a protocol layer; it is a property of the substrate's value-domain.
- **Consistency under partition is the eventual case.** Replicas separated by a network partition continue to record events independently; on reunion, a sync round merges the events and converges on the union via the cellwise $\vee_k$. The substrate is partition-tolerant by construction; the engineering choice is between consistent-during-partition (one replica refuses writes until rejoined) or available-during-partition (both replicas accept writes, sync at rejoin). Per [replication-consistency-via-network-sheaf](../theorems/replication-consistency-via-network-sheaf.md), the substrate distinguishes these via the network-sheaf consensus computation.
- **Replication respects topology.** Replicas span [topology](topology.md) regions according to the coverage constraints recorded on the replicated content. A predicated computer's deployment can be migrated, rebalanced, or extended by editing the substrate's topology and replica-membership predications; the substrate's operators handle the propagation.

## Disagreement is first-class, not exceptional

The bilattice's four-valued structure is exactly what makes replica disagreement a *substrate state* rather than an *error condition*. When replicas hold contradictory values for a cell:

- The cellwise $\vee_k$ produces $\top$ at the disagreement cell — the substrate records "told both" rather than crashing.
- Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the $\mathrm{con}$-relation in the joint d-frame *fails* at this cell, structurally encoding the disagreement.
- Per [repair](repair.md), the $\top$-cell becomes a substrate signal that governance must reconcile — surfaced for explicit resolution rather than silently overwritten.

Replication on the predication substrate is therefore a substrate-level concern, not an infrastructure-level concern. The substrate's operators handle replica membership, sync, and failover by reading and writing predications; the runtime's job is to schedule the operators against the actual instances. There is no separate replication service that the substrate is unaware of.
