---

title: "Equivalence"
aliases:
  - "equivalence"
  - "equivalences"
date-created: 2025-12-31
tags: []
defines:
  - "Equivalence"
  - "equivalences"
---

An equivalence in an [∞-category](../objects/infinity-category.md) is a [morphism](../../ordinary-categories/morphisms/morphism.md) f: A → B that has an inverse up to higher [homotopies](../../../../topology/morphisms/homotopy.md): there exists g: B → A with g ∘ f homotopic to id_A and f ∘ g homotopic to id_B, together with coherent higher homotopies witnessing these identifications. In an ordinary [category](../../ordinary-categories/objects/category.md), this reduces to [isomorphism](../../ordinary-categories/morphisms/isomorphism.md); in higher categories, the higher coherence data is essential.

An equivalence of categories (ordinary or ∞) is a [functor](../../ordinary-categories/morphisms/functor.md) F: C → D that is essentially surjective (every object of D is equivalent to some F(c)) and fully faithful (F induces equivalences on all hom-spaces). Equivalent categories have the same categorical structure — they may differ in the specific objects they contain, but not in the patterns of [morphisms](../../ordinary-categories/morphisms/morphism.md) between them.

Equivalence is the correct notion of "sameness" in higher [category theory](../../../_index.md). Demanding strict equality ([isomorphism](../../ordinary-categories/morphisms/isomorphism.md)) of ∞-categories is both too restrictive and poorly behaved; equivalence allows the flexibility that higher-dimensional structure requires. In [homotopy type theory](../objects/infinity-1-topos.md), the univalence axiom asserts that equivalent types are equal, making equivalence the foundational notion of identity.
