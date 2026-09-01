---
title: Entropy Functional
id: entropy-functional
role: structure
status: plan
derived_from:
- acts/entropy
proof_refs: []
---



Entropy functional on a fixed profile, earned by the act `Entropy` (TraceProfile
EntropyMeasure).

## Components

- Entropy measure `H` over the fixed profile (`FixedChain`).
- Monotonicity under flow–measure evolution until the stationary chain.
- Minimum attained exactly at the stationary profile.
- In numeric semantics: proportional scaling by leading spectral ratio until convergence.

## Proof

Sketch: `Entropy` uses `TraceProfile` with `EntropyMeasure` to define `H` on
the fixed profile recognised by `FixedChain`. Show monotonicity under the
earned flow/measure acts and that the minimum occurs at the stationary
profile. In numeric semantics, derive the spectral proportionality from the
leading eigenvalue.
