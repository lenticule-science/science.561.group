---
name: category
description: A mathematical category — a collection of objects, a collection of morphisms with each morphism carrying a source and target object, an associative composition of composable morphisms, and an identity morphism at every object, satisfying associativity and identity laws (Mac Lane 1971, ch. I §2).
title: category
---

## Definition

A category $\mathcal{C}$ consists of:

- a class $\mathrm{Ob}(\mathcal{C})$ of **objects**;
- for each ordered pair $A, B \in \mathrm{Ob}(\mathcal{C})$, a set $\mathcal{C}(A, B)$ of **morphisms** from $A$ to $B$;
- for each object $A$, an **identity morphism** $\mathrm{id}_A \in \mathcal{C}(A, A)$;
- a **composition** operation $\circ : \mathcal{C}(B, C) \times \mathcal{C}(A, B) \to \mathcal{C}(A, C)$ for each ordered triple $A, B, C$.

The data satisfies two axioms:

- **(C1) Associativity.** For composable $f, g, h$, $(h \circ g) \circ f = h \circ (g \circ f)$.
- **(C2) Identity laws.** For every $f \in \mathcal{C}(A, B)$, $\mathrm{id}_B \circ f = f$ and $f \circ \mathrm{id}_A = f$.

## Every entity is a category

In this repository, every record at `code/structures/<slug>.md` and every record at `code/transformers/<gerund>.md` denotes an entity. Each entity is an object of the predication category $\mathcal{P}$ — the category whose objects are entities and whose morphisms are predication cells $(s, p, o)$ in the sense of [predication-cell](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/docs/dev/notes/predication-cell.md).

For any object $V$ of $\mathcal{P}$, the **slice category** $\mathcal{P}/V$ is itself a category:

- $\mathrm{Ob}(\mathcal{P}/V) := \{(X, f) : X \in \mathrm{Ob}(\mathcal{P}),\; f : X \to V \in \mathcal{P}\}$ — pairs of an entity and a predication cell into $V$.
- $\mathcal{P}/V((X, f), (Y, g)) := \{h : X \to Y \in \mathcal{P} \mid g \circ h = f\}$ — predication arrows commuting with the maps into $V$.
- Identity at $(X, f)$ is $\mathrm{id}_X$; composition is composition in $\mathcal{P}$.

Associativity and identity laws hold in $\mathcal{P}/V$ because they hold in $\mathcal{P}$ (the slice construction is functorial in the base; Mac Lane 1971, ch. I §3). Therefore $\mathcal{P}/V$ is a category.

Identifying $V$ with $\mathcal{P}/V$: every entity is a category. This applies uniformly to structures (records at `code/structures/`), transformers (records at `code/transformers/`), files, directories, programs, and the values in any frontmatter cell.

## The `category:` predicate

A record's `category:` frontmatter field records a particular categorical home for the record. The cell `(this-record, category, V)` asserts that this record is an object of the category $V$ (where $V$ is itself an entity, hence a category by the construction above). A record may have multiple categorical homes (every entity does, by Yoneda and by the multiple-fibration view of categorical type theory); the `category:` field names one principal home for purposes of group-by-program operational tooling.

A record may carry `category: <self>` (the value equals the slug). This is the slice-loop: $V$ is an object of $\mathcal{P}/V$ via $\mathrm{id}_V$. Not preferred as a primary home — typically the `category:` field names a containing category higher in the hierarchy.

## What this layer governs

This record is a definition of the mathematical concept "category". The directory split between `code/structures/` and `code/transformers/` is one operational discriminator (object-records vs morphism-records); the math layer carries both as categories in their own right. The slice construction guarantees both directions: every object-record is a category (slice), every morphism-record is a category (slice), and every value appearing in any frontmatter is a category (slice).

## External references

- Mac Lane, S. (1971). *Categories for the Working Mathematician*. Graduate Texts in Mathematics 5. Springer. Chapter I, §§2–3.
- The repository's own `prose/learning/claims/predication-settling-objects-and-preorder-morphisms-form-a-category.md` walks the five-piece category-axiom check on a specific construction; the same pattern applies to the slice $\mathcal{P}/V$ at any $V$.
