---
title: Mixing and Ergodic Invariants
tags:
  - dynamics
  - mixing
  - ergodic
  - invariant
depends_on:
  - profile-mixing
  - mixing
  - fixed-kernel
  - fixed-chain
  - ergodicity
  - reach
---
# Theorem (Mixing and Ergodic Invariants)

Profile dynamics, entropy, and fixed kernels combine to give the usual
probabilistic guarantees: mixing, ergodicity, and unique invariant measures.
This text summarises the relevant theorems.

## 1. Mixing behaviour

**Theorem 1 (Profile mixing).**  
[Profile Mixing](../../acts/profile-mixing.md) composes
[Profile Dynamics](../../acts/profile-dynamics.md) with
[Profile Entropy](../../acts/profile-entropy.md), asserting that entropy increases
under profile flow until the stationary profile is reached.

*Proof sketch.* `(ProfileDynamics ProfileEntropy)` records that each profile step
pushes entropy forward.  Once a profile is stationary, entropy ceases to grow,
establishing mixing. ∎

**Corollary (Entropy mixing).**  
[Mixing](../../acts/mixing.md) specializes the profile result to the fixed entropy
functional (`Entropy`), so state distributions become independent under long
flow.

## 2. Stationary kernels and chains

**Theorem 2 (Fixed kernels and chains).**  
[Fixed Kernel](../../acts/fixed-kernel.md) applies
[Ensure Fixed Point](../../acts/ensure-fixed-point.md) to
[Observation Kernel](../../acts/observation-kernel.md), yielding stationary kernels.
[Fixed Chain](../../acts/fixed-chain.md) does the same for
[Profile Kernel Chain](../../acts/profile-kernel-chain.md).  Both inherit the
mixing behaviour above.

*Proof sketch.* Fixed-point iteration plus `IterativePersistence` ensures the
kernel/chain stabilizes.  Since the underlying dynamics are mixing, the fixed
points describe the unique stationary distributions. ∎

## 3. Ergodicity and invariants

**Theorem 3 (Ergodicity).**  
[Ergodicity](../../acts/ergodicity.md) lets `FixedKernel` witness `Mixing`, equating
time and space averages.  Thus every observable computed along the stationary
kernel agrees with its spatial expectation.

**Theorem 4 (Invariant lattice).**  
[Fixed Invariant](../../acts/fixed-invariant.md) through
[Fixed Invariant Geometry](../../acts/fixed-invariant-geometry.md) package the
invariant lattice and its geometry.  The mixing/ergodic acts ensure that this
lattice has a unique minimal fixed point—exactly the stationary profile recognized
by `FixedChain`.

## Result

| Property | Witnessing acts |
| -------- | ---------------- |
| Mixing | `ProfileMixing`, `Mixing` |
| Stationary kernels/chains | `FixedKernel`, `FixedChain` |
| Ergodicity | `Ergodicity = (FixedKernel Mixing)` |
| Invariant lattice | `FixedInvariant`, `FixedInvariantGeometry` |

Whenever the runtime needs guarantees about convergence, averaging, or invariant
measures, cite these acts: they provide the rigorous backing for the probabilistic
arguments used in higher-level constructions.
