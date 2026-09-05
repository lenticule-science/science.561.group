---
title: Measurement Kernel Carrier
id: measurement-kernel
role: structure
status: plan
derived_from: acts/observation-kernel
proof_refs: []
---



## Definition
- Carrier: Stochastic-style kernels that transport observed measures along the earned observation flow.
- Components: each kernel pairs an input measure with the corresponding output distribution induced by flow evolution.
- Source: earned from [Observation Kernel](../acts/observation-kernel.md), which packages flow and observation into a transition operator.

## Invariants
- Kernel composition follows the flow composition law; identities act as measure-preserving kernels.
- Measures pushed through the kernel respect observation coherence from [Flow Observation](../acts/flow-observation.md).

## Proof
- Derived from: [Observation Kernel](../acts/observation-kernel.md), which establishes the existence of flow–measure kernels.
- Shows that: the observation kernel act already furnishes the transition operators; enforcing flow-observation coherence yields a well-defined carrier of measurement kernels.
