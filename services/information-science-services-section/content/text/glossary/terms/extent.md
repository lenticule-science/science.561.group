---

introduces: fiber
description: "The set of objects that fall under a formal concept — the 'what' of the concept. Paired with intent (the 'why')."
aliases: [ extent, extents, Extent, emsenn.net ]
component-of: formal-concept
contrasts-with: intent
date-created: 2026-03-31
type: fiber
---

The extent of a formal concept is the set of objects that fall under it.

In [formal concept analysis](./formal-concept-analysis.md), a formal concept is a pair $(A, B)$ where $A$ is the extent (objects) and $B$ is the intent (attributes). The extent contains exactly the objects that have all the attributes in the intent, and the intent contains exactly the attributes shared by all the objects in the extent.

If the concept is "papers in the repository," the extent is the set of files with `type: paper`. If the concept is "authored, published papers," the extent is the smaller set of files with `type: paper`, `authors`, and `status: published`.

In a [concept lattice](../../../../services/math-services-section/content/text/glossary/terms/concept-lattice.md), concepts are ordered by extent inclusion: a concept with a larger extent (more objects, fewer defining attributes) is more general and sits higher in the lattice.

The term comes from Ganter & Wille (1999). In the [Galois connection](../../../../services/math-services-section/content/text/glossary/terms/galois-connection.md) on a [formal context](../../math/domains/logic/terms/formal-context.md), the extent is the output of the attributes-to-objects map $B'$.

In the extends/restricts framework: the extent is on the **extends** side of the [adjunction](../../../../services/math-services-section/content/text/glossary/terms/adjoint-pair.md) — it is what the concept reaches out to cover.

In [formal concept analysis](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/formal-concept-analysis.md), a formal concept is a pair (A,B)(A, B) where AA is the extent (objects) and BB is the intent (attributes). The extent contains exactly the objects that have all the attributes in the intent, and the intent contains exactly the attributes shared by all the objects in the extent.

If the concept is &ldquo;papers in the repository,&rdquo; the extent is the set of files with `type: paper`. If the concept is &ldquo;authored, published papers,&rdquo; the extent is the smaller set of files with `type: paper`, `authors`, and `status: published`.
