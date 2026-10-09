---
type: morphism
class: coordination-operation
realizes: [leader-election]
depends-on:
  - leader-record
  - identity-record
  - witness
  - signature
  - propose-quorum-value
  - vote-as-section
  - cluster-as-replica-cover
  - modal-necessity-operator
  - closure-2-monad
  - closure-monad-no-non-trivial-periodic-orbits
  - residuated-restriction-as-authority-gate
see-also:
  - propose-quorum-value
  - acquire-distributed-lock
  - leader-election-termination-via-no-periodic-orbits
  - distributed-lock-as-residuated-authority-gate
---

# Elect leader

The substrate operation that *runs a leader-election protocol* among substrate-instances eligible for a role, producing a [leader-record](../objects/leader-record.md) on success. Structurally, it is the substrate-content procedure that lifts a quorum decision on the role-predicate to a substrate-recorded leader, with the elected leader's authority gated by the term/lease modal restriction per [residuated-restriction-as-authority-gate](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md).

## Signature

`elect-leader(role, election-protocol, participants) → (leader-record, election-witness) | (election-failure)`

Inputs:

- **`role`** — the role being elected for; structurally, the predicate $\mathrm{leads\text{-}for}(role) \in \mathcal{C}$ in the substrate's predication category, on whose cells the election decides.
- **`election-protocol`** — `bully`, `raft`, `paxos`, `lease-only`.
- **`participants`** — eligible substrate-instances; the index set of the election's effective [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md).

Outputs:

- **`leader-record`** — on success, the new [leader-record](../objects/leader-record.md) with bumped term; per the math grounding below, the `current-leader` field is the cellwise $\bigvee_k$-merge of the recorded election votes, restricted by the term-modal $\Box_{R_{\mathrm{term}}}$.
- **`election-witness`** — records the election protocol's run as the cluster's [vote-as-section](teaching/explanations/vote-as-section.md) family for the role-predicate.
- **`election-failure`** — on partition or insufficient participation, election fails; substrate operates leaderless until next election. Failure is the substrate-content witness of a non-vanishing $\delta^0$ on the role-predicate sections — no global section was lifted.

## Operational semantics

Per the chosen protocol, the substrate runs election rounds:

- **Bully**: highest-priority participant becomes leader.
- **Raft**: random-timeout-driven; first to time out becomes candidate; quorum of votes confirms — equivalently, [propose-quorum-value](propose-quorum-value.md) is invoked on the role-predicate with the candidate as `value`.
- **Paxos**: prepare-and-promise / accept rounds — equivalently, two invocations of the underlying quorum-consensus on the role-predicate.
- **Lease-only**: current leader's lease expires (the term-modal $\Box_{R_{\mathrm{term}}}$ collapses to $\mathbf f$); next eligible takes over.

Per [witness](../../../objects/witness.md), every protocol step produces witnesses. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the elected leader's identity is non-repudiably attested.

## Math grounding

Leader-election is structurally a quorum-consensus on the role-predicate, with the elected leader's authority gated by a modal restriction. The factorization:

- **Role ↔ predicate $\mathrm{leads\text{-}for}(role) \in \mathcal{C}$.** The role determines which predicate the election decides on; the per-cell predication $\mathrm{leads\text{-}for}(role, m)$ records member $m$'s candidacy at the cell.

- **Election round ↔ quorum-consensus on the role-predicate.** Per [vote-as-section](teaching/explanations/vote-as-section.md), each participant's signed endorsement is a section of the role-predicate's [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the participant's clopen. The election's threshold is the quorum-discipline that admits a Mayer–Vietoris lift of the section family to a unique global section identifying the elected leader.

- **`term` bump ↔ knowledge-order stratum advance.** Per [closure-monad-no-non-trivial-periodic-orbits](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md), the [closure 2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) governing the election's closure-rule system admits no non-trivial periodic trajectory. The substrate-content witness of this fact is the `term` field's monotone-increasing discipline: a successful election bumps `term`, recording the substrate as having moved to a strictly higher knowledge-order stratum from which the prior contender cannot be re-instated within the same window. Per [leader-election-termination-via-no-periodic-orbits](../theorems/leader-election-termination-via-no-periodic-orbits.md), this is what closes the termination argument.

- **Lease/term window ↔ modal sub-region of $R$.** The substrate's lease discipline is one [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_{\mathrm{term}}}$ parameterized by the sub-region "current term has not expired." The leader's recorded authority is exactly the residuated-modal restriction of the role-predicate by this sub-region, per [residuated-restriction-as-authority-gate](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md). This is the same construction that gates the lock holder in [acquire-distributed-lock](acquire-distributed-lock.md), specialized to the role-predicate rather than the holds-predicate.

- **`election-failure` ↔ non-vanishing $\delta^0$ on the role-predicate sections.** When endorsements do not agree on overlap (split-vote partitions), the global section does not exist; the failure-witness records the obstruction. The substrate does not silently elect; it surfaces the obstruction and remains leaderless until the next election.

## Engineering invariants

- **Single-leader-per-term.** The protocol's correctness ensures at most one leader per term; equivalently, $H^0(U, \mathcal{F}_U)$ on the role-predicate has at most one global section per round.
- **Term-monotone.** Each successful election bumps term; per the math grounding, this is the substrate-content discipline closing the no-periodic-orbits termination argument.
- **Authority gated by term-modal projection.** The leader's recorded authority is supported only while $\Box_{R_{\mathrm{term}}}$ holds; lease expiry causes the derived `current-leader` to lapse without a destructive write per [leader-record](../objects/leader-record.md).
- **Witness-emitted.** Per [witness](../../../objects/witness.md), the full election sequence is auditable; the election-witness chain is the knowledge-axis surface of the leadership claim per [leader-record](../objects/leader-record.md)'s math grounding.

## Position in the platform

Elect-leader is the substrate's *leadership-transition primitive*. Composes with [leader-record](../objects/leader-record.md) (the substrate-content artifact it produces) and the substrate's federation-graph (which determines participant eligibility). Per the math grounding, it is not a separate primitive parallel to [propose-quorum-value](propose-quorum-value.md): it is one specialization of quorum-consensus to the role-predicate, with the lease/term modal restriction layered on top. Implementations that ship a separate `leader-election` subsystem alongside a quorum-consensus subsystem are duplicating substrate machinery the math identifies as one construction.
