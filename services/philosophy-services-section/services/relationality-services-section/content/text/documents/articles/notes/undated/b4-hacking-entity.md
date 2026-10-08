---
name: entity
description: "An element of an entity set: an individual or node that predicates discuss. Symbol e. Entities occupy the subject and object coordinates of predication cells."
symbol: "e"
depends-on: [entity-set]
derives-from: docs/dev/scraps/entity.md
title: entity
---

# Entity

An element of an entity set, denoted `e`. Entities are the individuals or nodes that predicates discuss — the population over which the predication cell triples `(s, p, o)` range.

## Role

An entity may occupy the **subject** coordinate or the **object** coordinate of a predication cell `(s, p, o)`. The two cell-coordinate roles (`subject` and `object-as-cell-coordinate`) are siblings in this hacking/library/ and define what an entity DOES in a cell.

Entities themselves have no further internal structure typed by predicating. Predications ABOUT an entity are cells in the entity's fiber, not properties of the entity itself — see `object.md` at the (now-disentangled) predicate-category subtree for the parallel claim about categorical objects.

## Position

`transfinite-predication-category/hacking/library/entity/`. Wrapped in `hacking/` because the derivation from the generic predicating-tier category to "what counts as an entity here" is not yet worked out — entities are admitted as primitive.

## Relation to extended-entity-set

A separate $thing `extended-entity-set/` (also at this category's `hacking/library/`) types extensions of the entity set with additional structure. The bare `entity` here is the generic notion; `extended-entity-set` carries the additional indexings (timestamp, spatial coordinate, etc.) used by application-domain settlings.

## Derivation source

Adapted from `predication-categories/concepts/entity.md`, preserved at `docs/dev/scraps/entity.md`.
