---
title: Scale Window
id: scale-window
role: structure
status: plan
proof_refs: []
description: Subcarrier of hypertensor windows with an explicit scale parameter to model coarse/fine views.
---



Subcarrier of hypertensor windows with an explicit scale parameter to model
coarse/fine views.

## Definition
- Levels: refinement order small → medium → large windows drawn from
  [Hypertensor Window](./hypertensor-window.md).
- Embeddings: inclusions/rescalings between scales compatible with coverage and
  flow.

## Invariants
- Compatibility: restriction/rescaling preserves admissible sections.
- Stability: scale hierarchy is closed under earned window refinements.

## Proof
- Uses: [Hypertensor Window](./hypertensor-window.md) with added scale metadata.
- Shows that: windows can be organised by scale to support renormalisation
  steps.
