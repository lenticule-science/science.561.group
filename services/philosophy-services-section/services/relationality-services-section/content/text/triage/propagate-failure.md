---
title: Propagate Failure
id: propagate-failure
role: operator
status: plan
inputs:
- id: failure-carrier
  alias: payload
outputs:
- id: failure-carrier
  alias: result
transformation:
- call
  - failure-absorb
  - payload
proof_refs:
- failure-carrier
- failure-algebra
---



Propagates failure recognitions through operations, aligning with failure algebra.

## Definition
- Inputs: recognition(s) possibly containing failure elements from
  [Failure Algebra](../structure/failure-algebra.md).
- Output: combined recognition where failures are absorbed/propagated as per the algebra.
- Behaviour: evaluate operation; if any input is failure, propagate failure unless an explicit handler is defined.

## Invariants
- Absorption: failure presence forces failure result (unless handled).
- Determinism: propagation follows algebraic rules consistently.

## Proof
- Uses: failure algebra absorption rules.
- Produces: resulting recognition.
- Shows that: failure handling is consistent with algebraic semantics.
