---
title: "semantic HTML"
aliases:
  - "semantic HTML"
  - "semantic markup"
date-created: 2026-03-01T00:00:00
type: term
keywords:
  - WebDesign
cites:
  - "HTML5 for Web Designers"
---

Semantic HTML is the practice of choosing HTML elements based on the meaning they convey rather than the visual appearance they produce. A `<nav>` element declares that its contents are navigation links; an `<article>` declares a self-contained piece of content; a `<header>` marks introductory material. These elements communicate structure to browsers, screen readers, search engines, and any other software that processes the document.

The alternative — using generic elements like `<div>` and `<span>` for everything and relying on CSS classes for visual differentiation — produces documents that look correct to sighted users but carry no machine-readable structure. Screen readers cannot announce what role a section plays; search engines cannot distinguish primary content from navigation; automated tools cannot extract the document's outline.

Semantic HTML is the foundation of web [accessibility](./accessibility.md): assistive technologies depend on markup meaning to make content navigable [@keith_HTML5WebDesigners_2016]. It also supports the broader project of the [semantic web](../curricula/the-semantic-web-and-linked-data.md) by providing a base layer of structured meaning in every web document.
