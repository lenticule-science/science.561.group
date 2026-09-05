---
title: Lookup Binding
id: lookup-binding
role: operator
status: plan
inputs:
- id: evaluation-state
  alias: state
- id: trace
  alias: name
outputs:
- id: trace
  alias: value
transformation:
- let
  - env
    - state
      - bindings
  - value
    - lookup
      - env
      - name
  - return
    - value
proof_refs:
- evaluation-state
- binding-environment
- read-binding
---


Retrieves a bound runtime value from the [Evaluation State](./evaluation-state.md)
by name (port id or variable).

## Proof
- Uses: the state’s [Binding Environment](./binding-environment.md).
- Shows that: name resolution is available as a documented lookup over the binding environment.
