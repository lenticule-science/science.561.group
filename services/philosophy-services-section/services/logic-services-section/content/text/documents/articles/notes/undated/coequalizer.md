---
name: coequalizer
description: "The universal cocone over a parallel pair — an object C with a morphism c : B → C such that c ∘ f = c ∘ g for parallel f, g : A → B, and universal among such pairs. Categorically captures the 'quotient identifying two morphisms' images.'"
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
title: coequalizer
---

A **coequalizer** of a parallel pair $f, g : A \to B$ in a category $\mathcal{C}$ is an object $C$ together with a morphism $c : B \to C$ satisfying $c \circ f = c \circ g$ and the dual universal property to [equalizer](equalizer.md) [@maclane1971, Ch. III §3; @awodey2010, §5.4]:

> For every $(Q, q : B \to Q)$ with $q \circ f = q \circ g$, there exists a unique morphism $u : C \to Q$ such that $u \circ c = q$.

The coequalizing morphism $c$ is always an [epimorphism](epimorphism.md) — it is the "quotient projection" identifying $f$'s and $g$'s images.

**Examples by category.**

- In Set, the coequalizer of $f, g : A \to B$ is the quotient $B / \sim$ where $\sim$ is the smallest equivalence relation with $f(a) \sim g(a)$ for every $a$.
- In Grp, the coequalizer is the quotient by the smallest normal subgroup containing $\{f(a) g(a)^{-1} : a \in A\}$.
- In Top, the coequalizer is the quotient space.

**Regular epimorphisms.** A morphism that arises as a coequalizer is called a *regular* epimorphism. Like with monomorphisms, in well-behaved categories every epi is regular; in others (like Top), regular epis are a proper subclass.
