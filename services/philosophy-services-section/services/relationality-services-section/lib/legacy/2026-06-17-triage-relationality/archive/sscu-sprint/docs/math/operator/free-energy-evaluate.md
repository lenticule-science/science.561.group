---
title: Free Energy Evaluate
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Evaluates the free energy functional on a thermodynamic state.

## Definition
- Inputs: a [Free Energy Functional](../structure/free-energy-functional.md) and
  a [Thermodynamic State](../structure/thermodynamic-state.md).
- Output: free-energy valuation (numeric or relational) suitable for comparing
  states.
- Behaviour: combines entropy and observables from the state per the functional
  (e.g., `F = E - T·S` in numeric semantics).

## Invariants
- Monotonicity: along admissible flows, free energy decreases toward equilibrium
  when temperature/constraints are fixed.
- Consistency: agrees with entropy monotonicity and observable algebra laws.

## Proof
- Uses: [Free Energy Functional](../structure/free-energy-functional.md) and
  [Thermodynamic State](../structure/thermodynamic-state.md).
- Shows that: free-energy evaluation is well-defined over earned thermodynamic
  carriers.
