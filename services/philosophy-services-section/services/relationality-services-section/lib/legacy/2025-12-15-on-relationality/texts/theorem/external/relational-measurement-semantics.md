---
title: Relational Measurement Semantics
tags:
  - measurement
  - observable
  - algebra
depends_on:
  - theorem/internal/observable-algebra
  - theorem/internal/mixing-ergodicity
operations:
  - name: measure
    symbol: μ
    acts:
      - profile-measure
  - name: integral
    symbol: ∫
    acts:
      - profile-integral
  - name: expectation
    symbol: "E[·]"
    acts:
      - flow-observation-equivalence
---
# Theorem (Relational Measurement Semantics)

The observable algebra earned internally corresponds to classical measure and
operator semantics.  Observables behave like measurable functions; measures like
states; and integration matches expectation.

## 1. Observable algebra ↔ measurable functions

**Theorem 1 (Observables as functions).**  
The internal [Observable Algebra](../../internal/observable-algebra.md) shows that
observables form a lattice-ordered algebra closed under addition and scalar
multiplication, just like bounded measurable functions.  The flow invariance
mirrors the equivalence of functions up to measure-zero differences.

## 2. Measures as states

**Theorem 2 (Profile measures).**  
[Measure](../../../acts/measure.md),
[Profile Measure](../../../acts/profile-measure.md), and
[Profile Integral](../../../acts/profile-integral.md) act exactly like measures
and integrals on measurable spaces: integration is linear, positive, and respects
pullbacks (through `FlowObservation`).

*Proof sketch.* Each cited act’s proof remarks on linearity/positivity.  Since
`FlowObservation` composes with integration, we get the functorial behaviour of
expected value under morphisms. ∎

## 3. Expectations and probabilistic semantics

**Theorem 3 (Expectations via Markov dynamics).**  
[Relational Markov Dynamics](relational-markov-dynamics.md) interprets the flow
of measures as a Markov chain; expectations of observables coincide with the
integrals computed along those kernels.  Detailed balance and ergodicity match
standard probabilistic assumptions.

*Proof sketch.* The Markov theorem already states that entropy, detailed balance,
and ergodicity hold.  Together with the observable algebra, this replicates the
“measure + observable” framework used in probability. ∎

## 4. Comparison to operator algebras

**Theorem 4 (Operator interpretation).**  
Restricting to stabilized observables, composition with flow corresponds to
Heisenberg evolution.  `FlowObservationEquivalence` plays the role of quotienting
by null operators, matching the C*-algebraic idea of identifying operators that
act trivially on all states.

*Proof sketch.* `FlowObservationEquivalence` explicitly identifies observables
that no context can distinguish.  Viewing observables as operators on the space
of traces, the flow acts as conjugation, so we obtain the usual operator algebra
semantics. ∎

## Summary

| Classical concept | Relational witnesses |
| ----------------- | -------------------- |
| Observable algebra | Internal observable algebra theorem |
| Measures/integration | `Measure`, `ProfileMeasure`, `ProfileIntegral` |
| Expectations | `Relational Markov Dynamics` |
| Operator equivalence | `FlowObservationEquivalence` |

Hence the relational calculus realises the standard measurement semantics used in
probability and operator algebra.
