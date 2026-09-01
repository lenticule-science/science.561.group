---
name: read-binding
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Environment lookup by name in an evaluation state’s binding environment.

## Invariants
- Does not mutate the environment.
- Returns the bound value or a sentinel handled upstream.
