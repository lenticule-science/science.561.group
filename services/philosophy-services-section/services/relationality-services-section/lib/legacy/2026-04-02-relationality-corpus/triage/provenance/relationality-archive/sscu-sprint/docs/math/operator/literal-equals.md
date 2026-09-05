---
name: literal-equals
role: operator
inputs:
- id: trace
  alias: left
- id: trace
  alias: right
outputs:
- id: recognition
  alias: predicate
transformation:
- call
  - eq
  - left
  - right
proof_refs:
- trace
- recognition
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Compares two literal tags as traces, returning a recognition predicate of equality.

## Invariants
- Reflexive and symmetric on traces.
- Pure: no side effects; yields a predicate witness of equality.
