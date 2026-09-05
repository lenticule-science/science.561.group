---
title: Harmonic Flow
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



Flow governed by harmonic modes instead of local context.

## Definition
- Inputs: [Harmonic Mode](../structure/harmonic-mode.md) decomposition and a
  [Hypertensor Section](../structure/hypertensor-section.md).
- Output: evolved section according to spectral (harmonic) dynamics.
- Behaviour: evolve each mode separately per its eigenvalue/phase, then
  recombine.

## Invariants
- Mode-wise evolution: modes evolve independently.
- Consistency: recombined section respects sheaf/coverage constraints.

## Proof
- Uses: harmonic modes to drive flow.
- Produces: evolved section.
- Shows that: spectral/harmonic dynamics can drive section evolution.
