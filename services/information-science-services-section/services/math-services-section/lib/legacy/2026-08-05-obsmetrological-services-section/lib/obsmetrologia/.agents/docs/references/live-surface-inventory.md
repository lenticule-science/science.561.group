---
title: Live Surface Inventory
description: Generated inventory counts and paths for the Lean, Blueprint, Verso, provenance, and agent documentation surfaces that carry Obsmetrologia coverage.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - inventory
  - generated
  - diataxis
---
# Live Surface Inventory

Generated from the live checkout by `scripts/build-agent-diataxis-coverage.mjs`.

## Counts

| Surface | Count | Root |
| --- | --- | --- |
| Lean modules | 311 | Obsmetrologia/ |
| Blueprint source files | 184 | docs/blueprint/src/ |
| Blueprint claim-sites parsed | 719 | docs/blueprint/src/ |
| Verso manual pages | 104 | docs/verso/ObsmetrologiaManual/ |
| Dated provenance notes | 59 | dev/content/notes/ |

## Generated Coverage Files

This builder creates:

- per-topic tutorials under `.agents/docs/tutorials/`;
- per-topic guides under `.agents/docs/guides/`;
- per-topic explanations under `.agents/docs/explanations/`;
- per-topic references under `.agents/docs/references/`;
- global ledgers for Lean modules, Blueprint claim-sites, Verso pages, provenance notes, and topic coverage.
