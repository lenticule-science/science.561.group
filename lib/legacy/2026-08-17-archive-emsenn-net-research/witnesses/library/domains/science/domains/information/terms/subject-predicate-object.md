---

introduces: triple
description: "The basic structure of an assertion: a subject, a predicate relating it to an object, and the object. The atomic unit of knowledge representation."
aliases: [SPO, SPO triple, triple, subject-predicate-object triple]
made-of: [subject, predicate, object]
instances-in: [rdf-triple, yaml-frontmatter, entity-attribute-value, database-row]
predicate-is: unsaturated-function
combination-is: residuated-lattice
values-in: epistemic-state
fibers-via: predicate-fiber
origin: frege-1879
formalized-by: lambek-1958
categorical-form: lawvere-1969
date-created: 2026-03-30
---

A subject-predicate-object triple (SPO triple) is the basic structure of an assertion: a subject $S$, a predicate $P$ that relates it, and an object $O$. "The file extends legibility" has subject "the file," predicate "extends," and object "legibility."

Frege (1879) established the logical form: the predicate is an unsaturated function that takes the subject and returns a value. The SPO triple is function application — $P(S) = O$.

The structure appears across disciplines under different names:

- **Linguistics**: subject-verb-object sentence structure
- **Semantic web**: RDF triples (W3C 2024) — the atomic unit of linked data
- **Databases**: entity-attribute-value (EAV) — a row, a column name, and a cell value
- **Logic**: a relation $P(S, O)$ applied to two terms
- **Key-value data**: a file (subject) with a key (predicate) mapped to a value (object)

Lambek (1958) formalized how the predicate combines with its arguments as a [residuation](../../math/domains/algebra/terms/residuated-lattice.md): the product and its two residuals exhaust the modes of functor-argument interaction. The predicate's combination with its arguments is algebraically determined.

When SPO triples carry values from the four-valued [bilattice](../../math/domains/algebra/terms/bilattice.md) $\{\bot, t, f, \top\}$, each assertion has an epistemic state: unattested, affirmed, denied, or contested. Shared predicates across triples generate fibers whose algebra is a [concept lattice](../../math/domains/order/terms/concept-lattice.md) with [Lambek calculus](../../math/domains/logic/terms/lambek-calculus.md) structure.
