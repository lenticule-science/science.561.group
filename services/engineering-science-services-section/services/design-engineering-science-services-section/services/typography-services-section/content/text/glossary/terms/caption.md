---
name: "caption"
aliases:
  - "caption"
  - "caption text"
date-created: 2026-03-03T00:00:00
tags: []
---

A caption is text that accompanies an image, figure, table, or other visual element to provide context, explanation, or attribution. Captions sit at the boundary between the visual content they describe and the [body text](./body.md) that surrounds it.

Caption text is typically set smaller than body text -- often 80-90% of the body size -- and may use a different weight, style, or typeface to distinguish it from the running text. This size reduction signals to the reader that the caption is supplementary: it supports the visual element rather than carrying the document's main argument.

A caption serves several functions depending on the context. It can identify what the reader is looking at ("Figure 3: Cross-section of a beam joint"), explain why the visual matters ("The stress concentration appears at the fillet radius"), provide attribution ("Photo by [name], [year]"), or supply data that the visual alone cannot convey.

In web documents, captions are typically marked up with the `<figcaption>` element inside a `<figure>` wrapper. This pairing gives screen readers and search engines a semantic link between the image and its description, which plain proximity alone does not provide.

Captions are among the most-read elements on a page. Research in journalism and layout design has found that readers often scan captions before deciding whether to read the surrounding body text. A caption that merely restates what the image shows wastes this attention; an effective caption adds information the image alone cannot communicate.

## Related terms

- [body](./body.md) -- the main reading text, from which caption text is visually distinguished
- [heading](./heading.md) -- text that structures the document, serving a different navigational role than captions
