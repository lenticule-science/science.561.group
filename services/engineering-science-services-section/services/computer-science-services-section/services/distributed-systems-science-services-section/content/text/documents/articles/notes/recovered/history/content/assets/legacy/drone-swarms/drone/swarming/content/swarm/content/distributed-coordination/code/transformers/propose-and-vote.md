---
type: morphism
class: coordination-operation
realizes: [quorum-consensus]
depends-on:
  - quorum-consensus
  - cluster-record
  - quorum-record
  - signature
  - witness
  - vote-as-section
  - cluster-as-replica-cover
  - settling-associated-sheaf
  - replica-mayer-vietoris
  - bilattice-network-sheaf-consensus
  - inconsistency-sheaf
see-also:
  - elect-leader
  - propose-quorum-value
  - consensus-as-h0-construction
  - audit-quorum-witness-chain
---

# Propose and vote

The substrate operation that *runs a [quorum-consensus](teaching/explanations/quorum-consensus.md) round* on a cluster, deciding a value via voter agreement. Operationally, it is the substrate-content procedure that constructs a candidate global section on the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) and either commits the lift or records the obstruction.

## Signature

`propose-and-vote(cluster-record-id, proposed-value, instance-id) → (decided-value | failed-witness)`

Inputs:

- **`cluster-record-id`** — reference to the [cluster-record](../objects/cluster-record.md), which determines the potential replica cover $\{U_i \to U\}_i$ per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md).
- **`proposed-value`** — the value being proposed; structurally, the constant section the proposer asks each member to commit to over its clopen.
- **`instance-id`** — identifier for this consensus round (typically the leader's term + sequence number); equivalently the settling stage $\tau$ in the cluster's [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at which the round is run.

Outputs:

- **`decided-value`** — on success, the value the cluster agreed on (which may differ from proposed-value if a competing proposal had priority); per the math grounding below, this is the unique global section in $H^0(U, \mathcal{F}_U)$ produced by the Mayer–Vietoris lift of the recorded vote-sections.
- **`failed-witness`** — on failure (no quorum, or sections fail the sheaf condition on overlap), records the failure as a non-vanishing $\delta^0$ together with the cells that obstruct the lift.

## Operational semantics

Per the cluster's `consensus-protocol`:

- **Raft.** Leader appends value to its log; replicates to followers; on majority-acknowledgment, the value is committed.
- **Paxos.** Run accept phase with the proposed value (assuming Phase 1 has been amortized via leader-election); on quorum-of-accepts, the value is decided.
- **EPaxos.** No leader; the proposer broadcasts; if no conflicts and quorum-of-acks, fast path; else slow path with second round.

Each member's signed acknowledgment is a section $\sigma_i \in \mathcal{F}_U(U_i)$ of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) per [vote-as-section](teaching/explanations/vote-as-section.md). Per [signature](../../teaching/explanations/signature.md), every vote is signed; the decision witness includes all voter signatures and is what the resulting [quorum-record](../objects/quorum-record.md)'s `votes` field records.

Per [witness](../../../objects/witness.md), the round produces witnesses for proposal, votes, and decision (or failure).

## Math grounding

The operation is the substrate-content procedure that runs one cycle of the global-section construction underlying [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md):

1. **Propose = announce a candidate constant section.** Sending `proposed-value` to participants is structurally proposing the constant section $v$ over $U$ as the candidate global section; each member is asked to commit a local section $\sigma_i$ whose value at every point of $U_i$ is $v$.

2. **Vote = commit a local section per [vote-as-section](teaching/explanations/vote-as-section.md).** The signed vote is a function on $U_i$ (enforced as a function by the no-double-vote rule) bound to the member's identity by the signature. The substrate-recorded vote is exactly the section's substrate-content witness.

3. **Threshold met = local family lifts to a global section.** Per [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), the local family $\{\sigma_i\}_i$ lifts to a unique global section in $H^0(U, \mathcal{F}_U)$ when the family agrees on the overlap regions $U_i \cap U_j$. The cellwise merge realizing the lift is one application of [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md). The substrate's `decided-value` field records the lifted global section.

4. **Failure = a non-vanishing $\delta^0$ obstruction.** When some pair of votes disagrees on the overlap, the cellwise $\vee_k$ at the disagreement cell carries the value $\top$ in [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), contributing a non-zero section to the [inconsistency sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md). The substrate records this as `failed-witness` with the offending pair attached, surfaced for repair per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md). Failure is *not* an exception path; it is the substrate-content witness of a recognized cohomological obstruction.

5. **Round-success ≠ universal-witness-propagation.** Per [consensus-achieves-bigraded-common-knowledge](../theorems/consensus-achieves-bigraded-common-knowledge.md) (status: `sketch`), the operation produces the truth-axis fixed point synchronously with the threshold-of-acks; the knowledge-axis fixed point (universal possession of the signed certificate) propagates asynchronously through subsequent witness diffusion. The substrate's [quorum-record](../objects/quorum-record.md) records the two as separate fields (`agreed-value` vs `witness-chain`) precisely so this propagation gap is observable.

## Engineering invariants

- **Safety.** Two different values are never both decided in the same instance — equivalently, for a fixed `instance-id` there is at most one global section in $H^0(U, \mathcal{F}_U)$ per [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md).
- **Quorum-required.** Decision requires quorum of affirmative votes; the threshold corresponds to the cover-discipline declared in the cluster's `quorum-policy`.
- **Sheaf-condition enforced on overlap.** Disagreeing votes on $U_i \cap U_j$ produce a `failed-witness`, never a silently-merged committed value.
- **Witness-emitted.** All consensus events are recorded; per [audit-quorum-witness-chain](audit-quorum-witness-chain.md), the round's outputs are auditable as a Čech cocycle calculation against the same cover this operation constructed sections on.
