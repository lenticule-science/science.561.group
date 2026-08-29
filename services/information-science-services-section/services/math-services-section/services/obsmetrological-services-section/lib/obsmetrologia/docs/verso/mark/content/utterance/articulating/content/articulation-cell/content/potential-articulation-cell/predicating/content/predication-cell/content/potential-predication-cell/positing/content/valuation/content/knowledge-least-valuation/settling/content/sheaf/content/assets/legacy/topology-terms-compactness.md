---
title: "Compactness"
aliases:
  - "compactness"
  - "compact"
  - "compact space"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: topological-space
references:
  - "Munkres, Topology, 2nd ed., Pearson, 2000"
defines:
  - "Compactness"
  - "compact"
  - "compact space"
---

Let $(X, \tau)$ be a [topological space](./topological-space.md).

**Definition.** An *open [cover](../../sheaf-theory/terms/cover.md)* of $X$ is a collection $\{U_i\}_{i \in I}$ of [open sets](./open-set.md) with $\bigcup_{i \in I} U_i = X$. A *subcover* is a subcollection that still covers $X$. The space $X$ is *compact* if every open cover of $X$ has a finite subcover.

**Proposition (Heine-Borel).** *A subset of $\mathbb{R}^n$ is compact (in the standard topology) if and only if it is closed and bounded.*

**Proposition (Extreme value theorem).** *If $X$ is compact and $f : X \to \mathbb{R}$ is [continuous](./continuous-map.md), then $f$ attains its supremum and infimum.*

*Proof sketch.* $f(X)$ is compact in $\mathbb{R}$ (continuous image of a compact space is compact), hence closed and bounded by Heine-Borel. A closed bounded subset of $\mathbb{R}$ contains its supremum and infimum. $\square$

**Proposition.** *A [continuous map](./continuous-map.md) from a compact space to a Hausdorff space is a closed map. In particular, a continuous bijection from a compact space to a Hausdorff space is a [homeomorphism](./homeomorphism.md).*

**Theorem (Tychonoff).** *The product $\prod_{i \in I} X_i$ (with the product topology) is compact if and only if each $X_i$ is compact. (The forward direction requires the axiom of choice.)*

**Examples.**

1. **$[0,1]$.** Compact (Heine-Borel, or directly by the nested interval property).
2. **$\mathbb{R}$.** Not compact: the cover $\{(-n, n)\}_{n \in \mathbb{N}}$ has no finite subcover.
3. **Cantor set.** Compact (closed and bounded subset of $\mathbb{R}$), despite being uncountable and nowhere dense.
4. **Finite spaces.** Every finite topological space is compact.
