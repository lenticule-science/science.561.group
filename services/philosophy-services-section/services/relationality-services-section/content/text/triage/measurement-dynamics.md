---
title: Measurement Dynamics
id: measurement-dynamics
role: operator
status: plan
derived_from: acts/mixing
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Statement

The entropy and mixing acts applied to `MeasurementKernels` describe how
repeated measurement and kernel application converge toward stationary
behaviour on the earned class of systems.

## Proof sketch

- [`entropy`](../acts/entropy.md) and [`mixing`](../acts/mixing.md) record
  convergence/mixing properties of kernels.
- Applying these to `MeasurementKernels` yields convergence toward stationary
  behaviour.

## Uniqueness

Given the kernels and entropy/mixing acts, the measurement dynamics are fixed
up to earned equivalence.

## Proof
- Derived from: [Mixing](../acts/mixing.md).
- Inputs: [Measurement Kernel](../structure/measurement-kernel.md).
- Shows that: applying mixing/entropy properties to measurement kernels yields convergence toward stationary behaviour.
