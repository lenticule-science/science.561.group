---
type: theorem
class: engineering-claim
status: proved
depends-on: [quorum-consensus, propose-and-vote, propose-quorum-value, quorum-record, lorentzian-causal-settling, event-causality-via-lorentzian-settling, predication-fiber-algebra, settlement-determinism]
see-also: [leader-election-termination-via-no-periodic-orbits, quorum-consensus-safety, quorum-safety-under-partition]
---

# The causal order of consensus votes is a Lorentzian causal-structure settling

**Claim.** For a [quorum-consensus](teaching/explanations/quorum-consensus.md) protocol, the directed acyclic order of [propose-and-vote](../morphisms/propose-and-vote.md) events across cluster members forms a [Lorentzian causal-structure settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) $v_{\mathrm{caus}}$ on the event-set $E$ of votes. Two votes $e_1, e_2$ are in the **apex cone** (settled $\mathbf{t}$ by $v_{\mathrm{caus}}$) iff $e_1$ causally precedes $e_2$ — i.e., $e_2$'s issuer had observed $e_1$ before issuing $e_2$. Two votes are in the **void cone** (permanently $\bot$) iff they are *spacelike-separated* — neither observed the other; the protocol must reconcile them through a quorum-level closure step. Per [event-causality-via-lorentzian-settling](../../../theorems/event-causality-via-lorentzian-settling.md) (the parent-level theorem this specializes), this settling structure underwrites the engineering safety guarantees of the quorum protocol.

## Why this holds

Per [lorentzian-causal-settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md), the causal-structure settling on an event set $E$ with seed direct-cause relation $\prec_0$ has cells $(e_1, e_2) \in E \times E$ and closure operator the transitive-closure step. The settling's apex cone is the set of causally-connected pairs; the void cone is the set of spacelike-separated pairs.

For quorum consensus:

- **Event set $E$.** Each `propose-and-vote` invocation by a cluster member emits a substrate-recorded vote event. $E$ is the set of all such events across the cluster for the quorum's lifetime.
- **Seed relation $\prec_0$.** $e_1 \prec_0 e_2$ iff $e_2$'s witness chain (per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md)) directly references $e_1$ — i.e., the issuer of $e_2$ observed $e_1$ before voting.
- **Settling closure.** Transitive closure of $\prec_0$ — if $e_2$ observed $e_1$ and $e_3$ observed $e_2$, then $e_3$ causally precedes nothing-not-already-causally-precede-$e_2$ except via $e_2$.

Per the parent [event-causality-via-lorentzian-settling](../../../theorems/event-causality-via-lorentzian-settling.md), this settling is well-defined on the substrate's event log with [settlement-determinism](../../../theorems/settlement-determinism.md): two cluster members reconstructing the causal order from the same event log produce the same Lorentzian settling.

## Engineering consequence

- **Vote ordering is a partial order, not a total one.** Per the apex/void cone structure, votes split into causally-comparable pairs (apex) and spacelike-separated pairs (void). The protocol does not need a global clock or total order; it operates on the partial order the causal settling provides.
- **Spacelike votes are exactly the reconciliation targets.** Per the void cone, the votes the protocol must reconcile are *structurally identified* — they are the cells $(e_1, e_2)$ at $\bot$ in $v_{\mathrm{caus}}$. The substrate's quorum-level closure rule (e.g., higher-epoch-wins, ballot-number-tie-break) operates on exactly this set.
- **Causal-past dependency is a substrate query.** A node deciding whether to accept a vote $e$ checks "is $e$ in my causal past?" — answered by querying the apex cone of $v_{\mathrm{caus}}$ at $e$. No additional protocol state is required beyond the event log.
- **Quorum safety reduces to apex-cone agreement.** Per [quorum-consensus-safety](quorum-consensus-safety.md), the safety property — "no two distinct values are decided" — corresponds to the claim that any two decision-events are in each other's apex cone (one observed the other), so they cannot disagree. The Lorentzian-settling structure is the formal carrier of this argument.
- **Partition is a measurable void-cone growth.** Per the void cone's identity with spacelike-separation, the size of the void cone over a time window measures cluster partition severity. The substrate exposes this as a telemetry signal, per [telemetry-as-continuous-valued-settling-projection](../../../theorems/telemetry-as-continuous-valued-settling-projection.md).
- **Leader-election composes via vote-causality.** Per [leader-election-termination-via-no-periodic-orbits](leader-election-termination-via-no-periodic-orbits.md), election terminates as a closure 2-monad iteration; per this theorem, the events of that iteration form a Lorentzian settling whose apex cone is the election's causal record. The two theorems describe the same protocol from algebraic and geometric angles respectively.

## What the theorem rules out

- **Total-order protocols claiming Lorentzian apex/void duality.** A protocol that requires a global total order on votes is not in the Lorentzian-settling frame — total orders have empty void cones, but real distributed clusters always have spacelike pairs (clock skew, network partition). A protocol claiming total-order without paying for it (synchronous clock, leader-mediated sequencing) is unsound on partition.
- **Witness-chain-free voting.** A vote that does not record what it observed (no witness chain) cannot enter the seed relation $\prec_0$; the resulting settling is degenerate (every vote is spacelike from every other). Per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md), the substrate refuses witness-chain-free votes.
- **Causal cycles.** A vote cannot be in its own apex cone — that would mean it observed itself before being issued. The substrate's witness-chain is acyclic by [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md); the resulting settling is necessarily acyclic.

## What the theorem requires

- Each vote is recorded as a substrate event with a witness chain referencing prior observations (per the parent's witness-chain discipline).
- The substrate's clock and event-log discipline supports event ordering per [monotonic-clock-discipline](../../../theorems/monotonic-clock-discipline.md).
- The cluster's events are at most countably many over the consensus protocol's run (per the Lorentzian-settling regime classification).

## Position

Together with [leader-election-termination-via-no-periodic-orbits](leader-election-termination-via-no-periodic-orbits.md) (election convergence) and [quorum-consensus-safety](quorum-consensus-safety.md) (decision uniqueness), this theorem grounds the distributed-coordination-platform's protocols in the math parent's geometric and algebraic apparatus. Election is closure-monad iteration; vote ordering is Lorentzian settling; quorum safety is apex-cone agreement. The three together exhaust the platform's primary theorem surface.
