---
name: merge-predicate
role: operator
inputs:
- id: recognition-ring
  alias: left
- id: recognition-ring
  alias: right
outputs:
- id: recognition-ring
  alias: merged
transformation:
- return
  - merged
proof_refs:
- recognition-ring
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Combines two recognition predicates (e.g., via lattice join/meet as appropriate
to the merge context).

## Proof
- Uses: recognition lattice/ring operations.
- Shows that: predicates can be combined while staying in the earned lattice.
