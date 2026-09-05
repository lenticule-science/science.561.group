---

introduces: method
description: "A mathematical framework for deriving conceptual hierarchies from data tables. A formal context of objects and attributes generates a concept lattice via a Galois connection."
aliases: [formal concept analysis, FCA]
extends: galois-connection
produces: concept-lattice
acts-on: formal-context
date-created: 2026-03-30
---

Formal concept analysis (Ganter & Wille 1999) derives conceptual structure from data. The input is a [formal context](../../math/theories/logic/terms/formal-context.md) $(G, M, I)$: objects $G$, attributes $M$, and an incidence relation $I$ recording which objects have which attributes.

The derivation operators form a [Galois connection](../../math/theories/order/terms/galois-connection.md) between subsets of objects and subsets of attributes. The closed elements — pairs $(A, B)$ with $A' = B$ and $B' = A$ — are the formal concepts. $A$ is the **extent** (the objects); $B$ is the **intent** (the attributes). The formal concepts form a complete [concept lattice](../../math/theories/order/terms/concept-lattice.md).

FCA applies to any data expressible as objects with attributes: database tables, key-value records, survey responses, text corpora. A repository of files with frontmatter is a formal context where files are objects and frontmatter keys are attributes.

Belohlavek (2004) generalized FCA to many-valued contexts where $I: G \times M \to L$ for a [residuated lattice](../../math/theories/algebra/terms/residuated-lattice.md) $L$. The concept lattice inherits $L$'s residuated structure. Wurm (2012) proved such concept lattices give complete semantics for the [Lambek calculus](../../math/theories/logic/terms/lambek-calculus.md).
