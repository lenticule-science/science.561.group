---
title: Pop Context Frame
id: pop-context-frame
role: operator
status: plan
inputs:
- id: evaluation-state
  alias: state
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


Pops the top frame from the evaluation context stack within an evaluation state.

## Invariants
- Removes exactly one frame from `context_stack`.
- Returns updated state; no mutation beyond stack change.
