---
type: reference
authors: [Angles, Renzo, Arenas, Marcelo, Barceló, Pablo, Hogan, Aidan, Reutter, Juan, Vrgoč, Domagoj]
year: 2017
title: "Foundations of Modern Query Languages for Graph Databases"
venue: "ACM Computing Surveys 50(5), 1–40"
description: R.
---

## Full citation

R. Angles, M. Arenas, P. Barceló, A. Hogan, J. Reutter, D. Vrgoč. "Foundations of Modern Query Languages for Graph Databases." *ACM Computing Surveys* 50(5), 1–40, 2017.

## Status

Pending direct re-read; covered via the [knowledge-representation-survey](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-representation-survey.md) and follow-up papers (Hogan et al., 2021).

## Annotation

A comprehensive survey of graph-database query languages: the property-graph model (nodes and edges with key–value attributes), the RDF model (triples with optional named graphs), and the family of query languages that have grown up around them (Cypher, SPARQL, Gremlin, GraphQL, the emerging GQL standard). The paper compares the languages along expressivity, complexity, and the patterns each supports natively (regular path queries, conjunctive queries, optional matching, aggregation).

The predicated framing reads property graphs and RDF as two substrates that are *both* recoverable from the predication-cell, with different restrictions: RDF restricts to ternary predication-cells (subject–predicate–object) with implicit value $\mathbf{t}$; property graphs allow attribute-bearing nodes and edges, recoverable as ternary cells *plus* an attribute-fiber over each node and edge identity. Neither carries the bilattice value-domain natively, so neither can express "asserted-positive-only", "asserted-both" (contradictory), or "asserted-negative-only" without auxiliary machinery (RDF+OWL's *negative property assertions*, property-graph application-layer convention).

The query-language survey is the load-bearing reference for the framing's claim that *querying is closure under a query-shaped closure-rule signature*: a SPARQL basic graph pattern is a conjunctive closure rule whose head is the query's variable binding; a Cypher path query is a regular-language closure rule. The [closure-as-fitting-fixpoint](../../../glossary/concepts/closure-as-fitting-fixpoint.md) theorem then characterises which query languages have terminating fixpoint semantics (those whose rule-system is in the strict or Scott-continuous regime) and which require transfinite or aperiodic semantics (e.g., recursive Cypher with arbitrary path predicates).

## Where used

- [knowledge-representation-survey](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-representation-survey.md)
- [closure-as-fitting-fixpoint](../../../glossary/concepts/closure-as-fitting-fixpoint.md)
- [federate](../../../glossary/terms/federate.md)
