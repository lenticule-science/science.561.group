---
type: example
depends-on: [predication-settling, four-bilattice, knowledge-order, distributed-settling-system, crdt-convergence, relational-database-settling]
instantiates: [predication-settling, distributed-settling-system]
lineage: 2
---

# Multi-agent epistemic settling on the social network (Belnap's motivation)

**Lineage 2** instance: three agents/replicas reporting on a disputed Likes claim. Recovers [@belnap1977]'s original motivation for four-valued logic in the L2 social-network setting.

**Data.** [Entity set](../objects/entity-set.md) $E = \{\text{Alice}, \text{Bob}\}$ (the L2 base, restricted to two entities for this example). [Predicate set](../objects/predicate-set.md) $\Pi = \{\text{Likes}\}$.

**Setup.** Three agents $A_1, A_2, A_3$ each report on whether $\text{Alice}$ likes $\text{Bob}$ — the disputed cell $(\text{Alice}, \text{Bob})$. The predication settling steps correspond to each agent's report arriving.

**Settling.** Writing $(s, o) = (\text{Alice}, \text{Bob})$ throughout:
- $\tau = 0$: $v_0(\text{Likes})(s, o) = \bot$ (no reports yet).
- $\tau = 1$ ($A_1$: "yes, Alice likes Bob"): $v_1(\text{Likes})(s, o) = \bot \vee_k \mathbf{t} = \mathbf{t}$.
- $\tau = 2$ ($A_2$: "yes"): $v_2(\text{Likes})(s, o) = \mathbf{t} \vee_k \mathbf{t} = \mathbf{t}$. No change.
- $\tau = 3$ ($A_3$: "no, Alice does not like Bob"): $v_3(\text{Likes})(s, o) = \mathbf{t} \vee_k \mathbf{f} = \top$ — positive evidence from $A_1, A_2$, negative evidence from $A_3$.

**Quiescent state.** $v_\tau(\text{Likes})(s, o) = \top$ for all $\tau \geq 3$. The community is inconsistent on whether Alice likes Bob.

**Role.** Recovers [@belnap1977]'s original motivation for four-valued logic: a community with disagreeing sources aggregates via $\vee_k$ (the [knowledge-order](../concepts/knowledge-order.md) join), and the result correctly indicates "the community is inconsistent on this claim" via $\top$ — rather than trivializing (as classical logic would) or silently dropping one source's input.

The L2 setting makes Belnap's motivation socially concrete: real-world disagreements about social facts ("does Alice like Bob?") are exactly the kind of thing where multiple sources with different access/perspective can disagree, and the appropriate aggregation is $\vee_k$ rather than majority-vote or dropout.

**Distributed reading.** This example is also a small [distributed settling system](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/distributed-settling-system.md): each agent is a replica; the settling steps correspond to merges arriving at a central coordinator (or, equivalently, to a gossip protocol reaching a common state). By the [CRDT convergence theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence.md), the order of agent-report arrivals does not affect the final state.

## Position in Lineage 2

L2 instance for the multi-agent / CRDT chapter. Pairs with [three-replica-mayer-vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/three-replica-mayer-vietoris.md) which performs the Mayer-Vietoris computation on the same setup. The L2 base is the natural site for these CRDT examples because social-network claims are inherently multi-source and disputed; the bilattice's $\top$ value captures exactly this disagreement structurally.
