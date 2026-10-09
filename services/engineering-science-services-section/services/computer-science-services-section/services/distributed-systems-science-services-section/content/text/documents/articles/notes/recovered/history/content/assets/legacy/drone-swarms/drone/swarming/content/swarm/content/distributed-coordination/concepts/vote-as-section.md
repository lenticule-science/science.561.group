---
type: concept
class: structural-bridge
depends-on: [quorum-consensus, propose-and-vote, signature, witness, settling-associated-sheaf, replica-cover]
see-also: [cluster-as-replica-cover, consensus-as-h0-construction]
---

# Vote as section

The structural identification — proper to this subtheory — between a substrate-recorded vote (per [propose-and-vote](../morphisms/propose-and-vote.md)) and a local section of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the voting member's clopen in the cluster's [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md). The identification is the substrate-level reading that lets [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md) treat protocol execution as global-section construction.

## The identification

Per [cluster-as-replica-cover](cluster-as-replica-cover.md), a cluster-member $m_i$ contributes a clopen $U_i \subseteq U$ in the dual-spectrum site, and $\mathcal{F}_U$ is the settling-associated sheaf on $U$. A *vote* by $m_i$ on a coordination problem with proposed value $v$ is the substrate-recorded artifact

$$\sigma_i \;:=\; (m_i, v, \mathrm{evidence}_i, \mathrm{sig}_i) \;\in\; \mathcal{F}_U(U_i)$$

— the section of $\mathcal{F}_U$ over $U_i$ whose value at each point of $U_i$ is the predicate-content $m_i$ asserts at that point, signed by $m_i$'s identity-key.

The structural reading:

- The **value** of $\sigma_i$ at a point $x \in U_i$ is the substrate-recorded predicate-content the vote asserts at $x$ — for a single-value consensus, $\sigma_i$ is the constant section with value $v$; for a leadership consensus, $\sigma_i$ is the constant section asserting "the leader is $L$"; for a lock acquisition, $\sigma_i$ is the constant section asserting "the holder is $H$".
- The **evidence** $\mathrm{evidence}_i$ is the substrate-recorded chain of prior witnesses (per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md)) that justifies the vote — cohomologically, it is the data ensuring $\sigma_i$ is a *well-defined* section of $\mathcal{F}_U|_{U_i}$ and not an arbitrary assignment.
- The **signature** $\mathrm{sig}_i$ binds the section to $m_i$'s identity (per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md)) — cohomologically, it is the substrate enforcement that $\sigma_i$ cannot be retracted, duplicated, or reattributed, which is exactly the property a sheaf section needs to participate in coherent gluing.

## Why this concept exists at the substrate level

The [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) is a math object; the math entity does not name which substrate-recorded artifact realizes "a section over $U_i$." This concept names that realization explicitly:

- A section is *not* a member's belief, opinion, or transient state — it is the *signed, witnessed, substrate-recorded vote*.
- The substrate's *no-double-vote rule* (per [quorum-consensus](quorum-consensus.md): each member casts at most one vote per consensus instance) is the substrate-level enforcement that $\sigma_i$ is a *function* on $U_i$ — not a multi-valued or empty assignment.
- The substrate's *agreement-on-overlap* discipline (members $i$ and $j$ whose clopens intersect must produce sections that agree on $U_i \cap U_j$) is the sheaf condition. For single-value consensus, where every $\sigma_i$ is the constant section with value $v_i$, agreement on overlap reduces to $v_i = v_j$ — the equal-value condition the protocol's no-conflicting-vote rule enforces.

Per [self-representation](../../teaching/explanations/self-representation.md), the section is substrate content: the vote-record, the evidence chain, and the signature are all recorded predications on the cluster's substrate.

## Engineering consequence

Three follow-on facts depend on this identification:

- **The protocol's success state is a global section.** When all members' votes agree on overlaps, [Mayer–Vietoris exactness](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) lifts the local sections $\{\sigma_i\}_i$ to a unique global section in $H^0(U, \mathcal{F}_U)$ — this is the consensus's decided value, made formal in [consensus-as-h0-construction](../theorems/consensus-as-h0-construction.md).
- **Audit operations evaluate sheaf cocycles.** Reading a quorum-record's recorded votes back as sections lets an audit operation (per [audit-quorum-witness-chain](../morphisms/audit-quorum-witness-chain.md)) check the cocycle condition — that overlapping votes agreed — by direct Čech-cochain calculation, with correctness guaranteed by [audit-via-cech-cocycle-evaluation](../theorems/audit-via-cech-cocycle-evaluation.md).
- **A failed consensus is a non-vanishing $\delta^0$.** When some pair of votes disagrees on overlap, the family $\{\sigma_i\}_i$ does not lift to a global section; the obstruction is a non-zero element of the connecting homomorphism's image. The protocol's failure-witness is the substrate-recorded evidence of this non-vanishing.

## Position

This is a *structural-bridge* concept companion to [cluster-as-replica-cover](cluster-as-replica-cover.md). Together they let the platform's theorems read protocol artifacts (clusters, votes, witnesses) as cohomological data (covers, sections, cocycles) at a single shared anchor.
