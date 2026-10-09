---
title: "Document Structure and Semantic HTML"
type: "lesson"
date-created: 2026-03-01
description: How HTML gives structure and meaning to documents, why that structure matters, and how the choice of markup shapes what a document can communicate.
---

Learning objectives

- Document Structure and Semantic HTML

Table of contents

- [What this lesson covers](#what-this-lesson-covers)

- [Prerequisites](#prerequisites)

- [Documents before the web](#documents-before-the-web)

- [Markup as explicit structure](#markup-as-explicit-structure)

- [Semantic HTML](#semantic-html)

[Key semantic elements](#key-semantic-elements)

- [Headings and document outline](#headings-and-document-outline)

- [The separation of structure and presentation](#the-separation-of-structure-and-presentation)

- [Why structure is not neutral](#why-structure-is-not-neutral)

- [Applications](#applications)

## What this lesson covers

How HTML gives structure and meaning to documents, why that structure matters, and how the choice of markup shapes what a document can communicate.

## Prerequisites

Familiarity with web pages as a reader. No prior knowledge of HTML is assumed.

## Documents before the web

Before hypertext, most documents were designed for a single rendering: a printed page. Structure — headings, paragraphs, lists, emphasis — was conveyed through visual formatting. A heading was a heading because it was set in a larger typeface, not because the document declared it to be one.

This created a problem. Visual formatting encodes structure *implicitly*: a sighted human can infer the hierarchy, but a machine, a screen reader, or a search engine cannot. The structure exists only in the reader&rsquo;s interpretation.

## Markup as explicit structure

Markup languages separate the declaration of structure from its presentation. Rather than saying &ldquo;make this text 24pt bold,&rdquo; a markup language says &ldquo;this is a heading.&rdquo; How that heading is rendered — its size, weight, color, position — is a separate concern handled by a stylesheet or rendering engine.

HTML (HyperText Markup Language) is the web&rsquo;s markup language. [Berners-Lee](../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/tim-berners-lee.md) designed it in 1989&ndash;1991 at CERN [@bernerslee_WeavingWeb_1999], drawing on SGML (Standard Generalized Markup Language), which had been used for technical documentation since the 1960s [@raggett_RaggettHTML4_1998]. HTML was deliberately simple compared to SGML: a small set of elements sufficient for scientific documents — headings, paragraphs, lists, links, and images.

## [Semantic HTML](../../../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/web-design-services-section/content/text/glossary/terms/semantic-html.md)

&ldquo;[Semantic HTML](../../../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/web-design-services-section/content/text/glossary/terms/semantic-html.md)&rdquo; means choosing HTML elements for what they *mean*, not how they *look*. The distinction matters because HTML elements carry machine-readable meaning that affects how the document is processed by browsers, assistive technologies, and search engines.

Consider the difference between these approaches:

**Presentational**: a `

` styled to look like a navigation bar, with `` elements styled to look like links. A sighted user sees navigation. A screen reader sees a generic container with generic text — no indication that these are navigation links.

**Semantic**: a `` element containing an unordered list of `` (anchor) elements. A sighted user sees navigation. A screen reader announces &ldquo;navigation&rdquo; and can let the user skip to it or past it. A search engine understands the site&rsquo;s link structure.

### Key semantic elements

HTML5 (finalized 2014) introduced elements that make document structure explicit [@keith_HTML5WebDesigners_2016]:

- `

`, `

` — introductory and closing content for a section or page

- `` — navigation links

- `

` — the primary content of the page (one per page)

- `

` — a self-contained piece of content (could stand alone if syndicated)

- `

` — a thematic grouping of content with a heading

- `` — tangentially related content (sidebars, pull quotes)

- ``, `` — illustrations, diagrams, or code examples with captions

These elements carry no default visual styling beyond what a browser&rsquo;s stylesheet provides. Their purpose is to communicate *what role* the content plays.

### Headings and document outline

HTML provides six heading levels: `` through ``. Headings create an implicit document outline — the hierarchy of sections and subsections that gives a long document its navigable structure.

A well-structured heading hierarchy serves the same function as a table of contents: it tells the reader (and any machine parsing the document) what the major sections are, how they relate, and where to find specific content. Screen readers let users navigate by heading level, jumping from `` to `` to scan a page&rsquo;s structure before reading in detail.

Skipping heading levels (going from `` to `` without an ``) breaks this hierarchy and confuses both human readers and assistive technology.

## The separation of structure and presentation

HTML handles structure. CSS (Cascading Style Sheets) handles presentation — colors, fonts, spacing, layout. This separation is a design principle, not an accident:

- A single HTML document can be rendered differently on a phone screen, a desktop browser, a screen reader, or a Braille display — the structure stays the same while the presentation adapts.

- A redesign can change how a site looks without touching the content.

- Accessible design becomes possible because the structural information is available to assistive technology regardless of visual presentation.

This principle is articulated in the W3C&rsquo;s architecture of the web: content, structure, presentation, and behavior should be handled by separate technologies that can vary independently.

## Why structure is not neutral

The choice of how to structure a document is a design decision with consequences. Headings impose hierarchy. Lists impose ordering or grouping. The `

` element declares what is primary and pushes everything else to the periphery. These are editorial choices, not technical necessities.

[Bowker](../../research/2026/07/31/humanities/domains/general/domains/people/geoffrey-bowker.md) and [Star](../../research/2026/07/31/humanities/domains/general/domains/people/susan-leigh-star.md)&rsquo;s work on classification applies here [@bowker_SortingThingsOut_1999]: any system of categories makes some things visible and others invisible, privileges some ways of organizing knowledge and disadvantages others. A heading hierarchy that makes sense for one audience may misrepresent the material for another. Semantic HTML does not eliminate these choices — it makes them explicit, which is a prerequisite for examining them.

## Applications

[Semantic HTML](../../../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/web-design-services-section/content/text/glossary/terms/semantic-html.md) is the foundation for web [accessibility](../../research/2026/07/31/lenticule-import/library/arts/arts-theory/design/terms/accessibility.md): assistive technologies rely on document structure to make content navigable. It supports the [semantic web](../../../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/web-design-services-section/content/text/documents/articles/notes/the-semantic-web-and-linked-data.md) by providing a base layer of machine-readable meaning. And it connects to [information architecture](../../research/2026/07/31/lenticule-import/library/arts/arts-theory/information-architecture/index.md): the structures expressed in HTML are the concrete implementation of an information architect&rsquo;s organizational decisions.
