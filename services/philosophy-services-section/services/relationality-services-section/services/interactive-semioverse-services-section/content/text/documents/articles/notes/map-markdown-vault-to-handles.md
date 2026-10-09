---
name: map-markdown-vault-to-handles
id: map-markdown-vault-to-handles
description: Map a markdown vault into handles, interaction surfaces, and
  footprints. Use when building an interactive semioverse representation of a vault.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies:
  - survey-markdown-vault
  - learn-about-interactive-semioverse
keywords:
  - semiotics
  - interactive-semioverse
  - markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
title: map-markdown-vault-to-handles
---

# Map a Markdown Vault to Handles

- Assign stable [handles](../../../glossary/terms/handle.md) to each chosen unit (file, section, or heading).
- Build [interaction surfaces](../../../glossary/terms/interaction-surface.md) for each handle from headings, links, and definitions.
- Generate handle fragments and compute [footprints](../../../glossary/terms/footprint.md) for each handle.
- Store the mapping and [footprint](../../../glossary/terms/footprint.md) summaries in a vault index document.
