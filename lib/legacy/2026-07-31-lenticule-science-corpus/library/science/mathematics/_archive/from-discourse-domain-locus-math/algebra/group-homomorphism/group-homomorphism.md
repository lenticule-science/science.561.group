---

title: "Group Homomorphism"
description: "A group homomorphism is a [function](../../teaching/explanations/function/index.md) $phi : G \to H$ between [groups](../objects/group.md) that preserves the group operation: $phi(a cdot b) = phi(a) cdot phi(b)$ for all $a, b in G$. This extends the notion of [homomorphism](./homomorphism.md) from [monoids](../objects/monoid.md) to groups."
aliases:
  - "group homomorphism"
  - "group homomorphisms"
date-created: 2026-03-05
tags: []
---

A group homomorphism is a [function](../../teaching/explanations/function/index.md) $\phi : G \to H$ between [groups](../objects/group.md) that preserves the group operation: $\phi(a \cdot b) = \phi(a) \cdot \phi(b)$ for all $a, b \in G$. This extends the notion of [homomorphism](./homomorphism.md) from [monoids](../objects/monoid.md) to groups.

A group homomorphism automatically preserves the identity ($\phi(e_G) = e_H$) and inverses ($\phi(g^{-1}) = \phi(g)^{-1}$). These facts follow from the group axioms and do not need to be checked separately.

The **kernel** of $\phi$ is $\ker(\phi) = \{g \in G \mid \phi(g) = e_H\}$, which is always a [normal subgroup](../objects/normal-subgroup.md) of $G$. The **image** of $\phi$ is $\operatorname{im}(\phi) = \{\phi(g) \mid g \in G\}$, which is always a [subgroup](../objects/subgroup.md) of $H$. A homomorphism is injective if and only if its kernel is trivial.

In [category theory](../../categories/_index.md), group homomorphisms are the [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md) in the category of groups.
