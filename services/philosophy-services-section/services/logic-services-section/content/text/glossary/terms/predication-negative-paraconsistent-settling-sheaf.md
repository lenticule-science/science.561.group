---
type: definition
realizes: [kz-coherent-sheaf, cohomological-equivalence]
class: sheaf
symbol: "\\mathcal{F}_U^{(k, -)}"
depends-on: [paraconsistent-settling-associated-sheaf, settling-associated-sheaf, knowledge-order, four-bilattice, negation]
title: Negative-paraconsistent settling-associated sheaf
description: The bilattice-negation mirror of the paraconsistent settling-associated sheaf $\mathcal{F}U^{(k)}$.
---

# Negative-paraconsistent settling-associated sheaf

The bilattice-[negation](../../documents/articles/research/2026/07/31/morphisms/negation.md) mirror of the [paraconsistent settling-associated sheaf](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/paraconsistent-settling-associated-sheaf/paraconsistent-settling-associated-sheaf.md) $\mathcal{F}_U^{(k)}$. Where $\mathcal{F}_U^{(k)}$ tracks the *Belnap-designated positive-evidence* increments (cells transitioning to $\mathbf{t}$ or $\top$ — gaining a truth-component), $\mathcal{F}_U^{(k, -)}$ tracks the symmetric *Belnap-designated negative-evidence* increments (cells transitioning to $\mathbf{f}$ or $\top$ — gaining a falsity-component).

For each $(q, \tau)$, define the **set of newly-added negative-Belnap-designated cells**:

$$\Delta^{-, \mathrm{Belnap}}_\tau(q) \;:=\; \{(s, o) \,:\, v_\tau(q)(s, o) \in \{\mathbf{f}, \top\} \text{ and } v_{\tau'}(q)(s, o) \notin \{\mathbf{f}, \top\} \text{ for all } \tau' < \tau\}.$$

Via duality each such cell corresponds to a Priestley point in $X_q^\tau$; write $\Delta^{-, *, \mathrm{Belnap}}_\tau(q) \subseteq X_q^\tau$ for the image. The **negative-paraconsistent settling-associated sheaf** is

$$\mathcal{F}_U^{(k, -)}(q, \tau, U) \;:=\; \mathbb{Z}^{\Delta^{-, *, \mathrm{Belnap}}_\tau(q) \,\cap\, U},$$

with restriction maps determined by the dualized reindexing on cells.

## Relation to the truth-side sheaves

The inclusion $\{\mathbf{f}\} \hookrightarrow \{\mathbf{f}, \top\}$ would induce, in parallel with $\iota : \mathcal{F}_U \to \mathcal{F}_U^{(k)}$, a sequence

$$0 \to \mathcal{F}_U^{(\mathbf{f})} \to \mathcal{F}_U^{(k, -)} \to \mathcal{F}_U^{(\top)} \to 0$$

if a falsehood-only sheaf $\mathcal{F}_U^{(\mathbf{f})}$ (the $\mathbf{f}$-cell-only mirror of $\mathcal{F}_U$) were defined, but in predication categories the cokernel — the $\top$-tracking [inconsistency sheaf](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) $\mathcal{F}_U^{(\top)}$ — is the same on both sides. So the negative-paraconsistent sheaf, the positive-paraconsistent sheaf, and the inconsistency sheaf together carry the full bilattice-side cohomological data:

$$\mathcal{F}_U^{(k)} \,\cap\, \mathcal{F}_U^{(k, -)} \;\cong\; \mathcal{F}_U^{(\top)},$$

where the intersection is taken on the cell-set level (cells that are both newly-truth-positive and newly-falsehood-positive at $\tau$ are exactly the cells transitioning to $\top$ at $\tau$).

## Bilattice-negation symmetry

Bilattice [negation](../../documents/articles/research/2026/07/31/morphisms/negation.md) $\neg : \mathbf{FOUR} \to \mathbf{FOUR}$ swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and fixes $\bot, \top$. It induces a natural isomorphism

$$\mathcal{F}_U^{(k)} \,\circ\, \neg \;\;\cong\;\; \mathcal{F}_U^{(k, -)},$$

i.e., applying negation cell-wise to the settling and then forming the positive-paraconsistent sheaf gives the negative-paraconsistent sheaf of the original. This symmetry is what licenses $\mathcal{F}_U^{(k, -)}$ as the natural mirror without separately re-deriving its functoriality and basic properties — they transfer through $\neg$.

## Reading

The corpus has, until now, been asymmetric in its cohomology-tracking: the [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) $\mathcal{F}_U$ and its paraconsistent variant $\mathcal{F}_U^{(k)}$ both track *positive* (truth-component) evidence, while *negative* (falsity-component) evidence content was implicit (recoverable from negation-applied data) but not separately surfaced as its own sheaf. The asymmetry was acceptable while $\mathcal{F}_U$ was the central cohomological object.

The [d-frame-valued settling sheaf](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) $\mathbb{F}_U$ restores the symmetry: its $L_+$ and $L_-$ frame components are positive-and-negative evidence on equal footing. The shadow functor $\mathbb{F}_U \mapsto (\mathbb{S}_+ \mathbb{F}_U, \mathbb{S}_- \mathbb{F}_U)$ delivers $(\mathcal{F}_U^{(k)}, \mathcal{F}_U^{(k, -)})$ directly. Defining $\mathcal{F}_U^{(k, -)}$ as a corpus object makes the d-frame ↔ $\mathbf{Ab}$ comparison statable precisely.
