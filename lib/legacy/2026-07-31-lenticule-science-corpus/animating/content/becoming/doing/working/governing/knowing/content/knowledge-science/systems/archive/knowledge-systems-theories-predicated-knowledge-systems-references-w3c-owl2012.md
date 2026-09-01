---
type: reference
authors: ["W3C OWL Working Group"]
year: 2012
title: "OWL 2 Web Ontology Language Document Overview"
venue: "W3C Recommendation, 2nd ed."
---

## Full citation

W3C OWL Working Group. *OWL 2 Web Ontology Language Document Overview.* W3C Recommendation, 2nd ed., 2012.

## Status

Pending direct re-read; covered via the [knowledge-representation-survey](../texts/knowledge-representation-survey.md) and the description-logic literature.

## Annotation

The W3C standard defining OWL 2, the second-generation Web Ontology Language. OWL 2 layers a description-logic semantics on top of RDF: classes (unary predicates), object properties (binary predicates between individuals), data properties (binary predicates from individuals to literals), with axioms for subsumption, equivalence, disjointness, property hierarchies, property characteristics (transitive, symmetric, functional, inverse-functional), and class constructors (intersection, union, complement, restriction). Three syntactic profiles — OWL 2 EL, OWL 2 QL, OWL 2 RL — trade expressivity for tractability of canonical reasoning tasks.

For the predicated framing, OWL 2 is the canonical *closure-rule-system over an RDF substrate*: the OWL 2 axioms are precisely the closure rules that fire over RDF triples to produce the OWL-derived consequences. The three profiles correspond to three regime choices: OWL 2 EL is a strict regime (polynomial-time classification, suited to large biomedical ontologies), OWL 2 QL is a strict regime tuned for query rewriting, OWL 2 RL is a Scott-continuous regime expressible as Datalog rules. The [four-group-register-as-regime](../theorems/four-group-register-as-regime.md) theorem subsumes the OWL profiles as instances of regime choice.

The framing recovers OWL 2 as the description-logic *closure-rule signature* over an RDF substrate, with the same three structural restrictions as RDF (no bilattice value-domain, no algebraic federation, externally-applied closure). The framing's improvement over OWL is bilattice-valuation: where OWL must treat contradiction (e.g., `Punning` and inconsistency repair) as an external repair task, the bilattice substrate handles contradiction algebraically as a $\top$ value that propagates by closure rather than terminating reasoning.

## Where used

- [knowledge-representation-survey](../texts/knowledge-representation-survey.md)
- [four-group-register-as-regime](../theorems/four-group-register-as-regime.md)
- [closure-as-fitting-fixpoint](../theorems/closure-as-fitting-fixpoint.md)
