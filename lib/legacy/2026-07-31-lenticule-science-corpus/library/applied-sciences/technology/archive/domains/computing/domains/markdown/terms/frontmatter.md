---
title: "frontmatter"
aliases:
  - "frontmatter"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "frontmatter"
---

**Frontmatter** is a block of structured metadata placed at the top of a [Markdown file](markdown-file.md), delimited by a pair of `---` lines. The content between the delimiters is written in YAML (a human-readable data format) and provides machine-readable information about the document.

A typical frontmatter block looks like this:

```yaml
---
title: "Example Note"
date-created: 2025-06-15
tags:
  - type/term
---
```

Everything above the closing `---` is metadata; everything below it is the document's body content. Markdown processors and static site generators read the frontmatter to determine how to render, categorize, and link the document.

Frontmatter can contain any fields the author or system requires. Common fields include `title` (the document's display name), `date-created` (when the document was first written), `tags` (classification labels), `aliases` (alternative names the document can be referenced by), and `description` (a brief summary for search engines or previews).

In knowledge management tools like Obsidian, frontmatter serves as the primary mechanism for attaching structured data to otherwise unstructured notes. Search, filtering, and graph views all draw on frontmatter fields. In static site generators like Quartz, Hugo, or Jekyll, frontmatter controls page titles, URLs, publication dates, and template selection.

The YAML format requires attention to syntax. Strings containing colons, brackets, or other special characters should be wrapped in quotation marks. Lists are indicated by indented lines beginning with `-`. Incorrect indentation or missing delimiters will cause parsing errors that prevent the document from rendering.

Within this [vault](vault.md), every published [note](note.md) requires at minimum a `title` and `date-created` field in its frontmatter.

## Related terms

- [Markdown file](markdown-file.md) — the file format that uses frontmatter
- [note](note.md) — a document in a knowledge management system
- [vault](vault.md) — a collection of notes organized as a knowledge base
