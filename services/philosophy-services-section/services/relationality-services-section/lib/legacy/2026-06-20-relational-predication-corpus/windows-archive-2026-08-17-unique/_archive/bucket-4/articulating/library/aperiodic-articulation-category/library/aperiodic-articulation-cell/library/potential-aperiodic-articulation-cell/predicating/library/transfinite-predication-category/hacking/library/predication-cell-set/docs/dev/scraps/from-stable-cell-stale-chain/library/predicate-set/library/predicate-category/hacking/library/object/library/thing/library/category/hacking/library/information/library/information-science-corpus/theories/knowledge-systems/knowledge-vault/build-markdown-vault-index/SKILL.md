---
name: build-markdown-vault-index
id: build-markdown-vault-index
description: Scan a markdown vault and emit a vault index document. Use when producing
  an interactive semioverse mapping overview for a vault.
type: operational
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - survey-markdown-vault
keywords:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Build Markdown Vault Index

- Run `scripts/build-markdown-vault-index.py`.
- Provide `--vault-root` (directory to scan) and `--output` (index markdown file).
- Optionally set `--template` to a different `.md.j2` template.
- Commit or store the generated index near the vault root.
