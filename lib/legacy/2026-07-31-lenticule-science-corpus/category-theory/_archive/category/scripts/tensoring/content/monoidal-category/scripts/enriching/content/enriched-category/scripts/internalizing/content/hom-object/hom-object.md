---
title: "Hom-Object"
aliases:
  - "hom-object"
  - "hom-objects"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "Hom-Object"
  - "hom-objects"
---

The hom-object Hom(A, B) in an [enriched category](./enriched-category.md) over V is the object in the [monoidal category](./monoidal-category.md) V that plays the role of "[morphisms](../../ordinary-categories/terms/morphism.md) from A to B." In an ordinary [category](../../ordinary-categories/terms/category.md), hom-objects are [sets](../../../sets/terms/set.md) (the hom-sets); in an enriched category, they can be topological spaces, chain complexes, [simplicial sets](../../infinity-categories/terms/simplicial-set.md), or any other type of object in V.

Composition in an enriched category is a map Hom(B, C) ⊗ Hom(A, B) → Hom(A, C) using the [tensor product](./tensor-product.md) of V, and identity [morphisms](../../ordinary-categories/terms/morphism.md) are maps I → Hom(A, A) from the [unit object](./unit-object.md). The structure on hom-objects is what makes enrichment meaningful: in a topologically enriched category, composition is continuous; in a simplicially enriched category, [morphisms](../../ordinary-categories/terms/morphism.md) form a space whose points are [morphisms](../../ordinary-categories/terms/morphism.md) and whose higher simplices witness homotopies between them.

The internal hom (or exponential object) in a monoidal category is a hom-object that is right adjoint to the tensor product: [morphisms](../../ordinary-categories/terms/morphism.md) A ⊗ B → C correspond bijectively to [morphisms](../../ordinary-categories/terms/morphism.md) A → [B, C]. This [adjunction](../../../../disciplines/higher-topos-theory/terms/adjunction.md) — the closed structure — is the categorical version of the [residuation law](../../../../disciplines/logic/terms/heyting-implication.md) in a [Heyting algebra](../../../universes/semiotic-universe/terms/complete-heyting-algebra.md): a ∧ b ≤ c if and only if a ≤ (b → c).
