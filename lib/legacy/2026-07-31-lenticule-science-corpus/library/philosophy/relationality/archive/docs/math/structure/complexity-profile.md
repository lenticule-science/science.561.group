---
title: Complexity Profile
id: complexity-profile
role: structure
status: plan
proof_refs: []
---



Measures how “incompressible” a trace or recognition is, as a relational analog
of Kolmogorov complexity.

## Definition
- Carrier: mapping from traces/recognitions to compressibility witnesses from
  [Compressibility Recognition](compressibility-recognition.md).
- Interpretation: incompressible items carry high complexity; compressible ones
  lower complexity.

## Invariants
- Monotonicity: more compressible traces have lower complexity.
- Stability: complexity respects shuffle equivalence classes.

## Proof
- Uses: [Compressibility Recognition](compressibility-recognition.md).
- Shows that: complexity can be expressed via compressibility in the earned
  trace/shuffle framework.
