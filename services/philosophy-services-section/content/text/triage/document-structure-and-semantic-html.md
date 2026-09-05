---
title: "Document Structure and Semantic HTML"
aliases:
  - "Document Structure and Semantic HTML"
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - WebDesign
teaches:
  - "Document Structure and Semantic HTML"
cites:
  - "HTML5 for Web Designers"
  - "Raggett on HTML 4"
  - "Sorting Things Out: Classification and Its Consequences"
  - "Weaving the Web: The Original Design and Ultimate Destiny of the World Wide Web"
---

## What this lesson covers

How HTML gives structure and meaning to documents, why that structure matters, and how the choice of markup shapes what a document can communicate.

## Prerequisites

Familiarity with web pages as a reader. No prior knowledge of HTML is assumed.

---

## Documents before the web

Before hypertext, most documents were designed for a single rendering: a printed page. Structure — headings, paragraphs, lists, emphasis — was conveyed through visual formatting. A heading was a heading because it was set in a larger typeface, not because the document declared it to be one.

This created a problem. Visual formatting encodes structure *implicitly*: a sighted human can infer the hierarchy, but a machine, a screen reader, or a search engine cannot. The structure exists only in the reader's interpretation.

## Markup as explicit structure

Markup languages separate the declaration of structure from its presentation. Rather than saying "make this text 24pt bold," a markup language says "this is a heading." How that heading is rendered — its size, weight, color, position — is a separate concern handled by a stylesheet or rendering engine.

HTML (HyperText Markup Language) is the web's markup language. [Berners-Lee](../../../../general/people/tim-berners-lee.md) designed it in 1989--1991 at CERN [@bernerslee_WeavingWeb_1999], drawing on SGML (Standard Generalized Markup Language), which had been used for technical documentation since the 1960s [@raggett_RaggettHTML4_1998]. HTML was deliberately simple compared to SGML: a small set of elements sufficient for scientific documents — headings, paragraphs, lists, links, and images.

## [Semantic HTML](../terms/semantic-html.md)

"[Semantic HTML](../terms/semantic-html.md)" means choosing HTML elements for what they *mean*, not how they *look*. The distinction matters because HTML elements carry machine-readable meaning that affects how the document is processed by browsers, assistive technologies, and search engines.

Consider the difference between these approaches:

**Presentational**: a `<div>` styled to look like a navigation bar, with `<span>` elements styled to look like links. A sighted user sees navigation. A screen reader sees a generic container with generic text — no indication that these are navigation links.

**Semantic**: a `<nav>` element containing an unordered list of `<a>` (anchor) elements. A sighted user sees navigation. A screen reader announces "navigation" and can let the user skip to it or past it. A search engine understands the site's link structure.

### Key semantic elements

HTML5 (finalized 2014) introduced elements that make document structure explicit [@keith_HTML5WebDesigners_2016]:

- `<header>`, `<footer>` — introductory and closing content for a section or page
- `<nav>` — navigation links
- `<main>` — the primary content of the page (one per page)
- `<article>` — a self-contained piece of content (could stand alone if syndicated)
- `<section>` — a thematic grouping of content with a heading
- `<aside>` — tangentially related content (sidebars, pull quotes)
- `<figure>`, `<figcaption>` — illustrations, diagrams, or code examples with captions

These elements carry no default visual styling beyond what a browser's stylesheet provides. Their purpose is to communicate *what role* the content plays.

### Headings and document outline

HTML provides six heading levels: `<h1>` through `<h6>`. Headings create an implicit document outline — the hierarchy of sections and subsections that gives a long document its navigable structure.

A well-structured heading hierarchy serves the same function as a table of contents: it tells the reader (and any machine parsing the document) what the major sections are, how they relate, and where to find specific content. Screen readers let users navigate by heading level, jumping from `<h2>` to `<h2>` to scan a page's structure before reading in detail.

Skipping heading levels (going from `<h2>` to `<h4>` without an `<h3>`) breaks this hierarchy and confuses both human readers and assistive technology.

## The separation of structure and presentation

HTML handles structure. CSS (Cascading Style Sheets) handles presentation — colors, fonts, spacing, layout. This separation is a design principle, not an accident:

- A single HTML document can be rendered differently on a phone screen, a desktop browser, a screen reader, or a Braille display — the structure stays the same while the presentation adapts.
- A redesign can change how a site looks without touching the content.
- Accessible design becomes possible because the structural information is available to assistive technology regardless of visual presentation.

This principle is articulated in the W3C's architecture of the web: content, structure, presentation, and behavior should be handled by separate technologies that can vary independently.

## Why structure is not neutral

The choice of how to structure a document is a design decision with consequences. Headings impose hierarchy. Lists impose ordering or grouping. The `<main>` element declares what is primary and pushes everything else to the periphery. These are editorial choices, not technical necessities.

[Bowker](../../../../general/people/geoffrey-bowker.md) and [Star](../../../../general/people/susan-leigh-star.md)'s work on classification applies here [@bowker_SortingThingsOut_1999]: any system of categories makes some things visible and others invisible, privileges some ways of organizing knowledge and disadvantages others. A heading hierarchy that makes sense for one audience may misrepresent the material for another. Semantic HTML does not eliminate these choices — it makes them explicit, which is a prerequisite for examining them.

## Applications

[Semantic HTML](../terms/semantic-html.md) is the foundation for web [accessibility](../terms/accessibility.md): assistive technologies rely on document structure to make content navigable. It supports the [semantic web](./the-semantic-web-and-linked-data.md) by providing a base layer of machine-readable meaning. And it connects to [information architecture](../../information-architecture/index.md): the structures expressed in HTML are the concrete implementation of an information architect's organizational decisions.
