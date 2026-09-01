---
title: "(Infinity,1)-Category"
aliases:
  - "(infinity,1)-category"
  - "(∞,1)-category"
  - "infinity-1-category"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: infinity-category
references:
  - "Lurie, Higher Topos Theory, Princeton University Press, 2009"
---

Let $\mathcal{C}$ be an [$\infty$-category](./infinity-category.md).

**Definition.** An *$(\infty,1)$-category* is an $\infty$-category $\mathcal{C}$ in which every $k$-[morphism](../../../objects/categories/ordinary-categories/terms/morphism.md) for $k \geq 2$ is invertible (up to $(k+1)$-[morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md), and so on coherently). That is, the only non-invertible cells are the 1-[morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md); all higher cells serve as homotopical coherence data.

In the quasicategory model (the standard model due to Joyal and Lurie), an $(\infty,1)$-category is a simplicial set $X$ satisfying the *inner horn-filling condition*: for every $n \geq 2$ and $0 < k < n$, every map $\Lambda^n_k \to X$ extends to a map $\Delta^n \to X$. Objects are $0$-simplices, [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) are $1$-simplices, and $n$-simplices for $n \geq 2$ witness composition and higher coherences. Composition is determined up to a contractible space of choices.

**Proposition.** *The nerve $N(\mathcal{C})$ of an ordinary category $\mathcal{C}$ is a quasicategory in which all inner horns have unique fillers. Conversely, a quasicategory $X$ is isomorphic to the nerve of an ordinary category if and only if all inner horn fillers are unique.*

*Proof sketch.* The nerve $N(\mathcal{C})_n = \mathrm{Fun}([n], \mathcal{C})$. Inner horn filling corresponds to composition, and uniqueness of fillers corresponds to strict associativity and unitality.

**Proposition.** *For any two objects $x, y$ in a quasicategory $X$, the mapping space $\mathrm{Map}_X(x, y)$ is a Kan complex. An $(\infty,1)$-category in which all mapping spaces are contractible or empty is equivalent to a poset. An $(\infty,1)$-category in which all mapping spaces are discrete is equivalent to an ordinary category.*

**Proposition.** *An $(\infty,1)$-category in which all $1$-[morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) are invertible is an $\infty$-groupoid, i.e., a Kan complex. Under the homotopy hypothesis, the homotopy theory of $\infty$-groupoids is equivalent to the homotopy theory of topological spaces.*

**Proposition.** *The standard categorical notions — [adjunctions](./adjunction.md), limits, colimits, [Kan extensions](../../../objects/categories/ordinary-categories/terms/kan-extension.md), and [natural transformations](../../../objects/categories/ordinary-categories/terms/natural-transformation.md) — all admit $(\infty,1)$-categorical analogues, characterized by the same universal properties but with diagrams commuting up to coherent homotopy.*

**Examples.**

- *Spaces:* The $(\infty,1)$-category $\mathcal{S}$ of spaces (Kan complexes), with mapping spaces given by $\mathrm{Map}_{\mathcal{S}}(X,Y) = Y^X$. This is the terminal presentable $(\infty,1)$-category under colimit-preserving functors.
- *Stable categories:* The derived $(\infty,1)$-category $\mathcal{D}(R)$ of a ring $R$, obtained as the $\infty$-categorical localization of the category of chain complexes of $R$-modules at the quasi-isomorphisms.
- *[$(\infty,1)$-topoi](./infinity-1-topos.md):* The $(\infty,1)$-category of [sheaves of spaces](./sheaf-of-spaces.md) on a [site](./site.md) is the central example in higher topos theory.
