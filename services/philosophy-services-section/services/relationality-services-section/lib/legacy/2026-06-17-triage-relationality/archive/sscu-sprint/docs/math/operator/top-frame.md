---
title: Top Frame
role: operator
inputs:
- id: evaluation-context-stack
  alias: stack
outputs:
- id: evaluation-context
  alias: frame
transformation:
- return
  - stack
    - head
proof_refs:
- evaluation-context-stack
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Returns the `head` evaluation frame from the
[Evaluation Context Stack](../structure/evaluation-context-stack.md).

## Proof
- Uses: stack structure.
- Shows that: the current evaluation frame can be selected for stepping.
