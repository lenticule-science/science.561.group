---
name: compute-recognition-normal-form
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



Computes the canonical normal form of a recognition via nucleus and logical
simplification.

## Definition
- Inputs: a recognition in the [Recognition Carrier](../structure/recognition.md).
- Output: its [Recognition Normal Form](../structure/recognition-normal-form.md).
- Behaviour: apply nucleus closure, simplify using logical laws (idempotence,
  absorption, distributivity, implication adjunction) until fixed.

## Invariants
- Idempotent: normalising twice yields the same result.
- Deterministic: output depends only on the input recognition.

## Proof
- Uses: nucleus and logic algebra simplifications.
- Produces: canonical normal form.
- Shows that: normalisation terminates and yields a unique representative up to
  earned equivalence.
