---
title: Port Type Check
id: port-type-check
role: operator
status: plan
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
---

# Port Type Check

Validates that each port’s carrier/direction matches its inducing operator
signature.

## Invariants
- Predicate is top iff every port’s carrier/direction matches its declared signature.
- Pure check over port metadata; no side effects.
