---
name: glue-sections
role: operator
inputs:
- id: hypertensor-section
  alias: left
- id: hypertensor-section
  alias: right
outputs:
- id: hypertensor-section
  alias: glued
transformation:
- call
  - sheaf-glue
  - call
    - coverage-site
  - call
    - matching-family
    - left
    - right
proof_refs:
- hypertensor-section
- sheaf-glue
- matching-family
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Glues two compatible sections over overlapping windows into a single section,
using the earned sheaf gluing operation.

## Proof
- Uses: [Sheaf Glue](sheaf-glue.md) over the [Coverage Site](../structure/coverage-site.md)
  to combine compatible sections.
- Shows that: compatible local sections can be glued into a global section,
  preserving sheaf invariants.
