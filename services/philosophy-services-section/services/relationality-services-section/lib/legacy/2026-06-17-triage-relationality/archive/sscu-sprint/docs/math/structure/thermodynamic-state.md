---
title: Thermodynamic State
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Fixed invariant state bundled with entropy (and optionally energy-like
observables) to support thermodynamic reasoning.

## Definition
- Components: [Fixed Invariant State](fixed-invariant-state.md), value of the
  [Entropy Functional](entropy-functional.md), and optional observables treated
  as energy constraints.
- Structure: admissible flows that preserve invariance and evolve entropy
  monotonically toward minima.

## Invariants
- Entropy monotonicity: along earned flows, entropy is non-increasing and
  minimised at the fixed state.
- Constraint preservation: observables/energy constraints remain satisfied
  under allowed flows.

## Proof
- Uses: [Fixed Invariant State](fixed-invariant-state.md) and
  [Entropy Functional](entropy-functional.md) to package thermodynamic data.
- Shows that: fixed states plus entropy/constraints form a carrier supporting
  thermodynamic interpretations of the earned stochastic dynamics.
