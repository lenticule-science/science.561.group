---
title: Push Context Frame
id: push-context-frame
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
- return
  - updated
proof_refs:
- evaluation-state
- evaluation-context
---


Pushes a frame onto the evaluation context stack within an evaluation state.

## Invariants
- Adds one frame to `context_stack`.
- Returns updated state; no mutation beyond stack change.
