---
type: theorem
status: proved
depends-on: [predication-settling-category, predication-settling-preorder-morphism, predicatory-equalization]
see-also: [equalization-locus]
---

# Equalizers in the predication settling preorder collapse to identities

In the [predication settling category](../objects/predication-settling-category.md) $\mathbf{PS}$, every parallel pair of morphisms is already equal, and its equalizer is the identity on its domain.

## Proof

By definition, $\mathbf{PS}$ has hom-sets that are either empty or singleton, determined by the pointwise [knowledge order](teaching/explanations/knowledge-order.md). Therefore if $f,g : v \to w$ are parallel morphisms in $\mathbf{PS}$, then $f=g$.

The identity $\mathrm{id}_v : v \to v$ equalizes them, since

$$f \circ \mathrm{id}_v = f = g = g \circ \mathrm{id}_v.$$

For any $h : x \to v$ with $f h = g h$, the unique mediating arrow $u : x \to v$ satisfying $\mathrm{id}_v \circ u = h$ is $u=h$. Existence and uniqueness are immediate. Hence $\mathrm{id}_v$ is the equalizer. $\square$

## Consequence

Nontrivial equalization in predication category theory must be stated outside the bare preorder hom-sets: as an [equalization locus](../objects/equalization-locus.md), as an equalizer in an ambient category of operational maps, or as a sheaf/equalizer condition in a richer value category.

