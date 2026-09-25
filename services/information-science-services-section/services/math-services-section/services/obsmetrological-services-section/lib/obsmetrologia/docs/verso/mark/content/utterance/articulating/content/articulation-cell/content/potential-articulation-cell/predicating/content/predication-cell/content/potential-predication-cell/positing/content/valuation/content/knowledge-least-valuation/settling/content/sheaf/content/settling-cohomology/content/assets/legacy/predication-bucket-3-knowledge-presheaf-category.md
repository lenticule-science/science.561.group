---
kind: definition
type: category
symbol: "\\mathbf{KP}"
depends-on: [spatiotemporal-knowledge-presheaf, knowledge-presheaf-preorder-morphism, knowledge-order]
---

# Spatiotemporal knowledge presheaf category

The category $\mathbf{KP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are [spatiotemporal knowledge presheaves](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) over fixed parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are [knowledge-presheaf preorder morphisms](../morphisms/knowledge-presheaf-preorder-morphism.md). Hom-sets are singletons or empty, determined by the pointwise [knowledge order](../concepts/knowledge-order.md): a morphism $v \to v'$ exists iff $v \leq_k v'$ pointwise and stepwise.

## Caveat: not the moduli-level morphism

$\mathbf{KP}$'s preorder morphisms are strictly weaker than [settling-morphisms](../morphisms/settling-morphism.md), which carry an ordinal shift, demand state equality, and require [settling endofunctor](../morphisms/settling-endofunctor.md) commutation. The settling-morphisms are the 1-cells of the 2-category whose biequivalences are [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence — the moduli-quotient relation. $\mathbf{KP}$ is the right setting for stating $\leq_k$-completeness ([knowledge-presheaf-category completeness](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/knowledge-presheaf-category-completeness.md), [initial and terminal objects](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/knowledge-presheaf-category-initial-terminal.md)) and the closure-as-monad presentation, *not* the moduli classification, which lives in the 2-category. See [equivalence hierarchy](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/equivalence-hierarchy.md).
