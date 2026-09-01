---
name: hom-set
description: "The set of morphisms Hom_C(A, B) from object A to object B in category C. The basic collection that makes a category a category — every pair of objects has its hom-set."
specializing: object
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
---

The **hom-set** $\mathrm{Hom}_{\mathcal{C}}(A, B)$ is the set of all morphisms from object $A$ to object $B$ in a category $\mathcal{C}$ [@maclane1971, Ch. I §2; @awodey2010, §1.4]. Sometimes written $\mathcal{C}(A, B)$, $\mathrm{Mor}_{\mathcal{C}}(A, B)$, or simply $[A, B]$ when the category is clear.

In a **locally small** category, every hom-set is a set (rather than a proper class). Most categories of interest are locally small.

**Hom-sets as the underlying data of a category.** A category is determined by its object collection together with the hom-sets between every pair of objects, plus the composition operation and identity morphisms. Two categories with the same objects and the same hom-sets and the same composition are the same category.

**Hom-functors.** Fixing one of the two arguments of $\mathrm{Hom}_{\mathcal{C}}(-, -)$ gives a functor:

- $\mathrm{Hom}_{\mathcal{C}}(-, B) : \mathcal{C}^{\mathrm{op}} \to \mathrm{Set}$ — contravariant, sending $A \mapsto \mathrm{Hom}_{\mathcal{C}}(A, B)$.
- $\mathrm{Hom}_{\mathcal{C}}(A, -) : \mathcal{C} \to \mathrm{Set}$ — covariant, sending $B \mapsto \mathrm{Hom}_{\mathcal{C}}(A, B)$.

See [hom-functor](../hom-functor/hom-functor.md). Together they form the bifunctor $\mathrm{Hom}_{\mathcal{C}}(-, -) : \mathcal{C}^{\mathrm{op}} \times \mathcal{C} \to \mathrm{Set}$.

**Yoneda's lemma.** $\mathrm{Nat}(\mathrm{Hom}(A, -), F) \cong F(A)$ for any functor $F : \mathcal{C} \to \mathrm{Set}$ — natural transformations from the hom-functor at $A$ into $F$ are in bijection with elements of $F(A)$. The Yoneda lemma's deeper consequence: an object is determined up to isomorphism by its hom-functor. See [yoneda-embedding](../yoneda-embedding/yoneda-embedding.md).

**Enriched generalizations.** In *enriched* category theory, hom-sets are replaced by *hom-objects* in some monoidal category $\mathcal{V}$. The basic hom-set case corresponds to enrichment in $\mathrm{Set}$. Other enrichment choices give 2-categories (enriched in Cat), preorders (enriched in $\mathbf{2}$), metric spaces (enriched in $[0, \infty]$, Lawvere), and DG-categories (enriched in Ch).
