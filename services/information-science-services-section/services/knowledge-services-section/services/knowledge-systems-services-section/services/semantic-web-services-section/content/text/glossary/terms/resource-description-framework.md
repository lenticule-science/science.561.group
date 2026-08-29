---
title: Resource Description Framework
description: The W3C's foundational data model for the semantic web, representing all information as subject-predicate-object triples, first standardized in 1999 and re-issued in 2004 and 2014 as the abstract syntax underneath the whole spec stack (RDF Schema, OWL, SPARQL, SKOS, JSON-LD).
date-created: 2026-08-22
aliases:
  - RDF
  - resource description framework
  - RDF triples
  - RDF graph
defines:
  - RDF
  - triple
  - RDF graph
instance-of: w3c-standard
---

The Resource Description Framework (RDF) is the W3C's abstract data model for the semantic web: every statement is expressed as a subject-predicate-object **triple** (e.g. "this-document" — "has-author" — "this-library"), and a collection of triples forms an **RDF graph**, in which the same node may serve as the object of one triple and the subject of another, linking statements into an arbitrarily large graph of interlinked claims.
This triple structure is what every other layer of the spec stack — [RDF Schema](./resource-description-framework.md#rdf-schema), [OWL](./web-ontology-language.md), [SPARQL](./sparql.md), [SKOS](./skos.md), and [JSON-LD](./json-ld.md) — is built on top of.

## History and Recommendation dates

RDF's technical lineage runs through Ramanathan V. Guha's Meta Content Framework (MCF), developed at Apple (1995-1997) and recast in XML with Tim Bray after Guha moved to Netscape; Netscape submitted the result to the W3C in June 1997.
The **RDF Model and Syntax Specification** became a W3C Recommendation on 22 February 1999.
It was superseded by a six-document RDF Core suite — including **RDF Schema (RDFS)**, which adds classes, properties, and subclass/subproperty hierarchies on top of the base triple model — both published as W3C Recommendations on 10 February 2004.
A further revision, **RDF 1.1 Concepts and Abstract Syntax**, became a W3C Recommendation on 25 February 2014, clarifying the abstract syntax (IRIs, blank nodes, datatyped literals, and named graphs organized into RDF datasets) without changing the core triple model itself.
See the fuller literature review at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md).

## Relation to the rest of the stack

RDF supplies the graph; it does not by itself supply meaning beyond "this subject has this relation to this object."
[RDF Schema](./resource-description-framework.md) and [OWL](./web-ontology-language.md) add class/property semantics and formal ontological reasoning respectively; [SPARQL](./sparql.md) is the query language for RDF graphs; [SKOS](./skos.md) is a purpose-built RDF vocabulary for thesauri and controlled vocabularies; [JSON-LD](./json-ld.md) is a JSON serialization syntax for RDF graphs, and is the form in which most RDF actually reaches the modern web via schema.org markup (see [knowledge-graph](./knowledge-graph.md)).

## Sources

- RDF Model and Syntax Specification, W3C Recommendation, 22 February 1999. https://www.w3.org/TR/1999/REC-rdf-syntax-19990222/
- RDF Concepts and Abstract Syntax / RDF Schema, W3C Recommendation, 10 February 2004. https://www.w3.org/TR/2004/REC-rdf-concepts-20040210/ ; https://www.w3.org/TR/rdf-schema/
- RDF 1.1 Concepts and Abstract Syntax, W3C Recommendation, 25 February 2014. https://www.w3.org/TR/rdf11-concepts/
- Meta Content Framework, precursor history. https://en.wikipedia.org/wiki/Meta_Content_Framework
