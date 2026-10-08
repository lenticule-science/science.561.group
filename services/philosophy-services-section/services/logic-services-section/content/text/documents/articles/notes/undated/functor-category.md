---
name: functor-category
description: "The category [C, D] whose objects are functors C → D and whose morphisms are natural transformations between them. The home of natural-transformations as morphisms. Self-referential: functor categories are themselves categories, and the same construction applies recursively."
specializing: category
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: "2"
    series: Oxford Logic Guides
    volume: 52
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
title: functor-category
---

The **functor category** $[\mathcal{C}, \mathcal{D}]$ (also written $\mathcal{D}^{\mathcal{C}}$) has [@maclane1971, Ch. II §4; @awodey2010, §7.5]:

- **Objects:** functors $F : \mathcal{C} \to \mathcal{D}$.
- **Morphisms:** natural transformations $\alpha : F \Rightarrow G$ between functors $F, G : \mathcal{C} \to \mathcal{D}$.
- **Composition:** vertical composition of natural transformations — $(\beta \circ \alpha)_c = \beta_c \circ \alpha_c$ at each object $c$.
- **Identity:** the identity natural transformation $\mathrm{id}_F : F \Rightarrow F$ whose components are identity morphisms.

This is the categorical home of natural transformations as morphisms. Mac Lane's slogan ("I didn't invent categories to study functors; I invented them to study natural transformations") finds its formal expression in the existence of the functor category: natural transformations *are* the morphisms in $[\mathcal{C}, \mathcal{D}]$.

**Self-referential structure.** Functor categories are themselves categories — they have hom-sets, composition, identities. The construction iterates: $[[\mathcal{C}, \mathcal{D}], \mathcal{E}]$ is another category, and natural transformations between bifunctors live there. This is the sense in which category theory is self-referential — the same notions (object, morphism, composition) apply at every level.

**Presheaves.** A particularly important functor category is the presheaf category $\hat{\mathcal{C}} = [\mathcal{C}^{\mathrm{op}}, \mathrm{Set}]$ — the category of $\mathrm{Set}$-valued contravariant functors on $\mathcal{C}$. Presheaves are the building blocks of sheaf theory and topos theory; the Yoneda lemma identifies $\mathcal{C}$ with a full subcategory of $\hat{\mathcal{C}}$ via the Yoneda embedding.

**Universal property in Cat.** When $\mathcal{C}$ and $\mathcal{D}$ are small categories, $[\mathcal{C}, \mathcal{D}]$ is the exponential object in Cat — the functor category satisfies the adjunction $\mathrm{Hom}_{\mathrm{Cat}}(\mathcal{E} \times \mathcal{C}, \mathcal{D}) \cong \mathrm{Hom}_{\mathrm{Cat}}(\mathcal{E}, [\mathcal{C}, \mathcal{D}])$, which makes Cat a Cartesian-closed category for small categories.
