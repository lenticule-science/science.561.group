---
title: "Markdown"
description: "Markdown is a markup language whose source strings are parsed by the CommonMark specification into an abstract syntax tree — a dual representation as both human-readable plain text and structured document tree."
date-created: 2026-03-18
---

## What this is

**Markdown** is a markup language: a formal language whose strings have a dual representation as plain text and as a structured document tree.

The mathematical invariant comes from formal language theory and abstract syntax. A **markup language** is defined by a grammar G that maps source strings to an **abstract syntax tree** (AST). The CommonMark specification defines Markdown's grammar as a deterministic parsing algorithm (not a pure context-free grammar, because Markdown's block/inline interaction requires a two-pass algorithm), producing a tree with two levels:

- **Block AST**: the top-level structure — paragraphs, headings, lists, code blocks, blockquotes, thematic breaks
- **Inline AST**: the content of blocks — emphasis, code spans, links, images, hard line breaks

The **dual representation** is the key property: a Markdown source string is simultaneously (1) a human-readable plain text document that conveys meaning even without rendering, and (2) a structured tree that conveys meaning to parsers and tools. CommonMark specifies that the AST is the semantic object; the source string is one serialization of it.

This dual nature is why Markdown is chosen for this system: entity files are both human-readable (browsable in any text editor) and machine-parseable (convertible to RDF graphs via frontmatter extraction and to structured documents via CommonMark parsing).

## Constraints in this system

Every entity file MUST have a `.md` extension.
Every entity file MUST have exactly one H1 heading (`# Title`) as the first heading after frontmatter.
Headings MUST use `#` syntax — no underline style (`===` or `---` underlines are semantically equivalent in CommonMark but excluded here for consistency).

Markdown MAY use fenced code blocks, tables, blockquotes, and lists.
Cross-references use `[text](../../../../../humanities/domains/math/domains/topology/terms/path.md)` links; `{#anchor-id}` on headers creates deep-link targets within a file.

## Relation to frontmatter

Every entity `.md` file begins with a YAML frontmatter block (delimited by `---`). The frontmatter is not part of the CommonMark AST — it is parsed separately before CommonMark processing. See [MarkdownFrontmatter](../../../../../../content/text/glossary/terms/markdown-frontmatter.md) for how frontmatter encodes RDF triples.

## Open questions

- Whether the CommonMark AST of entity bodies should be extracted and stored for cross-file structural queries, or whether the plain-text representation is sufficient for all current use cases.
