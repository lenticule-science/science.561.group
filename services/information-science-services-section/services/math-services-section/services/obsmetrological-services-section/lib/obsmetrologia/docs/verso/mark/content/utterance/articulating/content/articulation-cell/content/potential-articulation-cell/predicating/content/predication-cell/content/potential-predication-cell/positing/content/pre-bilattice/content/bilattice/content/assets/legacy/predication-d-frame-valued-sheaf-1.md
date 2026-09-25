---
kind: definition
realizes: [cohomological-equivalence, kz-coherent-sheaf]
type: sheaf
symbol: "\\mathbb{F}_U"
depends-on: [bitopological-settling-site, d-frame, settling-associated-sheaf, paraconsistent-settling-associated-sheaf, increment-sequence, spatiotemporal-knowledge-presheaf, paired-priestley-space]
---

# d-frame-valued sheaf (settling-side)

The bilattice-native counterpart of the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md). A sheaf on the [bitopological settling site](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md) whose values are [d-frames](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/d-frame.md), encoding *both* the truth-side cells and the inconsistency-side cells at each stage with their consistency/totality structure intrinsically — rather than recovering this content from a separate [paraconsistent variant](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/paraconsistent-settling-associated-sheaf/paraconsistent-settling-associated-sheaf.md) plus comparison.

## Construction

Fix a [knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) $(\mathcal{E}, c)$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with [increment sequence](increment-sequence.md) $U = (u_\tau)_{\tau < \lambda}$. For each $(q, \tau)$, define two sets of cells:

$$\Delta^+_\tau(q) \;:=\; \{(s, o) : v_\tau(q)(s, o) \in \{\mathbf{t}, \top\} \text{ and the } \mathbf{t}\text{-component first appears at } \tau\},$$
$$\Delta^-_\tau(q) \;:=\; \{(s, o) : v_\tau(q)(s, o) \in \{\mathbf{f}, \top\} \text{ and the } \mathbf{f}\text{-component first appears at } \tau\}.$$

Via [Jung–Rivieccio duality](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md), images $\Delta^{\pm, *}_\tau(q)$ live in the [paired Priestley dual](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md) $X_q^\tau$ as the $+$-points and $-$-points respectively.

The **d-frame-valued settling sheaf** $\mathbb{F}_U$ assigns to each pairwise-Stone clopen $U \subseteq X_q^\tau$ the d-frame

$$\mathbb{F}_U(q, \tau, U) \;:=\; \bigl(L_+, L_-, \mathrm{con}, \mathrm{tot}\bigr)$$

where:

- $L_+ \,:=\, \mathcal{P}(\Delta^{+, *}_\tau(q) \cap U)$ — the powerset frame of newly-truth-positive points in $U$.
- $L_- \,:=\, \mathcal{P}(\Delta^{-, *}_\tau(q) \cap U)$ — the powerset frame of newly-falsehood-positive points in $U$.
- $\mathrm{con}$ holds of $(A, B) \in L_+ \times L_-$ iff $A$ and $B$ are disjoint as subsets of cells *modulo the $\top$-witness set* — pairs are consistent precisely when their cells don't co-witness a $\top$-state at $\tau$.
- $\mathrm{tot}$ holds of $(A, B)$ iff $A \cup B$ covers the *settled* cells of $U$ at stage $\tau$ (cells in $\{\mathbf{t}, \mathbf{f}, \top\}$, i.e., not still $\bot$).

The functoriality on site morphisms uses the [d-frame morphism](../morphisms/d-frame-morphism.md) class: a site morphism $(f, h, j) : (q', \tau', U') \to (q, \tau, U)$ induces a d-frame morphism $\mathbb{F}_U(f, h, j)$ component-wise on $L_\pm$ via the dualized reindexing $(f \times h)^*$, with consistency and totality preserved by the duality.

## Reading

$\mathbb{F}_U$ packages the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) ($L_+$ part) and the [inconsistency sheaf](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) ($L_-$ part) as a single d-frame-valued object whose consistency and totality encode the bigraded structure intrinsically. Where the existing $\mathbf{Ab}$-valued setup factors the bilattice content through abelianization (and the [bigraded refinement](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) recovers it via a separate construction), $\mathbb{F}_U$ keeps it native to the value category.

This is one of three coordinate charts on the bigraded value-type axis ([bilattice-valued sheaves question](../questions/bilattice-valued-sheaves.md)); the other charts are [paired-Priestley-space-valued sheaves](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md) (spatial) and distributive-bilattice-valued sheaves (algebraic-fiber). The three are derived-equivalent under [Jung–Rivieccio duality](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) and the bilattice ↔ d-frame correspondence ([@jakl2025] §4.1); d-frames are the chart with the most off-the-shelf homological-algebra infrastructure (Jung–Moshier 2006, Jakl 2018).

## What this construction does *not* yet establish

The definition above specifies the data and functoriality. The substantive theorems on top of it — that $\mathbb{F}_U$ satisfies the d-frame sheaf condition, that there is a "shadow functor" comparison with the $\mathbf{Ab}$-valued [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md), and that $H^{\geq 2}$ vanishes (or doesn't) for $\mathbb{F}_U$ — are stated separately and remain to be proved. See [d-frame cohomology comparison](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) for the comparison; the vanishing question is the chapter's first substantive open theorem.
