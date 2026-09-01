---
name: merge-provenance
role: operator
inputs:
- id: trace
  alias: left
- id: trace
  alias: right
outputs:
- id: trace
  alias: merged
transformation:
- return
  - merged
proof_refs:
- trace
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Combines provenance records from two recognitions into a merged trace history.

## Proof
- Uses: trace composition rules.
- Shows that: provenance can be merged to preserve reproducibility.
