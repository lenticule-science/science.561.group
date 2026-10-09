---
kind: definition
type: category
symbol: "\\mathbf{KP}"
depends-on: [spatiotemporal-knowledge-presheaf, knowledge-presheaf-preorder-morphism, knowledge-order]
title: Spatiotemporal knowledge presheaf category
description: The category $\mathbf{KP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are spatiotemporal knowledge presheaves over fixed parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are knowledge-presheaf preorder…
---

# Spatiotemporal knowledge presheaf category

The category $\mathbf{KP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are [spatiotemporal knowledge presheaves](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) over fixed parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are [knowledge-presheaf preorder morphisms](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/morphisms/knowledge-presheaf-preorder-morphism.md).
Hom-sets are singletons or empty, determined by the pointwise [knowledge order](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/concepts/knowledge-order.md): a morphism $v \to v'$ exists iff $v \leq_k v'$ pointwise and stepwise.

## Caveat: not the moduli-level morphism

$\mathbf{KP}$'s preorder morphisms are strictly weaker than [settling-morphisms](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/morphisms/settling-morphism.md), which carry an ordinal shift, demand state equality, and require [settling endofunctor](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/morphisms/settling-endofunctor.md) commutation.
The settling-morphisms are the 1-cells of the 2-category whose biequivalences are [mutually-locally-derivable](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/concepts/mutually-locally-derivable.md) equivalence — the moduli-quotient relation. $\mathbf{KP}$ is the right setting for stating $\leq_k$-completeness ([knowledge-presheaf-category completeness](knowledge-presheaf-category-completeness.md), [initial and terminal objects](knowledge-presheaf-category-initial-terminal.md)) and the closure-as-monad presentation, *not* the moduli classification, which lives in the 2-category.
See [equivalence hierarchy](../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/equivalence-hierarchy.md).
