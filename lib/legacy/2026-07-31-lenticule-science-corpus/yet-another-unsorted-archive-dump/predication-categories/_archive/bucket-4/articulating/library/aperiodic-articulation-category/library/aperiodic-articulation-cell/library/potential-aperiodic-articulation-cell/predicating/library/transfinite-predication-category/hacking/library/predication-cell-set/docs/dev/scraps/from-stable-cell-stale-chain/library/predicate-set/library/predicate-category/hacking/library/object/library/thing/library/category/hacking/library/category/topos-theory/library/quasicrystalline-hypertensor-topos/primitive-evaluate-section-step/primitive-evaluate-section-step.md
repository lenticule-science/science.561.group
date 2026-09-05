---
title: Primitive Evaluate Section Step
id: evaluate-section-step
role: operator
status: plan
inputs:
- id: hypertensor-section
  alias: section
- id: evaluation-context-stack
  alias: stack
outputs:
- id: hypertensor-section
  alias: next-section
- id: evaluation-context-stack
  alias: next-stack
transformation:
- return
- next-section
- next-stack
proof_refs:
- hypertensor-section
- evaluation-context-stack
---


Kernel small-step over a hypertensor section using the top frame of the
evaluation context stack to compute the next section and updated stack.

## Proof
- Uses: admissible flow/nucleus and frame plugging.
- Shows that: small-step reduction is available as a primitive transition.
