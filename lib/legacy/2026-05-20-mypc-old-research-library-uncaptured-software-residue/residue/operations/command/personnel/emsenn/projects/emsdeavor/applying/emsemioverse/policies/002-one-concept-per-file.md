---
title: "Policy 002: One concept per file"
date-created: 2026-03-07T00:00:00
type: policy
number: 2
keywords:
  - Policies
  - KnowledgeOrganization
description: "Each file should contain exactly one concept, term, or idea."
---

Each file should contain exactly one concept, term, or idea.

## What this means

In the Zettelkasten tradition, the **principle of atomicity** was
coined by Christian Tietze (zettelkasten.de, 2013): one idea per note.
Luhmann called each unit a **Zettel**; Ahrens (*How to Take Smart
Notes*) calls them **permanent notes**; Matuschak calls them
**evergreen notes** and draws the analogy explicitly: "evergreen note
titles are like APIs." In information architecture and technical
writing, the established practice is **topic-based authoring**,
formalized in the DITA standard (OASIS): one topic per file,
self-contained, composable via maps. In software engineering, the
analog is the **single responsibility principle** (Martin, 2003).

A file that contains one concept is:

- **Addressable.** Other files can link to it precisely.
- **Composable.** It can be combined into different contexts (a
  curriculum, a text, a skill) without dragging in unrelated content.
- **Parseable.** Frontmatter describes that one concept; scripts can
  extract structured data without disambiguation.
- **Maintainable.** When understanding changes, one file changes.

## Operational implications

- When a file covers two concepts, split it. Use the `split-note` skill.
- Index files are the composition layer — they organize atomic files
  into navigable structures. An index is not a concept; it is a map.
- Texts (essays, papers) are compositions of concepts, not containers
  for new concepts. If a text introduces a new term, that term should
  also exist as its own term file.
- When frontmatter can encode a relationship that prose currently
  describes, prefer frontmatter. This makes the relationship
  machine-readable without requiring the agent to read the prose.
- Prefer many small files over few large files. The cost of a file is
  near zero; the cost of entangled concepts is high.
