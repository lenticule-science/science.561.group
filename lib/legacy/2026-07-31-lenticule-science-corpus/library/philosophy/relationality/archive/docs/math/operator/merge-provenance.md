---
title: Merge Provenance
id: merge-provenance
role: operator
status: plan
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
---

# Merge Provenance

Combines provenance records from two recognitions into a merged trace history.

## Proof
- Uses: trace composition rules.
- Shows that: provenance can be merged to preserve reproducibility.
