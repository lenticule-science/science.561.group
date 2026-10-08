---

introduces: data-structure
description: "The formal model of key-value data: a type from a partially ordered set together with a partial function from feature names to values. Forms a lattice under subsumption."
aliases: [ typed feature structures, feature structure, attribute-value matrix, AVM, Typed feature structure, emsenn.net ]
date-created: 2026-03-30
type: data-structure
---

A typed feature structure (Carpenter 1992) is a type drawn from a partially ordered set of types, together with a partial function from features (attribute names) to values. It is the formal model of key-value data.

Every key-value data format is a typed feature structure:

- A YAML frontmatter block: the type is the file, the features are the keys, the values are the YAML values.
- A JSON object: the type is the document, the features are the property names.
- A database row: the type is the entity, the features are the column names.

The set of all typed feature structures over a given signature forms a bounded [lattice](../../math/domains/order/terms/lattice.md) under **subsumption**: $F_1 \sqsubseteq F_2$ iff $F_1$ is at least as specific as $F_2$. The meet is **unification** (combining two structures into their most general common specialization). The join is **generalization** (finding the most specific structure that subsumes both).

A collection of feature structures sharing attribute names is a formal context in the sense of Ganter & Wille (1999): the entities are objects, the attribute names are attributes, and the values give the incidence relation. The [concept lattice](../../../../services/math-services-section/content/text/glossary/terms/concept-lattice.md) of this formal context organizes the data by shared structure.

When feature values carry [epistemic states](./epistemic-state.md) from the four-valued [bilattice](../../math/domains/algebra/terms/bilattice.md), the formal context inherits a [residuated lattice](../../math/domains/algebra/terms/residuated-lattice.md) structure (Belohlavek 2004), giving key-value data a [Lambek calculus](../../../../services/math-services-section/content/text/glossary/terms/lambek-calculus.md).

The set of all typed feature structures over a given signature forms a bounded [lattice](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/order/terms/lattice.md) under **subsumption**: $F_1 \sqsubseteq F_2$ iff F1F_1 is at least as specific as F2F_2. The meet is **unification** (combining two structures into their most general common specialization). The join is **generalization** (finding the most specific structure that subsumes both).

The CUE configuration language (a JSON superset used in production) explicitly bases its semantics on Carpenter's typed feature structures, with lattice-theoretic unification as evaluation.
