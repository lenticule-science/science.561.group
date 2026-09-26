---
title: Pop Evaluation Context
id: pop-evaluation-context
role: operator
status: plan
inputs:
- id: evaluation-state
  alias: state
outputs:
- id: evaluation-state
  alias: updated
transformation:
- let
  - stack
    - state
      - context_stack
  - updated_stack
    - pop
      - stack
  - return
    - state
      - context_stack
        - updated_stack
proof_refs:
- evaluation-state
- evaluation-context
- evaluation-context-stack
description: Removes the top evaluation frame from the context stack inside an Evaluation State, returning the updated state.
---


Removes the top evaluation frame from the context stack inside an
[Evaluation State](./evaluation-state.md), returning the updated state.

## Invariants
- Removes exactly one frame from the head of the context stack.
- Stack remains well-formed; no mutation beyond dropping the head.
