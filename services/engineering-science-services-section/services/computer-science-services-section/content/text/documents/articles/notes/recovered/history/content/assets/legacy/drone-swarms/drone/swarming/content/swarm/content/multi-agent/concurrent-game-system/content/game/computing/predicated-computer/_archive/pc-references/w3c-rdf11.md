---
type: reference
class: engineering-system
status: cited
authors: [W3C RDF Working Group]
year: 2014
title: "RDF 1.1 Concepts and Abstract Syntax"
venue: "W3C Recommendation, 25 February 2014"
---

## Source

R. Cyganiak, D. Wood, M. Lanthaler (eds.). *RDF 1.1 Concepts and Abstract Syntax*. W3C Recommendation, 25 February 2014. <https://www.w3.org/TR/rdf11-concepts/>

## Form

Standards specification. The normative definition of the RDF 1.1 data model; the engineering register's anchor for the subject-predicate-object triple as a wire and storage primitive.

## Content summary

Specifies the RDF 1.1 abstract syntax: an RDF graph is a set of *triples* $(s, p, o)$ with subject $s$ an IRI or blank node, predicate $p$ an IRI, and object $o$ an IRI, blank node, or literal; an RDF dataset is a default graph plus a set of named graphs identified by IRI or blank node. Specifies datatypes, language-tagged strings, IRI normalization, the entailment regimes (simple, RDF, RDFS, D), and the dataset semantics. Companion specifications define concrete syntaxes (Turtle, TriG, N-Triples, N-Quads, JSON-LD, RDF/XML), the SPARQL 1.1 query and update languages ([w3c-sparql11](w3c-sparql11.md)), and the RDF Schema and OWL ontology layers.
