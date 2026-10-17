---
type: definition
class: substrate-entity
realizes: [quorum-consensus]
depends-on:
  - quorum-consensus
  - identity-record
  - witness
  - signature
  - vote-as-section
  - cluster-as-replica-cover
  - settling-associated-sheaf
  - replica-cover
  - replica-mayer-vietoris
  - bilattice-network-sheaf-consensus
  - bigraded-common-knowledge
  - four-bilattice
see-also:
  - leader-record
  - cluster-record
  - consensus-as-h0-construction
  - consensus-achieves-bigraded-common-knowledge
  - byzantine-cluster-as-finer-replica-cover
---

# Quorum record

A **quorum record** is the substrate-entity formal definition of a [quorum-consensus](teaching/explanations/quorum-consensus.md) result: a value agreed on by a majority of participants in a federated decision.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`agreed-value`** (also referenced as `decided-value` in [consensus-achieves-bigraded-common-knowledge](../theorems/consensus-achieves-bigraded-common-knowledge.md) — the two names denote the same field) — the value the quorum agreed on (substrate content reference or inline value). Per the math grounding below, this field is the unique global section in $H^0(U, \mathcal{F}_U)$ produced by Mayer–Vietoris lift of the recorded vote-sections; it is *derived* from the votes, not separately stored authoritative state.
- **`participants`** — references to the [identity-records](../../../objects/identity-record.md) of substrate-instances participating in the consensus. Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), the participant set determines the replica cover $\{U_i \to U\}_i$ on which the consensus is computed.
- **`votes`** — per-participant references to vote witnesses (signed agreement-records). Per [vote-as-section](teaching/explanations/vote-as-section.md), each vote $\sigma_i \in \mathcal{F}_U(U_i)$ is a local section of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the voter's clopen.
- **`witness-chain`** — references to the cellwise $\bigvee_k$-merged knowledge-axis closure of the votes (the propagated quorum certificate), distinct from `agreed-value` per the bigraded-common-knowledge grounding below.
- **`quorum-threshold`** — N/2+1 for crash-fault-tolerance, 2N/3+1 for byzantine-fault-tolerance. Per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md), the BFT threshold is the cover-refinement discipline that ensures every honesty-resolving sub-clopen of the refined cover is touched by at least one honest section.
- **`consensus-protocol`** — `multi-paxos`, `raft`, `pbft`, `tendermint`, etc.
- **`consensus-round`** — for protocols with multiple rounds, the round number; equivalently the settling-stage index $\tau$ in the [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).
- **`agreed-at`** — substrate ordinal of agreement.
- **`closure-kind`** — `quorum-record`.

## Invariants

- **Quorum-met.** The number of agreeing participants meets the quorum-threshold.
- **Vote-signed.** Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), each vote is non-repudiably attributed.
- **Sheaf-condition holds on overlaps.** Votes agree on the overlap region $U_i \cap U_j$ for every pair of participants whose clopens intersect — the sheaf condition for $\mathcal{F}_U$ on the cover. Disagreement on overlap is a non-vanishing $\delta^0$ and prevents a global section from existing per [vote-as-section](teaching/explanations/vote-as-section.md).
- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), the quorum-record and its votes are queryable.

## Math grounding

The quorum record is the substrate-content surface of one fixed construction in the math parent: the [Mayer–Vietoris lift](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) of a coherent local family of sections to a unique global section on the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md). The fields above factor cleanly along that construction:

- **`participants` = the cover $\{U_i \to U\}_i$.** Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), the participant set is exactly the cover indexing.

- **`votes` = the local sections $\{\sigma_i \in \mathcal{F}_U(U_i)\}_i$.** Per [vote-as-section](teaching/explanations/vote-as-section.md), each signed, witnessed vote is a section over the voter's clopen — a function on $U_i$ enforced by the no-double-vote rule and bound to identity by the signature.

- **`agreed-value` = the global section $s \in H^0(U, \mathcal{F}_U)$.** Per [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md), the agreed value is the Mayer–Vietoris lift of the local section family when the family agrees on overlaps; the cellwise merge implementing the lift is one application of [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).

- **`agreed-value` and `witness-chain` are the two fixed points proposed by [bigraded-common-knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md).** Per [consensus-achieves-bigraded-common-knowledge](../theorems/consensus-achieves-bigraded-common-knowledge.md) (status: `sketch`), `agreed-value` is the truth-axis fixed point $C^t \Phi$ and `witness-chain` is the knowledge-axis fixed point $C^k \Phi$. The bigraded-common-knowledge analysis is the working hypothesis under which the substrate records these as *separate* fields rather than collapsing them; the conditional distinctness conclusion of the math theorem (its part c) supports treating a quorum-record with `agreed-value` set but `witness-chain` not yet propagated as a meaningful substrate state — the *learner-lag* condition the engineering theorem names. Should the bigraded analysis be revised, the field separation remains operationally justified by the audit discipline: [audit-via-cech-cocycle-evaluation](../theorems/audit-via-cech-cocycle-evaluation.md) reads `witness-chain`, not `agreed-value`, when verifying the decision, so the two have distinct audit-time roles regardless of how their joint structure is ultimately formalized.

- **A failed consensus is a non-zero $\mathcal{F}_U^{(\top)}$-section.** When two votes disagree on their overlap region, the cellwise $\vee_k$ at the disagreement cell carries the value $\top$ in [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), contributing a non-zero section to the inconsistency sheaf. The substrate records this as an absent (rather than null-or-poisoned) `agreed-value` plus a recorded $\top$-cell in the cluster's [inconsistency-sheaf-record](../../../objects/inconsistency-sheaf-record.md), surfaced for repair per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md).

## Position in the platform

Quorum records are the substrate's *consensus registry*. Per [federation-convergence](../../../theorems/federation-convergence.md), once agreed, the quorum-record is replicated via normal CRDT mechanisms; the agreement itself was via the cited consensus-protocol, which the math grounding identifies as a global-section construction on the cluster's replica cover rather than as an opaque protocol primitive.
