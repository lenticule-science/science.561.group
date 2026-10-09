---
title: Measurement Structure
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
description: "The measure, profile, observation, and entropy acts induce a measurement structure: observables, measures, and kernels with well-behaved dynamics under flow."
keywords:
  - measurement
  - observable
  - kernel
aliases:
  - Measurement Stack
  - measurement stack
---

# Measurement Structure

The measure, profile, observation, and entropy acts induce a measurement
structure: observables, measures, and kernels with well-behaved dynamics under
flow.

Formally, there exists a structure

```text
Measurement = (Observables, Measures, Kernels, Evolve)
```

such that:

1. **Observables and integration.**
   `Observables` and `Measures` are sets and relations induced by the acts
   `Measure`, `ProfileMeasure`, `ProfileIntegral`, and `FlowObservation`,
   describing how observables are measured and propagated along flows.

2. **Kernels.**
   `Kernels` is the collection of Markov-style kernels induced by
   `ObservationKernel`, packaging flow-measure evolution into transition
   operators.

3. **Dynamics.**
   `Evolve` uses the entropy and mixing acts to describe how repeated
   measurement and kernel application converge toward stationary behaviour on
   the earned class of systems.

Together these acts and this structure justify the probabilistic semantics
used elsewhere (Markov specifications, measurement simulations, etc.): they
provide a single measurement object that specs and implementations must
instantiate.

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
