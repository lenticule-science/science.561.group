---
title: Detect Critical Modality
id: detect-critical-modality
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Detect Critical Modality

Detects modalities whose collapse changes fixed-point structures.

## Definition
- Inputs: [Modal Structure](./modal-structure.md).
- Output: [Critical Modality](./critical-modality.md) witness for
  modalities with global impact.
- Behaviour: simulate collapsing/adding modalities; observe changes in fixed
  points/invariants; mark critical ones.

## Invariants
- Soundness: only modalities whose change alters fixed points are marked.
- Stability: criticality persists under equivalent modal presentations.

## Proof
- Uses: modal analysis and fixed-point calculations.
- Produces: critical modality witness.
- Shows that: sensitivity to modality changes can be detected recognitionally.
