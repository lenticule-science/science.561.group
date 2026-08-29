---
title: Predication Cell
description: The object of the predication category — an assertion-position, the ordered oriented triple φ = (s, p, o) from subject through predicate to object. The location at which a valuation later records evidence; subject and object positions are not interchangeable, and the predicate is a typed coordinate, not a label.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["predication-cell", "predicate", "entity", "subject", "object", "predicate-category", "assertion-position", "orientation", "bilattice"]
---

# Predication Cell

## What this node is

A **predication cell** is the object of the predication category that
[predicating](../../predicating.md) produces — the *assertion-position*, the
location at which a predication valuation will later record evidence about a
[predicate](../predicate/predicate.md)'s instantiation on a pair of
[entities](../entity/entity.md). Concretely it is the ordered triple

$$\phi = (s, p, o)$$

whose first coordinate is an entity (the subject), second a predicate, and third
an entity (the object). The cell's content lies in the **orientation** the triple
carries — it asserts something *of $s$ in relation to $o$* — not in symmetric
tuple structure.

## What makes it a cell, not a generic triple

- **Subject and object positions are not interchangeable.** $(s, p, o)$ and
  $(o, p, s)$ are *distinct* assertion-positions with independent values; their
  relationship is mediated by predicate converse, not by any symmetry on the
  index.
- **The predicate is a typed coordinate, not a label.** Predicates live in the
  small [predicate-category](../predicate-category/predicate-category.md)
  $\mathcal{C}$ whose morphisms fall in four canonical classes; the predicate
  coordinate carries the typing that licenses reindexing.
- **The entity-pair index is a diagonal of two transversal projections.** Cells
  $(s, p, s)$ are fixed points of both projection generators.

## Where values live

A predication cell is *the location at which* a value is held; the value itself
lives in the predication fiber algebra $A_p$ at the cell's predicate coordinate,
and is admitted only downstream at **positing**. A valuation $v$ assigns each
predicate $p$ an element $v(p) \in A_p$, evaluating at $(s, o)$ to the cell's
bilattice value $v(p)(s, o)$ — evidence for and against the predication.
Set-theoretically the cell is an element of the predication cell set
$\Phi = E \times \Pi \times E$.

## Orientation

Descend to [entity](../entity/entity.md) for the subject/object coordinate
and [predicate](../predicate/predicate.md) for the typed middle coordinate;
read [predicate-category](../predicate-category/predicate-category.md) for the
typed index that licenses reindexing. The morphism that produced this object is
[predicating](../../predicating.md); value enters it at positing.
