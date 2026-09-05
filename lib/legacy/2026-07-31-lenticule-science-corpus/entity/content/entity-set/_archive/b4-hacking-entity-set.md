---
name: entity-set
description: "A set E whose elements are entities. Carries no required structure beyond set-hood in general; specific theorems and applications may impose finiteness and the set may be sorted. Pairs of entities form the index E × E over which predication-fiber-algebras are built."
symbol: "E"
realizes: [entity]
derives-from: docs/dev/scraps/entity-set.md
---

# Entity set

A set `E` whose elements are entities. No required structure beyond set-hood.

## Specific impositions

- **Finiteness** — required by many concrete theorems (cohomological-dimension claims, decidability of closure, etc.).
- **Sorting** — `E` may be sorted (i.e., partitioned into kinds with kind-restricted operations).
- **Equipped with relations** — `<` when `E` is well-ordered, `=` with constants `c ∈ E`, etc. These show up as signature atoms in the closure-rule-language.

## Role

Pairs of entities form the index `E × E` over which predication-fiber-algebras are built. The first and second coordinates of such pairs are the **subject** and **object** positions of predication cells.

## Position

`transfinite-predication-category/hacking/library/entity-set/`. The bare entity-set is the basic carrier; the substrate's `extended-entity-set` (sibling) is the structurally-equipped variant used by application-domain settlings.

## Derivation source

Adapted from `predication-categories/objects/entity-set.md`, preserved at `docs/dev/scraps/`.
