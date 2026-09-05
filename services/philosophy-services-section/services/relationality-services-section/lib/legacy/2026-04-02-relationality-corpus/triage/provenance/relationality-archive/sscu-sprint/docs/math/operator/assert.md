---
name: assert
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



The earned guard that takes a predicate in the [Logic Algebra](../structure/logic-algebra.md)
and, if it holds, yields it as a witnessed assertion; otherwise it produces a
failure via the [Failure Carrier](../structure/failure-carrier.md).

## Proof
- TODO: fill proof.
