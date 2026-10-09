---
title: Weiqi LSP Authorization
description: "The owner's directive authorizing implementation of apps/weiqi-lsp per its SPEC.md, and the conditions attached to that authorization."
date: 2026-08-19
keywords: ["weiqi", "weiqi-lsp", "authorization"]
date-created: 2026-08-19
---


The [Weiqi LSP Constitution](weiqi-lsp-constitution.md) requires explicit authority before
`src/`, `test/`, or `package.json` appear for the service; until authorized, only `SPEC.md`
is permitted.

The owner, 2026-08-19, verbatim:

> "Another agent was working on a weiqi-cli and it also got interrupted by our outage,
> restart it as part of our doing of weiqi stuff."

This authorizes materializing `apps/weiqi-lsp` per its `SPEC.md`, under these conditions:

1. Implementation follows `SPEC.md` as written; deviations carry stated reasons.
2. `apps/weiqi-kernel` remains read-only. `SPEC.md`'s WQ005 references `COLUMN_LETTERS`,
   which the kernel does not export; the column alphabet is derived instead through the
   kernel's exported `pointToCoord`.
3. The kernel's test suite must pass untouched after materialization.
