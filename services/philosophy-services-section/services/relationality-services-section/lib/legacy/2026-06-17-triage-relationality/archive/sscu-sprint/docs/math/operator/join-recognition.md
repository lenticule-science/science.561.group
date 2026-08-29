---
title: Join Recognition
role: operator
inputs:
- id: recognition
  alias: left
- id: recognition
  alias: right
outputs:
- id: recognition
  alias: join
transformation:
- let
  - merged
    - call
      - recognition-merge
      - left
      - right
  - predicate
    - call
      - join-predicate
      - left
        - predicate
      - right
        - predicate
  - join
    - call
      - update-predicate
      - merged
      - predicate
  - return
    - join
proof_refs:
- recognition
- recognition-merge
- join-recognition
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Join Recognitions

Binary join (disjunction) on recognitions: glue supports/windows/scopes, then
take the lattice join of predicates.

## Invariants
- Support/window/scope remain glued; predicate is the least upper bound.
- Flow/nucleus compatibility maintained via `recognition-merge`.

## Proof
- Derived from: recognition join act on predicates plus sheaf gluing for
  supports/windows.
- Shows that: recognitions can be disjoined without breaking locality or
  flow/nucleus invariants.
