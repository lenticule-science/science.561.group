---
name: slicing
description: The slice-category construction functor — sends an object V of a category C to the overcategory C/V whose objects are arrows into V and whose morphisms are commuting triangles over V.
gerund: slicing
agent-noun: slicer
imperative: slice
originating: structure
terminating: slice-category
preserves:
  - identities
  - composition
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: maclane-moerdijk1992
    type: book
    title: "Sheaves in Geometry and Logic: A First Introduction to Topos Theory"
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
      - literal: Moerdijk, Ieke
    issued:
      - year: 1992
  - id: borceux1994
    type: book
    title: "Handbook of Categorical Algebra, vol. 1: Basic Category Theory"
    publisher: Cambridge University Press
    location: Cambridge
    author:
      - literal: Borceux, Francis
    issued:
      - year: 1994
title: slicing
---

Let $\mathcal{C}$ be a category and $V$ an object of $\mathcal{C}$. The **slice category** $\mathcal{C}/V$ (also called the *overcategory* at $V$) is defined as follows [@maclane1971, ch. I §3]:

- Objects of $\mathcal{C}/V$ are pairs $(X, f)$ with $X \in \mathrm{Ob}(\mathcal{C})$ and $f : X \to V$ a morphism in $\mathcal{C}$.
- Morphisms of $\mathcal{C}/V$ from $(X, f)$ to $(Y, g)$ are arrows $h : X \to Y$ in $\mathcal{C}$ satisfying $g \circ h = f$ (commuting triangles over $V$).
- Composition and identities are inherited from $\mathcal{C}$.

**Slicing** is the categorical operation $V \mapsto \mathcal{C}/V$. It is functorial in $V$ in the following sense: for every morphism $w : V \to V'$ in $\mathcal{C}$, the post-composition functor
$$w_* : \mathcal{C}/V \to \mathcal{C}/V', \quad (X, f) \mapsto (X, w \circ f)$$
is a functor between slice categories [@maclane1971, ch. II §6], and the assignment $w \mapsto w_*$ preserves identities and composition in $\mathcal{C}$. The construction therefore defines a functor $\mathcal{C} \to \mathbf{Cat}$ (or, when $\mathcal{C}$ is small, $\mathcal{C} \to \mathbf{Cat}_{\mathrm{small}}$) sending each object to its slice.

The slice category $\mathcal{C}/V$ is the standard *bundle-around-the-basepoint-$V$* in categorical algebra and sheaf theory [@maclane-moerdijk1992, ch. I §3; @borceux1994, ch. 1 §6]. Its objects collect every arrow into $V$ — the *cells incident to $V$* in the predication-category reading — and its morphisms record the commutation between such cells. The slice carries every piece of the bundle structure attached to a basepoint.

The cell $(V, \text{slicing}, \mathcal{C}/V)$ records that the object $V$ slices to its slice category. Reading: "$V$ slices to $\mathcal{C}/V$."

Slicing differs from [specializing](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/slicing/docs/dev/notes/specializing.md) in that the target is a *category* (the slice) rather than a *more-general object* (the supertype). Specialization narrows within a level; slicing crosses up to the category-of-arrows-into-the-basepoint, raising the dimension by one.
