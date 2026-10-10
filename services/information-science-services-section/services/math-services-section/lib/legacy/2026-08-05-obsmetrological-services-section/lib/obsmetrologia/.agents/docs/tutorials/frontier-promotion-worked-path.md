---
title: Frontier Promotion Worked Path
description: A tutorial for taking a newly revealed Obsmetrologia idea from source pressure to claim-site, status, Blueprint, Verso, Lean, and Diataxis coverage.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - tutorial
  - frontier
  - promotion
  - claim-sites
---

# Frontier Promotion Worked Path

This tutorial teaches the movement from new idea to documented claim-site.

## Scenario

While writing docs, you discover a term that seems necessary. It might be a
regime distinction, a new FOUR instance, a relational boundary carrier, a
frontier theorem, or a provenance term from the corpus.

Do not immediately write an explanatory essay. First build the claim-site.

## Step 1: Capture The Source

Record the exact path where the term appeared.

Examples:

- `Obsmetrologia/.../*.lean`;
- `docs/blueprint/src/chapters/.../*.tex`;
- `docs/verso/ObsmetrologiaManual/.../*.lean`;
- `dev/content/notes/YYYY/MM/DD/*.md`;
- `docs/verso/mark/.../*.md`.

Write one line:

```text
Source path: <path>
```

## Step 2: Determine Scale

Choose one:

- topic: a namespace-scale region;
- concept: a module-scale construction;
- term: a declaration-scale claim;
- provenance only: a source pressure not yet promoted.

## Step 3: Determine Status

Choose the most conservative status supported by live files:

- foundation;
- recovery;
- frontier;
- provenance;
- archived;
- computational witness;
- unknown.

If Blueprint marks it `\notready`, it is frontier even if the prose sounds
confident.

## Step 4: Write The Claim-Site Stub

Use:

```text
Name:
Scale:
Status:
Generated from:
Generates:
Lean carrier:
Blueprint carrier:
Verso carrier:
Provenance:
Missing coverage:
```

This stub can live in a reference page, a concept index entry, or a new
documentation task.

## Step 5: Choose The Next Carrier

If the idea is imprecise, leave it in provenance.

If it is precise but unproved, add or update a Blueprint red node.

If it is proved, align Lean, Blueprint green status, and Verso explanation.

If it is already proved but undocumented, add Diataxis coverage.

## Step 6: Add The Four Modes

At minimum:

- tutorial: point to the nearest learning path;
- guide: point to the maintenance procedure;
- explanation: explain why this exists in the derivation;
- reference: list paths, status, and declaration labels.

## Step 7: Report The Discovery

When finishing, explicitly report:

- the new thing revealed;
- whether it was documented, left as a coverage obligation, or routed to
  frontier/provenance;
- the files touched.

