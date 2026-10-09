---
title: Meet Recognition
id: meet-recognition
role: operator
status: plan
inputs:
- id: recognition
  alias: left
- id: recognition
  alias: right
outputs:
- id: recognition
  alias: meet
transformation:
- let
  - merged
    - call
      - recognition-merge
      - left
      - right
  - predicate
    - call
      - meet-predicate
      - left
        - predicate
      - right
        - predicate
  - meet
    - call
      - update-predicate
      - merged
      - predicate
  - return
    - meet
proof_refs:
- recognition
- recognition-merge
- meet-recognition
description: "Binary meet (conjunction) on recognitions: glue supports/windows/scopes, then take the lattice meet of predicates."
---

# Meet Recognitions

Binary meet (conjunction) on recognitions: glue supports/windows/scopes, then
take the lattice meet of predicates.

## Invariants
- Support/window/scope remain glued; predicate is the greatest lower bound.
- Flow/nucleus compatibility maintained via `recognition-merge`.

## Proof
- Derived from: recognition meet act on predicates plus sheaf gluing for
  supports/windows.
- Shows that: recognitions can be conjoined without breaking locality or
  flow/nucleus invariants.
