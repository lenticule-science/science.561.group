---
title: Set Binding
id: set-binding
role: operator
status: plan
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
---


Returns a new [Evaluation State](./evaluation-state.md) whose binding
environment maps `name` to `value` (shadowing any prior binding).

## Invariants
- Functional update: produces a new state; original bindings remain unchanged.
- Shadowing: new binding for `name` overwrites prior mapping while preserving others.
