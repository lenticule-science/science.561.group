---
title: Spectral Theorem
tags:
  - spectrum
  - harmonics
  - markov
---
# Theorem (Spectral Theorem)

With acts

- `HarmonicMode = (EnsureFixedPoint HarmonicStep)`,
- `SpectrumSeed = (ObservationKernel HarmonicMode)`,
- `SpectrumMap = (FixedNucleateProfile SpectrumSeed)`,
- `Spectrum = (TraceProfile SpectrumMap)`,

we have:

1. **Eigenstructure.**  
   Each `HarmonicMode` is an eigen-recognition of the observation kernel; the
   leading eigenvalue is inherited from the fixed-shape semantic corollary.

2. **Spectral decomposition.**  
   Any fixed invariant recognition decomposes into components along the harmonic
   basis under `Spectrum`.

3. **Orthogonality up to nucleus.**  
   Distinct harmonic modes collapse disjointly under `FixedNucleateProfile`,
   giving nucleus-mediated orthogonality.

4. **Spectral radius.**  
   The largest eigenvalue in numeric semantics is the dominant contraction
   factor of the flow; all others are bounded by its reciprocal because of the
   flow’s contraction along the tail trace.

## Proof sketch

Follows from the harmonic modes, the spectral eigenvalue, and the collapse
behaviour of the fixed nucleus.
