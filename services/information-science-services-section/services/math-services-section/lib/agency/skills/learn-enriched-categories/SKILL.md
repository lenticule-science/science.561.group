---
name: learn-enriched-categories
description: Learn how enriched categories generalize ordinary ones over a monoidal base — hom-objects, enriched composition, unit conditions, and what enrichment buys.
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - math-laws
---

# Learn Enriched Categories

In an ordinary category, hom-sets are sets. In an enriched category, hom-objects live in a fixed monoidal category $\mathcal{V}$, and composition is a morphism in $\mathcal{V}$ rather than a function. Enrichment is what lets categorical reasoning carry extra structure (metric, topological, ordered, linear) automatically.

## What you will be able to do

- Write the data of a $\mathcal{V}$-enriched category: objects, hom-objects $\mathcal{V}(x, y) \in \mathcal{V}$, composition $\circ : \mathcal{V}(y, z) \otimes \mathcal{V}(x, y) \to \mathcal{V}(x, z)$, units $u_x : I \to \mathcal{V}(x, x)$.
- State the associativity and unit coherence conditions and check them in a worked example.
- Identify the enrichment in standard examples: $\mathbf{Set}$-enriched (ordinary), $\mathbf{Cat}$-enriched (2-categories), $[0, \infty]$-enriched (Lawvere metric spaces), $\mathbf{Ab}$-enriched (preadditive categories).

## Prerequisites

- `learn-category-theory` — ordinary categories, functors, natural transformations.

## Reference

- `library/domains/humanities/domains/math/domains/categories/` — the categories domain in the library; enriched categories are a development on the basic theory.

## Verification

Pick a base $\mathcal{V}$ (other than $\mathbf{Set}$). Define a small $\mathcal{V}$-enriched category — write out the hom-objects, composition, and units. Verify associativity and the unit conditions explicitly using $\mathcal{V}$'s monoidal structure.
