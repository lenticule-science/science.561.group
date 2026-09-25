---
title: "emsenn.net"
type: "method"
date-created: 2026-03-30
description: A mathematical framework for deriving conceptual hierarchies from data tables.
---

A mathematical framework for deriving conceptual hierarchies from data tables. A formal context of objects and attributes generates a concept lattice via a Galois connection.

Formal concept analysis (Ganter & Wille 1999) derives conceptual structure from data. The input is a [formal context](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/logic/terms/formal-context.md) $(G, M, I)$: objects $G$, attributes $M$, and an incidence relation $I$ recording which objects have which attributes.

The derivation operators form a [Galois connection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/galois-connection.md) between subsets of objects and subsets of attributes. The closed elements — pairs $(A, B)$ with A′=BA&#x27; = B and B′=AB&#x27; = A — are the formal concepts. $A$ is the **extent** (the objects); $B$ is the **intent** (the attributes). The formal concepts form a complete [concept lattice](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/concept-lattice.md).

FCA applies to any data expressible as objects with attributes: database tables, key-value records, survey responses, text corpora. A repository of files with frontmatter is a formal context where files are objects and frontmatter keys are attributes.

Belohlavek (2004) generalized FCA to many-valued contexts where $I: G \times M \to L$ for a [residuated lattice](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/algebra/terms/residuated-lattice.md) $L$. The concept lattice inherits LL&rsquo;s residuated structure. Wurm (2012) proved such concept lattices give complete semantics for the [Lambek calculus](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/lambek-calculus.md).
