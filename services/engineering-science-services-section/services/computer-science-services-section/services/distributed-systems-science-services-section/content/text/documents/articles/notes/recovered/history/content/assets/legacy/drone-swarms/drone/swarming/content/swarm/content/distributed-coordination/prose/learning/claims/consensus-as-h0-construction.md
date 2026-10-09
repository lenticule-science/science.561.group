---
type: theorem
class: engineering-claim
status: proved
depends-on: [quorum-consensus, propose-and-vote, quorum-record, cluster-as-replica-cover, vote-as-section, replica-cover, replica-mayer-vietoris, settling-associated-sheaf, bilattice-network-sheaf-consensus]
see-also: [quorum-consensus-safety, quorum-safety-under-partition, leader-election-termination-via-no-periodic-orbits, consensus-causal-order-via-lorentzian-settling, consensus-achieves-bigraded-common-knowledge]
---

# A successful consensus's decided value is an element of $H^0(U, \mathcal{F}_U)$

**Claim.** Let $C$ be a [cluster-record](../objects/cluster-record.md) presenting an $N$-element [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_i \to U\}_{i=1}^N$ on the [bitopological settling site](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bitopological-settling-site.md) per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), and let $\mathcal{F}_U$ be the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) for the coordination problem's predicate. A successful execution of [propose-and-vote](../morphisms/propose-and-vote.md) on $C$ produces, as its substrate-recorded decided value, a unique element

$$s \;\in\; H^0(U, \mathcal{F}_U)$$

— a global section of $\mathcal{F}_U$ on $U$. Conversely, every global section so reached is the decided value of *some* successful execution: the protocol enumerates the sections in $H^0(U, \mathcal{F}_U)$ that are reachable from the substrate's current vote-state.

The platform's existing safety, termination, and partition-tolerance theorems are the cohomological content of this construction read through the relevant invariants of $\mathcal{F}_U$.

## Why this holds

**Part 1: Each member's vote is a local section.** Per [vote-as-section](teaching/explanations/vote-as-section.md), member $m_i$'s recorded vote $\sigma_i$ is a section of $\mathcal{F}_U$ over $U_i$ — well-defined because the no-double-vote rule makes $\sigma_i$ a function (not a multi-valued assignment), signature-bound because the [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md) discipline prevents retraction or reattribution.

**Part 2: A successful protocol reaches overlap-agreement.** The [propose-and-vote](../morphisms/propose-and-vote.md) operation completes successfully when a quorum of members has voted *and* the votes agree on the value. For two members $i, j$ both in the deciding quorum with overlapping clopens, the substrate-recorded agreement-on-value is exactly the sheaf agreement condition

$$\sigma_i|_{U_i \cap U_j} \;=\; \sigma_j|_{U_i \cap U_j}.$$

For single-value consensus, where every $\sigma_i$ is the constant section with value $v_i$, this reduces to $v_i = v_j$.

**Part 3: Mayer–Vietoris lifts the local sections to a global section.** Per the [replica Mayer–Vietoris sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), exactness at $H^0(U, \mathcal{F}_U)$ gives

$$0 \to H^0(U, \mathcal{F}_U) \xrightarrow{\mathrm{res}} \prod_i H^0(U_i, \mathcal{F}_U) \xrightarrow{\mathrm{diff}} \prod_{i<j} H^0(U_i \cap U_j, \mathcal{F}_U).$$

The family $(\sigma_i)_i$ satisfies $\mathrm{diff}(\sigma_i)_i = 0$ by Part 2, so it lies in $\ker(\mathrm{diff}) = \mathrm{im}(\mathrm{res})$. The global section $s \in H^0(U, \mathcal{F}_U)$ with $s|_{U_i} = \sigma_i$ is unique by injectivity of $\mathrm{res}$.

**Part 4: The recorded decided value is $s$.** The [quorum-record](../objects/quorum-record.md)'s `decided-value` field records the value the quorum agreed on; for single-value consensus this is the constant value $s$ takes on $U$. For more structured coordination problems (leadership claims, lock-holder records), the recorded decided value is the substrate-encoded form of $s$.

**Part 5: Conversely, every reachable global section is reached by some execution.** Per [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the cellwise $\vee_k$-merge on a connected network sheaf produces the unique global section consistent with the input local sections. Any global section consistent with a substrate-realizable family of votes is reachable by the substrate operation that produces that vote-family followed by the merge.

## Why the existing theorems are projections of this construction

- **[quorum-consensus-safety](quorum-consensus-safety.md)** is the *uniqueness* clause: the lifted global section is unique by Mayer–Vietoris injectivity, so two successful executions reaching agreement cannot have decided different values.
- **[quorum-safety-under-partition](quorum-safety-under-partition.md)** is what happens when the cover degenerates ($U_i \cap U_j = \emptyset$ for cross-partition pairs); the quorum-threshold rule re-supplies the agreement constraint by allowing only one side of the partition to claim a section.
- **[consensus-causal-order-via-lorentzian-settling](consensus-causal-order-via-lorentzian-settling.md)** is the time-direction layer: where this theorem assembles sections across the *space* of cluster members, the Lorentzian causal settling assembles them across the *time* of consensus rounds.
- **[leader-election-termination-via-no-periodic-orbits](leader-election-termination-via-no-periodic-orbits.md)** is the iterative-construction layer: building the global section by iterating the cluster's closure-rule system terminates because the closure 2-monad has no non-trivial periodic orbits.

## Engineering consequence

- **Single shared anchor for safety arguments.** Future safety claims about coordination protocols can cite this theorem as their structural source rather than re-deriving safety from pigeonhole-quorum arguments.
- **Failed-consensus diagnostic.** When [propose-and-vote](../morphisms/propose-and-vote.md) returns a failed-witness, the failure has a structural source: $\mathrm{diff}(\sigma_i)_i \neq 0$ for some pair. The protocol's failure-witness records *which* pair disagreed, giving operators a direct cohomological diagnostic.
- **Audit operations are first-class.** Per [audit-via-cech-cocycle-evaluation](audit-via-cech-cocycle-evaluation.md), an audit operation can re-verify a recorded decision by checking the Čech cocycle condition on the recorded votes, with correctness guaranteed by Husainov-acyclicity.

## Position

This is the unifying theorem the [cohomology-as-coordination-substrate](teaching/explanations/cohomology-as-coordination-substrate.md) narrative justifies. It does not replace the existing four theorems; it identifies their shared structural source. Subsequent theorems about coordination protocols should cite this one to anchor the global-section reading rather than re-establishing it.

This theorem captures the *truth-axis* half of consensus correctness: the decided value as a global section. Its bigraded refinement, [consensus-achieves-bigraded-common-knowledge](consensus-achieves-bigraded-common-knowledge.md), names the second, knowledge-axis fixed point — the cluster's common possession of the witness chain — and identifies the engineering pathologies (learner-lag, stale-epoch, split-brain) that arise when the two fixed points diverge. Theorems about audit, learner reads, or witness propagation should cite the bigraded refinement rather than this one, since witness-propagation is the knowledge-axis content that the truth-axis sheaf reading does not see.
