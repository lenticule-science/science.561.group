---
type: definition
class: category
symbol: "\\mathbf{PS}"
depends-on: [predication-settling, predication-settling-preorder-morphism, knowledge-order]
---

# Predication settling category

The category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are [predication settlings](predication-settling.md) over fixed parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are [predication-settling preorder morphisms](../morphisms/predication-settling-preorder-morphism.md). Hom-sets are singletons or empty, determined by the pointwise [knowledge order](../concepts/knowledge-order.md): a morphism $v \to v'$ exists iff $v \leq_k v'$ pointwise and stepwise.

## Caveat: not the moduli-level morphism

$\mathbf{PS}$'s preorder morphisms are strictly weaker than [settling-morphisms](../morphisms/settling-morphism.md), which carry an ordinal shift, demand state equality, and require [settling endofunctor](../morphisms/settling-endofunctor.md) commutation. The settling-morphisms are the 1-cells of the 2-category whose biequivalences are [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence — the moduli-quotient relation. $\mathbf{PS}$ is the right setting for stating $\leq_k$-completeness ([predication-settling-category completeness](../theorems/predication-settling-category-completeness.md), [initial and terminal objects](../theorems/predication-settling-category-initial-terminal.md)) and the closure-as-monad presentation, *not* the moduli classification, which lives in the 2-category. See [equivalence hierarchy](../narratives/equivalence-hierarchy.md).
