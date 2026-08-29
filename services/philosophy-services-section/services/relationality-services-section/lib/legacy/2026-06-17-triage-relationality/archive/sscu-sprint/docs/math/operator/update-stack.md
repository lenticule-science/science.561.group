---
title: Update Stack
role: operator
inputs:
- id: evaluation-context-stack
  alias: stack
- id: hypertensor-section
  alias: section
outputs:
- id: evaluation-context-stack
  alias: updated
transformation:
- return
  - stack
    - tail
proof_refs:
- evaluation-context-stack
- hypertensor-section
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Pops the head frame after it has been applied, yielding the remaining
[Evaluation Context Stack](../structure/evaluation-context-stack.md).

## Proof
- Uses: stack/frame discipline to push/pop as needed.
- Shows that: stack evolution after a step can be expressed without violating context invariants.
