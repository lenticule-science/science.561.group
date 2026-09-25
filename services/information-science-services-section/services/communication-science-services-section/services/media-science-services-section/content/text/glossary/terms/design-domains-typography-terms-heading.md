---
title: "heading"
type: "term"
date-created: 2026-03-03
---

A heading is text that introduces, labels, and structures a section of content. Headings create the hierarchical skeleton of a document: they tell the reader what each section is about and how sections relate to one another.

Headings are set with greater visual weight than [body text](../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/typography-services-section/content/text/glossary/terms/body.md) &ndash; larger size, bolder weight, or both &ndash; so that a reader scanning the page can locate them without reading the surrounding prose. This visual distinction is functional, not decorative: it lets the reader navigate the document&rsquo;s argument from its structure alone.

In HTML, headings form a six-level hierarchy from `` through ``. The `` element represents the page&rsquo;s primary topic; subsequent levels represent increasingly specific subsections. This hierarchy carries semantic meaning: assistive technologies like screen readers use heading levels to build a navigable outline of the page, and search engines use them to understand the document&rsquo;s structure. Skipping levels (placing an `` directly under an ``, for example) breaks this outline and makes the document harder to navigate for users who rely on it.

In Markdown, headings are marked with `#` characters: one `#` for a top-level heading, two for a second-level heading, and so on. Quartz and other [static site generators](../../documents/articles/research/2026/07/31/humanities/domains/general/terms/static-site-generator.md) convert these to the corresponding HTML heading elements.

Effective headings are specific. &ldquo;Results&rdquo; tells the reader less than &ldquo;Failure rates under cyclic loading.&rdquo; A reader should be able to reconstruct the document&rsquo;s argument from its headings without reading the body text between them.
