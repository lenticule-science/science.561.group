---
type: theorem
status: proved
depends-on: [predication-settling, predication-settling-category, predication-settling-preorder-morphism, knowledge-order]
---

# Initial and terminal objects in the predication settling category

The [predication settling category](../objects/predication-settling-category.md) $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has both a **terminal object** $\mathbf{1}$ — the constant-$\top$ [predication settling](../objects/predication-settling.md), defined by $v_\tau^{\mathbf{1}}(p)(s, o) = \top$ for all $p, \tau, s, o$ — and an **initial object** $\mathbf{0}$ — the constant-$\bot$ predication settling, defined by $v_\tau^{\mathbf{0}}(p)(s, o) = \bot$ for all $p, \tau, s, o$.

## Proof

Under the preorder-enriched morphism structure given by [predication-settling preorder morphisms](../morphisms/predication-settling-preorder-morphism.md), a morphism $v \to v'$ exists iff $v \leq_k v'$ pointwise in the [knowledge order](../concepts/knowledge-order.md). Every predication settling $v$ satisfies $v \leq_k \mathbf{1}$ (since $\top$ is the $\leq_k$-top), so $\mathbf{1}$ is terminal. Every predication settling $v$ satisfies $\mathbf{0} \leq_k v$ (since $\bot$ is the $\leq_k$-bottom), so $\mathbf{0}$ is initial. In both cases the morphism is unique because all morphisms between a given pair are identified in the preorder-enriched category. $\square$
