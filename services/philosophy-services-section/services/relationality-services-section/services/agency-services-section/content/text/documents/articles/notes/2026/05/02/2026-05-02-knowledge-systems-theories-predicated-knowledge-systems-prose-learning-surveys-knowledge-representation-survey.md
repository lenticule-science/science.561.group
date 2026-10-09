---
title: "Knowledge Representation, from RDF to property graphs — substrate choices in contrast"
date-created: 2026-05-02
description: "A synthesis of the upstream knowledge-representation literature (RDF/RDFS/OWL, description logics, Topic Maps, Sowa's conceptual graphs, Datalog/Prolog, Brachman & Levesque, property graphs) read against the predication-cell choice — what each system commits to and how those commitments correspond to engineering decisions in predicated-computing."
references:
  - id: hayes-patelschneider2014
    type: document
    title: Hayes & Patel-Schneider, RDF 1.1 Semantics (W3C 2014)
  - id: baader-et-al2003
    type: document
    title: Baader, Calvanese, McGuinness, Nardi, Patel-Schneider, Description Logic Handbook (2003)
  - id: iso13250-2003
    type: document
    title: ISO/IEC 13250:2003 — Topic Maps
  - id: sowa2000
    type: document
    title: "Sowa, Knowledge Representation: Logical, Philosophical, Computational Foundations (2000)"
  - id: brachman-levesque2004
    type: document
    title: Brachman & Levesque, Knowledge Representation and Reasoning (2004)
  - id: abiteboul-hull-vianu1995
    type: document
    title: Abiteboul, Hull, Vianu, Foundations of Databases (1995)
  - id: angles-et-al2017
    type: document
    title: Angles et al., Foundations of Modern Query Languages for Graph Databases (2017)
  - id: ganter-wille1999
    type: document
    title: "Ganter & Wille, Formal Concept Analysis: Mathematical Foundations (1999)"
  - id: shapiro-rapaport2011
    type: document
    title: Shapiro, Rapaport et al., on SNePS / propositional graphs
see-also:
  - knowledge-organization-survey
  - predication-logic-through-knowledge-systems
---

Knowledge representation in the 1990s and 2000s split into seven nearly-disjoint engineering programs, each making a different choice about what the storage unit *is*, what the value-domain is, and what the inferential closure does. This essay walks the seven choices, contrasts each with the predication-cell choice that the predicated-knowledge-systems subtheory commits to, and names which engineering decisions in [predicated-computing](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md) correspond to which prior-art lineage.

## 1. RDF / RDFS / OWL

RDF (W3C 2004; Hayes & Patel-Schneider 2014 for RDF 1.1) takes the storage unit to be the **triple** $(s, p, o)$ — subject, predicate, object — where each component is an IRI (or, for objects, a literal or a blank node). The value-domain is implicit: a triple is either *in* the graph or *not in* it. This is the binary value-domain $\mathbf{2}$. RDF Schema adds class hierarchies and predicate domain/range; OWL (W3C 2012) adds description-logic axioms turning the graph into a knowledge base with formal inference.

The substrate choice: triples-as-storage-unit, $\mathbf{2}$-as-value-domain, monotonic-entailment-as-closure. The closure is the RDF/OWL deductive closure — every triple entailed by the axioms.

Contrast with the predicated-knowledge-systems substrate: the storage unit is the same (predication-cell ≅ RDF triple), but the value-domain is $\mathbf{2} \otimes \mathbf{2}$ (positive and negative evidence on independent channels) instead of $\mathbf{2}$. RDF cannot say "the patient is asserted both as allergic and as not-allergic" — the triple is either present or absent. The bilattice substrate distinguishes $t$ (asserted), $f$ (denied), $\bot$ (unattested), and $\top$ (contested), and admits closure rules that propagate the contestation. The OWL-style description-logic closure becomes one [closure-rule language](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) among several admitted by the substrate; the substrate is value-domain-richer but does not lose the OWL fragment that admits monotonic interpretation.

The engineering correspondence is the [predicated-computing knowledge-graph correspondence narrative](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/narratives/correspondences-with-knowledge-representation.md): the substrate's content is an RDF graph by construction, with provenance built in (witnesses replace separate provenance graphs), federation built in (substrate algebra replaces SPARQL federation), and access control built in (scope replaces named-graph context).

## 2. Description logics

Description logics (Baader et al. 2003) form a family of decidable fragments of first-order logic engineered for terminological reasoning. The substrate is the **TBox** (terminological axioms about concepts and roles) plus the **ABox** (assertions about individuals). The value-domain is $\mathbf{2}$; the closure is description-logic entailment, with decidability and complexity bounds (e.g., $\mathcal{ALC}$ is ExpTime-complete, $\mathcal{SROIQ}$ is N2ExpTime-complete).

What description logics get right: the *predicate vocabulary itself* is a first-class object — concept inclusions, role hierarchies, inverse and transitive role declarations are part of the TBox, not external schema. This is structurally what [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) calls for in predicated-computing: the predicate vocabulary is substrate content.

What description logics constrain: the value-domain is $\mathbf{2}$; multi-source disagreement is not representable; the closure language is fixed by the chosen DL fragment (you choose $\mathcal{ALC}$ or $\mathcal{SROIQ}$ at design time, not per assertion). The predicated framing relaxes both: the value-domain is $\mathbf{2} \otimes \mathbf{2}$ and the closure-rule system is an admissible-rule-set that the substrate carries as content rather than a fixed DL fragment baked into the engine.

The engineering correspondence is the substrate's [closure-rule discipline](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/closure-rule.md): a closure rule is a substrate entity, declared with a finite radius and deterministic match-and-conclude semantics. Description-logic axioms are one closure-rule encoding among several admitted.

## 3. Topic Maps (ISO/IEC 13250)

Topic Maps (ISO/IEC 13250:2003, building on Pepper's 1996 work) take the storage unit to be the **topic** — an entity standing for a *subject* (a real-world or conceptual referent) — together with **associations** (typed n-ary relations among topics) and **occurrences** (links from topics to information resources). Each topic carries a *subject identifier* (IRI of the subject's identity) distinct from the *resource identifier* (IRI of the document about the subject). The substrate explicitly separates *what the topic is about* (the subject) from *where the document is* (the resource).

Topic Maps' decisive contribution is the **subject identifier**: identity is by *what* the topic refers to, not by syntactic position. Two topic maps merge by topic-identity: when two maps name the same subject under any subject identifier they share, the merged map carries one topic for that subject with associations from both. This is operationally the predicated-knowledge-systems substrate's [identity-by-relations](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline, with the merge corresponding to the substrate's federation join.

The predicated framing absorbs Topic Maps as a near-cousin: topics are entities with identity-predications, associations are predication cells (or, for n-ary associations, [n-ary predication](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/n-ary-predication.md) cells), occurrences are predications relating topics to documents. The bilattice value-domain extends Topic Maps' implicit binary semantics — a topic-map merge that produces conflicting associations becomes a $\top$-valued cell in the substrate, instead of the silent loss-of-information that Topic Maps' merge produces.

## 4. Conceptual graphs (Sowa)

Sowa's conceptual graphs (Sowa 1984; Sowa 2000 for the textbook treatment) take the storage unit to be the **concept node** — labelled with a concept type and an optional referent — connected by **conceptual relations** which are themselves typed nodes. A graph is a bipartite structure: concept nodes alternating with relation nodes. The value-domain is $\mathbf{2}$ (a graph either holds or does not); the closure is a peano-style projection-and-restriction calculus equivalent to first-order logic.

What conceptual graphs get right: relations are first-class entities with their own arity and their own type hierarchy. Sowa's relation types include the case-grammar relations (Agent, Patient, Theme, Instrument, Location) which are the linguistic-philosophy ancestor of what Ranganathan called PMEST and what predicated-knowledge-systems calls a [stratified predicate vocabulary](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/upper-ontology-as-predicate-vocabulary.md).

Conceptual graphs are reflected in the substrate as: concept nodes ≅ entities with type-predications, relation nodes ≅ predicates (or, for n-ary, n-ary-predication cells), the projection calculus ≅ a closure-rule language. Sowa's graph is a $\mathbf{2}$-valued predicated knowledge system with a particular choice of n-ary admission discipline.

## 5. Datalog and Prolog

Datalog (the function-symbol-free fragment of Prolog; Abiteboul, Hull, Vianu 1995) takes the storage unit to be the **fact** $p(t_1, \ldots, t_n)$ — an atomic predicate applied to terms — together with **rules** $p(t) \,{:\!\!-}\, q_1(t_1), \ldots, q_n(t_n)$ that derive new facts from existing ones. The value-domain is $\mathbf{2}$; the closure is the **least Herbrand model** computed by bottom-up evaluation of the rules to fixpoint. Datalog has polynomial-time data complexity and admits efficient evaluation strategies (semi-naive, magic sets).

Datalog is the prior art for the predicated framing's [closure-driven settling](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) discipline: the substrate's settlement is bottom-up rule evaluation to fixpoint, with the bilattice generalisation supplied by Fitting (1991) for paraconsistent Datalog. Where Datalog computes a least Herbrand model under $\mathbf{2}$, the substrate computes a least bilattice-valued model under $\mathbf{2} \otimes \mathbf{2}$ — Fitting's bilattice fixpoint semantics is the direct mathematical antecedent. Where Datalog falls into the [Scott-continuous regime](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) of the four-regime classification, Prolog with negation-as-failure can land in the strict regime, and stratified Datalog with arithmetic in the transfinite-bounded regime.

The engineering correspondence is the substrate's [closure-rule application](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md) operator: the substrate-level instance of one Datalog rule firing.

## 6. Brachman & Levesque on KR&R

Brachman and Levesque's *Knowledge Representation and Reasoning* (2004) is the textbook synthesis of the earlier KR programs (KL-ONE, FRAMES, semantic networks, default logic). Their organising thesis: **knowledge representation is the use of formal symbols to stand for some body of propositions, plus a reasoning procedure that is sound and complete for the represented theory**. They distinguish *epistemic* representation (what a knower believes) from *ontological* representation (what is the case), and they catalogue the engineering trade-offs (expressiveness vs. tractability).

The predicated framing keeps Brachman & Levesque's epistemic/ontological distinction structurally: the bilattice value-domain encodes the epistemic side directly ($t$, $f$, $\bot$, $\top$ are *epistemic* states of a knower), while the cell coordinates $(s, p, o)$ are *ontological* references to entities and predicates in the world. The expressiveness/tractability trade-off becomes the four-regime classification: the choice of closure-rule language fixes the regime, which fixes both the expressiveness (which subsets of countable limit ordinals are realisable as firing sets) and the tractability (decidability survives the strict and Scott-continuous regimes; transfinite-bounded and aperiodic regimes give up decidability for expressiveness).

## 7. Property graphs

Property graphs (Angles et al. 2017 for the foundational survey) take the storage unit to be the **labelled node with key-value attributes** and the **labelled edge with key-value attributes**. Cypher and Gremlin are the canonical query languages; Neo4j and TigerGraph the canonical implementations. The value-domain is implicit and varied: nodes and edges either exist or don't, but their attributes carry typed values from arbitrary domains.

Property graphs trade away the predicate-as-first-class commitment that RDF, description logics, Topic Maps, conceptual graphs, and Datalog all share. An edge label in a property graph is a string, not a node — there is no native way to say "the edge label `cites` has these axioms" without re-encoding the schema as additional graph content. Property graphs gain ergonomic schema flexibility and lose semantic anchoring.

The predicated framing makes the contrasting commitment: predicates are entities, predicate vocabulary is substrate content, and predicate-level reasoning (the predicate category's morphisms — specialisation, inversion, composition) is substrate operation. A property graph is a degenerate predicated knowledge system whose predicate vocabulary has been collapsed into edge-label strings; recovering the semantic anchoring requires re-introducing the predicate-category structure as out-of-band metadata, at which point the substrate is a worse RDF.

## 8. SNePS and the propositional-graph lineage

The SNePS network (Shapiro et al. 1979 onward; Shapiro, Rapaport et al. 2011 for the modern treatment) takes the storage unit to be the **propositional node** — a node *for each proposition*, asserted or not. Every assertion is reified; reasoning is over nodes-as-propositions. SNePS was the canonical experimental platform for the propositional-attitudes side of KR (belief, desire, intention).

SNePS is the prior art for the predicated framing's reification discipline: every closure-rule application produces a witness, every witness is a substrate entity, every substrate entity admits propositional attitudes (an agent can carry the predication "agent believes witness W"). The substrate's [witness](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/witness.md) discipline takes SNePS' reification and grounds it in the bilattice value-domain.

## 9. Formal Concept Analysis

FCA (Ganter & Wille 1999) is the subject of the companion subtheory [`formal-concept-analysis/`](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/formal-concept-analysis). Re-stated through the KR lens: FCA's [formal context](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/formal-concept-analysis/objects/formal-context.md) is a $\mathbf{2}$-valued predicated knowledge system with no closure rules, whose [concept-lattice](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/concept-lattice.md) extraction is the substrate's [Galois-closure operator](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) restricted to the trivial closure-rule system. Belohlavek's residuated-lattice-valued generalisation (per the companion's [residuated-context](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/formal-concept-analysis/objects/residuated-context.md) and [belohlavek-bridge](../../../../../../glossary/concepts/belohlavek-bridge.md)) extends to bilattice-valued contexts that the substrate carries natively. The full structural correspondence is developed in the companion's [fca-against-the-predicated-substrate](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/formal-concept-analysis/texts/fca-against-the-predicated-substrate.md).

## 10. What predicated knowledge systems inherit

The seven systems' commitments correspond to seven engineering decisions in [predicated-computing](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md):

| Prior-art system | Substrate choice it makes | Predicated-knowledge-systems analogue | Engineering correspondence |
|---|---|---|---|
| RDF/OWL | Triple, $\mathbf{2}$, monotonic-entailment | Predication-cell, $\mathbf{2}\otimes\mathbf{2}$, closure-rule system | [knowledge-graph correspondence](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/narratives/correspondences-with-knowledge-representation.md) |
| Description logics | TBox+ABox, fixed DL fragment | Predicate-vocabulary as substrate content; admissible closure-rule-language | [closure-rule](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/closure-rule.md), [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) |
| Topic Maps | Topic+Association+Occurrence with subject identifier | Entity+predication-cell with identity-by-relations | [identity-by-relations](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md), substrate federation |
| Conceptual graphs | Concept+Relation bipartite, FOL-equivalent projection | Entity+predicate, n-ary admitted, $\mathbf{2}\otimes\mathbf{2}$-valued | [n-ary-predication](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/n-ary-predication.md) |
| Datalog/Prolog | Fact+Rule, least Herbrand model | Predication-cell+closure-rule, predication settling | [closure-rule-application](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md) |
| Brachman-Levesque KR&R | Epistemic/ontological split, expressiveness/tractability | Bilattice values (epistemic), cell coordinates (ontological), four-regime (expressiveness/tractability) | [four-regime classification](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) |
| Property graphs | Labelled-node+labelled-edge with attributes | Predication-cell with predicate-category structure | (not directly inherited; see §7 critique) |
| SNePS | Propositional-node, reified assertions | Witness-as-substrate-entity, reified closure-application | [witness](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/witness.md) |
| FCA | Formal context, Galois closure | Predication-fiber-algebra, closure-operator | [predicate-fiber](../../../../../../../../../../../../../information-science-services-section/content/text/glossary/terms/predicate-fiber.md), [from-data-tables-to-concept-lattices](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/teaching-articles/explanations/from-data-tables-to-concept-lattices.md) |

The substrate is not a successor of any one of these. It is the synthesis: predicate-as-first-class (from RDF/OWL/DL/CG/Datalog), identity-by-reference-not-position (from Topic Maps), closure-by-rule-system-as-content (from Datalog and DL), reification-of-derivations (from SNePS), Galois-closure-on-attribute-fibers (from FCA), and bilattice-valued-evidence (from Belnap → Fitting → Busaniche-Cignoli, the line covered in [predication-logic-through-knowledge-systems](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/predication-logic-through-knowledge-systems.md)). What none of the prior-art systems individually offer is the *combination* — and the combination is what predicated-knowledge-systems names.
