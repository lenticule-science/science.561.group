---
name: representable-functor
description: "A functor F : C^op → Set that is naturally isomorphic to a hom-functor Hom_C(-, A) for some object A. The representing object A determines F up to natural isomorphism. The Yoneda embedding's image — every representable presheaf is the contravariant hom-functor of some object."
specializing: functor
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
title: representable-functor
---

A **representable functor** on a category $\mathcal{C}$ is a functor $F : \mathcal{C}^{\mathrm{op}} \to \mathrm{Set}$ that is naturally isomorphic to a [hom-functor](hom-functor.md) $\mathrm{Hom}_{\mathcal{C}}(-, A)$ for some object $A$ [@maclane1971, Ch. III §2; @awodey2010, §8.4]:

$$F \cong \mathrm{Hom}_{\mathcal{C}}(-, A)$$

The object $A$ is called the **representing object** of $F$. The same definition makes sense for covariant functors $F : \mathcal{C} \to \mathrm{Set}$ being represented by $\mathrm{Hom}_{\mathcal{C}}(A, -)$.

**Uniqueness of the representing object.** By the Yoneda lemma, the representing object is unique up to canonical isomorphism. Two objects $A, A'$ with $\mathrm{Hom}_{\mathcal{C}}(-, A) \cong \mathrm{Hom}_{\mathcal{C}}(-, A')$ are canonically isomorphic. This is what makes "the representing object" a well-defined construction.

**Universal elements.** A functor $F$ is representable iff there is a *universal element* — an element $u \in F(A)$ for some $A$ such that every other $x \in F(X)$ arises uniquely from $u$ via the functoriality of $F$. Formally, the universal element $u$ corresponds to the identity $\mathrm{id}_A$ under the Yoneda isomorphism $F(A) \cong \mathrm{Nat}(\mathrm{Hom}_{\mathcal{C}}(-, A), F)$.

**Why representability matters.** Representability is the structural property identifying when a functor's behavior is "controlled by a single object." Many important constructions in category theory and its applications can be characterized as representable functors:

- **Products** are representable: $\mathrm{Hom}(-, A \times B) \cong \mathrm{Hom}(-, A) \times \mathrm{Hom}(-, B)$.
- **Exponentials** $B^A$ are representable in cartesian-closed categories.
- **Limits** are representable by the limit object.

Representability turns "object construction with a universal property" into "find a representing object for this functor."

**Adjoints and representability.** A functor $F : \mathcal{C} \to \mathcal{D}$ has a right adjoint iff $\mathrm{Hom}_{\mathcal{D}}(F(-), B)$ is representable in $\mathcal{C}$ for every $B \in \mathrm{Ob}(\mathcal{D})$. Adjoints exist via representability, putting the entire theory of adjoint functors inside the Yoneda framework.
