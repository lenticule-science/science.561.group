---
title: Order
description: "The object preorder generates when antisymmetry is added — a set carrying a relation ≤ (\"is at least as much as\") that is reflexive, antisymmetric, and transitive. Not \"order theory\" the discipline but order the structure: the antisymmetric refinement of settling's accessibility preorder, the monotone graded chain it ascends and the least upper bound it reaches. Generates the lattice, and through it the bounded, distributive, and Heyting refinements."
date-created: 2026-06-19
date-modified: 2026-06-21
keywords: ["order", "partial-order", "lattice", "meet", "join", "least-upper-bound", "monotone", "antisymmetric", "preorder", "settling"]
---

## What this node is

**Order** is the object a [preorder](../../preorder.md) generates when one law is
added. It is a set carrying a single relation $\le$, read "is at least as much as,"
that is

- **reflexive** — everything $\le$ itself;
- **antisymmetric** — if $a \le b$ and $b \le a$ then $a = b$;
- **transitive** — $\le$ chains.

That is the whole of it: order is the thinnest mathematics of comparison, one
relation and three laws. It is not a discipline ("order theory") filed here by
topic; it is the structure settling settles *into*.

The middle law is what separates order from its generator. A
[preorder](../../preorder.md) has only reflexivity and transitivity and so permits
**ties** — distinct elements each $\le$ the other. **Antisymmetry** forbids the
ties: mutual comparison now forces identity. Order is therefore a preorder with one
restriction added, and it sits one law deeper than the preorder that generates it —
equivalently, it is the preorder with its ties quotiented away.

## Why settling reaches it

[Settling](../../../../settling.md) lays down the preorder first — the
reflexive-transitive accessibility frame of its modal closure
possibilize∘necessitate — and then supplies antisymmetry by its own defining move:
the fixed point it iterates to is the **least** one. That single fact carries the
three pieces of an order and is why order is *reached* here and not posited earlier:

- the closure is **monotone** — each step sits $\le$ the next, giving the relation;
- the orbit is a **graded chain** — a totally-ordered ascent indexed by the
  closure ordinal;
- the fixed point is a **least upper bound** — the smallest value dominating the
  whole chain, and *least* means *unique*, which is antisymmetry.

Monotone ascent to a least-upper-bound fixed point is order before it is anything
else: it is the preorder's accessibility relation once leastness has removed the
ties. The specific [knowledge-order](../../../../../../../../pre-bilattice/content/knowledge-order/knowledge-order.md)
and [truth-order](../../../../../../../../pre-bilattice/content/truth-order/truth-order.md)
posited on the bilattice's charges are particular orders given as structure;
order *as such* — the general object any such order instantiates — is what
settling proves, because settling is where order does the work of reaching a
destination.

## What it generates

Add to an order the requirement that every pair of elements have a greatest lower
bound (**meet**) and a least upper bound (**join**) and the order becomes a
**lattice** — the first refinement, and the one settling already needs (its fixed
point is a join). Under the lattice the further refinements derive in turn:
bounded (a $\top$ and $\bot$), complete (meets and joins of all subsets, where
the closure's fixed point lives by Knaster–Tarski), distributive (meet distributes
over join), and — adding an internal implication right-adjoint to meet — the
**Heyting algebra**, whose refusal of $\lnot\lnot a = a$ is the order-side projection
of Curry–Howard. The [bilattice](../../../../../../../../pre-bilattice/content/bilattice/bilattice.md)
that [positing](../../../../../../../../../positing.md) opened is two orders of this
kind crossed; here is where the single order under each of its axes is proven.

Order strengthens in a second, independent direction. Demand that *every* pair be
comparable — no two elements left side by side with no relation — and order becomes
a [total order](content/total-order/total-order.md), a chain. This is the shape of
settling's ascent itself: the value space is a lattice, but the closure orbit that
settling traces through it is a totally-ordered chain. Bounds and comparability are
the two ways to add one more law to order; they are independent and meet only in
special structures.

## Orientation

The object that generates this one is the [preorder](../../preorder.md), itself laid
down by [settling](../../../../settling.md) as the accessibility frame of its modal
closure; settling is the generative home of order and of
[sheaf](../../../sheaf/sheaf.md) alike. Descend through `content/` along the
refinement chain beginning at the lattice, and to [total order](content/total-order/total-order.md)
for the comparability strengthening. Un-derived material — further lattice
refinements, the Priestley duality recovering an order from its topology, and the
worked tutorials — sits in [`_archive`](_archive) awaiting derivation into place.
