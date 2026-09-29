---
type: concept
class: coordination-protocol
depends-on:
  - lock
  - federation-graph
  - leader-election
  - identity-record
  - substrate-accessibility-relation
  - four-bilattice
  - right-residuation-operator
  - modal-necessity-operator
see-also:
  - quorum-consensus
  - distributed-lock-as-residuated-authority-gate
  - residuated-restriction-as-authority-gate
---

# Distributed lock

A *substrate-recorded mutual-exclusion primitive that spans multiple substrate-instances*. Where the parent's [lock](../../functional-runtime-platform/concepts/lock.md) provides exclusion within a single substrate, distributed locks provide exclusion across the federation graph.

Per [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md), a distributed lock is not a coordination primitive sui generis: it is the [right residuation operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) $\mathrm{R}_{\alpha_\ell}$ on the lock's [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) fiber — gating the request payload by a quorum-witnessed authority element $\alpha_\ell$ — composed with the [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_{\mathrm{lease}}}$ on the lease sub-region of the substrate's [accessibility relation](../../teaching/explanations/substrate-accessibility-relation.md). Mutual exclusion, lease auto-release, reentrancy, and termination each follow from one corpus-level theorem; see the cited theorem.

A distributed lock has the structure:

- **Lock-id** — the resource being locked (typically by canonical hash or stable name).
- **Holder** — the substrate-instance currently holding the lock (with optional sub-holder identifying which agent / operation within that substrate).
- **Lease duration** — time-bounded; the lock auto-releases if the holder doesn't renew.
- **Acquisition policy** — `fair` (FIFO across substrates), `priority`, `preemptive`.

Common implementation patterns:

- **Lease-based via consensus.** Holder is set via [quorum-consensus](quorum-consensus.md); the lease expires after a duration; renewal is another consensus round. Used by etcd, Zookeeper. Tolerates network partition (minority can't grant lease).
- **Leader-mediated.** Per [leader-election](leader-election.md), the elected leader handles lock requests; non-leaders forward. Single point of failure unless leader-election is robust.
- **Token ring.** A token circulates among participants; the token-holder owns the lock. Suitable for small federations with predictable communication.

Per [self-representation](../../teaching/explanations/self-representation.md), distributed-lock state is substrate content. Per [witness](../../../objects/witness.md), acquisitions and releases are witnessed.

Distributed locks are *expensive* relative to CRDT operations. Per [federation-convergence](../../../theorems/federation-convergence.md), the substrate's discipline is to use CRDT for the common case and reserve distributed locks for genuinely-exclusive operations.

Per the [latency-budget](../../teaching/explanations/latency-budget.md), distributed-lock acquisition has consensus-protocol latency; substrates with hard latency requirements should not use distributed locks on the critical path.

Network-partition behavior:

- **Lease-based**: holders on the partitioned side lose lock when their lease expires (they cannot renew); holders on the quorum side can re-acquire after the leasing duration.
- **Leader-mediated**: depends on leader-election's partition behavior.
- **Token ring**: typically blocks if the token can't traverse a partition.
