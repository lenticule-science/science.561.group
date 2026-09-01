---
title: Recognition Merge
id: recognition-merge
role: operator
status: plan
inputs:
- id: recognition
  alias: left
- id: recognition
  alias: right
outputs:
- id: recognition
  alias: merged
transformation:
- let
  - support
    - call
      - glue-sections
      - left
        - support
      - right
        - support
  - window
    - call
      - union-window
      - left
        - window
      - right
        - window
  - predicate
    - call
      - merge-predicate
      - left
        - predicate
      - right
        - predicate
  - evidence
    - call
      - concatenate-evidence
      - left
        - evidence
      - right
        - evidence
  - scope
    - call
      - union-scope
      - left
        - scope
      - right
        - scope
  - provenance
    - call
      - merge-provenance
      - left
        - provenance
      - right
        - provenance
  - collapse_depth
    - call
      - max-collapse-depth
      - left
        - collapse_depth
      - right
        - collapse_depth
  - nucleus
    - call
      - ensure-flow-nucleus-compatibility
      - left
        - nucleus
      - right
        - nucleus
  - merged
    - call
      - recognition
      - support
      - window
      - predicate
      - evidence
      - scope
      - provenance
      - collapse_depth
      - nucleus
  - return
    - merged
proof_refs:
- recognition
- glue-sections
- union-window
- merge-predicate
- union-scope
- ensure-flow-nucleus-compatibility
---


Merges two recognitions over possibly overlapping support into a single
recognition with glued support/window, combined predicate/evidence/scope, and
compatible flow/nucleus data.

## Proof
- Uses: section gluing, window/scope union, and predicate merge to combine
  recognitions while preserving locality and flow/nucleus compatibility.
- Shows that: recognitions can be merged into a single carrier without
  violating sheaf or flow invariants.
