---
title: Relational Markov Dynamics
aliases:
  - Relational Markov Dynamics
  - relational markov dynamics
tags:
  - markov
  - probabilistic
  - mixing
  - stationary
depends-on:
  - theorem/internal/observation-kernel
  - theorem/internal/mixing-ergodicity
  - theorem/internal/physics-soundness-invariants
operations:
  - name: transition kernel
  - name: entropy
  - name: mixing
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Relational Markov Dynamics)

The flow/measure/entropy acts form the usual ingredients of a reversible Markov
process: transition kernels, stationary distributions, entropy monotonicity,
and detailed balance.  This theorem lists the correspondences.

## 1. Transition kernels and chains

**Theorem 1 (Observation kernels).**  
Observation Kernel and
Flow Measure Step describe the one-step
transition operator on fixed profiles, while
Profile Kernel Chain iterates this
operator across profile towers.  Their fixed points are given by
Fixed Kernel and
Fixed Chain.

*Proof sketch.* Each act’s proof already interprets the evolution as a kernel.
Applying the fixed-point construction yields the stationary kernel/chain, matching
the Markov notion of steady state. ∎

## 2. Entropy and mixing

**Theorem 2 (Entropy monotonicity).**  
Entropy,
Profile Entropy, and
Mixing witness that entropy increases along the flow
until the stationary distribution is reached.  `Mixing` is earned by letting
`ProfileMixing` witness `Entropy`.

*Proof sketch.* The acts explicitly state that entropy is monotone under
flow–measure evolution and constant exactly on stationary chains.  This is the
usual H-theorem statement for Markov processes. ∎

## 3. Detailed balance and reversibility

**Theorem 3 (Detailed balance).**  
Detailed Balance combines
Flow Measure Step with
Reverse Flow Step (built from
Fixed Kernel) to show that the stationary
distribution equates forward and reverse transitions.

*Proof sketch.* The act’s proof explicitly checks the forward–reverse equality
under the stationary kernel, so it is exactly the detailed-balance condition. ∎

## 4. Ergodicity and invariants

**Theorem 4 (Ergodic averages).**  
Mixing and Ergodic Invariants shows that
Ergodicity equates time averages along the flow
with spatial averages over the stationary distribution.  Combined with
Reach and Physics Soundness,
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
