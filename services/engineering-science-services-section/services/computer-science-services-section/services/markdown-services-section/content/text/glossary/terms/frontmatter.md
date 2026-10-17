---
name: "frontmatter"
description: "A structured metadata block at the start of a document, separated from its body, carrying machine-readable assertions about the document as key-value pairs."
aliases:
  - "front matter"
  - "front-matter"
  - "metadata block"
date-created: 2025-12-31
date-modified: 2026-09-27
---

**Frontmatter** is a block of structured metadata at the top of a [Markdown file](./markdown-file.md), before the document's body. It carries machine-readable assertions about the document: not its prose, but what the document is, what it relates to and how it should be processed. The body is for human readers; the frontmatter is for assertions. Because both sit in one file, the document describes itself.

In Markdown the block is YAML between a pair of `---` lines:

```yaml
---
title: "Example Note"
date-created: 2025-06-15
tags:
  - type/term
---
```

Everything above the closing `---` is metadata; everything below it is the body. Markdown processors and static site generators read the frontmatter to decide how to render, categorize and link the document.

## Where it comes from

The idea is older than the name. Library catalog cards carried author, title, subject headings and call number on the card's front, with the record's body elsewhere. The Dublin Core Metadata Initiative (1995) standardized fifteen elements (title, creator, subject, description, date and others) for describing digital resources. What frontmatter adds is co-location: the metadata lives inside the document instead of in a separate catalog, database or sidecar file.

Tom Preston-Werner brought YAML frontmatter to static site generators with Jekyll in 2008. Hugo, Gatsby, Eleventy and Obsidian adopted the convention. TOML between `+++` delimiters and JSON blocks exist but are less common. The format varies; the concept (structured assertions co-located with content and parsed separately from the body) is the same across all of them.

## Fields

A block can carry any fields its author or system needs. Common ones are `title` or `name` (the display name), `date-created`, `date-modified`, `tags` (classification labels), `aliases` (other names the document can be linked by) and `description` (a one-sentence summary). In Obsidian, frontmatter is the main way to attach structured data to notes, and search, filters and graph views draw on it. In Quartz, Hugo and Jekyll it controls the page's layout and listing.

YAML needs care. A string containing a colon, a bracket or another special character should be quoted. List items are indented lines beginning with `-`. Wrong indentation or a missing delimiter is a parse error that stops the document from being read.

Within this [vault](./vault.md), every published [note](./note.md) carries at least a `title` or `name` and a `date-created`.

## Frontmatter as a graph

Frontmatter puts a document's relational assertions where a machine can read them without parsing the body. A collection of frontmatter-bearing documents can then be queried as a graph: each document is a node, and each key-value pair is an edge to another node or to a literal. This is the structure of an RDF [triple](../../../../../../../../../information-science-services-section/content/text/glossary/terms/subject-predicate-object.md) store, written in plain text: the document is the subject, the key the predicate, the value the object. It follows Frege's function-argument analysis (*Begriffsschrift*, 1879), in which a predicate is an unsaturated function (his term in "Function and Concept", 1891): the key names a relation, the document fills its subject place and the value its object place.

A human can read the YAML and see the document's relations; a machine can parse it and build the graph; neither needs the other. The schema is whatever keys documents actually use, so it grows from practice instead of being imposed in advance. [Markdown frontmatter](../../../../../../content/text/glossary/terms/markdown-frontmatter.md) gives the RDF reading in detail and how shapes validate it, and [relational system markdown](../../../../../../content/text/glossary/terms/relational-system-markdown.md) gives this system's conventions for keys and values.

## Related terms

- [Markdown file](./markdown-file.md): the file format that carries frontmatter
- [note](./note.md): a document in a knowledge management system
- [vault](./vault.md): a collection of notes organized as a knowledge base
