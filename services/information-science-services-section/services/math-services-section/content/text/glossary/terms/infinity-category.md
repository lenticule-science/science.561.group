---
name: "Infinity-Category"
description: "Let $X$ be a simplicial set, i.e., a functor $X: Delta^{mathrm{op}} \to mathbf{Set}$ where $Delta$ is the simplex [category](./category.md)."
aliases:
  - "infinity-category"
  - "∞-category"
  - "infinity-categories"
date-created: 2025-12-26
tags: []
mathematical-object: simplicial-set
references:
  ref1:
    title: "Lurie, Higher Topos Theory, Princeton University Press, 2009"
---

Let $X$ be a simplicial set, i.e., a functor $X: \Delta^{\mathrm{op}} \to \mathbf{Set}$ where $\Delta$ is the simplex [category](./category.md).

**Definition.** An *$\infty$-category* (in the sense of a *weak Kan complex* or *quasicategory*) is a simplicial set $X$ satisfying the *inner horn-filling condition*: for every $n \geq 2$ and every $0 < k < n$, every map $\Lambda^n_k \to X$ from the $k$-th inner horn extends to a map $\Delta^n \to X$.

Here the $0$-simplices of $X$ are the *objects*, the $1$-simplices are the *[morphisms](./morphism.md)*, and the higher simplices encode composition and coherence data. An inner horn $\Lambda^2_1 \to X$ specifies a composable pair of morphisms; a filler $\Delta^2 \to X$ provides a composite together with a witness of the composition. The inner horn condition ensures that composites exist but composites are unique up to a contractible space of choices.

More generally, the term "$\infty$-category" refers to any structure with objects, [morphisms](./morphism.md), 2-[morphisms](./morphism.md), and so on to all levels, with composition at each level satisfying associativity and unitality up to coherent higher [morphisms](./morphism.md).

**Proposition.** *The following models of $\infty$-categories are equivalent (in the sense of Quillen-equivalent model categories): quasicategories (Joyal, Lurie), complete Segal spaces (Rezk), Segal categories (Hirschowitz--Simpson), and simplicial categories (Bergner). In particular, any theorem proved in one model transfers to all others.*

**Proposition.** *An ordinary [category](./category.md) $\mathcal{C}$ embeds into $\infty$-categories via its nerve $N(\mathcal{C})$. The nerve is a quasicategory in which every inner horn has a unique filler. A quasicategory is a Kan complex (i.e., satisfies all horn-filling conditions, including outer horns) if and only if every morphism is invertible, in which case it models an $\infty$-groupoid.*

**Examples.**

- *Kan complexes:* A Kan complex is a quasicategory in which every morphism is invertible. These model homotopy types of spaces.
- *Nerves:* For any ordinary category $\mathcal{C}$, the nerve $N(\mathcal{C})$ is a quasicategory.
- *[$(\infty,1)$-categories](./infinity-1-category.md):* The most commonly used variant, equivalent to the quasicategory model. All $k$-morphisms for $k \geq 2$ are invertible; higher structure encodes homotopical coherence.
- *$(\infty,n)$-categories:* More generally, an $(\infty,n)$-category has non-invertible cells up to dimension $n$, with all cells above dimension $n$ invertible. The case $n=1$ gives the [$(\infty,1)$-category](./infinity-1-category.md).
