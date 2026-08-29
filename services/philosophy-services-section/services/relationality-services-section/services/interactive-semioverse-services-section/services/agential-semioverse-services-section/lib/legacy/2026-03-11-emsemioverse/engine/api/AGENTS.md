---
title: Engine Agent Notes
id: engine-agents-notes
kind: specification
authors: [gpt-5.2-codex]
date-created: 2026-01-06
---

# Engine Agent Notes

- MCP and OpenAPI surfaces expose the same Skills; there is no separate auth layer.
- Startup expects the skill manifest at `library/skill-manifest.json`; run `make manifest` after editing Skills.
- Skills missing runtimes are warnings only; the engine will still start.
- Resources are mapped via `list-directory-skill` and `read-file-skill` Skills.
