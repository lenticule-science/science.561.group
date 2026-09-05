---
title: Measurement Algebra Simulation
tags:
  - simulation
  - measurement
  - observable
depends_on:
  - theorem/external/relational-measurement-semantics
---
# Specification (Measurement Algebra Simulation)

This specification turns **Theorem (Relational Measurement Semantics)** into an
explicit routine: observables are bounded functions (vectors or symbolic
expressions), measures are positive distributions, and integration computes
expectations.

## State representation

- **Observable set `O`.**  
  Each observable is stored as a function `f` (e.g., real vector `ℝ^n` or
  symbolic expression) representing its value on each state.
- **Measure set `M`.**  
  Collection of probability distributions `μ` over the same state space (finite
  or symbolic).
- **Integration cache.**  
  Map `(μ, f) -> μ ⋅ f` to avoid recomputation and track temporal evolution.

## Inputs

1. Observable definitions (possibly generated from modal or trace data).
2. Measures drawn from the Markov simulation (stationary distributions).
3. Flow/observation updates describing how observables evolve in time.

## Update procedure

1. **Normalization.**  
   Ensure each observable is bounded and each measure sums to 1.  Clip or scale
   as needed.
2. **Integration / expectation.**  
   Compute `μ ⋅ f` for every `(μ, f)` pair and store the result.  Update when
   either argument changes.
3. **Flow propagation.**  
   Apply the flow operator to observables (matrix multiplication) and recompute
   expectations, mimicking `FlowObservation`.
4. **Equivalence detection.**  
   Identify observables with identical responses for all measures; these
   correspond to `FlowObservationEquivalence` classes.

## Invariants

- Expectations must be linear in both arguments; validate by checking sample
  combinations.
- Observables equivalent under all measures should collapse to a single class.
- Flow-propagated observables should preserve expectation with stationary
  measures.

## Outputs

- Expectation table `E[ f | μ ]`.
- Equivalence classes of observables.
- Alerts if invariants fail (nonlinearity, drift, normalization).
