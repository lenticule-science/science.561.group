---
title: Spectral Simulation
keywords:
  - simulation
  - spectral
  - harmonic
depends-on:
  - theorem/external/spectral-theorem
description: This specification implements Theorem (Spectral Theorem) by extracting harmonic modes, eigenvalues, and spectral decompositions from the earned observation kernel and observable algebra.
aliases:
  - Spectral Theorem
  - spectral theorem
operations:
  - name: harmonic mode
  - name: spectrum map
  - name: spectral projection
---

This specification implements **Theorem (Spectral Theorem)** by extracting
harmonic modes, eigenvalues, and spectral decompositions from the earned
observation kernel and observable algebra.  It provides finite numerical or
symbolic approximations of that structure; it does not introduce a separate
operator algebra besides the one defined by the acts.

## State representation

- **Kernel operator `K`.**
  A reference to the observation kernel realised by the Markov/measurement
  specs: concretely, an interface to the `ObservationKernel` and related acts
  acting on fixed invariant recognitions.  Implementations may represent `K`
  internally as matrices or linear operators for a *finite working set* of
  observables, but the authoritative kernel semantics come from the earned acts.

- **Harmonic basis storage.**
  A finite collection of modes `(psi)_i` with eigenvalues `(lambda)_i` obtained by applying
  `HarmonicMode`, `SpectrumMap`, and `Spectrum` to the observable algebra over
  the kernel.  This storage is a cache over recognitions (or their numeric
  realisations), not a new persistent basis.

- **Spectral projections.**
  Matrices or symbolic operators representing projections onto each cached mode
  for the current working set of observables.  These projections approximate
  the spectral projectors given by the theorem and can be regenerated from the
  kernel and harmonic basis as needed.

## Inputs

1. Observation kernel `K`.
2. Observable algebra elements to decompose.
3. Desired number of harmonics or convergence tolerance for power iterations.

## Procedures

1. **Mode extraction.**
   Use iterative eigenvalue algorithms (power method, Arnoldi, etc.) to compute
   harmonic modes consistent with the acts `HarmonicMode`, `SpectrumMap`, and
   `Spectrum`.

2. **Normalization.**
   Ensure modes are nucleus-orthogonal: collapse via `FixedNucleateProfile` to
   enforce disjointness.

3. **Spectral decomposition.**
   Express observables as sums of projections onto the harmonic basis; record
   coefficients and residuals.

4. **Spectral radius check.**
   Monitor leading eigenvalues—should match the contraction factor described in
   the theorem.

## Invariants

- Modes must remain orthogonal (up to nucleus equivalence).
- Reconstructed observables (sum of projections) must match the originals within
  tolerance.
- Eigenvalues should obey ordering/spacing constraints derived from harmonic
  acts.

## Outputs

- List of modes/eigenvalues.
  - Spectral projections for each observable.
  - Diagnostics for orthogonality, reconstruction error, and spectral radius.

## Earlier material

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

Follows from the harmonic modes, the spectral eigenvalue, and the collapse
behaviour of the fixed nucleus.
