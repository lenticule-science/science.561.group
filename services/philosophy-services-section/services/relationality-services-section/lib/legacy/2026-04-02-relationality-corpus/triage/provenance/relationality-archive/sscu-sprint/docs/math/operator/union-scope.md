---
name: union-scope
role: operator
inputs:
- id: coverage-site
  alias: left
- id: coverage-site
  alias: right
outputs:
- id: coverage-site
  alias: scope
transformation:
- return
  - scope
proof_refs:
- coverage-site
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Combines two coverage scopes into a joint coverage where both recognitions hold.

## Proof
- Uses: coverage stability/union properties.
- Shows that: scopes can be combined when coverage admits a common refinement.
