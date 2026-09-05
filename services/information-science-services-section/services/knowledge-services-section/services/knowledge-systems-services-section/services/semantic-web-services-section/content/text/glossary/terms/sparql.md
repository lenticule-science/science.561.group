---
name: SPARQL
description: The W3C-standardized query language and protocol for RDF graphs, first a Recommendation in 2008 and substantially extended (aggregates, subqueries, negation, property paths, an update language) as SPARQL 1.1 in 2013, now a first-class citizen in the knowledge-graph and knowledge-graph-plus-LLM (RAG-over-KG) literature.
date-created: 2026-08-22
aliases:
  - SPARQL
  - SPARQL Protocol and RDF Query Language
  - SPARQL 1.1
instance-of: w3c-standard
---

SPARQL (a recursive acronym for "SPARQL Protocol and RDF Query Language," pronounced "sparkle") is the standard query language for [RDF](./resource-description-framework.md) graphs: it lets a client match graph patterns against triples and retrieve, filter, or aggregate the results, in roughly the role SQL plays for relational tables.
A **SPARQL endpoint** is an HTTP service that accepts SPARQL queries against a given RDF dataset and returns results, historically the mechanism by which [linked-data](./linked-data.md) publishers made their datasets queryable rather than only downloadable.

## Recommendation history

SPARQL 1.0 — the SPARQL Query Language for RDF, the SPARQL Protocol, and the SPARQL Query Results XML Format — became a W3C Recommendation on 15 January 2008, authored by Eric Prud'hommeaux and Andy Seaborne.
**SPARQL 1.1**, a substantially larger family of eleven Recommendations published together on 21 March 2013, added aggregates, subqueries, negation, property paths, an expanded function/operator set, an update language for modifying RDF stores, a service-description vocabulary, and a JSON results format.
See the dated spec-stack overview at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md#2-the-spec-stack-dated).

## Continued relevance

Unlike some of the more reasoning-heavy parts of the spec stack (see [web-ontology-language](./web-ontology-language.md)), SPARQL remained in active use through the [knowledge-graph](./knowledge-graph.md) era — Wikidata, for instance, exposes a public SPARQL endpoint over its data — and is named explicitly, alongside SHACL, in Hogan et al.'s 2021 survey of knowledge-graph query and validation languages.
It also appears as a component in the emerging knowledge-graph-plus-large-language-model literature (Pan et al., 2024), where graph query against a knowledge graph is one mechanism for grounding a language model's output (retrieval-augmented generation over a knowledge graph, "RAG-over-KG").

## Sources

- SPARQL Query Language for RDF, W3C Recommendation, 15 January 2008. https://www.w3.org/blog/2008/01/sparql_is_a_recommendation/
- SPARQL 1.1, eleven W3C Recommendations, 21 March 2013. https://www.w3.org/blog/SW/2013/03/21/eleven-sparql-1-1-specifications-are-w3c-recommendations/
- Hogan, A. et al. (2021).
  "Knowledge Graphs."
  *ACM Computing Surveys*, 54(4), article 71. https://doi.org/10.1145/3447772
- Pan, S. et al. (2024).
  "Unifying Large Language Models and Knowledge Graphs: A Roadmap."
  *IEEE TKDE*, 36(7), 3580-3599. https://doi.org/10.1109/TKDE.2024.3352100
