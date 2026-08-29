---
title: Linked Data
description: A set of practices for publishing structured data on the web using dereferenceable HTTP URIs, coined by Tim Berners-Lee in a 2006 design note and given a five-star deployment scheme he added to the same page in 2010, with Bizer, Heath & Berners-Lee's 2009 "Linked Data - The Story So Far" as the field's own peer-reviewed retrospective and DBpedia (Auer et al. 2007) as the most-cited anchor dataset of the resulting Linking Open Data cloud.
date-created: 2026-08-22
aliases:
  - linked data
  - Linking Open Data
  - LOD
  - LOD cloud
  - five-star linked data
defines:
  - linked data
  - Linking Open Data cloud
  - five-star scheme
instance-of: design-principle
---

Linked Data names a set of best practices, not a single standard, for publishing structured data so that it can be discovered and combined across the web rather than sitting in an isolated silo.
Tim Berners-Lee stated the core practice in a 2006 W3C design-issues note: use URIs to name things, make those URIs dereferenceable over HTTP, return useful [RDF](./resource-description-framework.md) or [SPARQL](./sparql.md)-queryable information at that URI, and include links to other URIs so agents can discover more things.
Four years later, in 2010, Berners-Lee added a **five-star deployment scheme** to that same page — a maturity ladder running from "available on the web in any format" (1 star) through "available as linked open data" (5 stars) — which is often, imprecisely, cited as if it were part of the original 2006 note rather than a distinct addition; see the fuller discussion of this date at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md#3-linked-data).

## The Linking Open Data cloud and DBpedia

The community effort to actually publish linked data at scale is usually called the **Linking Open Data (LOD) cloud**: a continuously-updated map of interlinked open RDF datasets.
Chris Bizer, Tom Heath, and Tim Berners-Lee's "Linked Data — The Story So Far," *International Journal on Semantic Web and Information Systems* 5(3):1-22 (2009), is the field's own peer-reviewed three-years-on retrospective, reviewing the cloud's growth and proposing a research agenda.
Its most-cited anchor dataset is **DBpedia** — Auer, Bizer, Kobilarov, Lehmann, Cyganiak & Ives, "DBpedia: A Nucleus for a Web of Open Data," *ISWC 2007 + ASWC 2007*, LNCS 4825, pp. 722-735 — which extracts structured data from Wikipedia infoboxes into RDF and was explicitly proposed as the "nucleus" other open datasets could link against.

## Relation to knowledge graphs

Linked data's core commitment — dereferenceable URIs linking a federated web of datasets — is distinct from, and largely did not survive into, the industrial [knowledge-graph](./knowledge-graph.md) turn of the 2010s, which favored centralized, proprietary graph stores (Google's Knowledge Graph, Wikidata) over an open federated web of SPARQL endpoints.
The surviving mass-deployment form of structured web data is [JSON-LD](./json-ld.md) markup against schema.org vocabulary, which borrows RDF's data model but not the dereferenceable-URI federation ideal linked data originally proposed.

## Sources

- Berners-Lee, T. (2006).
  Linked Data design note (five-star scheme added 2010, per this library's own Internet Archive verification below; the previously cited tpximpact.com secondary explainer does not itself state a year). https://www.w3.org/DesignIssues/LinkedData.html
- Internet Archive captures of the design note above, used to verify the five-star scheme's 2010 addition directly: https://web.archive.org/web/20100527072545/http://www.w3.org:80/DesignIssues/LinkedData.html (27 May 2010, no five-star content) and https://web.archive.org/web/20101125165034/http://www.w3.org/DesignIssues/LinkedData.html (25 November 2010, five-star content present)
- Bizer, C., Heath, T., & Berners-Lee, T. (2009).
  "Linked Data — The Story So Far."
  *International Journal on Semantic Web and Information Systems*, 5(3), 1-22. https://www.researchgate.net/publication/225070216_Linked_Data_The_Story_so_Far
- Auer, S., Bizer, C., Kobilarov, G., Lehmann, J., Cyganiak, R., & Ives, Z. (2007).
  "DBpedia: A Nucleus for a Web of Open Data."
  *ISWC 2007 + ASWC 2007*, LNCS 4825, 722-735. https://link.springer.com/chapter/10.1007/978-3-540-76298-0_52
