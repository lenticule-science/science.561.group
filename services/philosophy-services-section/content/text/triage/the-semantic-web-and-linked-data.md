---
title: "The Semantic Web and Linked Data"
aliases:
  - "The Semantic Web and Linked Data"
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - WebDesign
teaches:
  - "The Semantic Web and Linked Data"
cites:
  - "Decolonizing Methodologies: Research and Indigenous Peoples"
  - "Linked Data: Evolving the Web into a Global Data Space"
  - "Metadata Principles and Practicalities"
  - "Sorting Things Out: Classification and Its Consequences"
  - "The Semantic Web"
  - "Weaving the Web: The Original Design and Ultimate Destiny of the World Wide Web"
---

## What this lesson covers

What the semantic web is, how linked data works, the standards that underlie it, and why making information machine-readable matters for knowledge systems.

## Prerequisites

[Document Structure and Semantic HTML](./document-structure-and-semantic-html.md). Familiarity with [information architecture](../../information-architecture/index.md) concepts is helpful.

---

## The web of documents and the web of data

The World Wide Web that most people use is a web of *documents*: HTML pages linked to one another by hyperlinks. A person can follow links, read pages, and synthesize information. But the links between pages are untyped — they say "this page connects to that page," not *how* or *why*. The meaning of each page lives in its natural-language text, accessible to humans but opaque to machines.

[Berners-Lee](../../../../general/people/tim-berners-lee.md)'s original vision for the web included a further layer: a web of *data*, where individual facts and relationships would be published in machine-readable form, linked by typed connections [@bernerslee_WeavingWeb_1999]. A page about a person would not merely link to a page about a university — it would state that the person *attended* that university, using a vocabulary both humans and machines could interpret.

This is the semantic web: an extension of the existing web in which information is given well-defined meaning, enabling computers to process, combine, and reason about data drawn from different sources [@bernerslee_SemanticWeb_2001].

## Linked data

[Linked data](../terms/linked-data.md) is the set of practices for publishing structured data on the web so that it can be interlinked and become more useful through those connections [@heath_LinkedData_2011]. [Berners-Lee](../../../../general/people/tim-berners-lee.md) outlined four principles for [linked data](../terms/linked-data.md) in 2006:

1. **Use URIs to name things.** Every entity — a person, a place, a concept, a dataset — gets a unique identifier on the web.
2. **Use HTTP URIs** so that those names can be looked up. If you visit the URI, you get useful information about the thing it names.
3. **Provide useful information** using standards (RDF, SPARQL) when someone looks up a URI.
4. **Include links to other URIs** so that people and machines can discover more things.

These principles extend the web's linking architecture from documents to data. Just as web pages gain value from linking to one another, data gains value from linking to other data.

## RDF: Resource Description Framework

RDF (Resource Description Framework) is the data model underlying the semantic web. It represents knowledge as a collection of *triples* — statements of the form:

**subject — predicate — object**

For example:

- `<Marie_Curie>` `<won>` `<Nobel_Prize_Physics_1903>`
- `<Marie_Curie>` `<bornIn>` `<Warsaw>`
- `<Nobel_Prize_Physics_1903>` `<field>` `<Physics>`

Each triple asserts a single relationship between two things. A collection of triples forms a *graph* — a network of entities connected by typed relationships. This graph structure is flexible: new triples can be added without modifying a schema, and triples from different sources can be merged because they share the same data model.

RDF does not prescribe a single serialization format. Triples can be expressed in RDF/XML, Turtle (a more human-readable syntax), JSON-LD (JSON for Linked Data, widely used for embedding structured data in web pages), or N-Triples (one triple per line).

## Ontologies and vocabularies

For linked data to work across sources, publishers need shared vocabularies — agreed-upon terms for common concepts and relationships. Several widely used vocabularies exist:

- **Dublin Core**: a small vocabulary for describing documents (title, creator, date, subject). Originally developed by librarians for cataloging web resources.
- **Schema.org**: a large, broadly adopted vocabulary for describing things on the web (people, organizations, events, products, places). Created jointly by Google, Microsoft, Yahoo, and Yandex, and used by search engines to generate rich results.
- **FOAF (Friend of a Friend)**: describes people and their social relationships.
- **SKOS (Simple Knowledge Organization System)**: describes knowledge organization systems — thesauri, classification schemes, taxonomies, and [controlled vocabularies](../../information-architecture/terms/controlled-vocabulary.md).

When shared vocabularies are insufficient, publishers can define their own terms using OWL (Web Ontology Language), which provides formal mechanisms for defining classes, properties, and logical relationships between them.

## SPARQL: querying linked data

SPARQL (SPARQL Protocol and RDF Query Language) is the query language for RDF data. Where SQL queries tables, SPARQL queries graphs by specifying patterns of triples:

```
SELECT ?person ?prize
WHERE {
  ?person <won> ?prize .
  ?prize <field> <Physics> .
}
```

This query finds all people who won a physics prize — by matching the pattern across whatever triples are available. SPARQL endpoints allow anyone to query published linked data over HTTP.

Wikidata, the structured knowledge base behind Wikipedia, provides a public SPARQL endpoint with billions of triples covering people, places, events, scientific concepts, and more.

## Structured data on the web today

The full semantic web vision — a seamless global graph of interlinked data — has not been realized in the form Berners-Lee envisioned. But significant parts of it are in daily use:

- **JSON-LD** embedded in web pages tells search engines about articles, products, events, organizations, and people. Most rich search results (event cards, recipe previews, product ratings) rely on structured data.
- **Wikidata** provides structured data to Wikipedia, voice assistants, and knowledge panels.
- **Open data portals** (government agencies, scientific institutions) publish datasets using linked data standards.
- **Library systems** use linked data for bibliographic records (the Library of Congress's BIBFRAME format replaces MARC records with RDF).

## Knowledge graphs

A knowledge graph is a structured representation of knowledge as a graph of entities and their relationships. The term gained wide use after Google announced its Knowledge Graph in 2012, but the underlying idea — representing knowledge as a network of typed connections — is much older, tracing back to semantic networks in AI research from the 1960s.

Knowledge graphs use linked data principles and RDF (or similar graph models) to represent facts in a form that supports both human browsing and machine reasoning. They are used in enterprise knowledge management, biomedical research, and digital humanities.

## The politics of structured data

Representing knowledge as structured data involves choices about what to represent, what categories to use, and whose conceptual framework defines the vocabulary. These choices are not neutral.

The Dublin Core metadata set [@duval_MetadataPrinciplesPracticalities_2002], for example, assumes a Western model of authorship — individual creators producing discrete documents. This model fits journal articles but poorly describes oral traditions, collective authorship, or knowledge systems where the relationship between a person and a story is not "creator" but something more complex (custodian, carrier, witness).

The same concern applies to ontologies: the classes and properties that define what can be stated in a knowledge graph also define what *cannot* be stated. A vocabulary that has no term for a particular relationship effectively makes that relationship invisible within the system.

This connects to [Bowker](../../../../general/people/geoffrey-bowker.md) and [Star](../../../../general/people/susan-leigh-star.md)'s observation that classification systems have political consequences [@bowker_SortingThingsOut_1999], and to Indigenous scholars' critiques of how Western knowledge frameworks systematically misrepresent or exclude Indigenous ways of knowing [@smith_DecolonizingMethodologies_2021]. [Linked data](../terms/linked-data.md) standards, like any infrastructure, embed assumptions that deserve examination.

## Applications

Linked data principles apply wherever knowledge is organized and published. Library catalogs, museum collections, research databases, educational resources, and knowledge bases all face the question of how to make their information findable and reusable — both by humans and by machines. The semantic web provides one set of answers, grounded in open standards and the architecture of the web itself.
