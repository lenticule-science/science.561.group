---
name: port-type-check
role: operator
inputs:
- id: port-set
  alias: ports
outputs:
- id: recognition
  alias: predicate
transformation:
- return
  - predicate
proof_refs:
- port-set
- recognition
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Validates that each port’s carrier/direction matches its inducing operator
signature.

## Invariants
- Predicate is top iff every port’s carrier/direction matches its declared signature.
- Pure check over port metadata; no side effects.
