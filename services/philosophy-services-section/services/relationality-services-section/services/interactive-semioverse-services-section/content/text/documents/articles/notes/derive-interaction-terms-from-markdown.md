---
name: derive-interaction-terms-from-markdown
id: derive-interaction-terms-from-markdown
description: Derive interaction terms from markdown structure and links. Use when
  building interaction surfaces for markdown-based handles.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies:
  - interpret-markdown-as-handles
keywords:
  - semiotics
  - interactive-semioverse
  - markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
title: derive-interaction-terms-from-markdown
---

# Derive Interaction Terms From Markdown

- Treat headings as [interaction term](../../../glossary/terms/interaction-term.md) constructors with their subsection content.
- Convert links into terms that reference other [handles](../../../glossary/terms/handle.md) by target path.
- Map inline math and definitions into semantic generator terms.
- Keep the [interaction surface](../../../glossary/terms/interaction-surface.md) finite by selecting the most salient terms.
