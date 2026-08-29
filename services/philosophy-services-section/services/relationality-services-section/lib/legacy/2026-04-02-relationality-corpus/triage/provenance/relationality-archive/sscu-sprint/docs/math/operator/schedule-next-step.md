---
name: schedule-next-step
role: operator
inputs:
- id: evaluation-state
  alias: state
- id: wiring-plan
  alias: plan
outputs:
- id: evaluation-state
  alias: updated
transformation:
- call
  - schedule-step
  - state
  - plan
proof_refs:
- evaluation-state
- wiring-plan
- schedule-step
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Removes the head of the ready queue in an [Evaluation State](../structure/evaluation-state.md),
checks its input bindings from the [Wiring Plan](../structure/wiring-plan.md),
and marks it in-flight for execution.

## Proof
- Uses: ready queue and plan topology to pick a ready step.
- Shows that: scheduling advances deterministically or produces failure if no ready steps remain.
