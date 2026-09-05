---
name: push-evaluation-context
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Pushes a new evaluation frame onto the [Evaluation Context Stack](../structure/evaluation-context-stack.md)
inside the [Evaluation State](../structure/evaluation-state.md).

## Invariants
- Stack grows by one frame; previous frames remain ordered below.
- New frame becomes the head of the context stack for subsequent stepping.
