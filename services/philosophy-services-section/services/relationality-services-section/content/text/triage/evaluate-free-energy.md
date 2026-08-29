---
title: Evaluate Free Energy
id: evaluate-free-energy
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Evaluate Free Energy

Typed evaluation of the free energy functional on a thermodynamic state.

## Definition
- Inputs: a [Thermodynamic State](../structure/thermodynamic-state.md) and the
  [Free Energy Typed Operator](../structure/free-energy-typed-operator.md).
- Output: recognition value (energy/ordering) in the
  [Recognition Carrier](../structure/recognition.md).
- Behaviour: combine entropy/observable values per the free-energy definition;
  emit typed recognition.

## Invariants
- Type safety: only applicable to thermodynamic/observable carriers.
- Monotonicity: respects entropy/observable algebra laws.

## Proof
- Uses: free-energy typed operator on the thermodynamic state.
- Produces: recognition result.
- Shows that: free-energy evaluation is well-defined and typed.
