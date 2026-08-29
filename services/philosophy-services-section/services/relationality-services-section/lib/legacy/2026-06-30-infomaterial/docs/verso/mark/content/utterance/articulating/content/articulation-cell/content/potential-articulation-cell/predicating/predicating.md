---
title: Predicating
description: The morphism that restricts articulation by saying something *of* the articulated cell. A predicate asserted over a cell is an arrow; predicates that compose — associatively, with identities — generate a category. Predicating is therefore the generative home of category theory: the predication category is what this morphism produces, and its object is the predication cell φ = (s, p, o).
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["predicating", "morphism", "predication-cell", "predicate", "predicate-category", "category-theory", "articulation-cell", "generative-unfolding", "curry-howard"]
---

# Predicating

## What this node is

Predicating is the morphism **out of the
[potential articulation cell](../potential-articulation-cell.md)** — the seed of
the articulation category, the generic articulated cell before any side is
committed. It descends to the next regime by running the articulation coherence
on that seed and consuming what it leaves. Where
[articulating](../../../../../articulating.md) only brings a cell into being,
**predicating says something *of* it**: it asserts a
[predicate](content/predicate/predicate.md) over the
cell, orienting it from a subject to an object.

A predicate asserted over a cell is an **arrow**. Predicates compose —
associatively, with identities — and so **generate a category**. This is the
literal sense in which category theory is not a subject filed nearby but *what
this morphism produces*: the **predication category**, whose object is the
[predication cell](content/predication-cell/predication-cell.md)
$\phi = (s, p, o)$, an oriented assertion-position from subject through predicate
to object.

## What it generates

Predicating's codomain is the predication category. Its carriers, under
[`content/`](content):

- [predication-cell](content/predication-cell/predication-cell.md) — the object:
  the ordered, oriented triple $\phi = (s, p, o)$ at which a valuation later
  records evidence. Built from two coordinates:
  - [entity](content/entity/entity.md) — the subject and
    object positions, which are **not interchangeable**: $(s,p,o)$ and $(o,p,s)$
    are distinct cells with independent values.
  - [predicate](content/predicate/predicate.md) — the
    **typed** middle coordinate, not a bare label.
- [predicate-category](content/predicate-category/predicate-category.md) — the
  small category $\mathcal{C}$ the predicates inhabit, with four canonical
  morphism classes (specialization, converse, subject-projection,
  object-projection) that license reindexing of cells.

The predication cell is only the *location* at which a value will live; the value
itself enters one morphism further on, at **positing**, where evidence is admitted
into the cell as a bilattice charge. Category and type theory are the two faces of
predicating — the semantic (arrows that compose) and the syntactic (consequence
over predication base objects); both are read off the one predication category.

## A note on the name

The corpus's development names this codomain the *transfinite*-predication
category. "Transfinite" is one of the four **settling** regimes (the closure-
ordinal classes strict / Scott-continuous / transfinite-bounded / aperiodic),
generated downstream under settling — not a property of predication as such. By
first-class derivation the base object is the plain **predication category**; the
transfinite development is preserved in [`_archive/`](_archive) for promotion.

## Orientation

The domain is the [potential articulation cell](../potential-articulation-cell.md);
the morphism above is [articulating](../../../../../articulating.md). Descend to
[predication-cell](content/predication-cell/predication-cell.md) for the object,
and to [predicate-category](content/predicate-category/predicate-category.md) for
the typed index. The next morphism, **positing**, admits value into the cell.
