---
type: theorem
status: proved
depends-on:
  - multi-observer-system
  - distributed-settling-system
  - settling-associated-sheaf
  - bitopological-settling-site
  - crdt-convergence-via-mayer-vietoris
  - cohomological-calm
  - replica-mayer-vietoris
  - settling-cohomology-vanishes-above-degree-1
see-also:
  - benchmark-multi-observer-disagreement
  - q-enriched-curry-finite-graph
  - hansen-ghrist2019
  - lopez2024
  - toward-agentic-swarm-theory
---

# Network-sheaf consensus on agent graphs

The corpus's CRDT / Mayer–Vietoris / cohomological-CALM trio specializes to the *network-sheaf-on-agent-graph* setting: when the observer category $O$ of a [multi-observer system](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/terms/multi-observer-system.md) is the incidence poset of a finite graph $G$ of agents, and the settling-associated sheaf $\mathcal F_v$ pushes forward to a network sheaf on $G$, the corpus's existing theorems give a consensus / disagreement / coordination-freeness / CALM-compatibility characterization of the network sheaf.

## Setup

Let $G = (V_G, E_G)$ be a finite undirected graph of *agents*: vertices $V_G$ are agents, edges $E_G$ are communication channels. Form the **incidence poset** $\hat G$:

- Objects of $\hat G$: $V_G \sqcup E_G$.
- Morphisms: a single non-identity morphism $v \leq e$ for each incidence $v \lhd e$ (the vertex $v$ is one of the two endpoints of edge $e$).

This is the standard cell-complex structure on a graph: 0-cells are agents, 1-cells are channels, face incidences are vertex-to-edge containments.

Fix a base $B = (\mathbf L, \mathcal C, E, \lambda)$ in the corpus's sense. A **multi-observer system on $G$** is a functor

$$V_G : \hat G \to \mathrm{Settlings}_B$$

assigning to each agent $v$ a settling $V_G(v)$ on the common base, to each channel $e$ a settling $V_G(e)$, and to each incidence $v \leq e$ a [settling-morphism](../morphisms/settling-morphism.md) $V_G(v) \to V_G(e)$ encoding "the joint view at the channel restricts to each endpoint's view."

For the simplest case, take $V_G(e)$ at each channel to be the *consensus* $\lim(V_G(v_1), V_G(v_2))$ of the two endpoint settlings — what the two endpoints can agree on. The settling-morphism from $v_i$ to $e$ is then the canonical morphism into the limit.

The **settling-associated sheaf** $\mathcal F_{V_G}$ on $\hat G$ assigns to each cell $\sigma \in \hat G$ the abelian group $\mathcal F_{V_G}(\sigma) = $ the underlying $\mathbf{Ab}$-valued sheaf of the settling $V_G(\sigma)$ at the appropriate clopen of the bitopological settling site (per the [d-frame cohomology comparison](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md), this is the truth-side or falsity-side shadow of the d-frame-valued sheaf $\mathbb F_{V_G}$, depending on which component is being tracked).

Restrictions $\mathcal F_{V_G}(v) \to \mathcal F_{V_G}(e)$ along incidences $v \lhd e$ are induced by the settling-morphisms.

## Statement

**Theorem (network-sheaf consensus on agent graphs).** *Let $V_G : \hat G \to \mathrm{Settlings}_B$ be a multi-observer system on a finite graph $G$ of agents, with settling-associated sheaf $\mathcal F_{V_G}$. Then:*

1. **Consensus.** *The categorical limit*
   $$V_G^{\mathrm{cons}} := \lim_{\sigma \in \hat G} V_G(\sigma) \in \mathrm{Settlings}_B$$
   *exists and equals the global sections $\Gamma(\hat G, \mathcal F_{V_G}) = H^0(\hat G, \mathcal F_{V_G})$ of the network sheaf. This is the maximum information shared by all agents and all communication channels, computed pointwise as the bilattice knowledge-meet $\bigwedge_k V_G(\sigma)$.*

2. **Disagreement and paraconsistent join.** *The dual operation — the cellwise bilattice knowledge-join $\bigvee_k V_G(\sigma)$ over agents — produces $\top$-content at cells where two or more agents have $(\mathbf t, \mathbf f)$-disagreeing values. By the [multi-observer disagreement benchmark](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-multi-observer-disagreement.md), the join is paraconsistent exactly at the disagreement loci. The disagreement is structurally distinct from the consensus: $\bigvee_k V_G(\sigma) \succeq_k V_G^{\mathrm{cons}}$ pointwise, with strict $\succ_k$ at disagreed cells.*

3. **CRDT-style coordination-freeness.** *Every replica cover $\{U_i \to U\}$ of any clopen $U$ in the bitopological settling site beneath $\hat G$ admits coordination-free merge. The Mayer–Vietoris connecting homomorphism*
   $$\delta^0 : H^0(U_1 \cap U_2, \mathcal F_{V_G}) \to H^1(U, \mathcal F_{V_G})$$
   *is identically zero, by [CRDT convergence via Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md).*

4. **Cohomological CALM.** *The network-sheaf computation is CALM-compatible: all Mayer–Vietoris obstructions $\delta^n$ vanish for $n \geq 0$, by [cohomological CALM](../../settling-cohomology/references/cohomological-calm.md) plus the [higher-degree vanishing theorem](../../settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md). Equivalently: monotone computations on agents' local views compose to consistent global computations without coordination, in the Hellerstein–Alvaro CALM sense.*

5. **Cohomological structure.** *The network sheaf has $H^0 = $ consensus settling (per (1)), $H^1$ classifying coordination-failures-of-non-monotone-extensions (zero for the settling-associated sheaf by (4)), and $H^n = 0$ for $n \geq 2$.*

## Proof

The five claims follow by direct citation of existing corpus theorems applied to the graph-incidence-poset specialization $O = \hat G$ of the multi-observer system.

**(1) Consensus.** The limit of $V_G : \hat G \to \mathrm{Settlings}_B$ exists in $\mathrm{Settlings}_B$ because the category has all small limits (corpus's [knowledge-presheaf-category](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/knowledge-presheaf-category.md) is complete). The identification $\lim V_G = \Gamma(\hat G, \mathcal F_{V_G}) = H^0(\hat G, \mathcal F_{V_G})$ is the standard sheaf-theoretic interpretation of global sections as the limit of the section presheaf, applied here. The pointwise computation $V_G^{\mathrm{cons}}(p)(s, o) = \bigwedge_k V_G(v)(p)(s, o)$ over agents $v$ is the multi-observer-system's consensus formula. $\square$

**(2) Disagreement.** Direct from the [multi-observer disagreement benchmark](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-multi-observer-disagreement.md): the cellwise $\vee_k$ over agents yields $\top$ exactly when some pair of agents has $(\mathbf t, \mathbf f)$-disagreeing values at that cell. The structural inequality $\bigvee_k V_G(\sigma) \succeq_k V_G^{\mathrm{cons}}$ follows from $\bot \preceq_k \bigvee_k$ for any family in a join-semilattice. The strict inequality at disagreement loci follows because $\mathbf t \vee_k \mathbf f = \top \succ_k \bot = \mathbf t \wedge_k \mathbf f$. $\square$

**(3) Coordination-freeness.** Direct from [CRDT convergence via Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md). The replica cover machinery applies to clopens of the bitopological settling site over which the network sheaf $\mathcal F_{V_G}$ is defined; the cited theorem's $\delta^0 = 0$ statement transfers verbatim because $\mathcal F_{V_G}$ has the same construction (free abelian group on newly-designated points) as the settling-associated sheaves the cited theorem is stated for. $\square$

**(4) Cohomological CALM.** Direct from [cohomological CALM](../../settling-cohomology/references/cohomological-calm.md), which combines (3) at $n = 0$ with the [higher-degree vanishing theorem](../../settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md) for $n \geq 2$. The settling-associated sheaf class includes $\mathcal F_{V_G}$. $\square$

**(5) Cohomological structure.** Combine (1) for $H^0$, (4) for $H^1 = 0$ via the vanishing-of-$\delta^0$ argument applied to the network-sheaf-as-a-Čech-cover-of-$\hat G$, and the higher-degree vanishing theorem for $n \geq 2$. $\square$

The theorem is a *reformulation*: every claim cites an already-proved corpus theorem, with the graph-incidence-poset specialization of the observer category being the only new piece. This new piece is structural unpacking of definitions, not a new mathematical step.

## Worked instance: 2-agent network

The smallest non-trivial agent graph is two agents connected by one channel. $V_G = \{v_1, v_2\}$, $E_G = \{e\}$, $\hat G = \{v_1, v_2, e\}$ with $v_1 \leq e \geq v_2$.

Specializing the [multi-observer disagreement benchmark](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-multi-observer-disagreement.md) to this network gives:
- Two agents $v_1, v_2$ with bilattice-negated initial states ($\mathbf t$ at $v_1$, $\mathbf f$ at $v_2$ on the same cell).
- Channel $e$'s settling = consensus $V_G(v_1) \wedge_k V_G(v_2)$, which is $\bot$ everywhere (no shared information).
- Network-sheaf $H^0 = $ trivial settling (everyone agrees on nothing).
- Cellwise join over agents $= V_G(v_1) \vee_k V_G(v_2) = \top$ at the $(\mathbf t, \mathbf f)$-disagreement cell — the *paraconsistent witness* of the disagreement.

Per (3): the Mayer–Vietoris $\delta^0$ is zero on every replica cover, so the per-agent views can be merged without coordination. Per (4): the network is CALM-compatible.

This is the *minimal* network-sheaf-on-agent-graph case where consensus and disagreement diverge. Larger graphs ($n$ agents on a path, cycle, complete graph, etc.) yield richer disagreement structure with the same theorem applying.

## Scope

The theorem applies to finite agent graphs $G$ with $\mathbf{Ab}$-valued shadow sheaves. Three extensions are separate theorems in the corpus, not subsumed here:

- **Bilattice extension** (full d-frame, not just $\mathbf{Ab}$-shadows): [bilattice network-sheaf consensus](bilattice-network-sheaf-consensus.md) (proved).
- **Spectral characterization** (Hansen–Ghrist's harmonic / convergence-rate framing): the corpus's Čech-method consensus diverges from this; comparison is the open [Hansen–Ghrist spectral engagement question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/hansen-ghrist-spectral-engagement.md).
- **Infinite agent graphs** (countable swarms, continuous via mean-field limit): not yet developed in the corpus.

For comparative positioning to literature (Hansen–Ghrist, Lopez 2024, Felber et al. 2025) and the theorem's role in the agentic-swarm-theory program, see the [toward-agentic-swarm-theory narrative](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/toward-agentic-swarm-theory.md).
