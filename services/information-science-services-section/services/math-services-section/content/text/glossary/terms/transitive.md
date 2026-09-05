---
name: "Transitive"
description: "A relation R on a set S is transitive if it chains: whenever aRb and bRc, then aRc."
aliases:
  - "transitive"
  - "transitivity"
date-created: 2025-12-26
introduces: property
tags: []
---

A relation R on a set S is transitive if it chains: whenever aRb and bRc, then aRc.

Transitivity is one of the three defining properties of a [partial order](./partial-order.md) and one of the two defining properties of a [preorder](./preorder.md). It captures the idea that the relation is coherent across intermediate steps — if a ≤ b and b ≤ c, then a ≤ c directly, without needing b as a witness.

In a poset viewed as a [category](./category.md), transitivity is [composition](./composition.md): a [morphism](./morphism.md) a → b followed by b → c composes to a [morphism](./morphism.md) a → c.

In [modal logic](./modal-logic.md), transitivity of the [accessibility relation](./accessibility-relation.md) validates the 4 axiom: □φ → □□φ. If accessibility chains (w accesses v, v accesses u, therefore w accesses u), then what is necessary is necessarily necessary. The modality j in the semiotic universe is idempotent (j(j(a)) = j(a)), which is the order-theoretic expression of transitivity: closing and then closing again yields nothing new.
