---
type: definition
class: substrate-entity
realizes: [cluster-membership]
depends-on:
  - cluster-membership
  - deployment-record
  - identity-record
  - witness
  - cluster-as-replica-cover
  - replica-cover
  - settling-associated-sheaf
  - bilattice-accessibility-relation
  - four-bilattice
  - four-regime-dichotomy
  - closure-2-monad
see-also:
  - leader-record
  - quorum-record
  - shard-record
  - failure-detection-as-bilattice-modal-suspicion
  - byzantine-cluster-as-finer-replica-cover
---

# Cluster record

A **cluster record** is the substrate-entity formal definition of a [cluster](teaching/explanations/cluster-membership.md): the predication-graph entity declaring a coordination cluster's membership, configuration, and current state.

## Structural fields

- **`id`** — kebab-case identifier (e.g., `prod-coordination-cluster`).
- **`members`** — references to [deployment-records](../../../objects/deployment-record.md) participating, with per-member role (`voter`, `learner`, `observer`) and state (`joining`, `active`, `failed`, `leaving`, `left`). Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), the potential-voter sub-list is the indexing $\{i\}_{i \in I}$ of the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_i \to U\}_i$ on the substrate region $U$ the cluster is responsible for.
- **`consensus-protocol`** — `raft`, `paxos`, `epaxos`, `pbft`, or substrate-custom. Per the math grounding below, the choice of protocol is the choice of global-section construction on the cluster's cover.
- **`quorum-policy`** — `simple-majority`, `read-write-quorum-spec`, `flexible`. CFT majority and BFT $2F+1$-of-$3F+1$ are two cover-discipline choices: per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md), the BFT threshold is the discipline guaranteeing the honesty-resolving refinement is touched by enough honest sections to admit a Mayer–Vietoris lift.
- **`current-leader`** — reference to the [leader-record](leader-record.md), if leader-election is in use.
- **`current-term`** — for term-based protocols, the current term/epoch; equivalently the membership-pinning ordinal at which the potential replica cover is held fixed for a consensus round.
- **`failure-detector-policy`** — reference to the [failure-detection](teaching/explanations/failure-detection.md) configuration; per the math grounding, this is the choice of bilattice-homomorphism projection of the cluster's heartbeat-indexed accessibility relation.
- **`accessibility-relation`** — *derived* (not separately stored) the cluster's [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R_{ij}(w, w')$ between observation worlds, computed from `members`, `failure-detector-policy`, and the cluster's recorded heartbeat-arrival history. The four substrate-recorded suspicion levels (`confirmed-alive`, `recently-heard-from`, `suspected`, `confirmed-failed`) are the four values of [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) on the per-cell aliveness predication, per [failure-detection-as-bilattice-modal-suspicion](../theorems/failure-detection-as-bilattice-modal-suspicion.md).
- **`closure-kind`** — `cluster`.

## Invariants

- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), the cluster's configuration is queryable.
- **Member-deployment-coherent.** Each member references a valid deployment-record.
- **Quorum-policy-coherent with members.** The quorum policy must be satisfiable by the current voter count.
- **Cover-condition holds.** Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), the union of potential members' clopens covers the substrate region the cluster is responsible for: $U = \bigcup_i U_i$.

## Math grounding

The cluster record is the substrate-content surface of the [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) on which the cluster's safety, termination, and partition-tolerance properties are computed as cohomological invariants. Each structural field has a fixed math role:

- **`members` ↔ cover indexing.** The potential-voter sub-list of `members` is exactly the index set $I$ of the replica cover $\{U_i \to U\}_{i \in I}$. The other roles refine the cover: `learner` members contribute a section but are not load-bearing on the global-section lift; `observer` members carry a non-merge accessibility entry and contribute to the [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) without contributing to quorum.

- **`current-term` ↔ cover-pinning ordinal.** Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md)'s "When the identification degrades" clause, membership churn mid-round changes the cover. The substrate's discipline is to pin the potential membership at the round's `current-term`, so the replica cover is well-defined for the duration of the consensus round even if the live `members` list mutates concurrently.

- **`quorum-policy` ↔ cover-discipline.** The choice of quorum threshold is the choice of which refinements of the replica cover are sufficient to admit a Mayer–Vietoris lift of the local section family per [vote-as-section](teaching/explanations/vote-as-section.md). Simple majority lifts on the trivial refinement; BFT $2F+1$-of-$3F+1$ lifts on the honesty-resolving refinement per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md); flexible read/write quorum-spec lifts on a refinement that distinguishes read-clopen from write-clopen at each member.

- **`failure-detector-policy` ↔ accessibility sub-region + projection class.** Per [failure-detection-as-bilattice-modal-suspicion](../theorems/failure-detection-as-bilattice-modal-suspicion.md), the cluster's failure detector is the substrate-content realization of one [modal possibility operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md) $\Diamond_R$ acting on the negative-evidence component of the heartbeat-indexed predication-fiber-algebra, with the choice of detector class (P, S, $\Diamond$P, $\Diamond$S) corresponding to one of four bilattice-homomorphism projections. The `failure-detector-policy` field records this choice as substrate-policy declaration; no bespoke detector code is shipped per class.

- **The cluster's closure regime is classified by the [four-regime-dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md).** The composed closure-rule system (membership + failure-detection + consensus + leader-election) acting on the cluster's predication fiber is itself a [closure 2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) per [closure-rule-system-realizes-closure-2-monad](../../../theorems/closure-rule-system-realizes-closure-2-monad.md). Its closure ordinal $\kappa$ falls into one of the regimes the dichotomy classifies — typically rendered as strict / Scott-continuous (fast settling under strong synchrony assumptions), transfinite-bounded (slow settling under a network adversary), and aperiodic (oscillatory under a non-monotone failure-detector). The cluster's choice of `consensus-protocol`, `quorum-policy`, and `failure-detector-policy` together determine where its closure system sits in the classification; a cluster whose recorded behavior contradicts the declared regime is itself a substrate-content coherence failure surfaced by audit per [regime-classification-for-substrate](../../../theorems/regime-classification-for-substrate.md).

## Position in the substrate

Cluster records are the substrate's *coordination-cluster registry*. Per [witness](../../../objects/witness.md), cluster events (membership changes, leader transitions, consensus rounds) produce witnesses; auditors can review cluster history. Per the math grounding, every such event is the substrate-content trace of a cover-modification or cover-pinned-section move on the cluster's replica cover, so the audit log is structurally a record of moves in a single cohomological calculation rather than a heterogeneous event stream.
