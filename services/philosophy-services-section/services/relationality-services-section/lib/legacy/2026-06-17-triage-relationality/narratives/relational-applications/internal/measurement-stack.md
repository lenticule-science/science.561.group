---
title: Measurement Stack
aliases:
  - Measurement Stack
  - measurement stack
tags:
  - measurement
  - observable
  - kernel
depends-on:
  - measure
  - profile-measure
  - profile-integral
  - flow-observation
  - observation-kernel
  - entropy
  - mixing
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Measurement Stack)

Observables, measures, and kernels form a coherent stack:

1. **Observables and integration.**  
   `Measure`, `ProfileMeasure`, `ProfileIntegral`, and `FlowObservation` show how
   observables are measured and propagated along flows.

2. **Kernels.**  
   `ObservationKernel` packages flow-measure evolution into Markov-style kernels.

3. **Dynamics.**  
   `Entropy` and `Mixing` demonstrate that repeated measurement converges toward
   stationary behaviour.

Together these acts justify the probabilistic semantics used elsewhere (Markov
specs, measurement simulations, etc.).
