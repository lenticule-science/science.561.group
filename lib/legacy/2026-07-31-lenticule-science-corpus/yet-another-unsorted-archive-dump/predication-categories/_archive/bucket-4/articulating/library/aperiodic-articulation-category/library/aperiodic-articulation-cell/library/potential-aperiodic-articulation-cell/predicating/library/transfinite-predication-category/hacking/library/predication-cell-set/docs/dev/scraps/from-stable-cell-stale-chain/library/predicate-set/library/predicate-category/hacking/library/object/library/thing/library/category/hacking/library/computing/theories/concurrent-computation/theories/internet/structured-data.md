---

title: "Structured data"
aliases:
  - "Structured data"
  - "structured data"
date-created: 2026-03-03T00:00:00
introduces: concept
keywords:
  - semantic-web
  - discoverability
---

Structured data is machine-readable information embedded in a web page that describes the page's content in a standardized vocabulary. Where HTML presents content for humans, structured data presents it for machines — search engines, AI agents, knowledge graph crawlers, and other automated systems.

## Forms

Three encoding formats are widely used:

- **[JSON-LD](./json-ld.md)** — a JSON block in the page's `<script>` tag. Recommended by Google. Used by emsenn.net.
- **Microdata** — HTML attributes (`itemscope`, `itemprop`) inline with content.
- **RDFa** — RDF attributes embedded in HTML tags.

All three formats use the same underlying vocabulary, most commonly [Schema.org](./schema-org.md).

## What it describes

Structured data answers the questions a machine would ask about a page:

- *What kind of thing is this?* (article, definition, person, lesson)
- *Who created it?* (author)
- *When?* (publication date)
- *What is it about?* (subject, keywords)
- *Where does it sit in a hierarchy?* (breadcrumb path)

## Why it matters for research sites

A research site that introduces new concepts faces a cold-start problem: search engines and AI systems have no prior knowledge of the site's vocabulary. Structured data provides the bridge. By declaring that a page is a `DefinedTerm` with a specific `name` and `description`, the site tells machines exactly what it offers — without relying on the machines to figure it out from context.

This matters when the goal is to be discoverable by AI agents exploring ideas at the boundary of their current knowledge. Structured data makes a site legible to automated systems in the same way that clear writing makes it legible to human readers.

## Relationship to the semantic web

Structured data is the surviving practical realization of the semantic web vision articulated by Tim Berners-Lee in the early 2000s. The full vision — a web of interconnected, machine-readable knowledge graphs — was largely unrealized, but the limited application of Schema.org vocabulary via JSON-LD has become ubiquitous. Nearly every major website emits structured data for search engine optimization, and search engines use it to generate rich results (knowledge panels, featured snippets, breadcrumb trails).

See also: [JSON-LD](./json-ld.md), [Schema.org](./schema-org.md), [robots.txt](./robots-txt.md).
