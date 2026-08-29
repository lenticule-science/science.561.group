---
title: Update Predicate
role: operator
inputs:
- id: recognition
  alias: carrier
- id: recognition-ring
  alias: predicate
outputs:
- id: recognition
  alias: updated
transformation:
- return
  - updated
proof_refs:
- recognition
- recognition-ring
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Replaces the predicate component of a recognition while keeping support/window,
evidence, scope, provenance, collapse depth, and nucleus unchanged.

## Proof
- Uses: recognition structure.
- Shows that: predicate updates can be applied without disturbing other fields.
