---
name: "Hom-Object"
aliases:
  - "hom-object"
  - "hom-objects"
date-created: 2025-12-31
tags: []
type: term
---

The hom-object Hom(A, B) in an [enriched category](./enriched-category.md) over V is the object in the [monoidal category](./monoidal-category.md) V that plays the role of "[morphisms](./morphism.md) from A to B." In an ordinary [category](./category.md), hom-objects are [sets](./set.md) (the hom-sets); in an enriched category, they can be topological spaces, chain complexes, [simplicial sets](./simplicial-set.md), or any other type of object in V.

Composition in an enriched category is a map Hom(B, C) ⊗ Hom(A, B) → Hom(A, C) using the [tensor product](./tensor-product.md) of V, and identity [morphisms](./morphism.md) are maps I → Hom(A, A) from the [unit object](./unit-object.md). The structure on hom-objects is what makes enrichment meaningful: in a topologically enriched category, composition is continuous; in a simplicially enriched category, [morphisms](./morphism.md) form a space whose points are [morphisms](./morphism.md) and whose higher simplices witness homotopies between them.

The internal hom (or exponential object) in a monoidal category is a hom-object that is right adjoint to the tensor product: [morphisms](./morphism.md) A ⊗ B → C correspond bijectively to [morphisms](./morphism.md) A → [B, C]. This [adjunction](./adjunction.md) — the closed structure — is the categorical version of the [residuation law](./heyting-implication.md) in a Heyting algebra: a ∧ b ≤ c if and only if a ≤ (b → c).

## Earlier material

The hom-object Hom(A, B) in an [enriched category](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/internalizing/content/hom-object/enriched-category.md) over V is the object in the [monoidal category](monoidal-category.md) V that plays the role of "[morphisms](morphism.md) from A to B." In an ordinary [category](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/internalizing/ordinary-categories/terms/category.md), hom-objects are [sets](set.md) (the hom-sets); in an enriched category, they can be topological spaces, chain complexes, [simplicial sets](simplicial-set.md), or any other type of object in V.

The internal hom (or exponential object) in a monoidal category is a hom-object that is right adjoint to the tensor product: [morphisms](morphism.md) A ⊗ B → C correspond bijectively to [morphisms](morphism.md) A → [B, C]. This [adjunction](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/disciplines/higher-topos-theory/terms/adjunction.md) — the closed structure — is the categorical version of the [residuation law](heyting-implication.md) in a [Heyting algebra](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/universes/semiotic-universe/terms/complete-heyting-algebra.md): a ∧ b ≤ c if and only if a ≤ (b → c).
