---
title: Semantic Collapse
id: semantic-collapse
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Collapses a logical formula/recognition expression to its recognition semantics,
eliminating syntactic redundancy.

## Definition
- Inputs: recognition expression in the [Recognition Carrier](./recognition.md).
- Output: semantic recognition after applying lattice/logic laws to remove
  redundancy.
- Behaviour: normalise using meets/joins/implication/negation and nucleus to
  produce a canonical semantic form.

## Invariants
- Idempotent: repeated collapse yields the same semantic recognition.
- Soundness: semantics preserved; syntax removed.

## Proof
- Uses: [Recognition Carrier](./recognition.md) and
  [Logic Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/logic-algebra.md).
- Produces: canonical semantic recognition.
- Shows that: syntactic forms can be reduced to earned semantics.
