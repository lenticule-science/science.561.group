---
title: Recognize Section
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



Math-level recognition of a hypertensor section, mirroring machine recognition.

## Definition
- Inputs: a [Hypertensor Section](../structure/hypertensor-section.md).
- Output: recognition result in the [Recognition Carrier](../structure/recognition.md).
- Behaviour: apply recognition operator to the section, producing semantic
  recognitions.

## Invariants
- Soundness: recognition reflects section content.
- Stability: recognition respects sheaf/flow constraints.

## Proof
- Uses: recognition semantics on sections.
- Produces: recognition output.
- Shows that: recognition is definable at the math level for sections.
