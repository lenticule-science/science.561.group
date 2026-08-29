---
title: Top Frame
id: top-frame
role: operator
status: plan
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
---

# Top Frame

Returns the `head` evaluation frame from the
[Evaluation Context Stack](./evaluation-context-stack.md).

## Proof
- Uses: stack structure.
- Shows that: the current evaluation frame can be selected for stepping.
