---
type: theorem
class: engineering-claim
status: proved
depends-on: [quorum-consensus, propose-and-vote, signature-binds-witness-to-identity, settlement-determinism, replica-cover, replica-mayer-vietoris, bilattice-network-sheaf-consensus, closure-monad-no-non-trivial-periodic-orbits]
see-also: [leader-election, consensus-achieves-bigraded-common-knowledge, consensus-as-h0-construction]
---

# Quorum consensus is safe: two values are never both decided

**Claim.** For any [cluster-record](../objects/cluster-record.md) running [propose-and-vote](../morphisms/propose-and-vote.md), in any single consensus instance, at most one value is decided. Two different values are never both decided in the same instance, even under arbitrary message loss, message reordering, or member failures (provided fewer than $\lceil N/2 \rceil$ voters fail simultaneously, where $N$ is the voter count).

This is the standard *safety* property of consensus protocols (Lamport's "safety" in the Paxos paper, Raft's "Election Safety" + "Log Matching" + "Leader Completeness").

## Why this holds

The argument depends on the consensus-protocol's safety proof. For Raft (the substrate's typical choice):

**Quorum-overlap.** Any two majority quorums of $N$ voters share at least one voter. If quorum $Q_1$ decides value $v_1$ and quorum $Q_2$ decides value $v_2$ in the same instance, the overlapping voter would have voted for both — but per the protocol, a voter votes for at most one value per instance.

**Vote-discipline.** Per [propose-and-vote](../morphisms/propose-and-vote.md), each voter signs at most one vote per instance. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the signature is non-repudiable — a voter cannot later claim it didn't vote.

**Decision-witness.** Per [witness](../../../objects/witness.md), a decision witness includes the quorum's signed votes. An auditor can verify quorum-overlap by inspecting the decision witnesses; if two different decisions claim quorum on the same instance, the inspection reveals a forged-or-double-voting violation.

**Cohomological source.** Quorum-overlap is the engineering surface of a structural fact about the substrate's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md): two voter-sets $V_1, V_2$ form a two-element cover of the consensus instance's substrate region, with $V_1 \cap V_2$ non-empty whenever $|V_1| + |V_2| > N$. Per the [replica Mayer–Vietoris sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), a section of the consensus-decision sheaf over $V_1$ and a section over $V_2$ glue to a section over $V_1 \cup V_2$ exactly when their restrictions agree on the overlap $V_1 \cap V_2$. The protocol's no-double-vote rule is the substrate-level enforcement of this gluing condition: the overlapping voter's single signed vote *is* the agreement-on-overlap that lets the two quorums' sections be the same global section. Two distinct decisions in the same instance would correspond to two non-isomorphic global sections of the same sheaf, contradicting the [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) result that the cellwise $\vee_k$-merge on a connected network sheaf is the unique consensus value.

**No periodic disagreement.** Per [closure-monad-no-non-trivial-periodic-orbits](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md), the closure 2-monad admits no non-trivial periodic orbit: the consensus instance cannot oscillate between two decided values across rounds. Combined with the Mayer–Vietoris uniqueness of the global section, the safety property is structural — it does not rely on the protocol's choice of timeout, leader, or transport.

## Engineering consequence

- **Multi-cell-atomic-commit safety.** Cross-substrate transactions per [transaction](../../teaching/explanations/transaction.md) using quorum-consensus inherit safety: the cluster cannot decide both commit and abort.
- **Leader-election-correctness.** Per [elect-leader](../morphisms/elect-leader.md), at most one leader is elected per term — the same safety property applied to leader-election.
- **Audit-verifiable.** Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), an auditor can verify safety by inspecting the decision witnesses.

## What the theorem rules out

- A consensus implementation that allows a voter to sign multiple votes per instance breaks the safety property.
- A consensus implementation without signature verification on votes admits forged votes that violate safety.
- A consensus implementation that loses witness records after deciding cannot prove safety to auditors.

## What the theorem requires

- The consensus protocol satisfies quorum-overlap (every pair of quorums shares a voter).
- Voters honor the one-vote-per-instance rule.
- Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), votes are signed and verified.
- Per [witness](../../../objects/witness.md), decision witnesses are durably recorded.
- Fewer than $\lceil N/2 \rceil$ voters fail simultaneously.
