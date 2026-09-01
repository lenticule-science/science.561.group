---
id: frontmatter
description: "A structured metadata block at the start of a document, separated from the body, carrying machine-readable assertions about the document in key-value form."
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  document: relational-universe
output: relational-universe
ast:
  structured-metadata-block:
    - document
    - key-value-assertions:
        - machine-readable-claims
---

# Frontmatter

## What this is

**Frontmatter** is a block of structured metadata placed at the start of a document, before the document body.

It carries machine-readable assertions about the document — not the document's prose content, but facts about what the document is, what it relates to, and how it should be processed.
The body carries human-readable content.
The frontmatter carries structured assertions.
They are co-located in one file, making the document self-describing.

## Format variants

Frontmatter appears in different formats depending on the substrate:

- **YAML between `---` delimiters** — the standard in markdown files (Jekyll, Hugo, and this system)
- **TOML between `+++` delimiters** — used in some static site generators
- **JSON between `---` delimiters** — less common; machine-friendly
- **Module-level variable annotations** — the Python equivalent; `id: str = "..."` at module scope

The format is secondary.
The concept — structured assertions co-located with content, parsed separately from the body — is the same across all of them.

## The key property

Frontmatter externalizes the document's relational assertions into a form a machine can read without parsing the body.
This is what makes a collection of documents queryable as a graph: the frontmatter of each document is its node record; the body is its human-readable content.

## Specializations

How frontmatter is interpreted depends on the system:

- In markdown files: [markdown-frontmatter](../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/glossary/terms/markdown-frontmatter.md) — how YAML frontmatter encodes RDF triples and drives SHACL validation
- In this system specifically: [relational-system-markdown](../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/glossary/terms/relational-system-markdown.md) — the Fregean predicate-as-key pattern, vocabulary constraints, and encoding conventions


## Open questions
