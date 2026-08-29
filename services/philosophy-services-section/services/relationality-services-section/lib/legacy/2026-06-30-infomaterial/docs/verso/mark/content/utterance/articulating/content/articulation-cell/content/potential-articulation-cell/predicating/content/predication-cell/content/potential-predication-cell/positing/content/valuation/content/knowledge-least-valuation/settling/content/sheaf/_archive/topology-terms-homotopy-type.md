---
title: "Homotopy Type"
aliases:
  - "homotopy type"
  - "homotopy types"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Hatcher, Algebraic Topology, Cambridge University Press, 2002"
defines:
  - "Homotopy Type"
  - "homotopy types"
---

Let $X$ be a topological space.

**Definition.** The *homotopy type* of $X$ is its equivalence class under [homotopy equivalence](./homotopy-equivalence.md). That is, two spaces $X$ and $Y$ have the same homotopy type if and only if $X \simeq Y$: there exist continuous maps $f: X \to Y$ and $g: Y \to X$ with $g \circ f \simeq \mathrm{id}_X$ and $f \circ g \simeq \mathrm{id}_Y$.

**Proposition.** *If $X$ and $Y$ have the same homotopy type, then they share all homotopy-invariant algebraic data: [homotopy groups](./homotopy-group.md), singular homology groups, singular cohomology ring, and Euler characteristic (when defined).*

*Proof sketch.* Each of these invariants is a functor from the homotopy category $\mathsf{hTop}$ (or from pointed spaces in the case of homotopy groups) to an algebraic category; [homotopy equivalences](./homotopy-equivalence.md) become isomorphisms in $\mathsf{hTop}$, hence are sent to isomorphisms by any such functor. $\square$

**Proposition.** *Every compact polyhedron (finite simplicial complex) has the homotopy type of a finite CW complex, and conversely.*

**Examples.**
- $\{*\}$, $D^n$, $\mathbb{R}^n$, and any convex subset of $\mathbb{R}^n$ all represent the [contractible](./contractible.md) homotopy type.
- $S^1$, the annulus $\{z \in \mathbb{C} : 1 \leq |z| \leq 2\}$, the cylinder $S^1 \times [0,1]$, and the Möbius band all represent the same homotopy type.
- $S^2$ and $T^2$ have different homotopy types: $\pi_1(S^2) = 0$ while $\pi_1(T^2) \cong \mathbb{Z} \times \mathbb{Z}$.

**Remark.** In higher [category theory](../../../objects/categories/index.md), homotopy types are identified with $\infty$-groupoids -- [$\infty$-categories](../../higher-topos-theory/terms/infinity-category.md) in which every [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) at every level is invertible. This identification is the content of the *homotopy hypothesis* (Grothendieck), proven in several models of higher categories.
