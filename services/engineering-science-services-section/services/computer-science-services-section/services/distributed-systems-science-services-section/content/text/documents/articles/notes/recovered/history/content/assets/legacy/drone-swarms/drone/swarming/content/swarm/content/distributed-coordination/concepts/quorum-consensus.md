---
type: concept
class: coordination-protocol
depends-on: [federation-graph, identity-record, witness, signature]
realizes:
  - settling-associated-sheaf
  - replica-cover
  - replica-mayer-vietoris
  - bilattice-network-sheaf-consensus
  - inconsistency-sheaf
  - bigraded-common-knowledge
see-also:
  - leader-election
  - distributed-lock
  - vote-as-section
  - cluster-as-replica-cover
  - consensus-as-h0-construction
  - byzantine-cluster-as-finer-replica-cover
  - consensus-achieves-bigraded-common-knowledge
---

# Quorum consensus

A *substrate-recorded protocol for reaching agreement on a single value across multiple substrate-instances*, used when the value is non-CRDT-mergeable and consensus is required. Quorum consensus is the substrate's mechanism for "this exact value, agreed by N/2+1 instances."

Per the math grounding below, quorum consensus is not a coordination primitive sui generis: it is the substrate-content procedure for computing $H^0(U, \mathcal{F}_U)$ on the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md). Safety and single-value-per-round follow from [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md); the structure of partial vs. full agreement is framed by [consensus-achieves-bigraded-common-knowledge](../theorems/consensus-achieves-bigraded-common-knowledge.md) (status: `sketch`).

## Common protocols

- **Multi-Paxos.** Classical consensus protocol. Two phases: prepare (proposer requests promises from acceptors), accept (proposer issues value if quorum promised). Tolerates F failures with 2F+1 acceptors. Structurally, prepare amortizes the Phase-1 cover-pinning across many rounds; accept is the section-collection phase.
- **Raft.** Leader-driven consensus (per [leader-election](leader-election.md)). Leader proposes log entries; quorum acknowledges before commit. Easier to understand than Paxos; widely used in etcd, Consul, Kafka. Structurally, the leader's role is to propose the candidate constant section; followers commit local sections; the commit threshold is the cover-discipline that admits a Mayer–Vietoris lift.
- **Byzantine Fault Tolerant (BFT) consensus.** Tolerates malicious actors, not just crashes. Uses larger quorums (typically 2F+1 of 3F+1 nodes for F malicious). PBFT, Tendermint, HotStuff are common. Per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md), the BFT threshold is the cover-refinement discipline that ensures the honesty-resolving sub-cover is touched by enough honest sections to admit the lift.
- **Crash Fault Tolerant (CFT) consensus.** Assumes nodes only crash, don't lie. Smaller quorums; suitable when actors are trusted. Structurally, this is consensus on the trivial cover-refinement.

## Math grounding

Quorum consensus factors cleanly through one global-section construction:

- **Each vote = a local section.** Per [vote-as-section](vote-as-section.md), each signed acknowledgment is a section $\sigma_i \in \mathcal{F}_U(U_i)$ of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the voting member's clopen — a function on $U_i$ enforced by the no-double-vote rule and bound to identity by the signature.

- **Threshold-met = local family lifts to a global section.** Per [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), the local family $\{\sigma_i\}_i$ lifts to a unique global section in $H^0(U, \mathcal{F}_U)$ when it agrees on the overlap regions $U_i \cap U_j$. The cellwise merge realizing the lift is one application of [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md). The agreed value is the lifted global section; per [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md), $H^0$ has at most one global section that lifts a given local family, so at most one value is agreed per round (the safety property is structural, not protocol-specific).

- **Failure = a non-vanishing $\delta^0$.** When some pair of votes disagrees on the overlap, the cellwise $\vee_k$ at the disagreement cell carries the value $\top$ in [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), contributing a non-zero section to the [inconsistency sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md). The substrate records this as a failed-witness with the offending pair attached. Failure is the substrate-content witness of a recognized cohomological obstruction, not an exception path.

- **Truth-axis vs knowledge-axis fixed points.** Per [consensus-achieves-bigraded-common-knowledge](../theorems/consensus-achieves-bigraded-common-knowledge.md) (status: `sketch`), a successful consensus is analyzed as producing two fixed points: a truth-axis fixed point (the cluster commonly knows *what* was decided) and a knowledge-axis fixed point (the cluster commonly possesses the signed certificate). The substrate's [quorum-record](../objects/quorum-record.md) records these as separate fields (`agreed-value` vs `witness-chain`) so the propagation gap (the *learner-lag* condition) is observable. The two-field discipline remains operationally justified independent of the bigraded analysis's eventual promotion: audit reads `witness-chain`, while runtime resolution reads `agreed-value`.

## Substrate-recorded state

Per [self-representation](../../teaching/explanations/self-representation.md), quorum-consensus state is substrate content: the value being agreed on, the participating substrate-instances, the per-instance vote, the agreed-quorum. Per [witness](../../../objects/witness.md), every agreement produces a witness signed by participants. Per [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md), the recorded round can be re-audited as a Čech cocycle calculation against the same cover the consensus lifted on, without re-running the protocol or reaching the original cluster members.

## When CRDT vs. quorum

- **CRDT** (per [federation-convergence](../../../theorems/federation-convergence.md)): operations commute, replicas converge automatically. No coordination overhead. Structurally, CRDT operations are sections of a presheaf whose merge is built into the algebra; no cover-respecting global-section lift is required.
- **Quorum**: operations don't commute; agreement is required. Coordination cost (round-trips, lock acquisition). Structurally, quorum operations require the Mayer–Vietoris lift on a replica cover; the cost is the lift's communication cost.

Use quorum when:

- A value must be unique-and-known across the federation (e.g., the canonical leader, the canonical configuration version) — i.e., requires a global section, not a CRDT merge.
- An action must be atomic across multiple substrates (e.g., a financial transfer between two substrate-resident accounts).
- A safety property requires agreement (e.g., not committing two conflicting writes) — i.e., requires the at-most-one-value-in-$H^0$ property of the global-section construction.

Per [federation-convergence](../../../theorems/federation-convergence.md), quorum results are themselves substrate content; once agreed, the agreed value is replicated via normal CRDT mechanisms. The expensive cover-respecting computation is amortized across the value's lifetime.
