---
title: Fixed Kernel Property
id: fixed-kernel-property
role: structure
status: plan
derived_from:
- acts/fixed-kernel
proof_refs: []
---


# Fixed Kernel Property

Property witnessing that an observation kernel is fixed under its own action.

## Definition
- Carrier: predicates asserting `K * K = K` for an [Observation Kernel](observation-kernel.md) `K`.
- Data: fixed-point equation and stability under iteration.

## Invariants
- Stability: applying the kernel again yields the same kernel.
- Compatibility: fixed kernel respects the invariant lattice/entropy properties.

## Proof
- Derived from: [Fixed Kernel](../acts/fixed-kernel.md) act, providing the
  fixed-point equation.
- Shows that: the act induces a property carrier used when checking mixing and
  ergodicity.
