---
title: Diataxis Coverage Index
description: A compact coverage map for the current Obsmetrologia relational and informational mathematics spine across tutorials, guides, explanations, and references.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - coverage-index
  - diataxis
  - claim-sites
---

# Diataxis Coverage Index

This index is the front door for the agent-facing Diataxis coverage system. It
is not a theorem list. It points to generated and hand-authored claim-site
coverage maps for future agents.

Status values here are documentation statuses, not automatic proof audits. Check
Lean and Blueprint before claiming a theorem is proved.

## Current Coverage Scale

The generated inventory currently covers:

- 311 Lean modules as concept-scale claim-site candidates;
- 719 parsed Blueprint claim-sites as term-scale entries;
- 104 Verso manual pages as exposition carriers;
- 59 dated development notes as provenance/frontier-pressure carriers;
- 12 top-level Obsmetrologia topics, each with tutorial, guide, explanation,
  reference, concept-atlas, and term-ledger pages.

The generated counts live in `references/live-surface-inventory.md`.

## Primary Ledgers

- Topic coverage: `references/topic-coverage-ledger.md`
- Lean concept coverage: `references/lean-module-coverage.md`
- Blueprint term coverage: `references/blueprint-claim-site-ledger.md`
- Verso exposition carrier: `references/verso-page-ledger.md`
- Provenance notes: `references/provenance-note-ledger.md`
- Remaining obligations: `references/coverage-obligations.md`

## Topic Coverage Pattern

Each top-level topic has:

- `tutorials/<topic>-path.md`
- `guides/<topic>-maintenance.md`
- `explanations/<topic>.md`
- `references/<topic>-coverage.md`
- `references/<topic>-concept-atlas.md`
- `references/<topic>-term-ledger.md`

The topic set is: primitive, articulation, language, calculus, site, closure,
cohomology, dynamics, persistence, relational, thermodynamics, and computing.

## Hand-Authored Orientation Pages

The generated system is supplemented by hand-authored orientation pages:

- `explanations/relational-informational-mathematics.md`
- `explanations/no-free-data.md`
- `explanations/claim-sites-and-carriers.md`
- `explanations/recurring-four.md`
- `explanations/regimes-and-frontier.md`
- `explanations/downstream-relational-sectors.md`
- `tutorials/first-reading-path.md`
- `tutorials/mark-to-settling-worked-path.md`
- `tutorials/frontier-promotion-worked-path.md`
- `guides/maintain-diataxis-coverage.md`
- `guides/promote-claim-site.md`
- `guides/write-maturity-bounded-docs.md`
- `guides/run-alignment-audits.md`

## Coverage Obligations Revealed

- High-pressure generated concept-atlas rows should be upgraded into
  hand-authored concept explanations.
- Concept rows need direct Verso page identifiers, not only the global Verso
  ledger.
- Provenance pointers should be attached per topic and concept after reading the
  relevant notes.
- Tutorials should gain checked examples where a small Lean witness is
  appropriate.
