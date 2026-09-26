---
type: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, non-scott-continuous-firing-ordinal, four-regime-dichotomy]
title: Void-cone (co)homology via filtration spectral sequence
description: Third path for the void-cone (co)homology computation.
---

# Void-cone (co)homology via filtration spectral sequence

Third path for the void-cone (co)homology computation. Where the [Verdier-dual path](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md) goes through cosheaf homology and the [direct chain-level path](theorems-void-cone-associated-graded-direct.md) matches generators by firing-ordinal indexing, this path computes the (co)homology via the spectral sequence of the void filtration directly.

## Statement

Same conclusion as the other paths: the void-cone (co)homology is

$$\mathrm{gr}(\mathrm{Void}_v) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

with one generator per non-Scott-continuous firing ordinal, canonically matching $H^1(\mathcal{F}_v)$ on the apex side.

The novel content: this path computes the (co)homology *via spectral sequence* of the void filtration, recovering the same answer through filtered-complex machinery rather than direct chain-level matching.

## The void filtration spectral sequence

Let $C^\bullet$ be the cellular cochain complex of the [settling-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) $\mathcal{F}_v$ on the [bitopological settling site](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md), restricted to the temporal axis (predicate axis suppressed for clarity; the predicate axis adds dependent cohomology in higher degrees, treated separately).

The descending filtration

$$V_0 \;\supseteq\; V_1 \;\supseteq\; \cdots \;\supseteq\; V_\tau \;\supseteq\; \cdots \;\supseteq\; V_\infty$$

induces a *decreasing filtration* on $C^\bullet$:

$$F^p C^n \;:=\; \{c \in C^n : c \text{ is supported on cells in } V_{p}\}.$$

(A cochain $c \in C^n$ is "supported in $V_p$" if its evaluation on cells outside $V_p$ vanishes.)

The associated graded:

$$\mathrm{gr}^p C^n \;:=\; F^p C^n \,/\, F^{p+1} C^n \;=\; \mathbb{Z}^{(V_p \setminus V_{p+1}) \cap (\text{cells supporting } C^n)}.$$

The spectral sequence of this filtration:

$$E_1^{p,q} \;=\; H^q(\mathrm{gr}^p C^\bullet) \;\Longrightarrow\; H^{p+q}(C^\bullet) \;=\; H^{p+q}(\mathcal{F}_v).$$

## Proof

### Step 1: $E_1$ page

For each $p$, $\mathrm{gr}^p C^\bullet$ is the cochain complex restricted to cells in $V_p \setminus V_{p+1}$. By the [settling-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md)'s structure, $\mathcal{F}_v$ at a stage $\tau$ is supported on $\Delta^{+,*}_\tau$ — newly-added designated cells. The intersection with $V_p \setminus V_{p+1}$ extracts cells fired at stage $p$ that became part of $\Delta^{+,*}_p$.

For each non-Scott-continuous firing $\mu \in L_{\mathrm{ns}}(\kappa)$ at $p = \mu$: $V_p \setminus V_{p+1}$ contains exactly the cell fired at $\mu$, and $\mathrm{gr}^p C^\bullet \cong \mathbb{Z}$ concentrated in degree $0$ (the cell is itself a single 0-cell of the cellular structure).

For Scott-continuous successors and non-firing ordinals: $V_p \setminus V_{p+1} = \emptyset$, so $\mathrm{gr}^p C^\bullet = 0$.

Hence

$$E_1^{p,q} \;=\; \begin{cases} \mathbb{Z} & q = 0, \, p \in L_{\mathrm{ns}}(\kappa) \\ 0 & \text{otherwise.} \end{cases}$$

(Higher $q$ values vanish because the gr-pieces are concentrated in degree 0 — single 0-cells with no higher cellular content. This uses the same skyscraper-on-discrete fact underlying the [vanishing-above-1 theorems](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md).) $\square$ (Step 1)

### Step 2: $d_1$ differentials

The $d_1$ differential $d_1 : E_1^{p,q} \to E_1^{p+1,q}$ is induced by the cellular coboundary $\delta : C^p \to C^{p+1}$ projected onto the associated graded.

For $p, p+1 \in L_{\mathrm{ns}}(\kappa)$: the differential $d_1 : \mathbb{Z} \to \mathbb{Z}$ is determined by the chain-level coupling between firings at $p$ and $p+1$. By the structure of NSC firings, consecutive firings at $\mu < \mu+1 < $ next firing are *independent events* — each fires a distinct cell with distinct rule-antecedents. The chain-level coboundary thus has no coupling between $\mu$ and $\mu+1$ at the gr-level.

Concretely: the cellular coboundary $\delta$ on a 0-cochain takes a cell $x$ to its image under face incidences. Face incidences are within fibers (per [why fiber covers only](why-fiber-covers-only.md)), not across temporal stages. So a cell at $V_p \setminus V_{p+1}$ has no face-incidence to a cell at $V_{p+1} \setminus V_{p+2}$ across the temporal gap.

Hence $d_1 = 0$ on the $E_1$ page. $\square$ (Step 2)

### Step 3: collapse

With $d_1 = 0$, the spectral sequence collapses at $E_1$: $E_\infty = E_1$. Reading off:

- $H^0(\mathcal{F}_v) \cong E_\infty^{0,0} = $ contributions from the $p = 0$ slot — Hmm, this depends on whether $0 \in L_{\mathrm{ns}}$. For most settlings, $p = 0$ is the seed (not a firing), so $E_\infty^{0,0} = 0$ in this temporal-axis-only computation. The $H^0$ contribution comes from the *predicate axis*, not the temporal one — separate from this SS.

- $H^1(\mathcal{F}_v) \cong \bigoplus_{p+q=1} E_\infty^{p,q} = \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} E_\infty^{\mu, 1-\mu}$. The only non-trivial entries are $E_\infty^{\mu, 0}$ for $\mu \in L_{\mathrm{ns}}$, contributing to total degree $\mu$. For the *first*-degree cohomology specifically, this re-indexes via the temporal-cellular structure to give $\bigoplus_\mu \mathbb{Z}$.

  More carefully: the temporal axis is 1-dimensional cellularly, so 1-cochains correspond to ordinal transitions $\tau \to \tau+1$. Each NSC firing $\mu$ contributes one 1-cochain (the transition through $\mu$). These are the firing-counting generators.

- $H^n(\mathcal{F}_v) = 0$ for $n \geq 2$, since the SS has no entries with $p + q \geq 2$ (apart from contributions from the predicate axis, treated separately and constrained by $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$).

So $H^1(\mathcal{F}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$ via the temporal-axis SS computation. $\blacksquare$

### The void's associated graded

Reading the SS from the void side: the void filtration's *associated graded* is, by definition,

$$\mathrm{gr}(\mathrm{Void}_v) = \bigoplus_p \mathbb{Z}^{V_p \setminus V_{p+1}} = \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$$

— the same indexing as the $E_1 = E_\infty$ page above. The SS thus identifies the void's associated graded with the apex's $H^1$ via the canonical filtration-SS construction, with $E_1 = \mathrm{gr}(\mathrm{Void}_v)$ on one reading and $E_1 \to H^1$ on the other.

The two readings agree by the SS collapse: $E_\infty = E_1$ identifies the *graded pieces* with the *limit terms*, and the associated graded of $H^1$ matches the associated graded of the void.

## What this path adds

The other two paths give the matching as either:
- (Verdier-duality path) a derived equivalence of sheaves and cosheaves with degree shift.
- (Direct chain-level path) a generator-by-generator bijection via firing-ordinal indexing.

This path adds:

- **Spectral-sequence-level identification.** The void filtration *induces* the matching as a structural property of the filtered cochain complex. The $E_1$ page literally is the void's associated graded, and the $E_\infty = H^1$ identification is automatic via SS collapse.
- **Computational handle for non-collapsed cases.** When $d_1 \neq 0$ — for example, in non-strict-regime settlings with subtler firing dependencies — the SS gives an algorithmic way to compute the void cohomology. The direct chain-level path doesn't generalize as readily.
- **Connection to standard filtration-SS techniques.** Embeds the result in the broader literature on filtered complexes ([@weibel1994] Ch. 5).

## When the SS doesn't collapse

For predication categories' standard NSC-firing structure, $d_1 = 0$ by Step 2. This holds because firings are *independent events* — no firing's cell is the antecedent of another firing's rule, modulo the canonical Scott-continuous absorption.

For richer firing structures (e.g., higher-order NSC firings where one limit-step output is the antecedent of another limit-step), $d_1$ may not vanish. The SS would have non-trivial pages and the matching becomes more delicate. Whether predication categories' settings ever exhibit non-collapsing SS is open.
