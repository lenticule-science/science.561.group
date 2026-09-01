---
title: Is True
role: operator
inputs:
- id: recognition
  alias: predicate
outputs:
- id: recognition
  alias: predicate
transformation:
- call
  - recognition-truth
  - predicate
proof_refs:
- recognition
- recognition-truth
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Converts a predicate in the [Recognition Carrier](../structure/recognition.md)
to a truthy/falsy recognition value for branching in the interpreter.

## Proof
- Uses: check for top/bottom (or equivalent truth ordering) on recognitions.
- Shows that: branching relies only on the earned recognition lattice without
  introducing an unearned logic algebra.
