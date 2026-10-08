---
name: slicing
description: The slice-category construction functor V ↦ C/V. Sends an object V of a category C to the overcategory C/V — objects are arrows into V, morphisms are commuting triangles over V. The standard bundle-around-the-basepoint construction in categorical algebra and sheaf theory. Distinguished from specializing by crossing up to a category of arrows-into-the-basepoint rather than narrowing within a level.
gerund: slicing
agent-noun: slicer
imperative: slice
originating: object
terminating: slice-category
preserves:
  - identities
  - composition
title: slicing
---

Let $\mathcal{C}$ be a category and $V$ an object of $\mathcal{C}$. The **slice category** $\mathcal{C}/V$ (also called the *overcategory* at $V$) is defined as follows (Mac Lane 1971, ch. I §3):

- Objects of $\mathcal{C}/V$ are pairs $(X, f)$ with $X \in \mathrm{Ob}(\mathcal{C})$ and $f : X \to V$ a morphism in $\mathcal{C}$.
- Morphisms of $\mathcal{C}/V$ from $(X, f)$ to $(Y, g)$ are arrows $h : X \to Y$ in $\mathcal{C}$ satisfying $g \circ h = f$ (commuting triangles over $V$).
- Composition and identities are inherited from $\mathcal{C}$.

**Slicing** is the categorical operation $V \mapsto \mathcal{C}/V$. It is functorial in $V$ in the following sense: for every morphism $w : V \to V'$ in $\mathcal{C}$, the post-composition functor

$$w_* : \mathcal{C}/V \to \mathcal{C}/V', \quad (X, f) \mapsto (X, w \circ f)$$

is a functor between slice categories (Mac Lane 1971, ch. II §6), and the assignment $w \mapsto w_*$ preserves identities and composition in $\mathcal{C}$. The construction therefore defines a functor $\mathcal{C} \to \mathbf{Cat}$ (or, when $\mathcal{C}$ is small, $\mathcal{C} \to \mathbf{Cat}_{\mathrm{small}}$) sending each object to its slice.

## Role

The slice category $\mathcal{C}/V$ is the standard *bundle-around-the-basepoint-$V$* in categorical algebra and sheaf theory (Mac Lane–Moerdijk 1992, ch. I §3; Borceux 1994, ch. 1 §6). Its objects collect every arrow into $V$ — the *cells incident to $V$* in the predication-category reading — and its morphisms record the commutation between such cells. The slice carries every piece of the bundle structure attached to a basepoint.

## Frontmatter usage

The cell

$$(V, \text{slicing}, \mathcal{C}/V)$$

records that the object $V$ slices to its slice category. Reading: "$V$ slices to $\mathcal{C}/V$."

## Distinction from specializing

Slicing differs from [specializing](object-specializing.md) in that the target is a *category* (the slice) rather than a *more-general object* (the supertype). Specialization narrows within a level; slicing crosses up to the category-of-arrows-into-the-basepoint, raising the dimension by one.
