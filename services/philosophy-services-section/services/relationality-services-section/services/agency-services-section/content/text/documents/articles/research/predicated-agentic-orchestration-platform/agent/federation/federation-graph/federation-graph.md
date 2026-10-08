---
type: definition
class: structure
realizes: [federation]
depends-on: [outpost, inbox, multi-observer-system, knowledge-order, bilattice, quantale-enriched-sheaf, bilattice-accessibility-relation, q-fuzzy-equivalence]
see-also: [agential-orchestration-platform, agent-community-consensus, federation-trust-bilattice-graded, federation-path-metrics-multiplicative, cycle-holonomy-as-federation-disagreement]
title: Federation graph
description: The platform's predication-graph sub-region recording how this platform connects to other platforms (or how scopes within this platform connect to each other).
---

# Federation graph

The platform's predication-graph sub-region recording how this platform connects to other platforms (or how scopes within this platform connect to each other).
Structurally, the federation graph is the substrate-side instance of:

- a [multi-observer system](../../../../../../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) on the network of federated platforms — a functor $V_\mathcal{F}: \hat G \to \mathrm{Settlings}$ whose vertices are platforms (or scopes), whose edges are routing channels, and whose [predication settlings](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) at each node are the platform's local state; **and**
- a [quantale-enriched sheaf](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md) on the federation site — each node carries a complete weighted lattice (its local fiber-algebra), each edge carries a $\mathsf{Q}$-functor restriction, and the sheaf condition asserts that local data on overlapping covers reconciles up to the quantale's grade.

The two formulations agree: the multi-observer functor *is* the q-enriched sheaf, with the bilattice values per node and the quantale grades per edge.

## Sub-structures the federation graph carries

The federation graph's nodes are [outpost](teaching/explanations/outpost.md) and [inbox](teaching/explanations/inbox.md) entities; its edges are routing predications declaring "this outpost routes to this inbox under these conditions."

- **Identity registry.** Predications recording the canonical identity of remote platforms — public keys, canonical names, version markers — that the local platform federates with.
  Identity records are required for [witness](../../../objects/witness.md) verification on incoming federated messages.
- **Bridge registry.** Predications recording the canonical-form translations admissible at the boundary.
  When two federating platforms run different closure-rule-system versions $V_1 \neq V_2$, a [federation-bridge](../federation-bridge/federation-bridge.md) entity records the translation between $V_1$-vocabulary and $V_2$-vocabulary predications, in canonical form, signed by an authority both platforms recognize.
  Per [q-fuzzy-equivalence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), a bridge that is not a strict equivalence is still admissible as a $q$-fuzzy equivalence — the federation tolerates lossy translation graded by the quantale.
- **Routing predications.** Predications on each [outpost](teaching/explanations/outpost.md) declaring which remote inbox it sends to under which conditions, and predications on each [inbox](teaching/explanations/inbox.md) declaring which remote outposts it accepts messages from.
- **Trust accessibility.** A [bilattice accessibility relation](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md) $R: W \times W \to \mathbf{L}^\bowtie$ on the federation's worlds, recording per-peer admission state.
  Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), this is structurally bilattice-valued, not Boolean.
- **Quantale-graded edge weights.** Each routing predication carries a quantale element $q \in \mathsf{Q}$ recording the edge's *cost* or *trust grade* (latency, reliability, authority-distance — the platform picks the quantale per its operational needs).
  Per [federation-path-metrics-multiplicative](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-path-metrics-multiplicative.md), grades along multi-hop paths multiply per the quantale's $\cdot$ operation.

## Engineering properties

- **Federation is opt-in.** No outpost forwards messages outside the local platform unless its routing predications declare an outbound destination.
  No inbox accepts messages from a remote outpost unless its routing predications include the remote outpost's identity.
  The default is "no federation" — connection is established by inserting predications.
- **Federation is bilattice-valued.** Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), the trust an inbox extends to a remote outpost is a [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) value — $\mathbf{t}$, $\mathbf{f}$, $\bot$, $\top$ — not a Boolean.
  Partial-trust, contested-trust, and unknown-trust are first-class.
- **Federation is quantale-graded.** Trust is not just *what kind* but also *how strong*.
  Per [federation-path-metrics-multiplicative](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-path-metrics-multiplicative.md), composing trust along multi-hop paths multiplies grades — exactly as the [Lawvere-quantale settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmark-lawvere-quantale-settling.md) accumulates distance along graph paths.
- **Federation is auditable.** Every federated message produces witnesses on both sides: the outpost records the emission, the inbox records the reception.
  An auditor with access to both [event logs](../../../objects/event-log.md) reconstructs the federation byte-for-byte.
  Discrepancies between the two sides are coherence violations — by definition, one of the platforms has an incomplete or tampered log.
- **Cycle holonomy detects disagreement.** Per [cycle-holonomy-as-federation-disagreement](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cycle-holonomy-as-federation-disagreement.md), traversing a cycle in the federation graph and finding the round-trip composition does *not* return the identity (in the q-fuzzy sense) is the substrate's structural detection of inter-peer disagreement — it surfaces governance-reconciliation candidates without requiring centralized polling.

Federation was sometimes treated as an architectural concern external to the substrate (network protocols, message brokers, RPC frameworks).
The modern formulation makes federation a substrate property: the federation graph is a predication-graph sub-region — equivalently a multi-observer system on the platform graph, equivalently a q-enriched sheaf on the federation site — federated messages are predications crossing scope boundaries, and federation is governed by the same closure machinery as everything else, with convergence guaranteed by [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md).
Network and protocol concerns become engineering details of *how the federation graph is realized at a given site*, not architectural concerns of *what federation is*.
