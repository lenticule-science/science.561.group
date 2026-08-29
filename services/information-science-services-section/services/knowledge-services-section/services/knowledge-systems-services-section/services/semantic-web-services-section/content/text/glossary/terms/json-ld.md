---
title: JSON-LD
description: A JSON-based syntax for serializing RDF/linked data, a W3C Recommendation since 2014 (revised 2020) and now the actual mass-deployment form of the semantic web on the open web, carried almost entirely through schema.org markup that search engines parse for rich results, per Web Data Commons's measured 50.0% structured-data prevalence in a 2020 web crawl.
date-created: 2026-08-22
aliases:
  - JSON-LD
  - JSON for Linked Data
  - JSON-LD 1.0
  - JSON-LD 1.1
defines:
  - JSON-LD
  - JSON-LD context
instance-of: w3c-standard
---

JSON-LD ("JSON for Linked Data") is a syntax for expressing [RDF](./resource-description-framework.md) graphs using ordinary JSON, designed so that systems already producing and consuming JSON can add linked-data structure with minimal disruption.
A JSON-LD document uses a `@context` block to map plain JSON keys to full RDF IRIs (typically schema.org terms), letting a document be read either as ordinary JSON by systems that don't care about linked data, or as an RDF graph by systems that do.

## Recommendation history

**JSON-LD 1.0** became a W3C Recommendation on 16 January 2014, led by Manu Sporny and Dave Longley (Digital Bazaar), Gregg Kellogg, Markus Lanthaler, and Niklas Lindström.
**JSON-LD 1.1**, adding richer context features and framing capabilities, became a W3C Recommendation on 16 July 2020, at which point 1.0 was formally republished as a Superseded Recommendation.
See the dated spec-stack overview at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md#2-the-spec-stack-dated).

## The surviving mass deployment

JSON-LD is, in practical terms, where the semantic web actually landed at web scale.
[Schema.org](./knowledge-graph.md) markup (originally specified for RDFa and Microdata syntax) is increasingly published as embedded JSON-LD `<script>` blocks, which search engines parse for rich-result rendering.
Web Data Commons's Common Crawl extraction reports measure this directly: 50.0% of a 3.4-billion-page December 2020 crawl contained structured data (schema.org, RDFa, or Microdata combined), up from 12.3% of a 3-billion-page August 2012 crawl — a trajectory documented in Guha, Brickley & Macbeth's 2016 CACM retrospective on schema.org's own design choices and adoption.
This is a narrower, more centralized outcome than the original [linked-data](./linked-data.md) vision of a federated web of independently linked, [SPARQL](./sparql.md)-queryable datasets, but it is the outcome that was actually, measurably adopted.

## Sources

- JSON-LD 1.0, W3C Recommendation, 16 January 2014. https://www.w3.org/news/2014/json-ld-is-a-w3c-recommendation/
- JSON-LD 1.1, W3C Recommendation, 16 July 2020. https://www.w3.org/news/2020/json-ld-1-1-specifications-are-w3c-recommendations/
- Guha, R.V., Brickley, D., & Macbeth, S. (2016).
  "Schema.org: Evolution of Structured Data on the Web."
  *Communications of the ACM*, 59(2). https://dl.acm.org/doi/10.1145/2844544
- Web Data Commons extraction reports (2012, 2020). http://webdatacommons.org/structureddata/2012-08/stats/stats.html ; http://webdatacommons.org/structureddata/2020-12/stats/stats.html
