---
type: theorem
class: engineering-claim
status: sketch
depends-on:
  - quorum-consensus
  - propose-and-vote
  - quorum-record
  - witness
  - signature-binds-witness-to-identity
  - vote-as-section
  - cluster-as-replica-cover
  - audit-quorum-witness-chain
  - bigraded-common-knowledge
  - bilattice-network-sheaf-consensus
  - modal-necessity-operator
  - bilattice-accessibility-relation
see-also:
  - consensus-as-h0-construction
  - quorum-consensus-safety
  - quorum-safety-under-partition
  - leader-election-termination-via-no-periodic-orbits
  - audit-via-cech-cocycle-evaluation
---

# Consensus achieves *bigraded* common knowledge: agreement-on-value and agreement-on-witness are structurally distinct fixed points

**Claim.** Let $C$ be a [cluster-record](../objects/cluster-record.md) running [propose-and-vote](../morphisms/propose-and-vote.md), and let $\Phi$ be the consensus instance's settling-associated sheaf, presented (per [cluster-as-replica-cover](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/cluster-as-replica-cover.md)) on the cluster's replica cover $\{U_i \to U\}_i$ with bilattice-valued accessibility $R_{ij}(w, w') := $ "member $i$ has received and verified member $j$'s signed report of state $w'$ while $i$ is in state $w$". A successful protocol execution does not produce *one* common-knowledge fixed point; it produces *two structurally distinct* fixed points in the sense of [bigraded common knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md):

- A **truth-axis fixed point** $C^t \Phi$ — the value the cluster commonly knows it has decided. This is the [consensus-as-$H^0$ construction](consensus-as-h0-construction.md)'s global section, recorded in `quorum-record.decided-value`.

- A **knowledge-axis fixed point** $C^k \Phi$ — the witness the cluster commonly knows it has produced. This is the cluster-wide closure of the signed quorum certificate, recorded as the `quorum-record`'s witness chain.

These two fixed points are *generically distinct* in the conditional sense of [bigraded common knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) part (c): whenever some member's accessibility relation is non-trivial *and* there is value-disagreement on a pair $(w, w')$ that member's accessibility relates with bilattice value $\mathbf{t}$, the per-axis modal necessities — and hence the gfps — already differ at that member's world. Frame-uniform axis-collapse "$C^t \psi = C^k \psi$ for every $\psi$" is restricted to the two degenerate cases the math theorem isolates: bilattice degeneracy (the substrate's value domain collapses to a chain), or epistemically trivial accessibility (no member has received any other member's signed report). The substrate-recorded difference between "the value is decided" and "the decision-witness has propagated" is the engineering surface of this conditional divergence, and the protocol-correctness of consensus is the joint achievement of *both* fixed points wherever the cluster's accessibility and value structure put it outside the degenerate cases — which is the working assumption for any production cluster.

The existing [consensus-as-$H^0$ construction](consensus-as-h0-construction.md) is the truth-axis projection of this theorem; it captures $C^t \Phi$ but is silent on $C^k \Phi$. This theorem refines it by naming what the silence costs.

## Why this holds

**Part 1: The two axes are present in any cluster's accessibility structure.** Per [bilattice-accessibility-relation](../../../../settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md), the cluster's inter-member visibility carries bilattice values: an entry $R_{ij}(w, w') \in \mathbf{L}^\bowtie$ records both *what member $i$ takes member $j$'s state to be* (a truth-axis claim) and *how confident member $i$ is in that determination* (a knowledge-axis claim, distinguishing "I have $j$'s signed report" from "I infer $j$'s state by silence"). The bilattice structure is not added decoration; it is forced by the substrate's distinction between content and witness, per [witness](../../../objects/witness.md) and [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md).

**Part 2: Per-axis modal necessity captures two engineering primitives.** Specializing the [modal-necessity-operator](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md):

- $(\Box^t_i \Phi)_w$ — "in every state $w'$ that member $i$ takes to be possible from $w$, the value-claim $\Phi$ holds." Engineering content: member $i$'s commitment that the decided value cannot change consistent with what $i$ has accepted.
- $(\Box^k_i \Phi)_w$ — "in every state $w'$ that member $i$ has sufficient evidence to consider, $\Phi$'s witness is present." Engineering content: member $i$'s commitment that the decision-witness is present in every state $i$ can substantiate, regardless of value.

These differ generically because the residuated implications $\to_t$ and $\to_k$ collapse Boolean disagreement to different bottoms ($\mathbf{f}$ vs $\bot$); a member who has *received conflicting reports* from the same neighbour fails $\Box^k$ while still potentially satisfying $\Box^t$ at a value the conflict happens to be consistent with.

**Part 3: $E^t$ and $E^k$ are everyone-knows-value and everyone-has-witnessed.** Aggregating modal necessities by truth-meet over members yields the cluster's everyone-knows-the-value operator $E^t \Phi := \bigwedge_t^i \Box^t_i \Phi$; aggregating by knowledge-meet yields the cluster's everyone-has-the-witness operator $E^k \Phi := \bigwedge_k^i \Box^k_i \Phi$. Per bigraded-common-knowledge part (c), these differ generically — specifically, whenever some member's accessibility relates two worlds $w \neq w'$ with $R(w,w') = \mathbf{t}$ and $\Phi(w) \neq \Phi(w')$. The substrate condition under which this hypothesis fails (every member's accessibility is the diagonal — no member has any signed report from any other member) is precisely the cluster that has not yet begun running the protocol; once any vote is exchanged, the hypothesis is satisfied at that member.

**Part 4: The two greatest fixed points are the two operational invariants of consensus.** By bigraded-common-knowledge part (a) (Knaster–Tarski on the per-axis complete lattice), both gfp's exist:

$$C^t \Phi \;=\; \mathrm{gfp}_{\leq_t}\,\psi.\,\Phi \wedge_t E^t \psi, \qquad C^k \Phi \;=\; \mathrm{gfp}_{\leq_k}\,\psi.\,\Phi \wedge_k E^k \psi.$$

Engineering identification:

- $C^t \Phi$ — *the cluster commonly knows the decided value.* Operational reading: every member, when probed, returns the same `decided-value`, *and* every member knows that every member returns the same value, *and* … to fixed point. This is the "agreement on what was chosen" half of consensus correctness.

- $C^k \Phi$ — *the cluster commonly possesses the decision-witness.* Operational reading: every member holds (or can fetch from a quorum-overlap) the signed quorum certificate, *and* every member knows that every member holds it, *and* … to fixed point. This is the "agreement on the proof" half of consensus correctness, the precondition for [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md) returning `confirmed` from any member.

**Part 5: Divergence corresponds to recognizable consensus-protocol pathologies.** The framework-internal reading of the different bottoms (per bigraded-common-knowledge's "framework-internal interpretation" section) admits direct engineering translations:

- $C^t = \mathbf{f}$ at some world while $C^k = \bot$ — the cluster has commonly-known-decided-falsity (e.g., "no value was decided, and we all know it") on the truth axis, but on the knowledge axis the absence-of-evidence has not propagated. Engineering: a *split-brain decision* where one partition has decided "no value" but the other partition's silence is being read as missing-witness rather than as decided-no.

- $C^t \neq \bot$ everywhere while $C^k = \bot$ at some world — the cluster commonly knows a value, but the witness has not propagated to a member. Engineering: the *learner-lag* phenomenon — a learner that knows the chosen value (via a single acceptor's report it trusts) but does not yet hold a quorum-signed certificate, and so cannot independently re-derive the decision under audit.

- $C^k \neq \bot$ everywhere while $C^t$ is non-uniform — every member holds a witness chain, but they disagree about which value the chain certifies. Engineering: a *stale-epoch* condition — different members hold quorum certificates from different epochs, and the higher-epoch-wins resolution rule has not yet been applied. Per [leader-election-termination-via-no-periodic-orbits](leader-election-termination-via-no-periodic-orbits.md), this state is transient under inflationary closure rules; the bigraded reading identifies *which* axis is currently being driven toward agreement (the truth axis, via the higher-epoch rule's truth-meet).

The benchmark-5-style witness for engineering: a three-member cluster with a paraconsistent valuation at one member ($v(w_3, p) = \top$, modeling a member that has received signed reports of both $p$ and $\neg p$ from distinct trusted neighbours) gives $C^t p$ and $C^k p$ stabilising to different bottoms — exactly the substrate condition under which the protocol must invoke a [repair](../../teaching/explanations/repair.md), per [repair-as-top-cell-resolution](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/repair-as-top-cell-resolution.md).

**Part 6: Quorum-overlap is the substrate-level convergence rule on the *knowledge* axis.** The quorum-overlap argument from [quorum-consensus-safety](quorum-consensus-safety.md) admits a knowledge-axis reading: an overlapping voter $m \in Q_1 \cap Q_2$ carrying *one signed vote* forces $\Box^k_m$-equality of the two quorums' witness chains at $m$, which propagates through the [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) cellwise $\vee_k$-merge toward a unique global witness on the knowledge axis. The independent observation — that signature-binding aligns the truth-axis sections certified by agreeing witness chains — is recorded here as a conjectural refinement (left as an open knowledge-axis-implies-truth-axis claim, see Status). What this theorem establishes from its dependencies alone is the *coexistence and generic distinctness* of the two fixed points; the conjectural implication is treated as downstream work and should not be cited as if proved. The point that survives without the conjecture is the affirmative one: the protocol must drive *both* $C^t$ and $C^k$, and the disciplines that ensure $C^k$ (signature propagation, witness durability, audit) are first-class engineering content rather than projections of the truth-axis sheaf cohomology of [consensus-as-$H^0$ construction](consensus-as-h0-construction.md).

## Engineering consequence

- **Two correctness obligations, not one.** A consensus implementation must drive *both* $C^t$ and $C^k$ to uniform non-bottom values. The first is captured by safety + termination of value-agreement. The second is captured by witness propagation, signature integrity, and audit-reachability. An implementation that achieves the first but not the second satisfies safety in isolation but cannot be audited and cannot re-derive its own decisions after replay — the [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md) operation requires $C^k$, not $C^t$.

- **Learner-lag has a structural name.** The window between "value chosen" and "learner can independently certify" is the window in which $C^t = \mathrm{value}$ but $C^k = \bot$ at the learner. Eliminating learner-lag requires propagating the witness to the learner, not just the value. Protocols that send only the decided value to learners (without the quorum certificate) are structurally exposing a $C^t$-without-$C^k$ window; whether this is acceptable is a substrate-policy decision, but it is now a *named* substrate-policy decision rather than an unstated one.

- **Split-brain detection has a refined diagnostic.** A split-brain is detectable as either ($C^t$-divergence with $C^k$-uniformity: agreed witness chain but disagreed value, indicating chain corruption or signature-discipline failure) or ($C^k$-divergence with $C^t$-uniformity: agreed value but disagreed witness, indicating the value is being asserted without provenance). The two detectable failure modes call for different repairs: signature-integrity audit per [substrate-tampering-detection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-tampering-detection.md) for the first, witness-propagation per [federation-convergence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) for the second.

- **Byzantine quorum certificates are knowledge-axis objects.** The standard distinction between "crash-tolerant majority quorum" and "Byzantine $2f+1$ quorum" is, in bigraded terms, a strengthening of the knowledge-axis bottom: a Byzantine quorum certificate raises the threshold at which $\Box^k_i \Phi$ holds (member $i$ requires $2f+1$ signed concurring reports rather than 1). The truth-axis safety argument is unchanged; the knowledge-axis convergence is what is being hardened. Per [byzantine-cluster-as-finer-replica-cover](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/byzantine-cluster-as-finer-replica-cover.md), the Byzantine cluster is a finer replica cover, which is precisely the refinement that lifts $C^k$'s convergence threshold.

- **Read-your-writes and read-after-commit are $C^k$-witnessed reads.** A read that returns a value the reader has previously written must, to be correct, witness $C^k$ at the reader for the value's settling — the reader must hold (or be able to fetch from quorum-overlap) the witness chain that certifies its own write was incorporated. Stale reads under read-replica topologies per [database-platform](../../database-platform/_index.md) are $C^t$-without-$C^k$ reads: the value is correct on the truth axis but not yet witness-certified at the read replica.

- **The audit operation cleanly factors.** [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md) and [audit-via-cech-cocycle-evaluation](audit-via-cech-cocycle-evaluation.md) are the substrate's two checks that $C^k \Phi$ has actually been achieved; the cocycle check is precisely the verification that the witness chain has propagated to a fixed point on the knowledge axis. An audit cannot fail on the truth axis without also failing on the knowledge axis (since the truth-axis value is recovered *from* the witness chain), but it can pass on the truth axis while failing on the knowledge axis (a recorded value with insufficient witness coverage).

## What the theorem rules out

- A consensus implementation that records a decided value without a propagating witness chain achieves $C^t$ in isolation; it is not a complete consensus implementation in the bigraded sense, and its decisions are not auditable.

- A consensus implementation that propagates witness chains without a discipline for resolving same-epoch value disagreement (e.g., a pure CRDT-style merge applied where coordination is required) achieves $C^k$ in isolation; it is, per the parent's discipline, the case where coordination is required precisely *because* truth-axis agreement does not follow from knowledge-axis agreement.

- A consensus correctness proof that establishes only "two members do not decide different values" without addressing witness-propagation establishes only the truth-axis half of correctness. It is sufficient for clusters that never need to be audited, replayed, or queried by learners — that is, almost no production cluster.

## What the theorem requires

- The cluster's accessibility relation is bilattice-valued — the substrate distinguishes content (truth axis) from evidence (knowledge axis). This is automatic for any substrate that satisfies [signature-binds-witness-to-identity](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md).

- The substrate's regime is non-aperiodic for the predications consensus ranges over (per [regime-classification-for-substrate](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/regime-classification-for-substrate.md)); both fixed-point iterations terminate within the substrate's closure-ordinal regime.

- The closure-rule system implementing the protocol is inflationary, monotone, and idempotent on both axes — per [leader-election-termination-via-no-periodic-orbits](leader-election-termination-via-no-periodic-orbits.md), this is what consensus's no-oscillation discipline already requires; the bigraded refinement is that inflationarity must hold on the knowledge axis as well as the truth axis.

## Position

This theorem is the bigraded refinement of [consensus-as-$H^0$ construction](consensus-as-h0-construction.md). The $H^0$-construction theorem identifies one global section as the decided value; this theorem identifies *two* fixed points as the operational content of consensus, with the $H^0$ global section being the truth-axis fixed point.

The lift uses [bigraded common knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) directly; the math theorem's "framework-internal interpretation of the different bottoms" section is the source of the engineering pathology classification in Part 5.

Together with [quorum-consensus-safety](quorum-consensus-safety.md) (truth-axis uniqueness), [leader-election-termination-via-no-periodic-orbits](leader-election-termination-via-no-periodic-orbits.md) (closure-axis termination), and the witness-discipline theorems, this completes the bigraded picture: safety = truth-axis uniqueness, termination = closure-axis convergence, audit-reachability = knowledge-axis common possession of the witness.

Subsequent theorems about consensus protocols, learners, audit, and Byzantine extensions should cite this theorem as their structural source whenever they touch witness-propagation, since witness-propagation is the knowledge-axis content that the truth-axis sheaf reading does not see.

## Status

`sketch` because:

- Parts 1–4 are direct specializations of [bigraded common knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) parts (a)–(b); their rigor inherits from that theorem's status (also `sketch`, with a clean Knaster–Tarski argument for the existence half). Promotion of bigraded-common-knowledge promotes Parts 1–4.

- Part 5 (engineering pathology classification) is at near-proved rigor for the three named pathologies (split-brain, learner-lag, stale-epoch); each is the engineering reading of one cell of the bilattice-divergence table from bigraded-common-knowledge part (d). The reading is novel-to-this-theorem and would benefit from a worked benchmark that exhibits each pathology on a three-member cluster.

- Part 6 (quorum-overlap as knowledge-axis closure) restates [quorum-consensus-safety](quorum-consensus-safety.md)'s argument in the bigraded register; the restatement is correct as a re-reading. The stronger claim — that knowledge-axis convergence *implies* truth-axis convergence via the signature-binding chain — is *not* established here and is not within this theorem's scope. It is recorded as an open downstream claim and would warrant its own theorem (`signature-binding-collapses-axes-on-witnessed-cells` or similar) so that subsequent proofs do not silently rely on it. Until then, citations of this theorem should treat the two-axis joint-convergence requirement as a *conjunction*, not as a knowledge-axis convergence alone.

Promotion path:

1. Promote [bigraded common knowledge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) per its own promotion path.
2. Construct an engineering benchmark cluster (three-member, paraconsistent at one member) and verify the three pathologies of Part 5 against the substrate's recorded states.
3. Establish the signature-binding chain claim of Part 6 as a separate proved theorem.

After the three steps, this theorem promotes to `proved`.
