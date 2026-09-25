---

title: "From Data Tables to Concept Lattices"
description: "How a collection of key-value records generates a formal context, and how the Galois connection on that context produces a concept lattice — the algebraic structure already present in any data system."
date-created: 2026-03-30
requires:
  - lattice
teaches:
  - formal-concept-analysis
  - formal-context
  - concept-lattice
  - galois-connection
type: explanation

---

Any collection of things with named attributes is a data table. A set of YAML files with frontmatter. A spreadsheet. A database. The rows are entities, the columns are attribute names, the cells are values. This is the most common shape of structured data.

Formal concept analysis (Ganter & Wille 1999) takes this data table and extracts its conceptual structure. The table is a [formal context](../../../../glossary/terms/formal-context.md): entities are objects, attribute names are attributes, and the cell values give the incidence relation.

The extraction works through a [Galois connection](../../../../glossary/terms/galois-connection.md) — a pair of maps that go back and forth between subsets of objects and subsets of attributes:

Given a set of objects $A$: find all attributes they share ($A'$).
Given a set of attributes $B$: find all objects that have all of them ($B'$).

A **formal concept** is a pair $(A, B)$ where $A$ and $B$ are mutual images under these maps: $A' = B$ and $B' = A$. The objects $A$ are the concept's **extent** (what falls under it). The attributes $B$ are its **intent** (what defines it).

The formal concepts form a complete [lattice](../../../../glossary/terms/lattice.md) — the [concept lattice](../../../../glossary/terms/concept-lattice.md). This is not imposed on the data. It is extracted from the data by the Galois connection. The lattice was already there; the Galois connection makes it visible.

The concept lattice answers structural questions about the data:
- Which attributes always appear together? (They share a concept.)
- Which entities are interchangeable? (They have the same intent.)
- What hierarchy of concepts organizes the entities? (The lattice ordering.)

This works for binary data (attribute present/absent). Belohlavek (2004) extended it to many-valued data, where cells carry values from a [residuated lattice](../../../../glossary/terms/residuated-lattice.md) $L$. The Galois connection uses $L$'s implication, and the concept lattice inherits $L$'s algebraic structure.

When the values come from the four-valued [bilattice](../../../../glossary/terms/bilattice.md) — tracking whether each attribute is unattested ($\bot$), affirmed ($t$), denied ($f$), or contested ($\top$) for each entity — the concept lattice becomes a residuated lattice with a [Lambek calculus](../../../../glossary/terms/lambek-calculus.md) (Wurm 2012). The data table acquires a modal calculus: you can reason about what's known, unknown, and contradictory across the whole system, using the algebra that the Galois connection extracted.

This is what formal concept analysis does: it takes data you already have and shows you the algebraic structure it already contains.

## Earlier material

The extraction works through a [Galois connection](../../../../glossary/terms/galois-connection.md) — a pair of maps that go back and forth between subsets of objects and subsets of attributes:

The formal concepts form a complete [lattice](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/prose/math/theories/order/terms/lattice.md) — the [concept lattice](../../../../glossary/terms/concept-lattice.md). This is not imposed on the data. It is extracted from the data by the Galois connection. The lattice was already there; the Galois connection makes it visible.

When the values come from the four-valued [bilattice](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/prose/math/theories/algebra/terms/bilattice.md) — tracking whether each attribute is unattested ($\bot$), affirmed ($t$), denied ($f$), or contested ($\top$) for each entity — the concept lattice becomes a residuated lattice with a [Lambek calculus](../../../../glossary/terms/lambek-calculus.md) (Wurm 2012). The data table acquires a modal calculus: you can reason about what's known, unknown, and contradictory across the whole system, using the algebra that the Galois connection extracted.
