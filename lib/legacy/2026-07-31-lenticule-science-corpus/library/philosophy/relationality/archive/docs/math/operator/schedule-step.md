---
title: Schedule Step
id: schedule-step
role: operator
status: plan
inputs:
- id: evaluation-state
  alias: state
- id: wiring-plan
  alias: plan
outputs:
- id: evaluation-state
  alias: updated
transformation:
- return
  - updated
proof_refs:
- evaluation-state
- wiring-plan
---

# Schedule Step

Primitive scheduler that dequeues the next ready step, marks it in-flight, and
updates queues/bindings accordingly.

## Invariants
- Selects next ready step based on the plan’s dependency order.
- Updates evaluation-state queues without mutating other fields.
