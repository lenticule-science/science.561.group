---
title: "Upper ontologies as predicate vocabularies — BFO, DOLCE, SUMO, Cyc re-read through the predicated framing"
date-created: 2026-05-02
description: "An extension of upper-ontologies-and-knowledge-organization into the predicated framing. BFO, DOLCE, SUMO, and Cyc are re-read as choices of predicate vocabulary on the substrate, with continuant/occurrent and quality/abstract becoming named regimes of the predicate category."
extends:
  - upper-ontologies-and-knowledge-organization
references:
  - id: arp-smith-spear2015
    type: document
    title: Arp, Smith & Spear, Building Ontologies with Basic Formal Ontology (2015)
  - id: masolo-et-al2003
    type: document
    title: Masolo et al., WonderWeb Deliverable D18: Ontology Library (2003)
  - id: niles-pease2001
    type: document
    title: Niles & Pease, Towards a Standard Upper Ontology (2001)
  - id: lenat-guha1990
    type: document
    title: Lenat & Guha, Building Large Knowledge-Based Systems (1990)
  - id: sowa2000
    type: document
    title: Sowa, Knowledge Representation (2000)
see-also:
  - knowledge-organization-survey
  - knowledge-representation-survey
  - process-ontology-and-situated-learning
---

The parent text [upper-ontologies-and-knowledge-organization](../../../texts/upper-ontologies-and-knowledge-organization.md) established the structural finding: every major upper ontology — BFO, DOLCE, SUMO, Cyc — divides reality by **mode of being**, never by topic or discipline. This essay picks up where that text leaves off and re-reads the four upper ontologies through the predicated framing. The re-reading is not a re-statement of upper-ontology content; it is the structural translation of "upper ontology" from "list of top-level categories" into **choice of predicate vocabulary on the substrate**.

## 1. The translation principle

A predicated knowledge system is parameterised by its [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) — the category whose objects are the predicates the system admits and whose morphisms are the predicate-level relationships (specialisation, inversion, composition, fusion). Choosing an upper ontology *is* choosing a predicate category: the upper ontology's top-level distinctions become the substrate's most-refined predicate-stratum, and the upper ontology's mid-level and lower-level vocabularies become the predicate-category's morphism structure relating refined predicates back to the top-level distinctions.

Continuant/occurrent (BFO), endurant/perdurant (DOLCE), physical/abstract (SUMO), and Cyc's microtheory partition all become **regimes of the predicate category** — substructures of the category that admit different closure-rule languages. A predicated knowledge system can run different regimes simultaneously over the same entity set: an entity admits both continuant predications (about its persistent qualities) and occurrent predications (about events it participates in), evaluated under the substrate's bilattice value-domain in both regimes.

## 2. BFO as a two-regime predicate category

BFO's top-level distinction — **continuant** vs. **occurrent** — becomes a partition of the predicate vocabulary into two regimes:

- The **continuant regime** is the sub-category of predicates whose subjects and objects are entities that persist through time and maintain identity across cells. Predications in this regime carry values whose closure is monotone in $\leq_k$: positive evidence accumulates as the entity is observed across time. The closure-rule system for the continuant regime is typically Scott-continuous (per the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)) — the standard regime for substrates that integrate multi-time-step observations.
- The **occurrent regime** is the sub-category of predicates whose subjects and objects are events, processes, or temporal regions. Predications in this regime carry values about *what happens*, not *what is*. The closure-rule system for the occurrent regime typically requires temporal closure rules (events have causal antecedents and consequences) and can land in the transfinite-bounded regime when chains of causation extend across countably many event-stages.

BFO's 36-class top-level vocabulary is the substrate's **predicate-category schema**: each BFO class is a top-level predicate (or a small family of related predicates), and BFO's relation taxonomy (`bfo:has_part`, `bfo:participates_in`, `bfo:realizes`, etc.) is the **morphism structure** of the predicate category. The BFO-extended substrate is what an instrumented working knowledge system gets when its predicate vocabulary is constrained to the BFO upper-level — the substrate's content is then guaranteed to participate in BFO-style ontological reasoning without separate axiom layers.

The decisive structural feature: BFO's continuant/occurrent split *is* the substrate's predicate-category being equipped with two named sub-regimes, and the substrate's [bilattice-valued allegory](../../../../../texts/the-bilattice-valued-allegory-of-relational-composition.md) gives the relation calculus that holds across the split. BFO's `participates_in` predication relating a continuant to an occurrent becomes a substrate predication whose value tracks the strength of evidence for the participation, evaluated under the substrate's standard closure.

## 3. DOLCE as a four-regime predicate category

DOLCE's four top-level categories — **endurants**, **perdurants**, **qualities**, **abstracts** — give a finer-grained partition than BFO's two-regime split. The predicated translation is direct:

- **Endurant regime**: same as BFO's continuant regime; predications about objects that are wholly present at each moment.
- **Perdurant regime**: same as BFO's occurrent regime; predications about processes that extend through time.
- **Quality regime**: predications about *individual property instances* — the redness of *this* tomato, the mass of *this* electron, not redness or mass in general. The quality regime's predicates have their own subjects (the quality instance) distinct from the entity that bears them. The substrate represents this with predicate-category morphisms relating quality predicates to inherence predicates (`dolce:inheres_in` connecting a quality to its bearer).
- **Abstract regime**: predications about non-spatiotemporal entities — sets, regions, propositions, mathematical structures. Predicates in this regime relate abstracts to other abstracts (set membership, region containment) or to non-abstract entities (a region is the spatial location of an endurant, a proposition is what an endurant believes).

DOLCE's cognitive bias — its commitment to capturing the ontological categories implicit in natural language and human cognition — translates into the substrate as a **predicate-category schema chosen for cognitive interoperability**: the substrate's content is structured so that human-language descriptions of the world map to substrate predications without re-conceptualisation. This is what a predicated knowledge system gains by adopting DOLCE: the substrate's closure rules align with human cognitive expectations, making the closure's outputs explainable to human users without translation.

## 4. SUMO as a pragmatic predicate-category merge

SUMO's top-level distinction (physical / abstract, with processes as physical sub-class) is similar to DOLCE's but engineered for merge with WordNet and with prior upper ontologies (Niles & Pease 2001 documents the merge methodology). SUMO's roughly 1,000 top-level terms and 20,000+ mid-level and domain terms form a much larger predicate-category schema than BFO or DOLCE — it is the schema for a substrate that wants out-of-the-box vocabulary for many domains rather than a minimalist top.

The predicated translation makes SUMO's pragmatism explicit: SUMO chooses *category density* over *category parsimony*. The substrate gains a richer predicate category at the cost of less crisp regime boundaries — the line between SUMO's `Physical` and `Abstract` is less load-bearing than BFO's continuant/occurrent split because SUMO admits hybrids (a `ContentBearingObject` is physical-with-abstract-content). For a predicated knowledge system optimised for breadth over depth, SUMO is the natural predicate-category schema.

## 5. Cyc as a context-fibred predicate category

Cyc's distinguishing architectural choice is the **microtheory** — a modular, context-specific knowledge base that may contain assertions inconsistent with assertions in other microtheories. Cyc's `inMicrotheory` relation parameterises every assertion: an assertion holds *in* a particular context, and inferences cross context boundaries only via explicit context-lift operators.

The predicated translation: Cyc's microtheories are the substrate's [scopes](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/objects/scope-record.md). The substrate's scope discipline is *exactly* the microtheory pattern — each scope carries its own active closure-rule subset, its own active predicate vocabulary, and its own consistency commitments. A predication is asserted in a scope, evaluated under the scope's rules, and visible to traversals that cite the scope. Cross-scope assertions require explicit operator (the substrate's federation join, or the agential-orchestration-platform's authorization-gated cross-scope read).

Cyc's contribution to the predicated framing is the *acknowledgement that no single microtheory is correct* — different contexts have different commitments, and a working knowledge system carries the context as substrate content. The substrate's scope discipline is the engineering surface of Cyc's microtheory architecture; the substrate's [scope-as-predication](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/narratives/scope-as-predication.md) narrative documents the structural correspondence.

## 6. What the four upper ontologies become together

A predicated knowledge system can adopt any one of the four as its predicate-category schema, or it can stratify its predicate category by composition: the top-level partition by BFO's continuant/occurrent (broadest possible), refined by DOLCE's quality/abstract distinctions (cognitive interoperability), populated by SUMO's domain vocabulary (breadth), with Cyc-style microtheory scopes for context-dependent regions (consistency-aware multi-source federation). The substrate does not require choosing one upper ontology; the predicate category admits the union as long as the morphism structure is well-defined across the union.

The structural finding the parent text established — that no upper ontology lists academic departments as top-level categories — gains its substrate-level explanation: disciplines are *not* predicates. Disciplines are [discourse communities](../../../terms/domain-analysis.md), and each discourse community admits a *different* predicate vocabulary (see [knowledge-organization-survey](knowledge-organization-survey.md) §2). The upper ontology supplies what the discourse communities *share* — the modes of being that any community must reckon with — while the per-domain predicate vocabularies supply what each community is *about*. Both live as substrate content; the upper ontology is one stratum of the predicate category, the per-domain vocabulary is another.

## 7. What the predicated framing adds to the upper-ontology line

The four upper ontologies as published agree on the following structure:

- A small set of top-level distinctions by mode of being.
- A relation taxonomy connecting top-level categories.
- A growing mid-level and domain vocabulary.

What they do not share is a single substrate that all four can be evaluated against. BFO is OWL-axiomatised; DOLCE has multiple axiomatisations (D&S, DnS); SUMO is in SUO-KIF; Cyc is in CycL. Each upper ontology comes with its own logical apparatus, and translating an assertion between them requires not just predicate renaming but engine swap.

The predicated-knowledge-systems substrate dissolves this. All four upper ontologies become predicate-category schemas on the same substrate. The substrate's bilattice value-domain, its closure-rule discipline, its predication-fibration, and its four-regime classification are shared across whatever upper ontology the substrate adopts. The upper-ontology choice fixes the predicate vocabulary; the substrate machinery is invariant.

This is the substantive structural addition the predicated framing makes to the upper-ontology line. The four upper ontologies were prior art for *what kinds of things exist*. The substrate is prior art for *what kind of mathematical object an arbitrary knowledge system is*. The two are orthogonal contributions that compose: a predicated knowledge system with a BFO predicate vocabulary is BFO-as-a-running-substrate; the same with DOLCE is DOLCE-as-a-running-substrate; the same with both stratified is BFO-and-DOLCE-as-a-stratified-substrate. The substrate is what was missing from the upper-ontology toolkit.

## 8. The discipline question, restated

The parent text observed that disciplines do not appear as top-level categories in any upper ontology, and posed the choice for knowledge libraries: organise by domain (following library tradition) or by ontological category (following upper ontologies). The predicated framing dissolves the choice: a predicated knowledge system organises *both ways simultaneously*. The predicate category is stratified by ontological category (the upper ontology); the entity set is fibered by discourse community (the domain). Domain-specific predicates live in the predicate category; domain-specific entities live in domain-specific scopes. The upper-ontology stratification governs what the predicates *are*; the domain fibration governs which entities *use* them.

Library classification gets both: the shelf order can follow integrative levels (per [integrative-levels](../../../terms/integrative-levels.md)) and the within-shelf decomposition can follow facets (per [faceted-classification](../../../terms/faceted-classification.md)), with the substrate guaranteeing that both views are projections of the same substrate content. The substrate is what makes "organise by domain *and* organise by ontology" coherent rather than competing.
