---
name: slice-category
description: "The category C/A whose objects are morphisms in C with codomain A, and whose morphisms (X, f) → (Y, g) are morphisms h : X → Y in C with g ∘ h = f. The categorical 'view from A' — every arrow into A becomes an object of C/A."
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
title: slice-category
---

The **slice category** $\mathcal{C}/A$ over an object $A$ in a category $\mathcal{C}$ has [@maclane1971, Ch. II §6; @awodey2010, §1.6]:

- **Objects:** morphisms $f : X \to A$ in $\mathcal{C}$ — pairs $(X, f)$ where $X$ is an object of $\mathcal{C}$ and $f$ is its arrow to $A$.
- **Morphisms:** a morphism $(X, f) \to (Y, g)$ in $\mathcal{C}/A$ is a morphism $h : X \to Y$ in $\mathcal{C}$ such that $g \circ h = f$. The triangle $f = g \circ h$ commutes.
- **Composition:** inherited from $\mathcal{C}$ — composing two compatible morphisms in $\mathcal{C}/A$ gives a morphism in $\mathcal{C}/A$.
- **Identity:** $\mathrm{id}_{(X, f)} = \mathrm{id}_X$ in $\mathcal{C}$.

**Usage and intuition.** The slice $\mathcal{C}/A$ presents $\mathcal{C}$ "from $A$'s perspective": every other object in $\mathcal{C}$ shows up multiple times, once per morphism it has to $A$. This is heavily used in foundations of mathematics:

- $\mathrm{Set}/A$ is equivalent to the category of $A$-indexed families of sets.
- The aliases-as-resolve-pullbacks theorem operates partially in slice categories.
- In topos theory, slice topoi $\mathcal{E}/A$ play a role analogous to localized rings.

**Adjoint to pullback.** When $\mathcal{C}$ has pullbacks, a morphism $f : A \to B$ induces a functor $f^* : \mathcal{C}/B \to \mathcal{C}/A$ by pulling back along $f$. This functor has a left adjoint $\Sigma_f : \mathcal{C}/A \to \mathcal{C}/B$ — dependent sum — given by post-composition with $f$. In well-behaved categories (locally cartesian closed), $f^*$ also has a right adjoint $\Pi_f$ — dependent product. The adjoint triple $\Sigma_f \dashv f^* \dashv \Pi_f$ is the structural source of dependent-type formalization.

**Dual.** The dual is the coslice category $A/\mathcal{C}$ — objects are morphisms $A \to X$ (under-category instead of over-category).
