---
title: Negate Recognition
role: operator
inputs:
- id: recognition
  alias: predicate
outputs:
- id: recognition
  alias: negation
transformation:
- let
  - neg_predicate
    - call
      - negate-predicate
      - predicate
        - predicate
  - negation
    - call
      - update-predicate
      - predicate
      - neg_predicate
  - return
    - negation
proof_refs:
- recognition
- negate
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Pseudocomplement in the recognition lattice: returns the largest recognition
whose meet with the input yields bottom, preserving support/window/scope via
structural sharing.

## Proof
- Derived from: negation act on predicates.
- Shows that: recognition negation can be expressed by negating the predicate
  while preserving support/window/scope and flow/nucleus data.
