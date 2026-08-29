---
title: Scale Tower
id: scale-tower
role: structure
status: plan
proof_refs: []
---


# Scale Tower

Extends modality/profile towers with an explicit scale dimension for multi-scale
analysis.

## Definition
- Components: levels of [Scale Window](./scale-window.md) organised as a tower
  aligned with [Modality Tower](modality-tower.md).
- Structure: rescalings between levels; flow/nucleus per scale.

## Invariants
- Compatibility: scale transitions respect modality/profile transitions.
- Stability: tower closed under earned rescalings and restrictions.

## Proof
- Uses: scale windows and modality tower to build a multi-scale stack.
- Shows that: scale can be treated as an additional tower dimension.
