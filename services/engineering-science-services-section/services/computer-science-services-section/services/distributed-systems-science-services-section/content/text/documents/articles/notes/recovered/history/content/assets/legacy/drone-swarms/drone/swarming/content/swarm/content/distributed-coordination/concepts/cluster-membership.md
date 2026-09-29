---
type: concept
class: distributed-discipline
depends-on: [federation-graph, deployment-record, identity-record, witness]
realizes:
  - replica-cover
  - parameter-base-category
  - bilattice-accessibility-relation
  - four-bilattice
see-also:
  - leader-election
  - failure-detection
  - cluster-as-replica-cover
  - byzantine-cluster-as-finer-replica-cover
---

# Cluster membership

The *substrate-recorded discipline for tracking which substrate-instances are members of a coordination cluster*: who's joined, who's currently active, who's failed, who's left.

A cluster is a subset of the federation graph that participates in coordination protocols (leader-election, quorum, distributed-locking) requiring stronger-than-CRDT guarantees. Per [cluster-as-replica-cover](cluster-as-replica-cover.md), the potential-voter sub-list of a cluster's membership is exactly the indexing $\{i\}_{i \in I}$ of the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_i \to U\}_i$ on the substrate region $U$ the cluster is responsible for; cluster membership is therefore not a free engineering concept but the substrate-content surface of one fixed math construction.

Cluster membership has the structure:

- **Cluster identifier** — kebab-case identifier for this cluster (e.g., `prod-west-coordination-cluster`).
- **Member substrate-instances** — references to the [deployment-records](../../../objects/deployment-record.md) participating, each with its [identity-record](../../../objects/identity-record.md). Per the math grounding below, this set is the indexing of the cluster's replica cover.
- **Member roles** — per-member designation: `voter`, `learner`, `observer`. Only voters participate in consensus. Per the math grounding, the role refines the cover: voters are load-bearing for the global-section lift; learners contribute a section but are not load-bearing; observers contribute to the [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) without contributing to quorum.
- **Membership state per member** — `joining`, `active`, `failed`, `leaving`, `left`.
- **Membership change protocol** — how members join/leave (typically requires consensus among existing voters); structurally, the change is a recorded base-change in the cluster's [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathbf{B}$, not a runtime mutation that breaks the potential cover.

## Math grounding

Cluster membership is the substrate-content discipline managing the cluster's replica cover. The factorization:

- **Active members ↔ cover indexing.** The set of currently-potential voters is exactly the index set $I$ of the replica cover $\{U_i \to U\}_{i \in I}$. The cover-validity precondition that the potential members' clopens jointly cover the substrate region $U$ is what makes the cluster's coordination protocols' safety theorems applicable.

- **Per-member role ↔ cover-refinement contribution.** The voter/learner/observer distinction refines the cover into a stratification: the voter sub-cover is what every Mayer–Vietoris lift is computed against; the learner sub-cover extends with non-load-bearing sections that audit can re-evaluate; the observer sub-cover contributes only accessibility-relation entries.

- **CFT vs BFT cluster sizing ↔ cover-discipline choice.** Per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md), a BFT cluster's $3F+1$ sizing is the substrate-content witness of the honesty-resolving cover-refinement that admits Mayer–Vietoris lift in the presence of $F$ adversarial sections. CFT $2F+1$ sizing is the same construction on the trivial refinement (no adversarial sections assumed).

- **Membership change ↔ recorded base-change in $\mathbf{B}$.** Joining or leaving the cluster updates the potential cover; the substrate's discipline pins membership at the in-flight round's `current-term` (per [cluster-record](../objects/cluster-record.md)) so the cover is well-defined for the duration of the round even if the live membership list mutates concurrently. Membership changes implemented as runtime branching (rather than recorded base-changes in $\mathbf{B}$) silently break the cover-respecting consensus theorems.

## Substrate-recorded state

Per [self-representation](../../teaching/explanations/self-representation.md), cluster membership is substrate content. Per [witness](../../../objects/witness.md), every membership transition produces a witness; auditors can review cluster history. Per the math grounding, every transition is the substrate-content trace of a cover-modification on the cluster's replica cover, so the membership history is structurally a record of moves in a single cohomological calculation rather than a heterogeneous event stream.

Per [failure-detection](failure-detection.md), the cluster monitors member health; suspected-failed members may be removed via the membership change protocol. The failure-detection discipline is itself one [modal-possibility operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md) $\Diamond_R$ on the heartbeat-indexed accessibility relation; the four substrate-recorded suspicion levels are the four values of [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md).

## Properties

- **Bounded size.** Most coordination protocols have practical limits (Raft typically 3-7 voters, Paxos similar). Larger clusters trade lower availability (more potential disagreement on overlaps) for higher resilience (more redundancy in the cover).
- **Reconfigurable.** Per the membership change protocol, members can be added or removed during operation; the protocol must handle in-flight operations during reconfiguration via cover-pinning at the round's `current-term`.
- **Federation-portable.** Cluster membership records federate per [federation-convergence](../../../theorems/federation-convergence.md) at the *content* level (the records are CRDT-shaped); cluster *operations* (consensus on a value) require this subtheory's coordination protocols, which are non-CRDT precisely because they compute global sections rather than commutative merges.
