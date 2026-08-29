---
name: interpret-markdown-as-handles
id: interpret-markdown-as-handles
description: Map a markdown document into handles and semantic seeds. Use
  when treating a markdown file as a source of interactive semioverse data.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies:
  - map-markdown-vault-to-handles
keywords:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Interpret Markdown as Handles

- Choose the markdown unit to treat as a [handle](../../../glossary/terms/handle.md) (document, section, or heading).
- Assign each handle a stable identifier and a seed element in the semantic domain.
- Record how frontmatter fields map into semantic seeds (title, tags, dependencies).
- Note which fields are treated as [interaction surfaces](../../../glossary/terms/interaction-surface.md) versus static metadata.
