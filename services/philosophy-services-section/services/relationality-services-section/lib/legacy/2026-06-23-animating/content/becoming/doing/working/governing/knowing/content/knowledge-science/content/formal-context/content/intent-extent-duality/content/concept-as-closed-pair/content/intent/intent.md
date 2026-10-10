---

introduces: fiber
description: "The set of attributes that define a formal concept — the 'why' of the concept. Paired with extent (the 'what')."
aliases: [intent, intents]
component-of: formal-concept
contrasts-with: extent
date-created: 2026-03-31
---

The intent of a formal concept is the set of attributes that define it.

In [formal concept analysis](./formal-concept-analysis.md), a formal concept is a pair $(A, B)$ where $A$ is the [extent](./extent.md) (objects) and $B$ is the intent (attributes). The intent contains exactly the attributes shared by all objects in the extent, and the extent contains exactly the objects that have all attributes in the intent.

If the concept is "papers in the repository," the intent is {type: paper} — the attribute that defines membership. If the concept is "authored, published papers," the intent is {type: paper, authors, status: published} — a richer defining attribute set.

In a [concept lattice](../../math/theories/order/terms/concept-lattice.md), concepts are ordered by reverse intent inclusion: a concept with a larger intent (more defining attributes, fewer objects) is more specific and sits lower in the lattice.

The term comes from Ganter & Wille (1999). In the [Galois connection](../../math/theories/order/terms/galois-connection.md) on a [formal context](../../math/theories/logic/terms/formal-context.md), the intent is the output of the objects-to-attributes map $A'$.

In the extends/restricts framework: the intent is on the **restricts** side of the [adjunction](../../math/theories/categories/theories/ordinary-categories/terms/adjoint-pair.md) — it is what constrains which objects can belong.
