---
type: morphism
class: list-operation
realizes: [list]
depends-on: [list-record, insertion, settling-monotonicity, federation-convergence]
see-also: [list, list-append-convergence-via-fractional-index-bilattice]
---

# Append to list

The substrate operation that adds a new item to the end of a [list](teaching/explanations/list.md). Append is the most common list-modification primitive.

## Signature

`append-to-list(list-record-id, item, author) → (post-append-list, witness)`

Inputs:

- **`list-record-id`** — reference to the list.
- **`item`** — the item to append (must conform to the list's element-type shape).
- **`author`** — the user or agent performing the append.

Outputs:

- **`post-append-list`** — the list with the new item at the end.
- **`witness`** — records the append.

## Operational semantics

1. *Validate item.* Verify the item conforms to the list's `element-type` shape per [validate-against-shape](../../../morphisms/validate-against-shape.md).
2. *Compute new position.* For integer-indexed lists, position = current length + 1. For fractional-index lists, position = next-fractional-after-current-tail.
3. *Insert.* Per [insertion](../../../morphisms/insertion.md), admit the item with the computed position and a `next-element` predication from the prior tail.
4. *Update tail-pointer.* The list's tail-pointer is updated to the new item.
5. *Witness emit.*

## Engineering invariants

- **Constant-cost (with tail-pointer).** Append is O(1) when the list has a tail-pointer predication.
- **Federation-convergent for fractional-index lists.** Per [federation-convergence](../../../theorems/federation-convergence.md), concurrent appends from multiple authors produce items at distinct fractional-index positions; merge order is determined by canonical hash of the items' content.
- **Element-shape-conforming.** Per [validate-against-shape](../../../morphisms/validate-against-shape.md), non-conforming items are refused.
- **Monotone in $\leq_k$.** Append is admission-only; the list's predications grow knowledge-monotonically.
