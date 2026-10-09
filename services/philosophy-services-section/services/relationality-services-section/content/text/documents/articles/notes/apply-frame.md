---
title: Apply Frame
id: apply-frame
role: operator
status: plan
inputs:
- id: evaluation-context
  alias: frame
- id: hypertensor-section
  alias: section
outputs:
- id: hypertensor-section
  alias: reduced
transformation:
- let
  - reduced
    - call
      - sheaf-glue
      - frame
        - spine
      - frame
        - plug
      - frame
        - hole_scope
  - return
    - reduced
proof_refs:
- evaluation-context
- hypertensor-section
- sheaf-glue
description: Applies the frame’s plug operation to a section, producing the reduced section.
---


Applies the frame’s `plug` operation to a section, producing the reduced section.

## Proof
- Uses: evaluation context plug operation.
- Shows that: plugging the section into the frame yields the next section.
