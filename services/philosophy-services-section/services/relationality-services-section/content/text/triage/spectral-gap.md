---
title: Spectral Gap
id: spectral-gap
role: structure
status: plan
proof_refs: []
---



Records the difference between the leading harmonic mode and subsequent modes,
bounding mixing/relaxation rates.

## Definition
- Data: ordered [Spectrum](spectrum.md) with distinguished leading
  [Harmonic Mode](harmonic-mode.md); gap witness between the first and second
  modes (numeric or relational).
- Role: controls convergence rates in stochastic evolutions and entropy decay.

## Invariants
- Positivity: gap is non-negative; larger gap implies faster mixing.
- Stability: gap persists under admissible perturbations of the kernel.

## Proof
- Uses: [Spectrum](spectrum.md) and [Harmonic Mode](harmonic-mode.md) to define
  the gap.
- Shows that: the gap data can bound convergence in
  [Entropy Spectral Fixed Point](entropy-spectral-fixed-point.md) scenarios.
