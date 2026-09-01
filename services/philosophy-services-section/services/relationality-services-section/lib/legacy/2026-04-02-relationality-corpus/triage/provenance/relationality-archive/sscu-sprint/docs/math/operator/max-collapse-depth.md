---
name: max-collapse-depth
role: operator
inputs:
- id: recognition-collapse-depth
  alias: left
- id: recognition-collapse-depth
  alias: right
outputs:
- id: recognition-collapse-depth
  alias: depth
transformation:
- return
  - depth
proof_refs:
- recognition-collapse-depth
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Returns the greater of two collapse-depth measures.

## Proof
- Uses: ordering on collapse depth.
- Shows that: collapse depth can be combined conservatively.
