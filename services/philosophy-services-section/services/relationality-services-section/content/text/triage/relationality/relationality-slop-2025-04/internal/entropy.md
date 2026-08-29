---
title: Entropy
aliases:
  - Entropy
  - entropy
date-created: "2026-03-04T00:00:00"
keywords:
  - entropy
  - markov
depends_on:
  - entropy
  - profile-entropy
  - fixed-chain
---

# Theorem (Entropy)

`Entropy = (TraceProfile EntropyMeasure)` yields an entropy
functional on the fixed profile with the following properties:

1. **Monotonicity.**
   Under flow–measure evolution, entropy does not decrease until the stationary
   chain is reached.

2. **Stationary minimality.**
   Entropy attains its minimum exactly at the stationary profile (recognised by
   `FixedChain`).

3. **Spectral proportionality.**
   In numeric semantics, entropy scales proportionally to the leading spectral
   ratio under iteration:
   $$
   H_{n+1} = \lambda \cdot H_n
   \quad\text{until convergence.}
   $$

## Proof sketch

Monotonicity follows from the closure properties of `FixedNucleateProfile`.
Minimality follows because stationary kernels are fixed under the flow and
measurement, collapsing the entropy seed.  Proportionality follows from the
leading eigenvalue identified in the semantic corollary.
