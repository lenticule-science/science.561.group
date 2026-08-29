---
name: predication settling category
description: The category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ whose objects are predication-settlings over the base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are predication-settling-preorder-morphisms — a thin poset-category indexed by the pointwise-and-stepwise knowledge-order relation on valuations.
---

Fix a residuated lattice $\mathbf{L}$, a [predicate category](predicate-category.md) $\mathcal{C}$, an [entity set](entity-set.md) $E$, and a settling bound $\lambda$. The **predication-settling category** $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has [predication-settlings](predication-settling.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ as objects and [predication-settling-preorder-morphisms](../transformers/predication-settling-preorder-morphism.md) as morphisms. For $v, v' \in \mathrm{Ob}(\mathbf{PS})$:

$$\mathbf{PS}(v, v') := \begin{cases} \{\mathrm{morph}_{v \to v'}\} & \text{if } v_\tau(p) \leq_k v'_\tau(p) \text{ in } A_p \text{ for every } p \in \mathcal{C} \text{ and } \tau < \lambda, \\ \emptyset & \text{otherwise.} \end{cases}$$

Hom-classes are sub-singletons; the underlying preorder on $\mathrm{Ob}(\mathbf{PS})$ is antisymmetric (lifting antisymmetry of $\leq_k$ on $\mathbf{L}^\bowtie$ pointwise), so $\mathbf{PS}$ is a poset-category.
