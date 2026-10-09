---
type: theorem
class: engineering-claim
status: proved
depends-on: [agent, agent-record, federation-graph, multi-observer-system, network-sheaf-consensus-on-agent-graphs, bilattice-network-sheaf-consensus, predication-fiber-algebra, knowledge-order, four-bilattice]
see-also: [federation-convergence, dispatch-composes-authorization]
title: Agent communities are network-sheaf consensus systems
description: Claim.
---

# Agent communities are network-sheaf consensus systems

**Claim.** Let $\mathcal{C}$ be a community of agents on a platform — a finite set of [agent records](../objects/agent-record.md) connected by the platform's [federation graph](../../federation/federation-graph/federation-graph.md) and/or by shared sublocale access on a single substrate.
Let $\hat G_\mathcal{C}$ be the incidence poset of agents (vertices) and shared channels (edges).
Then the community's joint state is a [multi-observer system](../../../../../../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) $V_\mathcal{C}: \hat G_\mathcal{C} \to \mathrm{Settlings}_B$, and:

1. **Consensus exists.** The community's consensus settling $V_\mathcal{C}^{\mathrm{cons}} = \lim_{\sigma \in \hat G_\mathcal{C}} V_\mathcal{C}(\sigma)$ exists, equals $H^0(\hat G_\mathcal{C}, \mathcal{F}_{V_\mathcal{C}})$, and is computable as the cellwise [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) meet of the agents' settlings.

2. **Disagreement is structural.** When two agents have $(\mathbf{t}, \mathbf{f})$-disagreeing values at the same cell, the cellwise $\vee_k$-join over agents produces $\top$ at the disagreement cell — the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md)'s contradiction value.
  Disagreement is not an exception state; it is a substrate value that the platform records and acts on.

3. **Coordination-free merge.** Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) and [crdt-convergence](../../../../../../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence.md), the community's merge requires no consensus protocol.
  Each agent applies its local closure operator after merge; convergence to $\mathrm{cl}_p(\bigvee_k U)$ is automatic.

4. **CALM-compatible.** The community's joint computation is CALM-compatible per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md): all Mayer-Vietoris connecting morphisms vanish, so monotone computations on agents' local views compose to consistent global computations without coordination.

5. **Higher cohomology trivial.** $H^n(\hat G_\mathcal{C}, \mathcal{F}_{V_\mathcal{C}}) = 0$ for $n \geq 2$.

The platform's job in supporting an agent community is to *expose* this structure to the agents, not to *enforce* coordination on them.
The substrate's algebra is the coordination protocol.

## Why this holds

The argument is by direct application of [network-sheaf consensus on agent graphs](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/network-sheaf-consensus-on-agent-graphs.md) and its bilattice extension to the platform's agent community.

**Setup as multi-observer system.** Each [agent-record](../objects/agent-record.md) on the platform represents an entity in the substrate's [entity set](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/entity-set.md) $E$.
The agent's *view* — the sublocale of the substrate the agent has authorization to read and act on — is a settling on the platform's base $B$.
The community's observer category $\hat G_\mathcal{C}$ has agents as 0-cells and the platform's federation/shared-channel structure as 1-cells (incidence morphisms).
The functor $V_\mathcal{C}: \hat G_\mathcal{C} \to \mathrm{Settlings}_B$ assigns to each agent its view-settling and to each channel the consensus-settling restricted to the channel's scope.

**Claim (1) follows from the limit-of-multi-observer-system construction** in the math theorem: the limit exists in $\mathrm{Settlings}_B$ and equals the cellwise bilattice meet $\bigwedge_k V_\mathcal{C}(\sigma)$ over agents, which is exactly the $H^0$ global sections of the network sheaf $\mathcal{F}_{V_\mathcal{C}}$.

**Claim (2) follows from the disagreement-as-paraconsistent-witness** content of the math theorem.
When two agents' settlings produce $\mathbf{t}$ and $\mathbf{f}$ at the same cell respectively, the bilattice $\vee_k$ produces $\top = \langle 1, 1\rangle$ — the value-domain's first-class contradiction.
The substrate records this as a $\top$-cell, the platform's audit can identify which agents contributed the conflicting evidence, and a [governance-decision](../../../governance/governance-decision/governance-decision.md) operator may invoke a [repair](../../teaching/explanations/repair.md) to resolve.

**Claim (3) follows from [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md)** at the platform level: agents exchanging cells via the federation graph (or sharing a substrate) participate in a CRDT whose convergence is automatic.
The math theorem proves $\delta^0 = 0$ for every replica cover; the platform inherits this directly.

**Claim (4) follows from [cohomological-CALM](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md)** applied componentwise to the abelian shadows of the d-frame-valued network sheaf, plus the relations preserved by the bilattice extension theorem.
The Hellerstein-Alvaro CALM property holds at the platform level: monotone agent computations compose to monotone global computations.

**Claim (5) follows from [settling-cohomology vanishes above degree 1](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md)** applied to the network sheaf on the agent graph.

## Engineering consequence

The platform's role in agent coordination is **substrate-bearing, not coordination-managing**.
Several engineering consequences:

- **Consensus is computable, not negotiated.** The platform's [project](../../../morphisms/project.md) operator can compute the community's consensus by traversing the agent records and applying cellwise $\bigwedge_k$.
  There is no consensus algorithm to run, no leader to elect.
- **Disagreement is observable, not exceptional.** Cells in the community's join valued at $\top$ are flagged by the platform's audit.
  A [repair-catalog](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/repair-catalog.md) entry can match $\top$-cells and propose resolution paths (escalation, vote, deferral).
  The substrate exposes which agents disagreed and at which cells; the resolution discipline is policy.
- **Federation is multi-observer.** Cross-platform federation extends the agent community across substrates.
  Per [federation-convergence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), cross-substrate consensus is computable on the union of the agent records; the resulting community is a larger multi-observer system on the union of the federation graphs.
- **Adding an agent is editing predications.** A new agent joining the community is the substrate-side insertion of a new agent-record entity and the extension of the federation graph with the new agent's edges.
  The community's consensus is recomputed from the next $\mathrm{cl}_p$ application; no platform restart is needed.

## What the theorem rules out

- A platform that requires a centralized consensus protocol (Raft, Paxos, BFT) for agent coordination is not exploiting the substrate's CRDT-shape — the substrate's algebra already provides convergence; the centralized protocol is a workaround that loses the substrate's properties (auditability, replayability, regime-transparency).
- A platform that treats agent disagreement as an exception (catch-and-rollback) is not respecting the bilattice's first-class $\top$.
  Disagreement is a value, not an error; the substrate records it and policy responds.
- A platform whose agent communities span multiple substrate regimes incompatibly (one strict, one transfinite-bounded) cannot guarantee community-level consensus without trajectory federation per [scott-continuity-as-checkpointability](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scott-continuity-as-checkpointability.md).
  The platform must scope the cross-regime federation to a Scott-continuous prefix or ship trajectory.

## What the theorem requires

- Agents are represented as [agent-records](../objects/agent-record.md) — substrate entities.
- The community's federation graph is the substrate-side instance of a finite multi-observer system observer category.
- Each agent's settling shares the substrate's base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$.
- The substrate's closure operator satisfies the four [closure-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms.
- For non-Scott-continuous-regime substrates, federation across the community ships trajectory (per [scott-continuity-as-checkpointability](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scott-continuity-as-checkpointability.md)).
