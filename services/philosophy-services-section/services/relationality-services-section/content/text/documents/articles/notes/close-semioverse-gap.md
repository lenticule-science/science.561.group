---
name: close-semioverse-gap
id: close-semioverse-gap
description: Identify a documentation or skill gap using interactive semioverse concepts
  and close it with targeted artifacts. Use when bridging missing links in the library.
type: operational
authors:
- gpt-5.2-codex
- claude-opus-4-6
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - survey-markdown-vault
  - map-markdown-vault-to-handles
keywords:
  - semiotics
  - interactive-semioverse
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
title: close-semioverse-gap
---

# Close Semioverse Gap

A gap in the semioverse is a reference that does not resolve -- a [handle](../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/handle.md) that
points to nothing, a link to a page that does not exist, a skill dependency that
cannot be satisfied. Gaps are visible as broken [interaction surfaces](../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md).

## Identifying gaps

1. Run `/audit-vault-references` to find broken wikilinks and markdown links.
2. Run `/audit-content-folders` to find directories missing `index.md`.
3. Check skill dependencies: read SKILL.md files and verify their `dependencies:`
   paths exist.

## Closing a gap

For each gap, determine the minimal artifact needed to resolve it:

- **Missing page referenced by wikilink**: create the page with `/write-new-note`
  or `/make-content-folder` (if it is a directory).
- **Missing term or concept**: create a stub in the appropriate `terms/` or
  `concepts/` directory with at minimum a title, date-created, and one-sentence
  definition.
- **Missing person page**: create in `encyclopedia/people/` with full name as title.
- **Missing skill dependency**: either create the missing skill or update the
  dependency to point to the correct existing skill.
- **Broken relative path**: fix the link target rather than creating a new page.

The principle is minimality: create the smallest artifact that resolves the gap.
Do not generate large speculative documents to fill gaps — a stub with correct
frontmatter and one sentence is better than a long page of uncertain content.

## Recording the closure

After closing gaps, the audit script should show fewer broken references. Run
it again to verify. If the gap was in a skill's dependency list, verify the
skill can now be invoked without errors.
