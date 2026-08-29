---
type: concept
class: coordination-protocol
depends-on: [identity-record, federation-graph, signature, witness]
realizes:
  - modal-necessity-operator
  - residuated-restriction-as-authority-gate
  - closure-2-monad
  - closure-monad-no-non-trivial-periodic-orbits
  - replica-cover
  - settling-associated-sheaf
see-also:
  - quorum-consensus
  - distributed-lock
  - leader-election-termination-via-no-periodic-orbits
  - distributed-lock-as-residuated-authority-gate
---

# Leader election

A *substrate-recorded protocol for selecting one substrate-instance as leader* among a candidate set. Leaders are useful for operations that must have a single authority: serial-ID generation, single-writer for an exclusive log, single-actor for a sequential workflow.

Per the math grounding below, leader-election is not a coordination primitive sui generis: it is [quorum-consensus](quorum-consensus.md) on a role-predicate $\mathrm{leads\text{-}for}(role) \in \mathcal{C}$, composed with a term/lease modal restriction per [residuated-restriction-as-authority-gate](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md). Mutual exclusion of leaders, lease auto-release, term monotonicity, and termination each follow from one corpus-level theorem; see [leader-election-termination-via-no-periodic-orbits](../theorems/leader-election-termination-via-no-periodic-orbits.md).

Common protocols:

- **Bully algorithm.** Highest-priority live instance becomes leader. Simple; works well when priority is well-defined. Structurally, the priority order is a deterministic merge resolving the role-predicate sections without a separate vote round.
- **Raft-based election.** Random-timeout-driven, quorum-confirmed. Used by etcd, Consul, modern distributed databases. Structurally, the vote round is one application of the underlying quorum-consensus on the role-predicate.
- **Paxos-based election.** Quorum-agreed leader, more theoretical underpinning. Used by Spanner, ZooKeeper. Structurally, prepare/accept rounds are two invocations of quorum-consensus on the role-predicate.
- **Lease-based.** Leader holds a time-bounded lease (refreshed periodically); when lease expires, election re-runs. Structurally, the lease is the term-modal $\Box_{R_{\mathrm{term}}}$ sub-region; expiry is its collapse to $\mathbf f$.

## Math grounding

Leader-election factors cleanly through three predication-category constructions:

- **Vote round = quorum-consensus on the role-predicate.** Each candidate's eligibility-or-endorsement is a section $\sigma_i$ of the role-predicate's [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the participant's clopen, on the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md). The election succeeds when the cover-discipline (quorum threshold) admits a Mayer–Vietoris lift to a unique global section identifying the elected leader. Split votes are the substrate-content witness of a non-vanishing $\delta^0$ on the role-predicate sections.

- **Lease/term window = modal sub-region of $R$.** The substrate's lease discipline is one [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_{\mathrm{term}}}$. The leader's recorded authority is the residuated-modal restriction of the role-predicate by this sub-region — the same construction that gates the lock holder in [distributed-lock](distributed-lock.md), specialized to the role-predicate rather than the holds-predicate.

- **Term monotonicity = no-non-trivial-periodic-orbits discipline.** Per [closure-monad-no-non-trivial-periodic-orbits](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md), the [closure 2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) governing the election's closure-rule system admits no non-trivial periodic trajectory in its fixed-point lattice. Term-bumping is the substrate-content witness of this fact: oscillation between two would-be leaders without bumping `term` is closure-monotonically forbidden, and term-bumping records the substrate as having moved to a strictly higher knowledge-order stratum.

## Substrate-recorded state

Per [self-representation](../../teaching/explanations/self-representation.md), the election protocol's state is substrate content: candidates, current leader (or absent if none), term/epoch, election-witness chain. Per [witness](../../../objects/witness.md), every leader change produces a witness; per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the leadership claim is non-repudiable. Per the math grounding, `current leader` and `election-witness chain` correspond to the truth-axis and knowledge-axis sides of the leadership claim respectively (see [leader-record](../objects/leader-record.md)).

Per [federation-convergence](../../../theorems/federation-convergence.md), CRDT-style merge handles most state; leader election is for the residual cases. The leader-record itself isn't a CRDT — it's a single value that must be agreed on. The protocols achieve this via quorum consensus (per [quorum-consensus](quorum-consensus.md)) at a meta-level, plus the modal-restriction layer above.

Per the substrate's [latency-budget](../../teaching/explanations/latency-budget.md), leader election has timing implications: an election in progress blocks operations requiring the leader. Substrates that need short election times use lease durations and timeout values appropriate for their network conditions.

## Network-partition behavior

When network partition occurs, leaders may be wrongly removed (split-brain) or wrongly retained (zombie leader). Per the protocol's discipline, the substrate's response is:

- **Quorum protocols (Raft, Paxos)**: minority partitions cannot lift a global section on their sub-cover, so they cannot elect; they go read-only until partition heals. Two leaders elected on disjoint sub-covers would manifest as a $\top$-cell on the role-predicate's overlap region, surfaced for repair per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md).
- **Lease-based**: lease expiration on the unreachable side prevents zombie leaders — the term-modal $\Box_{R_{\mathrm{term}}}$ collapses to $\mathbf f$ on that side, and the residuated-modal restriction of the role-predicate ceases to support the prior leader's recorded authority — at the cost of a leader-less window.
