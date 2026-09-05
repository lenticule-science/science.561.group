---
title: Ergodicity Property
role: structure
derived_from:
- acts/ergodicity
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Structure capturing ergodicity: time averages equal space averages with respect
to the fixed invariant state.

## Definition
- Carrier: predicates tying a [Fixed Invariant State](fixed-invariant-state.md)
  to long-run averages along the kernel evolution, assuming
  [Mixing Property](mixing-property.md).
- Data: statements that for any observable, the time average along trajectories
  converges to the invariant-state expectation.

## Invariants
- Uniqueness: ergodicity implies a unique invariant state up to null sets.
- Convergence: time averages converge to expectations for all integrable
  observables.

## Proof
- Derived from: [Ergodicity](../acts/ergodicity.md), combining the fixed kernel
  with mixing.
- Uses: [Mixing Property](mixing-property.md) and
  [Fixed Invariant State](fixed-invariant-state.md).
- Shows that: the earned ergodicity act yields a property carrier used in
  entropy/spectral convergence arguments.
