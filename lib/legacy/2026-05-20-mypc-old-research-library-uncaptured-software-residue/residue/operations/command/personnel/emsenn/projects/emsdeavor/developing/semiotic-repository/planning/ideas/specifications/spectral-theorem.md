---

title: Spectral Simulation
aliases:
  - Spectral Simulation
  - spectral simulation
date-created: "2026-03-04T00:00:00"
keywords:
  - simulation
  - spectral
  - harmonic
depends_on:
  - theorem/external/spectral-theorem
type: specification
description: Specification for simulating spectral decomposition of the observation kernel into harmonic modes and projections.
target-discipline: mathematics
triage-status: promotable
---


# Specification (Spectral Simulation)

This specification implements **Theorem (Spectral Theorem)** by extracting
harmonic modes, eigenvalues, and spectral decompositions from the observation
kernel.

## State representation

- **Kernel operator `K`.**  
  The same operator used in the Markov spec, but here we emphasise its action on
  observables (vectors or symbolic expressions).

- **Harmonic basis storage.**  
  Collection of modes `ψ_i` with eigenvalues `λ_i`, obtained via `HarmonicMode`
  and related acts.

- **Spectral projections.**  
  Matrices (or symbolic operators) representing the projection onto each mode.

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
