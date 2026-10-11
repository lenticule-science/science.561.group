---
type: concept
class: structural-bridge
depends-on: [cluster-membership, quorum-consensus, replica-cover, settling-associated-sheaf, bitopological-settling-site]
see-also: [vote-as-section, consensus-as-h0-construction]
---

# Cluster as replica cover

The structural identification — proper to this subtheory — between a coordination cluster of $N$ substrate-instances and an $N$-element [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) on the [bitopological settling site](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bitopological-settling-site.md). This concept names the bridge so downstream theorems and operations can cite a single anchor rather than re-deriving the identification each time.

## The identification

Fix a coordination problem with predicate $q$ (the predicate the cluster reaches agreement *about* — a leadership claim, a lock holder, a value-to-be-decided), settling stage $\tau$ (the consensus round), and pairwise-Stone clopen $U$ in the dual paired-Priestley space $X_q^\tau$ (the substrate region the cluster is responsible for).

A [cluster-record](../objects/cluster-record.md) with members $\{m_1, \ldots, m_N\}$ presents a replica cover $\{U_i \to U\}_{i=1}^N$ as follows:

- Each member $m_i$ contributes a clopen $U_i \subseteq U$ — the dual-spectrum image of $m_i$'s locally observed evidence about the predicate $q$ at stage $\tau$.
- The cover condition $U = \bigcup_i U_i$ is the substrate's discipline that *every* substrate region the cluster is responsible for is observed by *some* member.
- The overlap region $U_i \cap U_j$ is the shared-evidence region between members $i$ and $j$ — substrate-recorded as the cross-references in their witness chains.

The pair $(\{U_i\}_i, \mathcal{F}_U|_U)$, where $\mathcal{F}_U$ is the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md), is the cluster's *cohomological surface* — the structure on which the platform's safety, termination, and partition-tolerance properties are cohomological invariants.

## Why this concept exists at the substrate level

The math entity [replica-cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) is built for two replicas; its $N$-element generalization is straightforward (the [Čech nerve](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) is the simplicial object whose $k$-cells are $(k+1)$-element subsets of members). What is *not* automatic is the engineering identification of which substrate-recorded artifact plays the role of $U_i$, of $U_i \cap U_j$, and of the cover condition. This concept names that identification:

- $U_i$ ↔ the dual-spectrum image of member $m_i$'s evidence (recorded in $m_i$'s vote per [vote-as-section](vote-as-section.md)).
- $U_i \cap U_j$ ↔ the shared-evidence region recorded as cross-references between $m_i$'s and $m_j$'s witness chains.
- $U = \bigcup_i U_i$ ↔ the substrate-recorded [cluster-membership](cluster-membership.md) discipline that every region in the cluster's scope is observed by some member.

Per [self-representation](../../teaching/explanations/self-representation.md), the cover data is substrate content; the cluster-record's `members` field plus each member's vote-or-witness is what makes the cover concrete.

## Engineering consequence

The concept's main payoff is allowing the platform's theorems to cite the cohomological structure at one shared anchor:

- [quorum-consensus-safety](../theorems/quorum-consensus-safety.md) reads as Mayer–Vietoris injectivity on this cover.
- [quorum-safety-under-partition](../theorems/quorum-safety-under-partition.md) reads as the degeneration of the cover when $U_i \cap U_j = \emptyset$ for cross-partition members.
- [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md) reads consensus protocols as global-section constructions on this cover.
- [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md) reads BFT extensions as cover refinements.

The unifying narrative is [cohomology-as-coordination-substrate](teaching/explanations/cohomology-as-coordination-substrate.md).

## When the identification degrades

The identification holds whenever the cluster's members can be assigned coherent dual-spectrum clopens. Two regimes degrade it:

- **Membership churn mid-round.** A member joining or leaving during a consensus round changes the cover; the identification reads the cover as the cover *as recorded at the cluster-record's pinned membership for that round* (per [cluster-record](../objects/cluster-record.md)'s `current-term` discipline).
- **Byzantine members.** A member whose recorded evidence is adversarial still presents a clopen $U_i$, but the section over $U_i$ may not be honest. The identification holds structurally; the [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md) theorem describes how BFT protocols compensate by refining the cover.

## Position

This is a *structural-bridge* concept — its job is to name the identification between an engineering artifact (a cluster) and a math object (a replica cover) explicitly enough that downstream theorems can cite it as a single anchor. It introduces no new substrate operations or substrate state; it relabels existing substrate state in cohomological terms.
