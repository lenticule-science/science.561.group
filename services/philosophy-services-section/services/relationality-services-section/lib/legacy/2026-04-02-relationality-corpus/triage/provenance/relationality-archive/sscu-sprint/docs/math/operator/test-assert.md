---
name: test-assert
role: Compare observed results against expected observables up to earned equivalence.
inputs:
- id: test-case
  name: test
- id: observable-carrier
  name: observed
outputs:
- id: logic-algebra
  name: assertion
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Uses measurement structures/dynamics to compare observed results against
expected observables, respecting nucleus equivalence where applicable.

## Proof
- TODO: fill proof.
