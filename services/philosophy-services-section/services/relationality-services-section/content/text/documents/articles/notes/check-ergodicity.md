---
title: Check Ergodicity
id: check-ergodicity
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: The Check Ergodicity operator witnesses ergodicity for the fixed kernel, equating time and space averages.
---



The **Check Ergodicity** operator witnesses ergodicity for the fixed kernel,
equating time and space averages.

## Definition
- Inputs: [Fixed Kernel](./fixed-kernel.md) with
  [Mixing Property](./mixing-property.md).
- Outputs: [Ergodicity Property](./ergodicity-property.md) and the
  same fixed kernel.
- Behaviour: checks that mixing implies ergodicity: time averages equal space
  averages for observables under this kernel.

## Invariants
- Confirms mixing implies ergodicity for the fixed kernel.
- Keeps the kernel within its earned carrier.

## Proof
Uses the [Ergodicity](./ergodicity.md) act applied to a fixed kernel with
mixing property to yield the ergodicity property. Shows that ergodicity is
earned without leaving the fixed-kernel carrier.
