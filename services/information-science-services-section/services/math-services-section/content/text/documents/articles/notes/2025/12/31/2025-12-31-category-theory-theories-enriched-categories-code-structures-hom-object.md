---

title: "Hom-Object"
aliases:
  - "hom-object"
  - "hom-objects"
date-created: 2025-12-31
tags: []
description: The hom-object Hom(A, B) in an enriched category over V is the object in the monoidal category V that plays the role of "morphisms from A to B." In an ordinary category, hom-objects are sets (the hom-sets); in an enriched category, they…
---

The hom-object Hom(A, B) in an [enriched category](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/internalizing/content/hom-object/_archive/enriched-category.md) over V is the object in the [monoidal category](../../../../../../glossary/terms/monoidal-category.md) V that plays the role of "[morphisms](../../../../../../glossary/terms/morphism.md) from A to B." In an ordinary [category](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/internalizing/content/ordinary-categories/objects/category.md), hom-objects are [sets](../../../../../../glossary/terms/set.md) (the hom-sets); in an enriched category, they can be topological spaces, chain complexes, [simplicial sets](../../../../../../glossary/terms/simplicial-set.md), or any other type of object in V.

Composition in an enriched category is a map Hom(B, C) ⊗ Hom(A, B) → Hom(A, C) using the [tensor product](../../../../../../glossary/terms/tensor-product.md) of V, and identity [morphisms](../../../../../../glossary/terms/morphism.md) are maps I → Hom(A, A) from the [unit object](../../../../../../glossary/terms/unit-object.md). The structure on hom-objects is what makes enrichment meaningful: in a topologically enriched category, composition is continuous; in a simplicially enriched category, [morphisms](../../../../../../glossary/terms/morphism.md) form a space whose points are [morphisms](../../../../../../glossary/terms/morphism.md) and whose higher simplices witness homotopies between them.

The internal hom (or exponential object) in a monoidal category is a hom-object that is right adjoint to the tensor product: [morphisms](../../../../../../glossary/terms/morphism.md) A ⊗ B → C correspond bijectively to [morphisms](../../../../../../glossary/terms/morphism.md) A → [B, C]. This [adjunction](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/topology/morphisms/adjunction.md) — the closed structure — is the categorical version of the [residuation law](../../../../../../glossary/terms/heyting-implication.md) in a [Heyting algebra](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/enriched-category/scripts/internalizing/universes/semiotic-universe/terms/complete-heyting-algebra.md): a ∧ b ≤ c if and only if a ≤ (b → c).
