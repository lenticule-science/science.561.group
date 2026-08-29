---

title: "Transitive"
description: "A relation R on a set S is transitive if it chains: whenever aRb and bRc, then aRc."
aliases:
  - "transitive"
  - "transitivity"
date-created: 2025-12-26
introduces: property
tags: []
defines:
  - "Transitive"
  - "transitivity"
---

A relation R on a set S is transitive if it chains: whenever aRb and bRc, then aRc.

Transitivity is one of the three defining properties of a [partial order](../objects/partial-order.md) and one of the two defining properties of a [preorder](../objects/preorder.md). It captures the idea that the relation is coherent across intermediate steps — if a ≤ b and b ≤ c, then a ≤ c directly, without needing b as a witness.

In a poset viewed as a [category](../../categories/theories/ordinary-categories/objects/category.md), transitivity is [composition](../../categories/theories/ordinary-categories/morphisms/composition.md): a [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) a → b followed by b → c composes to a [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) a → c.

In [modal logic](../../../disciplines/modal-logic/index.md), transitivity of the [accessibility relation](../../logic/morphisms/accessibility-relation.md) validates the 4 axiom: □φ → □□φ. If accessibility chains (w accesses v, v accesses u, therefore w accesses u), then what is necessary is necessarily necessary. The [modality](../../universes/semiotic-universe/terms/modality.md) j in the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe is idempotent (j(j(a)) = j(a)), which is the order-theoretic expression of transitivity: closing and then closing again yields nothing new.
