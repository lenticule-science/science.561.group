---
title: Rescale Section
id: rescale-section
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Rescale Section

Rescales a section across levels of the scale tower, propagating flow at each
scale.

## Definition
- Inputs: [Scale Tower](../structure/scale-tower.md) and a
  [Hypertensor Section](../structure/hypertensor-section.md) at some level.
- Output: the section transported to another scale level.
- Behaviour: restrict or extend along scale transitions, applying flow/nucleus
  appropriate to each level.

## Invariants
- Compatibility: rescaling respects coverage/sheaf structure at each scale.
- Stability: rescaling then rescaling back yields nucleus-equivalent section.

## Proof
- Uses: scale tower rescalings and section sheaf structure.
- Produces: rescaled section.
- Shows that: sections can be coherently moved across scales.
