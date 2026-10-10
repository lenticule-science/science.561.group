---
title: Source Surfaces
description: A reference to the live Obsmetrologia surfaces that carry settlement, incidence, exposition, provenance, audits, and agent maintenance.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - source-surfaces
  - blueprint
  - verso
---

# Source Surfaces

Use this reference to route claims to the right surface.

| Surface | Path | Role |
| --- | --- | --- |
| Site contract | `AGENTS.md` | Short operating contract for Lean/project work. |
| Full orientation | `CLAUDE.md` | Mathematical and proof discipline orientation. |
| Package overview | `README.md` | Project shape, verification commands, audit commands. |
| Lean root | `Obsmetrologia.lean` | Import spine and current derivation order. |
| Lean modules | `Obsmetrologia/` | Settlement carrier for definitions, theorems, examples, and docstrings. |
| Blueprint | `docs/blueprint/` | Incidence carrier for proved/open claim graph. |
| Verso manual | `docs/verso/` | Expository carrier for reader-facing manual pages. |
| Verso mark tree | `docs/verso/mark/` | Proof-tree documentation body and schema surface. |
| Corpus and notes | `dev/content/` | Provenance, exploratory notes, and frontier pressure. |
| Archive | `_archive/` | Reference material only, not active build input. |
| Agent docs | `.agents/docs/` | Maintenance carrier for future agents. |
| Coverage artifacts | `sites/docs/coverage/` | Generated audit reports, intentionally ignored. |

## Command Surfaces

From the package root:

```sh
make doctor
make build
make check
pnpm run lean:audit
pnpm run lean:audit:packaging
pnpm run lean:audit:blueprint
pnpm run lean:audit:frontier
pnpm run lean:audit:surfaces
```

For Lean-specific work, use the `obsmetrologia-lean-lsp` MCP server before shell
fallback for diagnostics, goals, hovers, local search, and axiom verification.

## Routing Rules

Put exact proof settlement in Lean.

Put claim dependency topology in Blueprint.

Put teaching exposition in Verso.

Put source history and unsettled exploratory material in corpus or notes.

Put future-agent operating instructions in `.agents/docs`.

Do not maintain parallel books.

