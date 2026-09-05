---
type: object
class: foundational
status: active
depends-on: []
see-also:
  - teaching/explanations/knowledge-graph.md
references:
  - references/hogan-knowledgegraphs2021.md
---

# RDF triple

An **RDF triple** is a (subject, predicate, object)
statement in the Resource Description Framework — the
atomic unit of RDF and graph-based knowledge
representation.

## Form

A triple has three components:

- **Subject.** The entity being described (a URI).
- **Predicate.** The property or relation (a URI).
- **Object.** The value or related entity (URI or
  literal).

Example:
```
<http://example.org/Beloved>
    <http://example.org/author>
    <http://example.org/MorrisonToni> .
```

This says: the resource Beloved has the author
property pointing to MorrisonToni.

## Why triples

The triple format is *minimal but composable*:

- **Schema-free.** Any predicate over any subject —
  no advance schema required.
- **Distributed.** Triples from anywhere can be
  combined.
- **Self-describing.** URIs identify resources
  globally.
- **Composable.** Knowledge built up from
  composition of triples.

This minimalism enabled the Linked Data project of
combining knowledge across distributed sources.

## RDF infrastructure

Around triples:

- **URIs/IRIs.** Globally identify resources.
- **Vocabularies.** Reusable predicate sets
  (FOAF, Dublin Core, schema.org).
- **RDFS.** Lightweight class/property hierarchy.
- **OWL.** Full description logic on top of RDF.
- **SPARQL.** Query language.
- **Triple stores.** Specialized databases for
  triples (Virtuoso, GraphDB, Stardog).

## Serialization formats

Triples can be serialized as:

- **N-Triples.** One triple per line; simplest.
- **Turtle.** Compact, prefix-based.
- **JSON-LD.** JSON-based; web-friendly.
- **RDF/XML.** Original; verbose.
- **N-Quads.** N-Triples with named graphs.

Same logical content, different syntax.

## Named graphs

An extension to triples: a *named graph* is a set of
triples with an identifier. Allows:

- Multiple sources distinguished.
- Provenance tracking.
- Versioning.
- Privacy and access control.

The (subject, predicate, object, graph) quad
extension.

## Reification

A weakness: triples don't naturally support metadata
*about* triples (who said this? when? how confident?).

Workarounds:

- **Standard RDF reification.** Awkward; rarely used.
- **Named graphs.** Per-graph metadata.
- **Singleton properties.** Per-triple unique
  predicates.
- **RDF-star.** Recent extension allowing triples-
  about-triples directly.

The reification issue motivates much KG-meta work.

## In contemporary AI

- **Linked Open Data cloud.** Billions of triples
  across hundreds of interconnected datasets.
- **Wikidata.** Crowdsourced; over 100M items, over
  1B triples.
- **Enterprise KGs.** Many use triple-store
  backends.
- **GNN inputs.** KGs as triples consumed by graph
  neural networks.

## Limits

- **Verbosity.** Triples are atomic; complex
  knowledge produces many triples.
- **Reification.** Metadata-about-triples is awkward.
- **Schema implicit.** Without ontology, triples
  don't enforce structure.
- **Performance.** Triple-store query performance
  varies; can be poor for some patterns.

## Status

Foundational data structure for KGs. Standard W3C
standards. Production deployment at very large
scale.
