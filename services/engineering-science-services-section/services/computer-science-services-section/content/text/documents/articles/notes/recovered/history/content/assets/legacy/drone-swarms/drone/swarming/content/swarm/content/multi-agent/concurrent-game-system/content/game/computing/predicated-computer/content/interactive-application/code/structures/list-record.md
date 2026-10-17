---
type: definition
class: substrate-entity
realizes: [list]
depends-on: [list, predication-cell, predication-fiber-algebra]
see-also: []
---

# List record

A **list record** is the substrate-entity formal definition of a [list](teaching/explanations/list.md): an ordered collection represented as substrate predications.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`element-type`** — reference to the [shape-record](../../../objects/shape-record.md) declaring what kind of items the list admits.
- **`items`** — references to the items in the list, with positional metadata. For CRDT-friendly lists, each item references its fractional-index for CRDT-friendly insertion.
- **`length`** — derived count of items.
- **`head-pointer`**, **`tail-pointer`** — for efficient access to the list's first and last items.
- **`ordering-discipline`** — `single-author-integer-index` (simple ordering) or `multi-author-fractional-index` (CRDT-friendly).
- **`scope`** — reference to the scope the list lives in.
- **`closure-kind`** — `list`.

## Invariants

- **Position-ordered.** The items' positions form a total order (per the cited ordering-discipline).
- **Element-shape-conforming.** Each item conforms to the cited element-type shape.
- **Append-monotonic.** Per [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), appended items are admit operations that contribute increments.

## Position in the platform

List records are the substrate's *ordered-collection primitive*. Used for menu items, message threads, comment chains, task lists, history logs, and many other interactive-application patterns.
