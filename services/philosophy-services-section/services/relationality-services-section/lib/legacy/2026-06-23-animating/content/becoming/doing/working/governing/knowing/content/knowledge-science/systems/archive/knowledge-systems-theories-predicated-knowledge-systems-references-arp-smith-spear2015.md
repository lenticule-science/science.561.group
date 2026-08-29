---
type: reference
authors: [Arp, Robert, Smith, Barry, Spear, Andrew D.]
year: 2015
title: "Building Ontologies with Basic Formal Ontology"
venue: "MIT Press"
---

## Full citation

R. Arp, B. Smith, A. D. Spear. *Building Ontologies with Basic Formal Ontology.* MIT Press, Cambridge, MA, 2015.

## Status

Pending direct re-read; covered via the [upper-ontologies-as-predicate-vocabularies](../texts/upper-ontologies-as-predicate-vocabularies.md) survey.

## Annotation

The standard textbook on Basic Formal Ontology (BFO), the most widely deployed top-level ontology in biomedicine (foundation of OBO Foundry, OBI, GO, etc.). BFO's signature commitment is the *continuant / occurrent* dichotomy: every entity is either a *continuant* (persists through time, maintaining identity — objects, qualities, dispositions, sites) or an *occurrent* (unfolds in time — processes, process-boundaries, temporal regions). Within continuants BFO further distinguishes *independent continuants* (substances) from *specifically dependent continuants* (qualities) and *generically dependent continuants* (information artefacts). Within occurrents the central distinction is *process* vs. *process-boundary*.

The predicated framing reads BFO as a *level-stratification of the predicate-category* rooted in a single binary cut (continuant/occurrent). Each BFO category is a sub-vocabulary of predicates, and the BFO upper-level axioms are *closure rules* governing which combinations of predicates can co-apply to the same subject (e.g., a quality cannot bear another quality directly; only continuants can be the bearer of qualities). The [predicate-category-stratification](teaching/explanations/predicate-category-stratification.md) concept names this structurally: BFO is one *choice* of stratification of the predicate category, comparable in role to (but different in cut from) DOLCE and SUMO.

The framing's structural claim about BFO: the continuant/occurrent split is *not a metaphysical universal* but a fibration choice well-suited to biomedical knowledge organisation, where temporal persistence of clinical entities matters and process-boundary events (diagnosis, surgery, death) need to be first-class. Other domains (sociology, computation) may benefit from different cuts.

## Where used

- [upper-ontologies-as-predicate-vocabularies](../texts/upper-ontologies-as-predicate-vocabularies.md)
- [upper-ontology-as-predicate-vocabulary](../objects/upper-ontology-as-predicate-vocabulary.md)
- [predicate-category-stratification](teaching/explanations/predicate-category-stratification.md)
