---
type: morphism
class: coordination-operation
realizes: [quorum-consensus]
depends-on:
  - quorum-consensus
  - quorum-record
  - identity-record
  - witness
  - signature
  - vote-as-section
  - cluster-as-replica-cover
  - settling-associated-sheaf
  - replica-mayer-vietoris
  - bilattice-network-sheaf-consensus
see-also:
  - elect-leader
  - propose-and-vote
  - acquire-distributed-lock
  - consensus-as-h0-construction
  - byzantine-cluster-as-finer-replica-cover
---

# Propose quorum value

The substrate operation that *runs a quorum-consensus protocol* to agree on a value across federated substrate-instances. It is the lower-level partner of [propose-and-vote](propose-and-vote.md): where `propose-and-vote` operates against a fixed [cluster-record](../objects/cluster-record.md), `propose-quorum-value` accepts the participant set and threshold directly and is the operation [acquire-distributed-lock](acquire-distributed-lock.md) and [elect-leader](elect-leader.md) compose with to obtain their authority elements.

## Signature

`propose-quorum-value(value, participants, protocol, threshold) → (quorum-record, consensus-witness) | (consensus-failure)`

Inputs:

- **`value`** — the value to agree on; structurally, the constant section the proposer asks each participant to commit to.
- **`participants`** — substrate-instances participating; the index set $I$ of the operation's effective replica cover $\{U_i \to U\}_{i \in I}$ per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md).
- **`protocol`** — `multi-paxos`, `raft`, `pbft`, etc.
- **`threshold`** — quorum size required (N/2+1 for CFT, 2N/3+1 for BFT). Per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md), the BFT threshold is the cover-refinement discipline that ensures the honesty-resolving sub-cover is touched by enough honest sections to admit a Mayer–Vietoris lift.

Outputs:

- **`quorum-record`** — on success, the agreed-value with quorum's signed votes; per the math grounding below, the record's `agreed-value` field is the global section in $H^0(U, \mathcal{F}_U)$ lifted by Mayer–Vietoris from the participant sections.
- **`consensus-witness`** — records the protocol's run.
- **`consensus-failure`** — on partition, insufficient participation, or proposal conflict, consensus fails; the failure-witness records the obstruction as a non-vanishing $\delta^0$.

## Operational semantics

Per the chosen protocol, the proposer runs round(s):

- Send proposal to participants.
- Collect signed votes; per [vote-as-section](teaching/explanations/vote-as-section.md), each vote is a section $\sigma_i \in \mathcal{F}_U(U_i)$ of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the participant's clopen.
- If threshold reached *and* sections agree on overlaps, declare consensus and emit the [quorum-record](../objects/quorum-record.md).
- Per [witness](../../../objects/witness.md), record the agreement and per-participant votes.

## Math grounding

The operation is the substrate-content surface of one cycle of the global-section construction on the participant-induced replica cover. The derivation factors as follows:

- **`participants` ↔ cover indexing.** Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), the participant list induces the replica cover $\{U_i \to U\}_{i \in I}$. The operation does not require a pre-existing cluster-record; it is parametrized directly by the cover.

- **Each vote ↔ a local section.** Per [vote-as-section](teaching/explanations/vote-as-section.md), each signed acknowledgment is a section $\sigma_i \in \mathcal{F}_U(U_i)$ — a function on the participant's clopen, bound to the participant's identity by the signature, well-formed by the no-double-vote rule.

- **`threshold` ↔ cover-discipline that admits a Mayer–Vietoris lift.** Per [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), the local family lifts to a global section when it is large enough to determine the lift on every cell of the cover. CFT majority threshold suffices for this on the trivial cover; BFT $2F+1$-of-$3F+1$ threshold suffices on the honesty-resolving refinement per [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md). The merge implementing the lift is one application of [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).

- **`quorum-record.agreed-value` ↔ the global section $s \in H^0(U, \mathcal{F}_U)$.** Per [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md), the agreed value is the lifted global section. The operation's substrate-content output (the quorum-record) is the substrate's record of which section $s$ was lifted from which local family on which cover.

- **`consensus-failure` ↔ non-vanishing $\delta^0$.** When the local family does not satisfy the sheaf condition on overlaps — e.g., distinct partitions of participants commit to different values on an overlap region — the lift does not exist; the failure-witness records the obstruction. The substrate does not silently merge or pick a value; it surfaces the obstruction.

## Engineering invariants

- **Threshold-met.** Per [quorum-record](../objects/quorum-record.md), agreement requires threshold of signed votes — equivalently, the cover-discipline required for the Mayer–Vietoris lift to exist.
- **Single-value-per-round.** Per [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md), $H^0(U, \mathcal{F}_U)$ has at most one global section that lifts a given local family, so at most one value is agreed per round.
- **Sheaf-condition enforced on overlap.** Disagreement on $U_i \cap U_j$ produces a `consensus-failure`, not a silently-merged committed value.
- **Witnessed.** Per [witness](../../../objects/witness.md), consensus rounds are auditable; per [audit-quorum-witness-chain](audit-quorum-witness-chain.md), the resulting quorum-record can be audited as a Čech cocycle calculation against the same cover the operation lifted on.

## Position in the platform

Propose-quorum-value is the substrate's *cross-substrate-agreement primitive*. It is used directly by [acquire-distributed-lock](acquire-distributed-lock.md) (to obtain the round's authority element) and by [elect-leader](elect-leader.md) (in protocols where leader-election reduces to a quorum on a leadership predicate). Used standalone when CRDT discipline doesn't suffice — see [quorum-consensus](teaching/explanations/quorum-consensus.md). Per the math grounding, the operation is not a separate primitive; it is the substrate-content procedure for one cycle of the cover-respecting global-section construction the consensus theorems specify.
