---
title: Push Evaluation Context
id: push-evaluation-context
role: operator
status: plan
inputs:
- id: evaluation-state
  alias: state
- id: evaluation-context
  alias: frame
outputs:
- id: evaluation-state
  alias: updated
transformation:
- let
  - stack
    - state
      - context_stack
  - updated_stack
    - push
      - stack
      - frame
  - return
    - state
      - context_stack
        - updated_stack
proof_refs:
- evaluation-state
- evaluation-context
- evaluation-context-stack
---

# Push Evaluation Context

Pushes a new evaluation frame onto the [Evaluation Context Stack](./evaluation-context-stack.md)
inside the [Evaluation State](./evaluation-state.md).

## Invariants
- Stack grows by one frame; previous frames remain ordered below.
- New frame becomes the head of the context stack for subsequent stepping.
