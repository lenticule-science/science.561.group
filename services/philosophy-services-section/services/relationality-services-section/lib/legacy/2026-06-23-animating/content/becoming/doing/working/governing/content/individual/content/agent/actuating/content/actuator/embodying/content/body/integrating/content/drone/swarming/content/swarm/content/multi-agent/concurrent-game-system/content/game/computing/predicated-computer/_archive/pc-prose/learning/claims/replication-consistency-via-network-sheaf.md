---
type: theorem
class: engineering-claim
status: proved
depends-on: [replication, two-store-coherence, multi-observer-system, bilattice-network-sheaf-consensus, network-sheaf-consensus-on-agent-graphs, crdt-convergence, d-frame, scope-cover-via-grothendieck-site]
see-also: [federation-trust-bilattice-graded, federation-convergence, cycle-holonomy-as-federation-disagreement]
---

# Replication consistency is the network-sheaf consensus on the replica graph

**Claim.** For a substrate's [replica graph](teaching/explanations/replication.md) $G = (V_G, E_G)$ — vertices the replicas, edges the sync channels — viewed as a [multi-observer system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) $V_G : \hat G \to \mathrm{Settlings}_B$, the substrate-wide replication-consistency is *exactly the [bilattice network-sheaf consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)*: replicas are consistent iff the d-frame consensus

$$\mathbb{F}_{V_G}^{\mathrm{cons}} \;=\; \lim_{\sigma \in \hat G} \mathbb{F}_{V_G}(\sigma)$$

projects to each per-replica d-frame $\mathbb{F}_{V_G}(v)$ via the corresponding equality. When projections disagree, the cellwise $\vee_k$ produces $\top$-witnesses at the disagreement cells — the substrate's structural record of multi-replica disagreement.

## Why this holds

Per [multi-observer-system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md), the replica graph $G$ with per-replica settlings $V_G(v)$ and per-channel restrictions $V_G(e)$ is exactly a multi-observer system on the agent graph (with replicas in the role of agents).

Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md):

- The **d-frame consensus** $\mathbb{F}_{V_G}^{\mathrm{cons}}$ is the categorical limit of the per-replica d-frames in $\mathbf{dFrm}$. Its $L_+$ and $L_-$ components are the limits in $\mathbf{Frm}$ of the corresponding components; the $\mathrm{con}$ and $\mathrm{tot}$ relations are inherited via the projection maps. Per the theorem's claim 1, the limit *exists* (and is computable componentwise).
- The **disagreement-join** $\bigvee_k V_G(v)$ of all replicas' settlings produces a d-frame whose $\mathrm{con}$ relation *fails* at exactly the cells where two replicas hold contradictory values. Per the theorem's claim 2, these con-failure cells are exactly the $\top$-witnesses of the joint settling.
- The **Mayer-Vietoris vanishing** (theorem's claim 3-4) guarantees that the d-frame cohomology of the replica graph vanishes in higher degrees: $H^n(\hat G, \mathbb{F}_{V_G}) = 0$ for $n \geq 1$. This is the substrate-level CRDT-convergence guarantee.

Per [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), two replicas with identical event-log content have identical predication graphs (the convergence is structural, not protocol-mediated). Combined with the network-sheaf consensus, this gives the substrate's replication-consistency criterion: replicas are consistent iff (a) each pair of replicas with shared scope is in $\mathrm{con}$ at every cell of that scope, *and* (b) the consensus d-frame's projection equals each replica's local d-frame.

## Engineering consequence

- **Consistency check is computable.** The substrate's replication-consistency check is a structural d-frame computation: form the limit, compare projections. Per the theorem's claim 5 (shadow comparison), the check decomposes componentwise into $L_+$ / $L_-$ checks plus relation inheritance.
- **Disagreement is a substrate state.** A $\top$-witness at a disagreement cell is not an exception — per the theorem's claim 2, it is the structural representation of "two replicas told us different things." Per [repair](teaching/explanations/repair.md), the substrate surfaces $\top$-witnesses for governance reconciliation.
- **CRDT-convergence is automatic.** Per the theorem's claim 3-4 (Mayer-Vietoris vanishing) and [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), replicas exchanging events under the substrate's $\vee_k$-join converge without coordination. The convergence is structural to the bilattice's value-domain.
- **Per-observer-rule extension.** Per the theorem's claim 6, when replicas have per-observer closure-rule systems (different replicas may run different rule versions during rollouts), the convergence still holds — the d-frame consensus is rule-independent at the consensus level.
- **Topology-respecting consistency.** Per [scope-cover-via-grothendieck-site](scope-cover-via-grothendieck-site.md), replication-consistency may be checked at any scope's cover: consistent at $\sigma$ iff consistent at every $\sigma_i$ in a covering family.
- **Federation as multi-replica.** Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federation is a special case of multi-replica with explicit trust grades; the same network-sheaf consensus applies.

## What the theorem rules out

- **Boolean replication-consistency.** A replication-consistency check that admits only "consistent / inconsistent" outcomes loses the substrate's $\bot$ (replica unknown), $\top$ (replica disagreement) distinctions. The substrate refuses; per the bilattice structure, four-valued is the minimum.
- **Centralized coordination.** A replication discipline that requires a central coordinator to declare "the consensus is X" is not implementing the network-sheaf consensus — the consensus is a *limit*, computable locally from per-replica d-frames and the channel structure.
- **$\top$-as-error.** A replication discipline that crashes or rejects writes when a $\top$-witness arises is collapsing the substrate's distinction between contradiction (substrate state) and error (operator failure). Per [repair](teaching/explanations/repair.md), $\top$ is a signal for resolution, not a failure mode.

## What the theorem requires

- The substrate's value-domain admits $\vee_k$ (knowledge join), $\wedge_k$ (knowledge meet), and the d-frame $\mathrm{con}$ / $\mathrm{tot}$ structure (per [d-frame](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/d-frame.md)).
- The replica graph is a multi-observer system: per-vertex settlings, per-edge channel-settlings, with d-frame morphism restrictions (per [multi-observer-system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md)).
- The substrate's [merge](../morphisms/merge.md) operator implements $\vee_k$ (the CRDT-style join).
- The replica graph is finite (per the theorem's setup); for infinite replica graphs, additional verification is needed per the regime classification.

## Position

Together with [scope-cover-via-grothendieck-site](scope-cover-via-grothendieck-site.md) and [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), this theorem completes the substrate's distributed-coordination picture: scope-decomposition for sharded reads, replica-consensus for multi-instance coordination, federation-trust for cross-substrate gluing — all structurally the same network-sheaf consensus on different agent graphs. The substrate's distributed discipline is one phenomenon at three engineering surfaces.
