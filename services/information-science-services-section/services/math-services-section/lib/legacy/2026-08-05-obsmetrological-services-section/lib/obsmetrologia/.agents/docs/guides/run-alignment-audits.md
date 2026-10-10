---
title: Run Alignment Audits
description: Commands and checks for validating Obsmetrologia documentation coverage, package alignment, Blueprint incidence, and cross-surface drift.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - guide
  - audits
  - verification
  - tooling
---

# Run Alignment Audits

Use this guide after changing `.agents/docs`, Verso, Blueprint, or Lean.

## Agent Docs Only

For `.agents/docs` changes, check file placement and frontmatter:

```sh
find .agents/docs -type f -name '*.md' | sort
rg -n '^---$|^title:|^description:|^date-created:|^tags:' .agents/docs
```

Every Markdown file in the four Diataxis directories should have:

- `title`;
- `description`;
- `date-created`;
- `tags`.

## Lean Or Proof Changes

For Lean proof work, follow the site contract:

- use the `obsmetrologia-lean-lsp` MCP server first for diagnostics, goals,
  hovers, local search, and axiom verification;
- use package checks for whole-project procedures.

Whole-project commands from the package root:

```sh
make doctor
make build
make check
```

## Blueprint Or Surface Drift

The package exposes audit commands:

```sh
pnpm run lean:audit
pnpm run lean:audit:packaging
pnpm run lean:audit:blueprint
pnpm run lean:audit:frontier
pnpm run lean:audit:surfaces
```

Use `lean:audit:blueprint` when claim labels, `\lean{...}` links, or proof
statuses change. Use `lean:audit:surfaces` when Lean, Blueprint, and Verso
alignment matters.

## Verso Changes

Use the repository's documented build path rather than raw guesses. The local
guidance says docs-side validation can require generated artifacts, so prefer
the project build target over one-off Lean invocation.

## What To Report

When finishing a documentation task, report:

- files created or changed;
- whether the change touched agent docs only or formal surfaces;
- checks run;
- checks not run and why;
- any visible coverage obligations left behind.

