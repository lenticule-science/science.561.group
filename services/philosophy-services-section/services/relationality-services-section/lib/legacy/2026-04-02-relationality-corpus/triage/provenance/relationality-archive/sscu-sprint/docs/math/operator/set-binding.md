---
name: set-binding
role: operator
inputs:
- id: evaluation-state
  alias: state
- id: trace
  alias: name
- id: trace
  alias: value
outputs:
- id: evaluation-state
  alias: updated
transformation:
- let
  - env
    - state
      - bindings
  - new_env
    - extend
      - env
      - name
      - value
  - return
    - state
      - bindings
        - new_env
proof_refs:
- evaluation-state
- binding-environment
- trace
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Returns a new [Evaluation State](../structure/evaluation-state.md) whose binding
environment maps `name` to `value` (shadowing any prior binding).

## Invariants
- Functional update: produces a new state; original bindings remain unchanged.
- Shadowing: new binding for `name` overwrites prior mapping while preserving others.
