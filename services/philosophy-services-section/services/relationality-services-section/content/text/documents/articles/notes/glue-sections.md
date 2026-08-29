---
title: Glue Sections
id: glue-sections
role: operator
status: plan
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
---

# Glue Sections

Glues two compatible sections over overlapping windows into a single section,
using the earned sheaf gluing operation.

## Proof
- Uses: [Sheaf Glue](./sheaf-glue.md) over the [Coverage Site](./coverage-site.md)
  to combine compatible sections.
- Shows that: compatible local sections can be glued into a global section,
  preserving sheaf invariants.
