---
title: Measurement Dynamics
id: measurement-dynamics
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/mixing
description: The entropy and mixing acts applied to MeasurementKernels describe how repeated measurement and kernel application converge toward stationary behaviour on the earned class of systems.
---



## Statement

The entropy and mixing acts applied to `MeasurementKernels` describe how
repeated measurement and kernel application converge toward stationary
behaviour on the earned class of systems.

## Proof sketch

- [`entropy`](../../../triage/relationality/relationality-slop-2025-04/internal/entropy.md) and [`mixing`](./mixing.md) record
  convergence/mixing properties of kernels.
- Applying these to `MeasurementKernels` yields convergence toward stationary
  behaviour.

## Uniqueness

Given the kernels and entropy/mixing acts, the measurement dynamics are fixed
up to earned equivalence.

## Proof
- Derived from: [Mixing](./mixing.md).
- Inputs: [Measurement Kernel](./measurement-kernel.md).
- Shows that: applying mixing/entropy properties to measurement kernels yields convergence toward stationary behaviour.
