---
title: Validate Snapshot Descriptor
id: validate-snapshot
role: operator
status: plan
inputs:
- id: snapshot
  alias: snapshot
outputs:
- id: snapshot
  alias: validated
- id: failure-carrier
  alias: failure
transformation:
- return
  - validated
  - failure
proof_refs:
- snapshot
- failure-carrier
---


Checks snapshot id, version, and provenance fields for correctness/uniqueness.

## Invariants
- Ensures `id`, `version`, and provenance fields are well-formed.
- Returns validated snapshot or explicit failure without mutating inputs.
