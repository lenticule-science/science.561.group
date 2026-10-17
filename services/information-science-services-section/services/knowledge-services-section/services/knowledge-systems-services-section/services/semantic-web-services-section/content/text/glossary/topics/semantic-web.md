---
title: "Semantic Web"
description: "The research program, launched by Berners-Lee, Hendler & Lassila's 2001 Scientific American essay, to make web data machine-meaningful via a stack of W3C-standardized formats (RDF, OWL, SPARQL, SKOS, JSON-LD) and linked-data practice, whose reasoning-heavy original vision gave way, by the 2010s, to an industrially-driven knowledge-graph turn that actually reached mass deployment as JSON-LD-serialized schema.org markup."
---

The semantic web is the research program, and later industry practice, aimed at making web data meaningful to machines rather than only renderable for humans — so that software agents, search engines, and now large language models can act on published data directly.
Tim Berners-Lee, James Hendler, and Ora Lassila's "The Semantic Web," *Scientific American* 284(5) (May 2001), is the field's founding statement.

## The literature

This section's [study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md) is the full literature review behind this topic page: it works through the founding vision, the W3C spec stack with every Recommendation date verified, the linked-data movement, the knowledge-graph turn, the field's own critiques and retrospectives, measured adoption reality, and the very recent knowledge-graph-plus-large-language-model literature — distinguishing throughout which claims are peer-reviewed research, which are W3C standards documents, and which are essays or trade commentary.
Read the note for citations; this page only orients the terms.

## The terms

The spec stack, in the order it was standardized:

- [resource-description-framework](../terms/resource-description-framework.md) (RDF) — the triples data model everything else builds on (1999, revised 2004 and 2014).
- [web-ontology-language](../terms/web-ontology-language.md) (OWL) — the formal-logic ontology layer (2004; OWL 2, 2009/2012).
- [sparql](../terms/sparql.md) — the query language for RDF graphs (2008; SPARQL 1.1, 2013).
- [skos](../terms/skos.md) — the lightweight vocabulary for publishing thesauri and controlled vocabularies as RDF (2009).
- [json-ld](../terms/json-ld.md) — the JSON serialization of RDF that turned out to be the actual mass-deployment syntax (2014; revised 2020).

Two further terms cover the movements that carried the spec stack into practice:

- [linked-data](../terms/linked-data.md) — Berners-Lee's 2006 publishing practices and 2010 five-star deployment scheme, and the Linking Open Data cloud (DBpedia and others) built on them.
- [knowledge-graph](../terms/knowledge-graph.md) — the industrial successor that actually reached web scale, from Google's 2012 "things, not strings" announcement through schema.org and Wikidata to today's knowledge-graph-plus-LLM literature.

## How this topic fits the library

This section sits within the knowledge-systems-services-section, alongside the sibling research-services-section, whose own glossary already defines [W3C](../../../../../../../research-services-section/content/text/glossary/terms/w3c.md) as the standards body itself — this section covers what the W3C standardized for the semantic web specifically, and does not redefine the W3C's own governance role.
It also relates to [skos](../terms/skos.md)'s treatment in this library's [vocabulary-mismatch research memo](../../../../../../../../../../../../content/text/documents/articles/notes/2026/08/20/vocabulary-mismatch-research-memo.md), which covers SKOS's practical use in controlled-vocabulary and hybrid-retrieval system design at greater depth than this topic page attempts.
