---
name: initial-object
description: "An object I in a category C such that for every object A there exists a unique morphism I → A. The categorical reference point all other objects receive unique morphisms from. Dual to terminal-object; unique up to unique isomorphism when it exists."
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
title: initial-object
---

An **initial object** $I$ in a category $\mathcal{C}$ is an object satisfying the universal property [@maclane1971, Ch. III §3; @awodey2010, §3.4]:

> For every object $A \in \mathrm{Ob}(\mathcal{C})$, there exists exactly one morphism $I \to A$.

The dual of [terminal-object](terminal-object.md): initial means "unique morphism out of"; terminal means "unique morphism into."

**Uniqueness.** Initial objects, when they exist, are unique up to *unique* isomorphism by the same dual argument as terminal objects.

**Examples by category.**

- In Set, the initial object is the empty set $\emptyset$ — there is exactly one function $\emptyset \to A$ for any $A$ (the empty function).
- In Top, the initial object is the empty space.
- In Grp, the initial object is the trivial group $\{e\}$ — same as the terminal object (Grp has a *zero object*).
- In Ring (rings with unit), the initial object is $\mathbb{Z}$ — there is exactly one ring homomorphism $\mathbb{Z} \to R$ sending $1 \mapsto 1_R$.
- In a partial order viewed as a thin category, the initial object is the least element.

When a category has both an initial object $I$ and a terminal object $T$, and $I \cong T$ canonically, the common object is called a **zero object**. Categories with a zero object (often called *pointed categories*) admit a canonical zero morphism $A \to 0 \to B$ between any two objects.

**Const-pinned witness.** Same pattern as terminal-object: the universal-property witness is pinned by `const` on a fixed subtree, dualized for the initial direction. This is one of the schemas demonstrating JSON Schema 2020-12's `const`-for-whole-subtrees feature.

**Free objects as initial.** A free object in some category over a generating data structure $X$ is initial in the comma category $X / U$ where $U$ is the forgetful functor. This is how the categorical formalization of "freeness" (free monoids, free groups, free vector spaces) lands in the same framework.
