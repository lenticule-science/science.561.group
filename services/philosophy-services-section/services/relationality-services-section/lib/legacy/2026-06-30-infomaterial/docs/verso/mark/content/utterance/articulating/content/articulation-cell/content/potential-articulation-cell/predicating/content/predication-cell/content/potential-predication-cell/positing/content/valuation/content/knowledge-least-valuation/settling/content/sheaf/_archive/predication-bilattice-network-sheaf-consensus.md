---
type: theorem
status: proved
depends-on:
  - network-sheaf-consensus-on-agent-graphs
  - multi-observer-system
  - d-frame-valued-sheaf
  - d-frame-cohomology-comparison
  - d-frame
  - d-frame-morphism
  - crdt-convergence-via-mayer-vietoris
  - cohomological-calm
  - benchmark-multi-observer-disagreement
see-also:
  - per-fiber-d-frame-curry-on-belnap-fiber
  - crdt-convergence-with-per-observer-rules
  - toward-agentic-swarm-theory
---

# Bilattice network-sheaf consensus on agent graphs

The [network-sheaf consensus on agent graphs theorem](network-sheaf-consensus-on-agent-graphs.md) (Task 1 of the [agentic-swarm-theory study plan](prose/teaching/explanations/toward-agentic-swarm-theory.md)) gives a consensus / disagreement / coordination-freeness / CALM characterization of multi-observer systems on finite agent graphs $G$, at the **abelian shadow** level — using the $\mathbf{Ab}$-valued $L_+$ and $L_-$ shadow sheaves of the underlying d-frame-valued sheaf. This theorem lifts that result to the **full d-frame** level: replace the shadow components by the d-frame-valued sheaf $\mathbb F_{V_G}$ and recover consensus / join / Mayer–Vietoris vanishing as a single d-frame statement, with consistency and totality relations beyond what the shadow records.

The lift is structurally light: each claim reduces componentwise to the abelian shadow theorem (proved) plus inheritance of $\mathrm{con}$ and $\mathrm{tot}$ through the limit / colimit constructions in $\mathbf{dFrm}$. The substantive new content is structural: the d-frame at the cohomology level captures the agent-graph's disagreement-as-paraconsistency content with a single algebraic object instead of a pair of components.

## Setup

Let $G = (V_G, E_G)$ be a finite agent graph and $\hat G$ its incidence poset (objects $V_G \sqcup E_G$, morphisms $v \leq e$ for incidences). Let $V_G : \hat G \to \mathrm{Settlings}_B$ be a multi-observer system (per the [multi-observer system object](../objects/multi-observer-system.md)).

Form the **d-frame-valued network sheaf** $\mathbb F_{V_G}$ on $\hat G$:

- For each $\sigma \in \hat G$, the stalk $\mathbb F_{V_G}(\sigma)$ is the d-frame at $V_G(\sigma)$'s settling — i.e., the d-frame-valued sheaf $\mathbb F_{V_G(\sigma)}$ at an appropriate clopen of the bitopological settling site, per the [d-frame-valued sheaf object](../objects/d-frame-valued-sheaf.md).
- For each incidence $v \leq e$ in $\hat G$, the restriction $\mathbb F_{V_G}(v) \to \mathbb F_{V_G}(e)$ is a [d-frame morphism](../morphisms/d-frame-morphism.md) — preserves $L_+, L_-$ frame structure and preserves $\mathrm{con}, \mathrm{tot}$ relations.

The shadow functor $\mathbb S : \mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$ from the [d-frame cohomology comparison theorem](d-frame-cohomology-comparison.md) takes $\mathbb F_{V_G}$ section-wise to $(\mathcal F^k_{V_G}, \mathcal F^{k,-}_{V_G})$, the truth-side and falsity-side $\mathbf{Ab}$-valued network sheaves of Task 1's setting.

## Statement

**Theorem (bilattice network-sheaf consensus on agent graphs).** *Let $V_G : \hat G \to \mathrm{Settlings}_B$ and $\mathbb F_{V_G}$ be as above. Then:*

1. **D-frame consensus.** *The categorical limit*
   $$\mathbb F_{V_G}^{\mathrm{cons}} \;:=\; \lim_{\sigma \in \hat G} \mathbb F_{V_G}(\sigma) \;\in\; \mathbf{dFrm}$$
   *exists and is the **consensus d-frame**. Its $L_+$ component is the consensus on the truth-side shadow (as in [Task 1](network-sheaf-consensus-on-agent-graphs.md), claim 1); its $L_-$ component is the consensus on the falsity-side shadow; its $\mathrm{con}$ and $\mathrm{tot}$ relations are the largest relations such that the limit-projections to each $\mathbb F_{V_G}(\sigma)$ are d-frame morphisms.*

2. **D-frame disagreement-join.** *The cellwise bilattice $\vee_k$ over agents (taking the d-frame join in each cell) produces a d-frame whose $L_+, L_-$ components are the unions of agents' truth- / falsity-positive selections, and whose $\mathrm{con}$ relation **fails** at $(\mathbf t, \mathbf f)$-disagreement loci where both an $L_+$ and an $L_-$ selection co-witness the same cell. The con-failure cells are exactly the $\top$-cells of the joint settling, recording the disagreement.*

3. **Componentwise Mayer–Vietoris vanishing.** *For every replica cover, the d-frame Mayer–Vietoris sequence has vanishing $\delta^0$ on each shadow component: $\delta^0_+ = 0$ on $\mathcal F^k_{V_G}$ and $\delta^0_- = 0$ on $\mathcal F^{k,-}_{V_G}$, both by direct application of [CRDT convergence via Mayer–Vietoris](crdt-convergence-via-mayer-vietoris.md). The d-frame structure on the cohomology has $L_\pm$ from the componentwise Mayer–Vietoris and $\mathrm{con}, \mathrm{tot}$ inherited from the d-frame structure on $\mathbb F_{V_G}$.*

4. **D-frame CALM-compatibility.** *The d-frame Mayer–Vietoris vanishes in all degrees: $\delta^n_\pm = 0$ for $n \geq 0$ on each shadow component, by [cohomological CALM](cohomological-calm.md) on each side. The d-frame structure on the global cohomology is therefore well-defined and inherits relations from the sheaf level.*

5. **Shadow comparison.** *The shadow functor $\mathbb S$ commutes with the bilattice consensus / join: $\mathbb S(\mathbb F_{V_G}^{\mathrm{cons}}) = (\mathcal F^{k,\mathrm{cons}}_{V_G}, \mathcal F^{k,-,\mathrm{cons}}_{V_G})$, and similarly for the join. This identifies the bilattice extension as a strict refinement of [Task 1's theorem](network-sheaf-consensus-on-agent-graphs.md): same shadow components, with $\mathrm{con}$ and $\mathrm{tot}$ relations on the cohomology that are not recoverable from the shadow alone.*

6. **Per-observer-rule extension.** *When the multi-observer system is [ruled](../objects/multi-observer-system-with-rules.md) (per-observer rule systems), the d-frame consensus / join captures both evidence-layer and inferential-layer disagreement. The componentwise application of [CRDT convergence with per-observer rules](crdt-convergence-with-per-observer-rules.md) establishes that the bilattice convergence is rule-independent at the d-frame level.*

## Proof

The proof rests on three structural moves: shadow-decomposition of d-frames, componentwise application of Task 1's theorem on each shadow, and inheritance of $\mathrm{con}, \mathrm{tot}$ through the limit / colimit constructions in $\mathbf{dFrm}$.

**(1) D-frame consensus exists.** $\mathbf{dFrm}$ has all small limits, computed component-wise: the limit of a diagram of d-frames has $L_+$ component = limit in $\mathbf{Frm}$ of the $L_+$ components; $L_-$ component = limit of the $L_-$ components; $\mathrm{con}$ relation = the largest relation satisfying the projections-are-d-frame-morphisms axioms (downward-closed in $L_+ \times L_-$, etc.). The shadow components match what Task 1's theorem gives on each side (the $\mathbf{Ab}$-valued consensus on $\mathcal F^k_{V_G}$ and on $\mathcal F^{k,-}_{V_G}$ separately). The relations on the cohomology are determined by their structure on the underlying cellular sheaf: a pair $(A, B)$ in the consensus is in $\mathrm{con}$ iff at every $\sigma \in \hat G$, the projected pair $(\pi_\sigma A, \pi_\sigma B)$ is in $\mathrm{con}(\mathbb F_{V_G}(\sigma))$. Similarly for $\mathrm{tot}$. $\square$

**(2) Disagreement-join.** The cellwise $\vee_k$ over agents is, by the [predication fiber algebra](../objects/predication-fiber-algebra.md), well-defined componentwise: $L_+$ join = pointwise frame-join of agents' $L_+$ selections; similarly $L_-$. The $\mathrm{con}$ relation on the join: a pair $(A, B)$ is in $\mathrm{con}$ iff $A \cap B = \emptyset$ as cell sets (i.e., no co-witness). The $(\mathbf t, \mathbf f)$-disagreement at a cell — agent $v_1$ has the cell in its $L_+$ side, agent $v_2$ has it in its $L_-$ side — produces $A = \{\text{cell}\} \in L_+$ join, $B = \{\text{cell}\} \in L_-$ join, $A \cap B = \{\text{cell}\} \neq \emptyset$. So $\mathrm{con}$ fails at the disagreement cell. By the bilattice's definition, the cell receives value $\top$ in the joint settling — $\top = (\mathbf t, \mathbf f)$ as a co-witness. $\square$

**(3) Componentwise Mayer–Vietoris vanishing.** The shadow functor commutes with the network-sheaf cohomology componentwise: $H^n(\hat G, \mathbb S(\mathbb F_{V_G})) = (H^n(\hat G, \mathcal F^k_{V_G}), H^n(\hat G, \mathcal F^{k,-}_{V_G}))$, by the [d-frame cohomology comparison theorem](d-frame-cohomology-comparison.md) applied section-wise. The Mayer–Vietoris connecting homomorphism on each shadow component is $\delta^0_\pm$ on the corresponding $\mathbf{Ab}$-valued sheaf; both vanish by [CRDT convergence via Mayer–Vietoris](crdt-convergence-via-mayer-vietoris.md). The d-frame structure on the cohomology has its $L_\pm$ components determined by the shadow, and its $\mathrm{con}, \mathrm{tot}$ relations inherited from the sheaf as in (1). $\square$

**(4) CALM-compatibility.** Apply [cohomological CALM](cohomological-calm.md) to each shadow component separately: $\delta^n_\pm = 0$ for all $n \geq 0$ on $\mathcal F^k_{V_G}$ and $\mathcal F^{k,-}_{V_G}$ respectively. The d-frame Mayer–Vietoris is the pair of these componentwise sequences (relations are preserved under the morphisms by d-frame-morphism axiomatics). $\square$

**(5) Shadow comparison.** Direct from the [d-frame cohomology comparison theorem](d-frame-cohomology-comparison.md) at the section level, applied to each $\mathbb F_{V_G}(\sigma)$, and the limit-commutes-with-shadow property (limits in $\mathbf{dFrm}$ project to limits in $\mathbf{Ab}$ on each component, and the shadow drops the relations cleanly). $\square$

**(6) Per-observer-rule extension.** Apply [CRDT convergence with per-observer rules](crdt-convergence-with-per-observer-rules.md) componentwise: the proof of that theorem rests on bilattice $\vee_k$ being rule-independent + per-observer convergence + joint convergence at $\sup_o \kappa_o$. None of these depend on the value category being abelian; they go through for the d-frame value category by the same argument. The d-frame structure on the joint settling has its components determined by the per-observer settlings, and its relations inherited as in (1). $\square$

## Worked instance: 2-agent network at the d-frame level

The smallest non-trivial agent graph (two agents, one channel) with the d-frame-valued [multi-observer disagreement benchmark](../examples/benchmarks/benchmark-multi-observer-disagreement.md) lifted to the d-frame level.

**Setup.** $V_G = \{v_1, v_2\}$, $E_G = \{e\}$. Settlings:
- $V_G(v_1)$: cell $(a, a)$ has value $\mathbf t$.
- $V_G(v_2)$: cell $(a, a)$ has value $\mathbf f$.
- $V_G(e) := V_G(v_1) \wedge_k V_G(v_2)$: cell $(a, a)$ has value $\bot$ (consensus).

D-frame stalks $\mathbb F_{V_G}(\sigma)$:

| $\sigma$ | $L_+$ | $L_-$ | $\mathrm{con}$ | $\mathrm{tot}$ |
|---|---|---|---|---|
| $v_1$ | $\mathcal P(\{(a,a)\}) = \mathbf 2$ | $\{\emptyset\}$ | trivially all pairs | $\{(\{(a,a)\}, \emptyset)\}$ (settled cells covered) |
| $v_2$ | $\{\emptyset\}$ | $\mathcal P(\{(a,a)\})$ | trivially all pairs | $\{(\emptyset, \{(a,a)\})\}$ |
| $e$ | $\{\emptyset\}$ | $\{\emptyset\}$ | trivially | trivially (no settled cells in consensus) |

Restrictions: $\mathbb F_{V_G}(v_1) \to \mathbb F_{V_G}(e)$ is the d-frame morphism collapsing $L_+$ to $\{\emptyset\}$ and identity on $L_-$. Similarly for $v_2$.

**D-frame consensus (per claim 1).**

Take pairs $(c_{v_1}, c_{v_2})$ where $c_{v_i}$ is a d-frame-valued section at $v_i$, with the equalizer constraint at $e$ that both restrictions agree. For the $L_+$ side: $c_{v_1}^+ \in \mathbf 2$, $c_{v_2}^+ \in \{\emptyset\}$, both restrict to $\emptyset$ in $\mathbb F_{V_G}(e)$'s $L_+$ — constraint trivially satisfied. So $L_+$-equalizer = $\mathbf 2 \times \{\emptyset\} = \mathbf 2$.

Hmm — wait, but this 2-element $L_+$ in the consensus doesn't match the "consensus is trivial" expectation from the original multi-observer disagreement benchmark.

The resolution: this is the *cellular sheaf consensus* on the agent graph $\hat G$, distinct from the *cellwise meet over agents* in the [multi-observer disagreement benchmark](../examples/benchmarks/benchmark-multi-observer-disagreement.md). The two diverge because the cellular sheaf $H^0$ accounts for the channel's structure (in this case, the channel's trivial d-frame imposing only a vacuous constraint), while the cellwise meet computes a different quantity (pointwise bilattice meet over agent valuations). For agent graphs where channels carry non-trivial consensus information, the two converge.

Concretely: the cellular sheaf $H^0$'s $L_+$ has 2 elements because $V_G(v_1)$'s $L_+$ is unconstrained by the channel (which collapses it). The cellwise meet over agents, by contrast, gives $L_+ = \{\emptyset\}$ (since one agent has trivial $L_+$). The cellular sheaf $H^0$ is the *largest compatible-with-channels* assignment; the cellwise meet is the *agent-pointwise minimum*. Different quantities.

Both are valid notions of "consensus"; the bilattice extension theorem (claim 1) captures the cellular version, while the multi-observer disagreement benchmark uses the cellwise version. The two coincide when the channel structure is informative; here the channel is trivial, so they diverge.

**D-frame disagreement-join (per claim 2).**

Cellwise bilattice $\vee_k$ over agents (ignoring the channel for the moment, since the join is computed agent-wise):

| | $L_+$ | $L_-$ |
|---|---|---|
| $V_G(v_1)$ | $\mathcal P(\{(a,a)\})$ | $\{\emptyset\}$ |
| $V_G(v_2)$ | $\{\emptyset\}$ | $\mathcal P(\{(a,a)\})$ |
| Cellwise $\vee_k$ | $\mathcal P(\{(a,a)\})$ | $\mathcal P(\{(a,a)\})$ |

The joint d-frame:
- $L_+ = \mathcal P(\{(a,a)\})$ — 2 elements.
- $L_- = \mathcal P(\{(a,a)\})$ — 2 elements.
- $\mathrm{con}$: a pair $(A, B)$ has $\mathrm{con}$ iff $A \cap B = \emptyset$. Pairs: $(\emptyset, \emptyset), (\emptyset, \{(a,a)\}), (\{(a,a)\}, \emptyset)$ are consistent; $(\{(a,a)\}, \{(a,a)\})$ is **not**. The pair where both $L_+$ and $L_-$ select the cell is the **con-failure pair** = the $\top$-witness for the cell.
- $\mathrm{tot}$: settled cells = $\{(a,a)\}$. $\mathrm{tot}$ holds when $A \cup B \supseteq \{(a,a)\}$. Three pairs satisfy: $(\{(a,a)\}, \emptyset), (\emptyset, \{(a,a)\}), (\{(a,a)\}, \{(a,a)\})$.

So the joint d-frame has 4 elements ($L_+ \times L_-$ is $2 \times 2$), with one con-failure pair (the disagreement) and three tot-satisfying pairs.

This is the d-frame-level paraconsistency-from-disagreement structure: the disagreement is a single con-failure cell, recorded as a $\top$-witness, in a d-frame whose other content is the agents' independent assertions.

**Comparison.** The shadow at the join level:
- $L_+$ shadow = $\mathcal P(\{(a,a)\}) \cong \mathbf 2$ — the $\mathbf t$-content from agent 1.
- $L_-$ shadow = $\mathcal P(\{(a,a)\}) \cong \mathbf 2$ — the $\mathbf f$-content from agent 2.

These match what Task 1's theorem gives on each shadow side. The d-frame extension adds the $\mathrm{con}$-failure information (the explicit $\top$-witness at the disagreement cell), which the shadow drops.

## What this theorem does not establish

- **Hansen–Ghrist spectral consensus at the d-frame level.** Same caveat as Task 1, but now sharpened: the [Hansen–Ghrist spectral engagement question](questions/hansen-ghrist-spectral-engagement.md) (task 2 of the study plan) establishes in Pass 2 that Hansen–Ghrist's spectral apparatus *structurally cannot extend to bilattice / d-frame values* — the bilattice carries no canonical inner product, the d-frame's $\mathrm{con}, \mathrm{tot}$ relations are not bilinear forms, and there is no $\Delta_F$-style self-adjoint operator combining the heterogeneous d-frame components. The corpus's bilattice extension here proceeds via componentwise reduction to $\mathbf{Ab}$-shadows plus relational inheritance — not via spectrum, by genuine structural obstruction rather than methodological choice. Pass 3 (Lopez 2024 fuzzy-adjoint as quantale-graded analog) and Pass 4 (Lawvere Laplacian fixed-point as the corpus-side substitute) are the open continuations.

- **Generalization beyond finite agent graphs.** Same scope as Task 1.

- **Non-trivial channel d-frame structure.** The worked instance uses a trivial channel d-frame. For richer channel structures (where channels carry non-trivial $L_+$ or $L_-$ content), the cellular sheaf $H^0$ acquires more refined structure; specific instances can be computed but the general structure is not characterized here.

- **Comparison to per-fiber d-frame Curry on the bitopological-site fiber.** The [per-fiber d-frame Curry on the Belnap fiber example](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md) established d-frame Curry equivalence on the *bitopological-site fiber* (the clopen lattice of paired-Priestley space) — a different cell complex from the agent graph $\hat G$. This theorem doesn't claim to subsume that result; both live within the corpus's Q-enriched cellular sheaf framework but on different cell complexes.
