---
title: Evaluate Observable
id: evaluate-observable
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Evaluate Observable

Evaluates an observable operator on a section, producing a typed recognition
result (probability/entropy/free energy).

## Definition
- Inputs: a section in [Hypertensor Section](./hypertensor-section.md)
  and an operator from [Observable Typed Operator](./observable-typed-operator.md).
- Output: recognition value in [Recognition Carrier](./recognition.md).
- Behaviour: apply the observable algebra operation per typing rules; emit
  recognition representing the numeric/semantic result.

## Invariants
- Type safety: only well-typed observables applied.
- Semantic correctness: result matches observable algebra semantics.

## Proof
- Uses: observable typed operators and section inputs.
- Produces: recognition result.
- Shows that: observable computations can be performed soundly within the type system.
