---
name: "Topic-Based Authoring"
aliases:
  - "Topic-Based Authoring"
  - "topic-based authoring"
  - "topic-based writing"
  - "structured authoring"
date-created: 2026-03-06
tags: []
---

***Topic-based authoring*** is a documentation strategy that organizes content into self-contained, reusable units (topics) rather than continuous documents. Each topic covers one subject, answers one question, or completes one task — and can be assembled with other topics into different documents for different audiences without rewriting.

The approach recognizes that readers don't read documentation linearly. They arrive at a page through search, a link, or a table of contents, read what they need, and leave. A topic must stand alone: it can't assume the reader has read the previous section or will read the next one. This aligns with [Janice Redish](../../../../general/people/janice-redish.md)'s principle that web content should answer the reader's question directly, without requiring them to process unrelated material [@redish2012].

Topic-based authoring typically divides content into three topic types:

- **Concept topics** — explain what something is. "What is authentication?" These correspond to term definitions and concept notes.
- **Task topics** — explain how to do something. "How to set up two-factor authentication." These are [procedural documentation](./procedural-documentation.md).
- **Reference topics** — provide lookup information. "[API documentation](./api-documentation.md)," parameter tables, configuration options. These are [reference documentation](./reference-documentation.md).

The most formalized implementation is DITA (Darwin Information Typing Architecture), an XML-based standard that enforces topic types and enables single-sourcing — publishing the same content in multiple formats (web, PDF, help systems) from one source. But topic-based principles apply even without formal systems: any documentation that organizes content into modular, self-contained units is practicing topic-based authoring.

The trade-off is narrative coherence. Topic-based content is findable and reusable but can feel fragmented — the reader who needs to understand a system holistically may struggle with content optimized for piecemeal access. The [user guide](./user-guide.md) bridges this gap by assembling topics into a coherent sequence.

## Related terms

- [user guide](./user-guide.md) — assembles topics into a coherent whole
- [knowledge base](./knowledge-base.md) — a collection of standalone topics
- [reference documentation](./reference-documentation.md) — one of the three standard topic types
- [procedural documentation](./procedural-documentation.md) — another standard topic type
- [information architecture](../../../terms/information-architecture.md) — the organizational structure that connects topics
