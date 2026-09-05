---
name: semantic-collapse
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Collapses a logical formula/recognition expression to its recognition semantics,
eliminating syntactic redundancy.

## Definition
- Inputs: recognition expression in the [Recognition Carrier](../structure/recognition.md).
- Output: semantic recognition after applying lattice/logic laws to remove
  redundancy.
- Behaviour: normalise using meets/joins/implication/negation and nucleus to
  produce a canonical semantic form.

## Invariants
- Idempotent: repeated collapse yields the same semantic recognition.
- Soundness: semantics preserved; syntax removed.

## Proof
- Uses: [Recognition Carrier](../structure/recognition.md) and
  [Logic Algebra](../structure/logic-algebra.md).
- Produces: canonical semantic recognition.
- Shows that: syntactic forms can be reduced to earned semantics.
