---
name: validate-snapshot-descriptor
role: operator
inputs:
- id: snapshot
  alias: snapshot
outputs:
- id: snapshot
  alias: validated
- id: failure-carrier
  alias: failure
transformation:
- call
  - validate-snapshot
  - snapshot
proof_refs:
- snapshot
- failure-carrier
- validate-snapshot
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Checks snapshot id/version/provenance fields for correctness and uniqueness,
returning the descriptor or a failure.

## Proof
- Uses: field checks via the primitive validator.
- Shows that: descriptor validation is explicit and non-mutating.
