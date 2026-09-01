---
title: Relational Markov Dynamics
aliases:
  - Relational Markov Dynamics
  - relational markov dynamics
date-created: "2026-03-04T00:00:00"
keywords:
  - markov
  - probabilistic
  - mixing
  - stationary
depends_on:
  - theorem/internal/observation-kernel
  - theorem/internal/mixing-ergodicity
  - theorem/internal/physics-soundness-invariants
operations:
  - name: transition kernel
  - name: entropy
  - name: mixing
---

# Theorem (Relational Markov Dynamics)

The flow/measure/entropy acts form the usual ingredients of a reversible Markov
process: transition kernels, stationary distributions, entropy monotonicity,
and detailed balance.  This theorem lists the correspondences.

## 1. Transition kernels and chains

**Theorem 1 (Observation kernels).**
[Observation Kernel](../internal/observation-kernel.md) and
[Flow Measure Step](404.md) describe the one-step
transition operator on fixed profiles, while
[Profile Kernel Chain](404.md) iterates this
operator across profile towers.  Their fixed points are given by
[Fixed Kernel](404.md) and
[Fixed Chain](404.md).

*Proof sketch.* Each act’s proof already interprets the evolution as a kernel.
Applying the fixed-point construction yields the stationary kernel/chain, matching
the Markov notion of steady state. ∎

## 2. Entropy and mixing

**Theorem 2 (Entropy monotonicity).**
[Entropy](../internal/entropy.md),
[Profile Entropy](404.md), and
[Mixing](404.md) witness that entropy increases along the flow
until the stationary distribution is reached.  `Mixing` is earned by letting
`ProfileMixing` witness `Entropy`.

*Proof sketch.* The acts explicitly state that entropy is monotone under
flow–measure evolution and constant exactly on stationary chains.  This is the
usual H-theorem statement for Markov processes. ∎

## 3. Detailed balance and reversibility

**Theorem 3 (Detailed balance).**
[Detailed Balance](../internal/detailed-balance.md) combines
[Flow Measure Step](404.md) with
[Reverse Flow Step](404.md) (built from
[Fixed Kernel](404.md)) to show that the stationary
distribution equates forward and reverse transitions.

*Proof sketch.* The act’s proof explicitly checks the forward–reverse equality
under the stationary kernel, so it is exactly the detailed-balance condition. ∎

## 4. Ergodicity and invariants

**Theorem 4 (Ergodic averages).**
[Mixing and Ergodic Invariants](../internal/mixing-ergodicity.md) shows that
[Ergodicity](404.md) equates time averages along the flow
with spatial averages over the stationary distribution.  Combined with
[Reach](404.md) and [Physics Soundness](../internal/physics-soundness-invariants.md),
this gives the full probabilistic interpretation.

*Proof sketch.* The ergodicity act is literally `(FixedKernel Mixing)`, so it
implements the time–space equality.  The referenced internal theorems package
the argument, ensuring all necessary witnesses are present. ∎

## Summary

| Markov concept | Relational witnesses |
| -------------- | -------------------- |
| Transition kernel | `ObservationKernel`, `FlowMeasureStep`, `ProfileKernelChain` |
| Stationary distribution | `FixedKernel`, `FixedChain` |
| Entropy/mixing | `Entropy`, `ProfileEntropy`, `Mixing` |
| Detailed balance | `DetailedBalance` |
| Ergodicity | `Ergodicity`, `Reach`, `Mixing and Ergodic Invariants` |

Hence the relational calculus realises reversible Markov dynamics internally;
all probabilistic arguments can cite these earned acts.
