---
title: Read Binding
id: read-binding
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
- return
  - value
proof_refs:
- evaluation-state
- trace
---


Environment lookup by name in an evaluation state’s binding environment.

## Invariants
- Does not mutate the environment.
- Returns the bound value or a sentinel handled upstream.
