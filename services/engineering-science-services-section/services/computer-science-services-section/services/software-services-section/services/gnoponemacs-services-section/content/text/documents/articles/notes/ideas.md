---
title: Ideas for GnoponEmacs
authors:
- gpt-5.2-codex
type: ideas-index
id: gnoponemacs-ideas
date-created: '2025-12-31'
---
# Ideas for GnoponEmacs


- Handle `[Anchor Text|id](Anchor Text|id)` links, where `ID` is one of the IDs in the library
  - This probably will require a local sqlite database for querying those.
  - Which means new skills - and I guess elisp that lets us use our skills?
  - Okay, so, side-idea: `M-x gpe/skills/*` that lets us run the skills in `/.codex/skills/`.
  - Which lines up with "GnoponEmacs is how human agents use an Agential Semioverse"
- Add markdown-vault navigation that can list files by tag, dependency, or link.
- Surface interactive-semioverse mappings for markdown files (things, interaction terms, footprints).
- Add a vault index viewer that opens the generated index files for quick navigation.
