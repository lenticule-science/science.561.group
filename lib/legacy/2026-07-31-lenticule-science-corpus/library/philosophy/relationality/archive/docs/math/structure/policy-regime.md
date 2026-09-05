---
title: Policy Regime
id: policy-regime
role: structure
status: plan
derived_from: math/acts/govern-regime
proof_refs: []
---



Earned policy carrier combining discipline/filter/regime data with trace
context.

## Definition
- Carrier: policies earned by [Govern Regime](../../math/acts/govern-regime.md)
  and its supporting acts (`discipline`, `filter`), attached to a
  [Trace Carrier](trace.md) context.
- Fields: discipline partitions (admissible flows), filters (constraints on
  recognitions/flows), regime composition data, and associated trace scope.

## Invariants
- Partition coherence: disciplines/filters partition admissible flows without
  overlap.
- Trace scope: policy applicability is scoped to the attached trace spine.
- Composition: regimes compose disciplines/filters associatively with identity.

## Proof
- Derived from: [Govern Regime](../../math/acts/govern-regime.md) with trace
  context from [Trace Carrier](trace.md).
- Shows that: lifting policy acts into calculus yields a parameterised policy
  carrier usable by recognition and system scheduling.
