---
title: Predicate Category
description: The small category C in which predicates live — the typed index that licenses reindexing of predication cells. Its morphisms fall in four canonical classes: specialization, converse, subject-projection, object-projection. Distinct from the discrete predication cell set; this is the index made to compose.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["predicate-category", "predicate", "predication-cell", "specialization", "converse", "subject-projection", "object-projection", "reindexing", "category-theory"]
---

# Predicate Category

## What this node is

The **predicate category** $\mathcal{C}$ is the small category in which
[predicates](../predicate/predicate.md) live. Where the
predication cell set $\Phi = E \times \Pi \times E$ is the *discrete* index over
which valuations range, the predicate category is the **typed** index — the index
*made to compose* — and it is what licenses reindexing one
[predication cell](../predication-cell/predication-cell.md)'s value onto related
cells.

## The four canonical morphism classes

Every morphism of $\mathcal{C}$ is built from four canonical classes, the seed
set the whole category is generated from (each acting on cells through the
predicate coordinate):

- **specialization** — refinement of one predicate by another;
- **converse** — the predicate reversed, relating $(s, p, o)$ to $(o, p, s)$;
- **subject-projection** — collapse onto the subject flank;
- **object-projection** — collapse onto the object flank.

These are the morphisms that the next layer of structure composes over; as gerund
morphisms (specializing, conversing, projecting) they are the arrows out of this
object, to be derived after the objects are in place. That predicates *compose*
this way — associatively, with identities — is exactly why
[predicating](../../predicating.md) generates a category at all.

## Orientation

Read [predicate](../predicate/predicate.md) for the
coordinate that inhabits this category and
[predication-cell](../predication-cell/predication-cell.md) for what its morphisms
reindex. The morphism that produced this category is
[predicating](../../predicating.md).
