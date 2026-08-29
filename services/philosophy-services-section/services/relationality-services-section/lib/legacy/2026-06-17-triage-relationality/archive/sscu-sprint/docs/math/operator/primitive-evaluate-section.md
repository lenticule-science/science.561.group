---
title: Primitive Evaluate Section
role: operator
inputs:
- id: hypertensor-section
  alias: section
- id: evaluation-context-stack
  alias: stack
outputs:
- id: hypertensor-section
  alias: result-section
- id: evaluation-context-stack
  alias: result-stack
transformation:
- return
- result-section
- result-stack
proof_refs:
- hypertensor-section
- evaluation-context-stack
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Performs big-step evaluation of a hypertensor section by iterating small-step
reductions until normal form or failure.

## Proof
- Uses: repeated application of small-step primitive.
- Shows that: big-step evaluation can be realized as a primitive loop.
