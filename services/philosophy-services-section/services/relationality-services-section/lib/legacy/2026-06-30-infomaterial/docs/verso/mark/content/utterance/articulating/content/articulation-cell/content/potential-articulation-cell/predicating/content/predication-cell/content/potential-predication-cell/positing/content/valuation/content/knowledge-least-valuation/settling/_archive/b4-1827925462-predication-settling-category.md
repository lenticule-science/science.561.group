---
name: predication-settling-category
description: The category PS(L, C, E, λ) whose objects are predication-settlings over the base (L, C, E, λ) and whose morphisms are predication-settling-preorder-morphisms — a thin poset-category indexed by the pointwise-and-stepwise knowledge-order relation on valuations.
collecting: predication-settling
having-thin-homs: predication-settling-category
having-antisymmetric-preorder: predication-settling-category
---

Fix a residuated lattice $\mathbf{L}$, a [predicate category](../predicate-category/predicate-category.md) $\mathcal{C}$, an [entity set](../entity-set/entity-set.md) $E$, and a settling bound $\lambda$. The **predication-settling category** $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has [predication-settlings](../predication-settling/predication-settling.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ as objects and predication-settling-preorder-morphisms as morphisms. For $v, v' \in \mathrm{Ob}(\mathbf{PS})$:

$$\mathbf{PS}(v, v') := \begin{cases} \{\mathrm{morph}_{v \to v'}\} & \text{if } v_\tau(p) \leq_k v'_\tau(p) \text{ in } A_p \text{ for every } p \in \mathcal{C} \text{ and } \tau < \lambda, \\ \emptyset & \text{otherwise.} \end{cases}$$

Hom-classes are sub-singletons; the underlying preorder on $\mathrm{Ob}(\mathbf{PS})$ is antisymmetric (lifting antisymmetry of $\leq_k$ on $\mathbf{L}^\bowtie$ pointwise), so $\mathbf{PS}$ is a poset-category.

## Why thin

The thin (sub-singleton hom) structure follows from the fact that the knowledge order $\leq_k$ on $\mathbf{L}^\bowtie$ is itself a partial order. Lifting pointwise to $A_p$ and stepwise to $(v_\tau)_{\tau < \lambda}$ preserves the partial-order structure. A morphism in $\mathbf{PS}(v, v')$ exists exactly when every coordinate of $v$ is below the corresponding coordinate of $v'$; when it exists, it is unique.

## Generators and derivation

The category is determined by the base parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and the collection of settling-objects over that base. The hom-classes are derivable from the objects: $\mathbf{PS}(v, v')$ is non-empty exactly when the pointwise-and-stepwise $\leq_k$-comparison holds, and the comparison is decidable when $\mathbf{L}, \mathcal{C}, E, \lambda$ are finite. Storing the morphisms alongside the objects is therefore redundant — the morphism structure is a function of the object data.
