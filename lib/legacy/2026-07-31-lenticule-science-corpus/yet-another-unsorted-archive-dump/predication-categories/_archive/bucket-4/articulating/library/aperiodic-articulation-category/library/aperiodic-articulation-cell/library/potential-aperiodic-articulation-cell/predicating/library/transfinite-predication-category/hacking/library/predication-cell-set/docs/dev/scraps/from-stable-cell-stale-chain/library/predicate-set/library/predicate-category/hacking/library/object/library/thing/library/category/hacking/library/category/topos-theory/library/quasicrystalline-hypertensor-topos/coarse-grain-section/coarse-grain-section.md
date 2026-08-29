---
title: Coarse-Grain Section
id: coarse-grain-section
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Coarse-Grain Section

Coarse-grains a hypertensor section from a fine scale to a coarser scale using a
scale embedding.

## Definition
- Inputs: fine [Scale Window](../structure/scale-window.md), a
  [Scale Embedding](../structure/scale-embedding.md) into a coarser window, and
  a [Hypertensor Section](../structure/hypertensor-section.md) on the fine
  window.
- Output: coarse-grained [Hypertensor Section](../structure/hypertensor-section.md)
  on the coarse window.
- Behaviour: restrict along the embedding, stabilise via nucleus if needed, and
  push forward along the embedding to the coarse window.

## Invariants
- Preservation: fixed shapes/recognitions are preserved under coarse-graining.
- Monotonicity: coarse-graining cannot create new fine-scale detail.
- Compatibility: commutes with coverage and sheaf restrictions.

## Proof
- Uses: [Scale Embedding](../structure/scale-embedding.md) and
  [Hypertensor Section](../structure/hypertensor-section.md) to define the map.
- Produces: coarse section for RG or multiscale analysis.
- Shows that: coarse-graining is a well-defined operator respecting earned
  sheaf/coverage structure across scales.
