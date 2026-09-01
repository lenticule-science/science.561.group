---

title: "Ring Homomorphism"
description: "A ring homomorphism is a [function](../../teaching/explanations/function/index.md) $phi : R \to S$ between [rings](../objects/ring.md) that preserves both operations and the multiplicative identity: $phi(a + b) = phi(a) + phi(b)$, $phi(a cdot b) = phi(a) cdot phi(b)$, and $phi(1_R) = 1_S$."
aliases:
  - "ring homomorphism"
  - "ring homomorphisms"
date-created: 2026-03-05
tags: []
---

A ring homomorphism is a [function](../../teaching/explanations/function/index.md) $\phi : R \to S$ between [rings](../objects/ring.md) that preserves both operations and the multiplicative identity: $\phi(a + b) = \phi(a) + \phi(b)$, $\phi(a \cdot b) = \phi(a) \cdot \phi(b)$, and $\phi(1_R) = 1_S$.

The kernel $\ker(\phi) = \{r \in R \mid \phi(r) = 0\}$ is always an [ideal](../objects/ideal.md) of $R$. The first isomorphism theorem for rings states that $R/\ker(\phi)$ is isomorphic to the image of $\phi$, paralleling the corresponding theorem for [groups](./group-homomorphism.md).

In [category theory](../../../objects/categories/index.md), ring homomorphisms are the [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md) in the category of rings.
