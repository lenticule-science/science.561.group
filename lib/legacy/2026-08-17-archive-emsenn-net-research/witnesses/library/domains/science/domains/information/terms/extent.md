---

introduces: fiber
description: "The set of objects that fall under a formal concept — the 'what' of the concept. Paired with intent (the 'why')."
defines: extent
aliases: [extent, extents]
component-of: formal-concept
contrasts-with: intent
date-created: 2026-03-31
---

The extent of a formal concept is the set of objects that fall under it.

In [formal concept analysis](./formal-concept-analysis.md), a formal concept is a pair $(A, B)$ where $A$ is the extent (objects) and $B$ is the intent (attributes). The extent contains exactly the objects that have all the attributes in the intent, and the intent contains exactly the attributes shared by all the objects in the extent.

If the concept is "papers in the repository," the extent is the set of files with `type: paper`. If the concept is "authored, published papers," the extent is the smaller set of files with `type: paper`, `authors`, and `status: published`.

In a [concept lattice](../../math/domains/order/terms/concept-lattice.md), concepts are ordered by extent inclusion: a concept with a larger extent (more objects, fewer defining attributes) is more general and sits higher in the lattice.

The term comes from Ganter & Wille (1999). In the [Galois connection](../../math/domains/order/terms/galois-connection.md) on a [formal context](../../math/domains/logic/terms/formal-context.md), the extent is the output of the attributes-to-objects map $B'$.

In the extends/restricts framework: the extent is on the **extends** side of the [adjunction](../../math/domains/categories/domains/ordinary-categories/terms/adjoint-pair.md) — it is what the concept reaches out to cover.
