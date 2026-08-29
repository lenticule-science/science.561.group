---
name: object-as-cell-coordinate
description: "The entity occupying the third coordinate of a predication cell (s, p, o). The entity TO WHICH the subject is being related under the predicate. Not the category-theoretic notion of 'object of a category'."
symbol: "o"
depends-on: [entity, predication-cell]
derives-from: docs/dev/scraps/object.md
---

# Object (as cell coordinate)

The entity `o` occupying the **third coordinate** of a predication cell `(s, p, o)`. The object is the entity *to which* the subject is being related under the predicate; the cell's value `v(p)(s, o) ∈ A_p` records the epistemic state on the proposition "`p` holds of `s` in relation to `o`."

## Naming distinction

The archive concept used the bare name `object/`. Current grammar already has two distinct "object" terms:

- `object` (category-theoretic) — an element of `Ob(C)` for some category. Lives in the disentangling backlog under the stale `predicate-category/hacking/library/object/` subtree, where it carries the SPOTCOMP substrate chain.
- `object-as-cell-coordinate` (this $thing) — the third coordinate of a predication cell.

The current placement uses the longer name to keep the two senses distinct. Path: `transfinite-predication-category/hacking/library/object-as-cell-coordinate/`.

## Role in the predicate-category morphism classes

The morphism class **predicate-object-projection** collapses `E × E` along the diagonal `(s, o) ↦ (o, o)`, extracting a unary predicate that depends only on the object. The object coordinate is what that projection projects ONTO.

Together with the **subject** coordinate (sibling `subject/`), the object indexes the entity-pair structure `E × E` over which fiber algebras are built.

## Frege's other slot

In Frege's two-slot account of predication (CLAUDE.md, "Fregean predication forces FOUR"), the object IS the second argument-slot — independent of the subject slot, contributing its own saturation status.

## Derivation source

Adapted from `predication-categories/concepts/object.md`, preserved at `docs/dev/scraps/object.md`. The archive note explicitly notes the same naming distinction (its first paragraph says: "*object* names the third coordinate of a predication cell — not the category-theoretic notion").
