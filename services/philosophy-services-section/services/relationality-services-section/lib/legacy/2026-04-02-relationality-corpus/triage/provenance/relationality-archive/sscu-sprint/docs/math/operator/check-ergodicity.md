---
name: check-ergodicity
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



The **Check Ergodicity** operator witnesses ergodicity for the fixed kernel,
equating time and space averages.

## Definition
- Inputs: [Fixed Kernel](../structure/fixed-kernel.md) with
  [Mixing Property](../structure/mixing-property.md).
- Outputs: [Ergodicity Property](../structure/ergodicity-property.md) and the
  same fixed kernel.
- Behaviour: checks that mixing implies ergodicity: time averages equal space
  averages for observables under this kernel.

## Invariants
- Confirms mixing implies ergodicity for the fixed kernel.
- Keeps the kernel within its earned carrier.

## Proof
Uses the [Ergodicity](../acts/ergodicity.md) act applied to a fixed kernel with
mixing property to yield the ergodicity property. Shows that ergodicity is
earned without leaving the fixed-kernel carrier.
