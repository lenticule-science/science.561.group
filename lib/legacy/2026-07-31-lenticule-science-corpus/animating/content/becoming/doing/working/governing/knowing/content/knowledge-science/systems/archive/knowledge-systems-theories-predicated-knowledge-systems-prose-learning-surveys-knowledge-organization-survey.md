---
title: "Knowledge Organization, from Ranganathan to Wille — and what predicated knowledge systems inherit"
date-created: 2026-05-02
description: "A synthesis of the upstream knowledge-organization literature (Ranganathan, Hjorland, Needham/Feibleman/Foskett, Dahlberg, Wille/Ganter, the BCG/CRG line) read through the predicated framing — what each commitment becomes when the substrate is the predication-cell."
references:
  - id: ranganathan1933
    type: document
    title: Ranganathan, Colon Classification (1933)
  - id: ranganathan1967
    type: document
    title: Ranganathan, Prolegomena to Library Classification (1967)
  - id: hjorland-albrechtsen1995
    type: document
    title: Hjorland & Albrechtsen, Toward a New Horizon in Information Science: Domain-Analysis (1995)
  - id: hjorland2002
    type: document
    title: Hjorland, Domain Analysis in Information Science: Eleven Approaches (2002)
  - id: needham1937
    type: document
    title: Needham, Integrative Levels: A Revaluation of the Idea of Progress (1937)
  - id: feibleman1954
    type: document
    title: Feibleman, Theory of Integrative Levels (1954)
  - id: foskett1962
    type: document
    title: Foskett, The Classification Research Group, 1952–1962
  - id: dahlberg1978
    type: document
    title: Dahlberg, A Referent-Oriented, Analytical Concept Theory for INTERCONCEPT (1978)
  - id: ganter-wille1999
    type: document
    title: Ganter & Wille, Formal Concept Analysis: Mathematical Foundations (1999)
  - id: vickery1960
    type: document
    title: Vickery, Faceted Classification (1960)
  - id: belohlavek2004
    type: document
    title: Belohlavek, Concept lattices and order in fuzzy logic (2004)
see-also:
  - knowledge-representation-survey
  - upper-ontologies-as-predicate-vocabularies
---

The 20th-century knowledge-organization literature did not converge on one schema. It converged on a small number of *operative distinctions*, each owed to a different worker, each independently re-discovered by working librarians, classifiers, and theorists when their existing instrument failed on a real corpus. This essay walks the six distinctions that bear on the predicated framing, names what each contributes, and ends by stating what a knowledge system inherits from the line when it adopts the predication-cell as its substrate.

## 1. Faceted analysis (Ranganathan)

Ranganathan's *Colon Classification* (1933, with six editions through 1967) broke with enumerative classification — Dewey, LCC, UDC — by refusing to list every possible compound subject in a fixed schedule. Instead, every subject is *analysed* into a small set of fundamental facets that combine freely. The PMEST mnemonic — **Personality** (the focal entity), **Matter** (substance), **Energy** (action or process), **Space** (location), **Time** (period) — was Ranganathan's catalogue of fundamental categories. A subject like "the nitrogen cycle in tropical soils during the monsoon" decomposes into Personality (soil), Matter (nitrogen), Energy (cycling), Space (tropics), Time (monsoon) and the colon notation joins them into a composite class number.

The substantive theoretical move is twofold. First, *subjects are composite, not atomic* — they are built up from facets, not retrieved from a list. Second, *facets are orthogonal to domain* — the same five facets apply whether the domain is agriculture, medicine, or engineering. This is what allows the classification to absorb new subjects without revising the schedule: any new compound is just a new combination of pre-existing facet values.

Vickery (1960) extended Ranganathan's analysis from the single Colon Classification into a general *method* for constructing special classifications. Vickery's method became the working tool of the Classification Research Group (CRG) in London through the 1950s and 1960s, and the basis for the Bliss Bibliographic Classification, Second Edition.

## 2. Domain analysis (Hjorland & Albrechtsen)

Hjorland and Albrechtsen (1995) recast information science around the **domain** as its primary unit. A domain is "a body of knowledge, defined socially and theoretically as the knowledge of a group sharing ontological and epistemological commitments." Domains are not natural kinds; they are discourse communities held together by shared assumptions about what exists, what counts as evidence, and how knowledge is produced.

Hjorland (2002) catalogued eleven complementary approaches to domain analysis — literature guides, special classifications and thesauri, indexing and retrieval studies, empirical user studies, bibliometrics, historical studies, document and genre studies, epistemological and critical studies, terminological studies, scientific-communication structure, and AI/database semantics. No approach is sufficient on its own; together they are how a domain is *known* well enough to be classified for.

The decisive theoretical move: classification's schedule is *downstream of* the domain's discursive commitments, not a mirror of natural reality. Two communities working on overlapping subjects with different commitments need different schedules. The classifier's job is not to discover *the* taxonomy but to render *this community's* taxonomy operational.

## 3. Integrative levels (Needham, Feibleman, Foskett)

Needham (1937), Feibleman (1954), and Foskett (1961, 1962) formalised the idea that matter organises into successive **levels of integration** — atoms, molecules, cells, organisms, minds, societies, cultures — each integrating the components of the level below and exhibiting emergent qualities not present at the lower level. Feibleman gave twelve laws (each level organises the level below; each has at least one emergent quality; higher levels depend on lower; higher levels cannot be fully reduced to lower; etc.).

Foskett applied integrative levels to library classification: the natural order of knowledge follows the sequence of integrative levels (physics before chemistry before biology before sociology), not the administrative structure of universities. The CRG adopted integrative levels as the theoretical basis for a new general classification, though the full scheme was never completed.

Integrative levels supply the *vertical axis* of a knowledge organisation. Faceted classification supplies the *horizontal* decomposition within each level. Together they are a two-dimensional framework: levels order domains, facets analyse subjects within domains.

## 4. Concept theory (Dahlberg)

Dahlberg's INTERCONCEPT work (1974–1978) gave terminology science a precise account of the **concept** as a distinct unit of knowledge. A concept has three faces: a *referent* (what it picks out), a *predications-set* (the asserted properties), and a *designation* (the term that makes it communicable). Dahlberg's referent-oriented theory takes the referent as primary; the term and the predications-set are derivative — different communities can carry the same concept under different terms and different predications-sets.

The theoretical contribution: a concept is not a word and not a property, but a unit constituted by the predicates that hold of its referent. Two concepts are the same when the referent and the asserted properties match; two terms denote the same concept when they pick out the same referent under the same property-set. This is the predication-side definition of conceptual identity that the predication-cell substrate inherits directly.

## 5. Formal Concept Analysis (Wille, Ganter, Belohlavek)

Wille's 1982 introduction of FCA, consolidated in Ganter & Wille (1999), gave concept theory a precise mathematical instrument. The input is a **formal context** $(G, M, I)$: objects $G$, attributes $M$, and an incidence relation $I \subseteq G \times M$ recording which objects have which attributes. The derivation operators — for $A \subseteq G$, $A' = \{m \in M : g\,I\,m \text{ for all } g \in A\}$, dually for $B \subseteq M$ — form a Galois connection, and the closed pairs $(A, B)$ with $A' = B, B' = A$ are the **formal concepts**. They form a complete **concept lattice** under the natural ordering, and this lattice is the conceptual structure latent in the data.

Belohlavek (2004) generalised the construction to many-valued contexts where $I: G \times M \to L$ for a residuated lattice $L$. The concept lattice inherits $L$'s residuated structure; Wurm (2012) proved such concept lattices give complete semantics for the Lambek calculus. When $L$ is the four-element bilattice $\mathbf{2} \otimes \mathbf{2}$, the concept lattice tracks both positive and negative evidence per attribute and the resulting modal calculus is decidable. This is the bridge from FCA to the predicated framing: an FCA context with binary incidence is a degenerate predicated knowledge system whose value-domain has been collapsed from $\mathbf{2} \otimes \mathbf{2}$ to $\mathbf{2}$.

## 6. The BCG / CRG line as the working tradition

The British Classification Research Group (CRG) carried the working synthesis of facets and integrative levels through the 1950s–70s. The Bliss Bibliographic Classification, Second Edition (BC2), is the most complete realisation: domain order set by integrative levels, internal structure of each domain set by facet analysis, with strict orthogonality between domain and facet. BC2 is the only completed faceted general classification of the era and is the closest pre-predication-aware ancestor of what a predicated knowledge system organises by.

## 7. What predicated knowledge systems inherit from this line

Each of the six contributions becomes a structural commitment when the substrate is the predication-cell:

- **Facets become predicates.** Ranganathan's facets are not types of cell content; they are *predicates*. A facet $F$ is the [predicate fiber](../../../../../terms/predicate-fiber.md) of a predicate $p_F$ in the system. A subject's "Personality value" is the value of the cell $\langle s, p_{\mathrm{Personality}}, o \rangle$. The orthogonality of facets is the algebraic independence of fibers under pointwise composition; the freedom to combine facets is the substrate's ability to assemble compound subjects from predication patterns. Ranganathan's compound subject is a [predication-graph store](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/objects/predication-graph-store.md) sub-region.
- **Domains become discourse-community fibers.** Hjorland's domain is the [discourse-community-as-fiber](teaching/explanations/discourse-community-as-fiber.md) — a sub-system of the predication-cell space picked out by the predicate vocabulary the community admits and the closure rules it accepts. Domain-level disagreement becomes substrate disagreement: two communities with the same nominal predicate but different closure rules generate different fiber algebras. The eleven approaches of Hjorland (2002) are eleven *projections* of the same fiber, each named by its choice of measurement.
- **Integrative levels become a stratification of the predicate category.** Foskett's vertical sequence is a partial order on the predicate vocabulary: predicates of higher integrative levels are realised by predicates of lower levels via the predicate-category morphisms (specialisation, inversion, composition). The natural order of knowledge is the [predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md)'s order on the vocabulary's level structure.
- **Concepts become equivalence classes of predication patterns.** Dahlberg's referent-oriented concept is the equivalence class of predication patterns that pick out the same entity under the same predicate-set. Two terms denote the same concept when they participate in the same predications under the same closure. This is the [identity-by-relations](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline applied at the concept level.
- **Concept lattices become a degenerate special case of fiber algebra.** An FCA formal context is a predicated knowledge system whose value-domain is $\mathbf{2}$ (presence/absence) instead of $\mathbf{2} \otimes \mathbf{2}$ (positive/negative evidence). The concept lattice is the predicate fiber's lattice of active points under the Galois closure; in the bilattice case, this lattice is generalised to the [bilattice-valued allegory of relational composition](../../../../../texts/the-bilattice-valued-allegory-of-relational-composition.md) and the concept lattice becomes one Priestley-dual face of the substrate.
- **The BCG/CRG synthesis becomes the substrate's natural reading.** A predicated knowledge system organised around a stratified predicate category (integrative levels) with orthogonal predicate-fibers (facets) over a discourse-community-defined domain (Hjorland) and equivalence-class concept identity (Dahlberg) *is* a 21st-century BC2 — a finished faceted general classification, on a substrate that did not exist when the CRG was working.

The synthesis is not novel in any of its six commitments. Each commitment has a citable upstream source. The novelty is the substrate that makes them simultaneously honour-able: the predication-cell carries facets as predicates, domains as fibers, levels as predicate-category strata, concepts as predication-pattern equivalence classes, FCA as a degenerate value-domain, and BC2 as the natural reading of the result.
