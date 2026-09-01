---
title: "Infinity Category"
aliases:
  - "infinity category"
  - "infinity categories"
  - "∞-category"
date-created: 2025-12-31
tags: []
mathematical-object: simplicial-set
---

An ∞-category is a category-like structure with [morphisms](../../ordinary-categories/morphisms/morphism.md) in all dimensions: objects, morphisms between objects, 2-morphisms between morphisms, 3-morphisms between 2-morphisms, and so on, with coherent [composition](../../ordinary-categories/morphisms/composition.md) at every level. Where an ordinary [category](../../ordinary-categories/objects/category.md) has only objects and arrows, an ∞-category has arrows between arrows at every height.

## Definition (quasi-category model)

Let $X$ be a [simplicial set](./simplicial-set.md), i.e., a functor $X: \Delta^{\mathrm{op}} \to \mathbf{Set}$ where $\Delta$ is the simplex category.

**Definition.** An *∞-category* (in the sense of a *weak Kan complex* or *quasi-category*) is a simplicial set $X$ satisfying the *inner horn-filling condition*: for every $n \geq 2$ and every $0 < k < n$, every map $\Lambda^n_k \to X$ from the $k$-th inner [horn](./horn.md) extends to a map $\Delta^n \to X$.

The $0$-simplices of $X$ are the *objects*, the $1$-simplices are the *morphisms*, and the higher simplices encode composition and coherence data. An inner horn $\Lambda^2_1 \to X$ specifies a composable pair of morphisms; a filler $\Delta^2 \to X$ provides a composite together with a witness of the composition. The inner horn condition ensures that composites exist but are unique only up to a contractible space of choices.

More generally, the term "∞-category" refers to any structure with objects, morphisms, 2-morphisms, and so on to all levels, with composition at each level satisfying associativity and unitality up to coherent higher morphisms.

## Models

**Proposition.** *The following models of ∞-categories are equivalent (in the sense of Quillen-equivalent model categories): [quasi-categories](./quasi-category.md) (Joyal, Lurie), complete Segal spaces (Rezk), Segal categories (Hirschowitz–Simpson), and simplicial categories (Bergner). In particular, any theorem proved in one model transfers to all others.*

A quasi-category is a simplicial set with inner horn fillers. A Segal category or complete Segal space uses simplicial spaces. A simplicially enriched category uses [enrichment](../../enriched-categories/objects/enriched-category.md) over simplicial sets. These models form the basis of higher [category theory](../../../_index.md).

## Nerves and ∞-groupoids

**Proposition.** *An ordinary [category](../../ordinary-categories/objects/category.md) $\mathcal{C}$ embeds into ∞-categories via its nerve $N(\mathcal{C})$. The nerve is a quasi-category in which every inner horn has a unique filler. A quasi-category is a Kan complex (i.e., satisfies all horn-filling conditions, including outer horns) if and only if every morphism is invertible, in which case it models an ∞-groupoid.*

## Examples

- **Kan complexes.** A Kan complex is a quasi-category in which every morphism is invertible. These model homotopy types of spaces.
- **Nerves.** For any ordinary category $\mathcal{C}$, the nerve $N(\mathcal{C})$ is a quasi-category.
- **[(∞,1)-categories](./infinity-1-category.md).** The most commonly used variant, equivalent to the quasi-category model. All $k$-morphisms for $k \geq 2$ are invertible; higher structure encodes homotopical coherence.
- **(∞,n)-categories.** More generally, an (∞,n)-category has non-invertible cells up to dimension $n$, with all cells above dimension $n$ invertible. The case $n=1$ gives the [(∞,1)-category](./infinity-1-category.md).

## (∞,1)-categories and (∞,1)-topoi

An [(∞,1)-category](./infinity-1-category.md) is an ∞-category where all $k$-morphisms for $k > 1$ are invertible — the higher morphisms witness [homotopies](../../../../topology/morphisms/homotopy.md) rather than genuinely directed transformations. Most of the ∞-categories arising in practice (spaces, spectra, derived categories, sheaf categories) are (∞,1)-categories. An [(∞,1)-topos](./infinity-1-topos.md) is an (∞,1)-category satisfying descent conditions that make it a context for homotopy-coherent logic and geometry.

## References

- Lurie, *Higher Topos Theory*, Princeton University Press, 2009.
