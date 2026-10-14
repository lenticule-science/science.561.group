---

introduces: method
description: "A mathematical framework for deriving conceptual hierarchies from data tables. A formal context of objects and attributes generates a concept lattice via a Galois connection."
aliases: [ formal concept analysis, FCA, Formal concept analysis ]
extends: galois-connection
produces: concept-lattice
acts-on: formal-context
date-created: 2026-03-30
date-updated: 2026-10-14
---

Formal concept analysis (Ganter & Wille 1999) derives conceptual structure from data. The input is a [formal context](../../math/domains/logic/terms/formal-context.md) $(G, M, I)$: objects $G$, attributes $M$, and an incidence relation $I$ recording which objects have which attributes.

The derivation operators form a [Galois connection](../../../../services/math-services-section/content/text/glossary/terms/galois-connection.md) between subsets of objects and subsets of attributes. The closed elements — pairs $(A, B)$ with $A' = B$ and $B' = A$ — are the formal concepts. $A$ is the **extent** (the objects); $B$ is the **intent** (the attributes). The formal concepts form a complete [concept lattice](../../../../services/math-services-section/content/text/glossary/terms/concept-lattice.md).

An observed table or corpus becomes an FCA context **only after** its object carrier, attribute carrier, and incidence criterion have been explicitly selected. A Markdown frontmatter key is an *assertion by a source*, not a theorem that the corresponding real-world property is true. Revisions, contradictory reports, and access/authority must be retained outside the Boolean incidence or through additional typed relations.

**FOUR-valued predication has two independent Boolean FCA projections.** Given a qualified charge $v(g,m)$, define $I^+(g,m)$ by its *positive evidence* bit and $I^-(g,m)$ by its *negative evidence* bit. An unknown ($\bot_k$) is in neither; positive-only is in $I^+$; negative-only is in $I^-$; **both/contested ($\top_k$) is in both**. The positive projection does *not* mean “true without opposition.” Projecting to $I^+$ alone discards the distinct negative evidence, so a later consumer must preserve the original FOUR carrier when that distinction matters.

The exact [Obsmetrologia positive incidence](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Predicating/Residuation.lean) declares `Valuation.posIncidence` via `Charge.pos` and includes both `tTop` and `kTop`. Its `primeA_iff_lres`, `primeB_iff_rres` and `closeA_iff_rres_lres` show how Boolean FCA derivations depend on **directional binary-relation residuals** under their stated types. The [Red Cup Chu positive-extension implementation](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/lib/metrologic/src/chu.mjs) and [exhaustive FOUR regression](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/lib/metrologic/test/chu.test.mjs) realize this chosen finite reading without inventing a second truth system.

Generalized FCA over valued incidences (e.g. Bělohlávek's residuated-lattice treatment) requires an **identified value algebra and appropriate residuation assumptions**; no arbitrary SPO table or FOUR-valued matrix becomes a categorical hyperdoctrine, valid market decision, or general Lambek model just because its columns can be called concepts. Those additional structures require independent definitions and conformance checks.
