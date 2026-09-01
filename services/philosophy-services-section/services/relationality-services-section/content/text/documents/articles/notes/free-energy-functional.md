---
title: Free Energy Functional
id: free-energy-functional
role: structure
status: plan
proof_refs: []
---



Functional combining entropy with observables to express free energy in the
relational/stochastic setting.

## Definition
- Inputs: entropy from [Entropy Functional](./entropy-functional.md) and chosen
  observables from [Observable Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/observable-algebra.md).
- Output: free-energy valuation (numeric `F = E - T·S` in semantic models or
  relational inequality in purely recognitional form).
- Behaviour: evaluates observables under the current state and combines with
  entropy to guide equilibrium reasoning.

## Invariants
- Monotonicity: along admissible flows, free energy decreases toward equilibria
  under fixed temperature/constraints.
- Consistency: compatible with entropy monotonicity and observable algebra
  operations.

## Proof
- Uses: [Entropy Functional](./entropy-functional.md) and
  [Observable Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/observable-algebra.md) to define the functional.
- Shows that: free-energy reasoning can be expressed within earned relational
  observables without introducing external semantics.
