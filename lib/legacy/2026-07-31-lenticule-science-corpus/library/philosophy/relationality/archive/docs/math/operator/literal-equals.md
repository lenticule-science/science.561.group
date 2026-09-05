---
title: Literal Equals
id: literal-equals
role: operator
status: plan
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
---


Compares two literal tags as traces, returning a recognition predicate of equality.

## Invariants
- Reflexive and symmetric on traces.
- Pure: no side effects; yields a predicate witness of equality.
