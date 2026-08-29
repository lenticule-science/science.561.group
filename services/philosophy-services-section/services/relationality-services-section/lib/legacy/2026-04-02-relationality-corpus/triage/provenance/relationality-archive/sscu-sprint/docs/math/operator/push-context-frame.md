---
name: push-context-frame
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
- return
  - updated
proof_refs:
- evaluation-state
- evaluation-context
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Pushes a frame onto the evaluation context stack within an evaluation state.

## Invariants
- Adds one frame to `context_stack`.
- Returns updated state; no mutation beyond stack change.
