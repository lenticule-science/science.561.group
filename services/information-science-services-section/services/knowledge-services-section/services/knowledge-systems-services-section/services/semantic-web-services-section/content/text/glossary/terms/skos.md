---
name: SKOS
description: The W3C's RDF vocabulary for publishing thesauri, classification schemes, and other controlled vocabularies on the web (broader/narrower/related concept relations, preferred/alternative/hidden labels, and mapping properties such as exactMatch and closeMatch), a Recommendation since 18 August 2009, and the specific technology used to publish traditional knowledge-organization systems on the semantic web rather than replace them.
date-created: 2026-08-22
aliases:
  - SKOS
  - Simple Knowledge Organization System
  - skos:Concept
  - skos:exactMatch
instance-of: w3c-standard
---

SKOS (Simple Knowledge Organization System) is a common [RDF](./resource-description-framework.md) data model for sharing and linking knowledge organization systems — thesauri, classification schemes, subject-heading systems, and taxonomies — on the web.
Rather than requiring the full formal-logic apparatus of [OWL](./web-ontology-language.md), SKOS is deliberately lighter weight: it defines a `skos:Concept` class, hierarchical `skos:broader`/`skos:narrower` and associative `skos:related` relations between concepts, preferred/alternative/hidden labels for each concept, and mapping properties (`skos:exactMatch`, `skos:closeMatch`, `skos:broadMatch`, `skos:narrowMatch`, `skos:relatedMatch`) for linking concepts across independently maintained vocabularies.
The SKOS Reference became a W3C Recommendation on 18 August 2009, edited by Alistair Miles and Sean Bechhofer, with an accompanying Primer.

## Relation to controlled-vocabulary practice

SKOS is the web-publication layer for a body of library and information science practice that predates the semantic web considerably: ISO 25964 (thesaurus construction and interoperability) and ANSI/NISO Z39.19 govern the design of the controlled vocabularies SKOS is used to publish as machine-readable RDF.
This library's own [vocabulary-mismatch research memo](../../../../../../../../../../../../content/text/documents/articles/notes/2026/08/20/vocabulary-mismatch-research-memo.md) covers this ground in depth — SKOS's `exactMatch`/`closeMatch` distinction, its use for outsider-facing alternative labels alongside expert preferred labels, and its role in hybrid (lexical plus dense) retrieval architectures — and should be read as the fuller treatment of SKOS's practical use, of which this entry is only the spec-history summary.

## Position in the spec stack

Where [OWL](./web-ontology-language.md) targets automated logical inference, SKOS deliberately avoids strong ontological commitments — `skos:broader` is not the same relation as OWL's `subClassOf`, precisely so SKOS can represent real-world thesauri whose broader/narrower relations do not obey strict logical hierarchy.
See the dated overview of where SKOS sits in the spec stack at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md#2-the-spec-stack-dated).

## Sources

- SKOS Simple Knowledge Organization System Reference, W3C Recommendation, 18 August 2009. https://www.w3.org/TR/skos-reference/
