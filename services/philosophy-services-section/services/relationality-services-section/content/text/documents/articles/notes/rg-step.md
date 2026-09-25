---
title: RG Step
id: rg-step
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Renormalisation step coarse-graining a section from finer to coarser scale.
---



Renormalisation step coarse-graining a section from finer to coarser scale.

## Definition
- Inputs: a fine-scale [Scale Window](./scale-window.md) with a
  [Hypertensor Section](./hypertensor-section.md).
- Outputs: a coarser [Scale Window](./scale-window.md) with a
  coarse-grained section.
- Behaviour: restrict to fine window via [Scale Embedding](./scale-embedding.md),
  apply [Measure Fixed Invariant](./measure-fixed-invariant.md) or nucleus to
  stabilise, then [Coarse-Grain Section](./coarse-grain-section.md) to the coarse
  window.

## Invariants
- Fixed-shape preservation: fixed shapes are preserved under RG; couplings may
  change.
- Monotonicity: coarse-graining does not invent new fine-scale detail.

## Proof
- Uses: [Scale Window](./scale-window.md), [Hypertensor Section](./hypertensor-section.md),
  and [Measure Fixed Invariant](./measure-fixed-invariant.md).
- Produces: coarse [Scale Window](./scale-window.md) section.
- Shows that: renormalisation respects earned invariants and flows toward
  coarse descriptions.

## Earlier material

## Definition
- Inputs: a fine-scale [Scale Window](scale-window.md) with a
  [Hypertensor Section](hypertensor-section.md).
- Outputs: a coarser [Scale Window](scale-window.md) with a
  coarse-grained section.
- Behaviour: restrict to fine window via [Scale Embedding](scale-embedding.md),
  apply [Measure Fixed Invariant](measure-fixed-invariant.md) or nucleus to
  stabilise, then [Coarse-Grain Section](coarse-grain-section.md) to the coarse
  window.

## Proof
- Uses: [Scale Window](scale-window.md), [Hypertensor Section](hypertensor-section.md),
  and [Measure Fixed Invariant](measure-fixed-invariant.md).
- Produces: coarse [Scale Window](scale-window.md) section.
- Shows that: renormalisation respects earned invariants and flows toward
  coarse descriptions.
