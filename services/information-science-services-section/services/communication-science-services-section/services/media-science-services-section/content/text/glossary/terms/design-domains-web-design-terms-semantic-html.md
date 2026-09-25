---
title: "semantic HTML"
type: "term"
date-created: 2026-03-01
---

Semantic HTML is the practice of choosing HTML elements based on the meaning they convey rather than the visual appearance they produce. A `` element declares that its contents are navigation links; an `

` declares a self-contained piece of content; a `

` marks introductory material. These elements communicate structure to browsers, screen readers, search engines, and any other software that processes the document.

The alternative — using generic elements like `

` and `` for everything and relying on CSS classes for visual differentiation — produces documents that look correct to sighted users but carry no machine-readable structure. Screen readers cannot announce what role a section plays; search engines cannot distinguish primary content from navigation; automated tools cannot extract the document&rsquo;s outline.

Semantic HTML is the foundation of web [accessibility](../../documents/articles/research/2026/07/31/lenticule-import/library/arts/arts-theory/design/archive/accessibility.md): assistive technologies depend on markup meaning to make content navigable [@keith_HTML5WebDesigners_2016]. It also supports the broader project of the [semantic web](../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/web-design-services-section/content/text/documents/articles/notes/the-semantic-web-and-linked-data.md) by providing a base layer of structured meaning in every web document.
