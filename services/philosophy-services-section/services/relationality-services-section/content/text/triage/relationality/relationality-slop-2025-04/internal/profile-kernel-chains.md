---
title: Kernel Chains on profiles
aliases:
  - Kernel Chains on profiles
  - kernel chains on profiles
date-created: "2026-03-04T00:00:00"
keywords:
  - profiles
  - tower
depends_on:
  - observation-kernel
  - build-profile-tower
  - profile-kernel-step
  - profile-kernel-chain
  - ensure-fixed-point
---

# Theorem (Kernel Chains on Profiles)

With acts

- `ProfileKernelStep = (ObservationKernel BuildProfileTower)`,
- `ProfileKernelChain = (ProfileKernelStep TraceProfile)`,
- `FixedChain = (EnsureFixedPoint ProfileKernelChain)`,

we have:

1. **Profile propagation.**
   `ProfileKernelChain` threads the kernel dynamics through successive profiles
   in the tower.

2. **Chain convergence.**
   `FixedChain` is the unique (up to stabilised equivalence) profile-level
   fixed distribution for this chain.

3. **Compatibility with fixed geometry.**
   The chain preserves the fixed geometry at each profile level and interacts
   coherently with the invariant lattice.

## Proof sketch

The profile tower recognitions provide the structural recursion; the observation
kernel supplies the local transition rule; and the fixed-point machinery yields
the stationary profile.
