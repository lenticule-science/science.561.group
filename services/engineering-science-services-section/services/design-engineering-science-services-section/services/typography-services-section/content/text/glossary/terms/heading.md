---
name: "heading"
aliases:
  - "heading"
  - "heading text"
  - "header"
date-created: 2026-03-03T00:00:00
tags: []
---

A heading is text that introduces, labels, and structures a section of content. Headings create the hierarchical skeleton of a document: they tell the reader what each section is about and how sections relate to one another.

Headings are set with greater visual weight than [body text](./body.md) -- larger size, bolder weight, or both -- so that a reader scanning the page can locate them without reading the surrounding prose. This visual distinction is functional, not decorative: it lets the reader navigate the document's argument from its structure alone.

In HTML, headings form a six-level hierarchy from `<h1>` through `<h6>`. The `<h1>` element represents the page's primary topic; subsequent levels represent increasingly specific subsections. This hierarchy carries semantic meaning: assistive technologies like screen readers use heading levels to build a navigable outline of the page, and search engines use them to understand the document's structure. Skipping levels (placing an `<h4>` directly under an `<h2>`, for example) breaks this outline and makes the document harder to navigate for users who rely on it.

In Markdown, headings are marked with `#` characters: one `#` for a top-level heading, two for a second-level heading, and so on. Quartz and other [static site generators](../../../../../../../../../science-services-section/services/information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/static-site-generator.md) convert these to the corresponding HTML heading elements.

Effective headings are specific. "Results" tells the reader less than "Failure rates under cyclic loading." A reader should be able to reconstruct the document's argument from its headings without reading the body text between them.

## Related terms

- [body](./body.md) -- the main reading text that headings introduce and organize
- [caption](./caption.md) -- text accompanying visual elements, serving a descriptive rather than structural role
- [hierarchy](./hierarchy.md) -- the nesting structure that headings create within a document
