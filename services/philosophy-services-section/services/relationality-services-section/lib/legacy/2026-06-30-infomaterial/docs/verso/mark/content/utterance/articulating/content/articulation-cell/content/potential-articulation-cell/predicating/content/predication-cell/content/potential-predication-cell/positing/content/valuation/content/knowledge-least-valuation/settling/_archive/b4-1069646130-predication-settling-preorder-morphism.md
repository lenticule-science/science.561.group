---
type: morphism
class: morphism
depends-on: [predication-settling, knowledge-order]
---

# Predication-settling preorder morphism

The same-base preorder relation between [predication settlings](../objects/predication-settling.md). For $v, v'$ over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$, a **preorder morphism** $v \to v'$ exists iff

$$v_\tau(p) \leq_k v'_\tau(p) \qquad \text{for every } p \in \mathcal{C}, \, \tau < \lambda,$$

pointwise in the [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p$ at $p$. When such a relation holds, the morphism is unique — all morphisms between any given pair are identified. Equivalently, hom-sets are singletons or empty, determined by the pointwise [knowledge order](../concepts/knowledge-order.md).

## Role

Preorder morphisms are the morphism class of the [predication-settling category](../objects/predication-settling-category.md) $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$. The category is preorder-enriched, and its $\leq_k$-completeness ([predication-settling-category completeness](../theorems/predication-settling-category-completeness.md)) and initial/terminal structure ([predication-settling-category initial-terminal](../theorems/predication-settling-category-initial-terminal.md)) are the structural results stated for these morphisms.

## Two other morphism notions

- The [predication-settling base-morphism](predication-settling-base-morphism.md) is the cross-base notion that varies the parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ themselves, with bilattice-hom family data and a $\leq_k$-inequality constraint along each base-change. The preorder morphism here is *not* the same-base specialization of the cross-base morphism — it is the *hom-set collapse* of that specialization, which forgets the bilattice-hom family data and keeps only the existence-of-inequality.
- The [settling-morphism](settling-morphism.md) is the same-base strict notion with state *equality*, ordinal shift, and [settling endofunctor](settling-endofunctor.md) commutation. It is strictly stronger than the preorder morphism — every settling-morphism implies $v \leq_k v'$ at the relevant ordinals, but the converse fails.

See [equivalence hierarchy](../narratives/equivalence-hierarchy.md) for how the three morphism classes interact at the moduli level.
