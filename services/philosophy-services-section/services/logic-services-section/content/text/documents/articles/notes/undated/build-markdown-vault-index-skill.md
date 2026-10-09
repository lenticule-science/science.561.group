---
name: build-markdown-vault-index
description: Scan a markdown vault and emit a vault index document. Use when producing
  an interactive semioverse mapping overview for a vault.
title: build-markdown-vault-index
---

# Build Markdown Vault Index

- Run `scripts/build-markdown-vault-index.py`.
- Provide `--vault-root` (directory to scan) and `--output` (index markdown file).
- Optionally set `--template` to a different `.md.j2` template.
- Commit or store the generated index near the vault root.
