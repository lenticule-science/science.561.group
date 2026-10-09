---
type: theorem
class: engineering-claim
status: proved
depends-on: [audit-quorum-witness-chain, vote-as-section, cluster-as-replica-cover, consensus-as-h0-construction, husainov-acyclicity, replica-mayer-vietoris, coordination-cohomologically-bounded-by-h1]
see-also: [snapshot-replay-fidelity, witness-chain-as-proof-object]
---

# The audit operation correctly verifies recorded consensus

**Claim.** The [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md) operation, when applied to a closed [quorum-record](../objects/quorum-record.md), returns `confirmed` if and only if the recorded `decided-value` is the unique global section of the cluster's [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) consistent with the recorded votes per [consensus-as-h0-construction](consensus-as-h0-construction.md). The procedure is *correct* in the strong sense: the per-pair Čech-1-cochain calculation captures every cohomological obstruction, with no possibility of a higher-degree obstruction the audit misses.

## Why this holds

**Part 1: The audit computes the Čech 1-cochain.** Per [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md), the audit constructs

$$d^0(\sigma)_{ij} \;:=\; \sigma_j|_{U_i \cap U_j} \;-\; \sigma_i|_{U_i \cap U_j}$$

for every overlapping pair $(m_i, m_j)$ in the recorded cluster membership.

**Part 2: The Čech 1-cochain detects the Mayer–Vietoris obstruction.** The connecting homomorphism $\delta^0$ in the [replica Mayer–Vietoris sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) sends a family $(\sigma_i)_i$ of local sections to the cohomology class of $d^0(\sigma)$ in $H^1(U, \mathcal{F}_U)$. The class vanishes iff the family lifts to a global section iff every pair satisfies $d^0(\sigma)_{ij} = 0$ in $H^0(U_i \cap U_j, \mathcal{F}_U)$.

**Part 3: For finite Alexandrov clusters, Čech equals derived-functor.** The cluster's underlying poset is finite Alexandrov (the cluster has finitely many members and the membership relation is the substrate-recorded $\leq$ on cluster-records). Per [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md), finite Alexandrov posets satisfying the Dedekind–MacNeille cut condition have agreement between Čech and derived-functor cohomology in every degree. The audit's per-pair calculation, which is the Čech-1-cochain calculation, computes the *exact* Mayer–Vietoris obstruction — no approximation.

**Part 4: No higher-degree obstruction is missed.** Per [coordination-cohomologically-bounded-by-h1](coordination-cohomologically-bounded-by-h1.md), $H^n(U, \mathcal{F}_U) = 0$ for $n \geq 2$. There are no higher-degree obstructions for the audit to potentially miss; the $H^1$ check (via $d^0$ on overlapping pairs) is exhaustive.

**Part 5: Confirmation matches the global section.** When all $d^0(\sigma)_{ij} = 0$, by Mayer–Vietoris injectivity at $H^0$ the global section $s$ with $s|_{U_i} = \sigma_i$ is unique. Per [consensus-as-h0-construction](consensus-as-h0-construction.md), the recorded `decided-value` is this $s$. The audit's `confirmed` status is therefore the substrate-recorded assertion that the recorded decision matches the unique reachable global section.

## Engineering consequence

- **Forensic audit is sound.** A `confirmed` result is a structural guarantee that the recorded consensus reached the unique decision the cluster's votes mathematically permitted. There is no class of substrate-recorded consensus error a sound audit could miss.
- **Refutations are diagnostic.** A `refuted` result returns the offending pair as evidence; an operator can identify the disagreeing members and inspect their evidence chains directly.
- **Audit cost is bounded.** The audit is $O(N^2)$ per-pair section comparisons; the bound is structural, not heuristic. There is no need to anticipate more expensive audit modes for higher-degree checks because higher-degree cohomology is structurally zero.
- **Audit-witness extends the consensus's witness chain.** Per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md), the audit-witness is itself substrate content that can be re-audited. This composability is what makes [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md) hold for consensus decisions: the audit can be re-run from the snapshot alone, and its result auditable in turn.

## Limits

- **Soundness, not Byzantine-detection.** The audit is sound for non-Byzantine settings: a `confirmed` result certifies that the recorded votes mathematically reach the recorded decision. It does not certify that the votes themselves are honest. A coordinated set of Byzantine members can produce a coherent set of dishonest votes whose audit returns `confirmed`. Byzantine-resilient audit requires the larger-quorum discipline of [byzantine-cluster-as-finer-replica-cover](byzantine-cluster-as-finer-replica-cover.md) plus separate honesty-of-evidence checks.
- **Pinned membership.** The audit assumes the cluster's membership is the membership recorded at the quorum-record's `current-term`. Audits across membership-change boundaries decompose into per-term audits stitched along the cluster-record's term sequence.
- **Sheaf-completeness assumption.** The audit assumes the recorded votes constitute a *complete* family of local sections — i.e., every cluster member contributed a vote. Partial families (incomplete quorums) are detected separately by the quorum-record's threshold check, not by the cocycle calculation; the audit operates on the post-threshold-check state.

## Position

This theorem certifies that the [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md) operation is sound. It is the engineering reflection of [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md): a deep math fact that finite Alexandrov posets have Čech equal to derived-functor cohomology becomes the deep engineering fact that finite-cluster audit needs no machinery beyond per-pair section-restriction comparison.
