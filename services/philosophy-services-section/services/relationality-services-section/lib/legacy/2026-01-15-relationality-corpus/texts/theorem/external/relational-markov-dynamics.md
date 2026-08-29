---

title: Relational Markov Dynamics
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
    symbol: K
    acts:
      - observation-kernel
  - name: entropy
    symbol: H
    acts:
      - entropy
  - name: mixing
    acts:
      - mixing
form: research
# Theorem (Relational Markov Dynamics)

The flow/measure/entropy acts form the usual ingredients of a reversible Markov
process: transition kernels, stationary distributions, entropy monotonicity,
and detailed balance.  This theorem lists the correspondences.

## 1. Transition kernels and chains

**Theorem 1 (Observation kernels).**  
[Observation Kernel](../../../acts/observation-kernel.md) and
[Flow Measure Step](../../../acts/flow-measure-step.md) describe the one-step
transition operator on fixed profiles, while
[Profile Kernel Chain](../../../acts/profile-kernel-chain.md) iterates this
operator across profile towers.  Their fixed points are given by
[Fixed Kernel](../../../acts/fixed-kernel.md) and
[Fixed Chain](../../../acts/fixed-chain.md).

*Proof sketch.* Each act’s proof already interprets the evolution as a kernel.
Applying the fixed-point construction yields the stationary kernel/chain, matching
the Markov notion of steady state. ∎

## 2. Entropy and mixing

**Theorem 2 (Entropy monotonicity).**  
[Entropy](../../../acts/entropy.md),
[Profile Entropy](../../../acts/profile-entropy.md), and
[Mixing](../../../acts/mixing.md) witness that entropy increases along the flow
until the stationary distribution is reached.  `Mixing` is earned by letting
`ProfileMixing` witness `Entropy`.

*Proof sketch.* The acts explicitly state that entropy is monotone under
flow–measure evolution and constant exactly on stationary chains.  This is the
usual H-theorem statement for Markov processes. ∎

## 3. Detailed balance and reversibility

**Theorem 3 (Detailed balance).**  
[Detailed Balance](../../../acts/detailed-balance.md) combines
[Flow Measure Step](../../../acts/flow-measure-step.md) with
[Reverse Flow Step](../../../acts/reverse-flow-step.md) (built from
[Fixed Kernel](../../../acts/fixed-kernel.md)) to show that the stationary
distribution equates forward and reverse transitions.

*Proof sketch.* The act’s proof explicitly checks the forward–reverse equality
under the stationary kernel, so it is exactly the detailed-balance condition. ∎

## 4. Ergodicity and invariants

**Theorem 4 (Ergodic averages).**  
[Mixing and Ergodic Invariants](../../internal/mixing-ergodicity.md) shows that
[Ergodicity](../../../acts/ergodicity.md) equates time averages along the flow
with spatial averages over the stationary distribution.  Combined with
[Reach](../../../acts/reach.md) and [Physics Soundness](../../internal/physics-soundness-invariants.md),
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
