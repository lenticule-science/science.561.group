---
title: Assert
id: assert
role: operator
status: plan
inputs:
- id: logic-algebra
  alias: predicate
- id: failure-carrier
  alias: on-failure
outputs:
- id: logic-algebra
  alias: predicate
transformation:
- if
- - call
  - is-true
  - predicate
- - return
  - predicate
- - return
  - - call
    - emit-failure
    - on-failure
    - predicate
proof_refs:
- logic-algebra
- failure-carrier
- is-true
- emit-failure
---



The earned guard that takes a predicate in the [Logic Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/logic-algebra.md)
and, if it holds, yields it as a witnessed assertion; otherwise it produces a
failure via the [Failure Carrier](./failure-carrier.md).

## Proof
- TODO: fill proof.
