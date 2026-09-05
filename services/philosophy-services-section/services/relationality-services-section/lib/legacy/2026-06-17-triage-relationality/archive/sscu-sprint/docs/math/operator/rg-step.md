---
title: RG Step
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Renormalisation step coarse-graining a section from finer to coarser scale.

## Definition
- Inputs: a fine-scale [Scale Window](../structure/scale-window.md) with a
  [Hypertensor Section](../structure/hypertensor-section.md).
- Outputs: a coarser [Scale Window](../structure/scale-window.md) with a
  coarse-grained section.
- Behaviour: restrict to fine window via [Scale Embedding](../structure/scale-embedding.md),
  apply [Measure Fixed Invariant](measure-fixed-invariant.md) or nucleus to
  stabilise, then [Coarse-Grain Section](coarse-grain-section.md) to the coarse
  window.

## Invariants
- Fixed-shape preservation: fixed shapes are preserved under RG; couplings may
  change.
- Monotonicity: coarse-graining does not invent new fine-scale detail.

## Proof
- Uses: [Scale Window](../structure/scale-window.md), [Hypertensor Section](../structure/hypertensor-section.md),
  and [Measure Fixed Invariant](measure-fixed-invariant.md).
- Produces: coarse [Scale Window](../structure/scale-window.md) section.
- Shows that: renormalisation respects earned invariants and flows toward
  coarse descriptions.
