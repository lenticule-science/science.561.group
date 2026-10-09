---
type: concept
class: ordered-collection
depends-on: [predication-cell, predication-fiber-algebra, settling-monotonicity]
see-also: [sequence, stack, queue, list-append-convergence-via-fractional-index-bilattice]
---

# List

A *substrate-recorded ordered collection*: a sequence of items in a particular order, supporting append, insert-at-position, remove-at-position, and iterate operations. Lists are the substrate's primary ordered-collection structure; sequences, stacks, and queues are specializations or restrictions of the list pattern.

The substrate represents a list as a chain of predications:

- A list-entity predication declaring the list exists, its name, its element-type.
- One or more `next-element` predications threading items together (item $i$ has a `next` predication pointing to item $i+1$).
- Item-position predications (typically fractional indices for CRDT-friendly insertion).
- Length and head/tail-pointer predications.

Lists in the substrate are *immutable in the substrate sense*: per [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the list's substrate predications can only grow in the knowledge order. A list "edit" — append, insert, remove — is admission of new predications declaring the new state.

Per the substrate's [federation-convergence](../../../theorems/federation-convergence.md), lists support CRDT-style collaborative ordering when items use *fractional indices* (each item's position is a rational number that admits arbitrary insertion between any two existing items). Concurrent appends from two users produce two new items at the end with distinct fractional indices; the merge order is determined by the canonical hash of each item's content.

Three engineering properties:

- **Append is constant-cost.** Adding an item at the end of a list is one predication insertion; per [wavefront-termination](../../../theorems/wavefront-termination.md), the cost is bounded by the list's length only insofar as the new item's `next-element` predication needs to know the prior tail. With a tail-pointer predication, append is O(1).
- **Insert-at-position requires a position-allocation discipline.** Fractional indices (per the CRDT-friendly approach) admit O(log n) insertion at any position; integer indices require O(n) re-indexing. The substrate's choice depends on whether the list is single-author (integer indices fine) or collaborative (fractional indices required).
- **Iteration is a substrate traversal.** Per [traversal](../../../morphisms/traversal.md), iterating a list is following the `next-element` chain from the head. Per [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), iteration is a free read.

Specializations:

- **Sequence** — a list with fixed-order, no repositioning of existing items. Append-only.
- **Stack** — a list with LIFO semantics. Push appends to the head; pop removes from the head.
- **Queue** — a list with FIFO semantics. Enqueue appends to the tail; dequeue removes from the head.
- **Set** — an unordered collection (not a list per se); the substrate's predication graph naturally represents sets (cells with the same predicate but different objects).
- **Map / Dictionary** — key-value collection; substrate-natural via a `mapped-to` predicate from key entities to value entities.
