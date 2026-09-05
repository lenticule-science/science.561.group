---
name: predication settling preorder morphism
description: A morphism v → v' between predication settlings over a common base, holding iff v_τ(p) ≤_k v'_τ(p) pointwise for every predicate and step. The knowledge-order analog of modeling-morphism. The morphism class of the predication-settling category.
---

The same-base preorder relation between [predication settlings](../structures/predication-settling.md). For $v, v'$ over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$, a **preorder morphism** $v \to v'$ exists iff

$$v_\tau(p) \leq_k v'_\tau(p) \qquad \text{for every } p \in \mathcal{C}, \, \tau < \lambda,$$

pointwise in the [predication fiber algebra](../structures/predication-fiber-algebra.md) $A_p$ at $p$. When such a relation holds, the morphism is unique. Hom-sets are singletons or empty, determined by the pointwise knowledge order.

Preorder morphisms are the morphism class of the predication-settling category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$. They differ from [modeling-morphism](modeling-morphism.md) (truth-order analog) and from same-base strict notions like settling-morphism (state equality with ordinal shift).
