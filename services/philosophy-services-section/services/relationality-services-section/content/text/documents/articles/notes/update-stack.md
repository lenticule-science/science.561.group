---
title: Update Stack
id: update-stack
role: operator
status: plan
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
description: Pops the head frame after it has been applied, yielding the remaining Evaluation Context Stack.
---


Pops the head frame after it has been applied, yielding the remaining
[Evaluation Context Stack](./evaluation-context-stack.md).

## Proof
- Uses: stack/frame discipline to push/pop as needed.
- Shows that: stack evolution after a step can be expressed without violating context invariants.

## Earlier material

Pops the head frame after it has been applied, yielding the remaining
[Evaluation Context Stack](evaluation-context-stack.md).
