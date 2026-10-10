---
type: reference
authors: [Niles, Ian, Pease, Adam]
year: 2001
title: "Towards a Standard Upper Ontology"
venue: "Proceedings of the 2nd International Conference on Formal Ontology in Information Systems (FOIS), 2–9"
---

## Full citation

I. Niles, A. Pease. "Towards a Standard Upper Ontology." In *Proceedings of the 2nd International Conference on Formal Ontology in Information Systems (FOIS)*, 2–9, 2001.

## Status

Pending direct re-read; covered via the [upper-ontologies-as-predicate-vocabularies](../texts/upper-ontologies-as-predicate-vocabularies.md) survey.

## Annotation

The introduction of the *Suggested Upper Merged Ontology* (SUMO), an attempt to merge multiple existing upper ontologies (Sowa's, Russell-Norvig's, ITBM-CNR's, etc.) into a single open-source standard expressed in SUO-KIF (Standard Upper Ontology Knowledge Interchange Format). SUMO's distinctive choice is to ground the upper ontology in a *single root concept* (Entity) and elaborate a single tree of subclasses, with axioms governing each subclass relation. SUMO also commits to *higher-order reasoning* through its KIF substrate (relations may take relations as arguments).

For the predicated framing, SUMO is a contrasting choice to BFO and DOLCE: rather than committing to a binary level-cut (continuant/occurrent or endurant/perdurant), SUMO commits to a *single rooted subclass tree* with rich axiomatic content. In framing terms, this is the choice to make the predicate-category's level-stratification *fully tree-shaped* rather than *binary-cut-then-elaborated*. The [predicate-category-stratification](teaching/explanations/predicate-category-stratification.md) concept covers both options: a tree-stratification is just a different fibration index than a binary-cut stratification, and both are admissible.

SUMO's commitment to higher-order reasoning is structurally more demanding than BFO/DOLCE: the framing reads it as committing the closure regime to be at least *aperiodic* (or otherwise non-Scott-continuous), since higher-order axioms cannot in general be expressed as monotone immediate-consequence rules. The [four-group-register-as-regime](../theorems/four-group-register-as-regime.md) theorem locates SUMO in the most-expressive corner of the regime classification.

## Where used

- [upper-ontologies-as-predicate-vocabularies](../texts/upper-ontologies-as-predicate-vocabularies.md)
- [upper-ontology-as-predicate-vocabulary](../objects/upper-ontology-as-predicate-vocabulary.md)
- [four-group-register-as-regime](../theorems/four-group-register-as-regime.md)
