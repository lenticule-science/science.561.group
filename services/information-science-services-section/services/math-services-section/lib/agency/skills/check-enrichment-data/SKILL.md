---
name: check-enrichment-data
description: Verify that proposed hom-objects and composition maps satisfy the axioms of a $\mathcal{V}$-enriched category — associativity and unit coherence in the base.
requires-capabilities:
  - read
  - math-laws
  - relate-relations
  - settle
---

# Check Enrichment Data

A proposed enriched category structure isn't valid until the axioms are verified. The axioms live in the base monoidal category $\mathcal{V}$ — associativity and unit coherence are statements about morphisms in $\mathcal{V}$, not pointwise statements about elements.

## When to use

You have proposed hom-objects and composition maps for a structure you want to call a $\mathcal{V}$-enriched category and need to verify it actually satisfies the enriched-category axioms.

## How it works

1. **Identify the base.** What monoidal category $\mathcal{V}$ is the enrichment over? What is its tensor $\otimes$ and tensor unit $I$?
2. **List the hom-objects.** $\mathcal{V}(x, y) \in \mathcal{V}$ for every ordered pair of objects $(x, y)$.
3. **Check composition typing.** Composition is a morphism $\circ : \mathcal{V}(y, z) \otimes \mathcal{V}(x, y) \to \mathcal{V}(x, z)$ in $\mathcal{V}$. Verify the source and target are the right hom-objects under $\mathcal{V}$'s tensor.
4. **Check units.** For each $x$, a morphism $u_x : I \to \mathcal{V}(x, x)$ in $\mathcal{V}$.
5. **Verify associativity.** The two composites of three morphisms agree as morphisms in $\mathcal{V}$ — check this using $\mathcal{V}$'s associator.
6. **Verify unit coherence.** Composing with $u_x$ on either side acts as identity, mediated by $\mathcal{V}$'s left/right unitors.
7. **Record findings.** Which axioms hold, which fail, and what's missing.

## Prerequisites

- `learn-enriched-categories` — the structural framework.
- `learn-category-theory` — ordinary categories (the underlying language).
