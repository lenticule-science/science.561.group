---
title: Max Collapse Depth
id: max-collapse-depth
role: operator
status: plan
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
description: Returns the greater of two collapse-depth measures.
---


Returns the greater of two collapse-depth measures.

## Proof
- Uses: ordering on collapse depth.
- Shows that: collapse depth can be combined conservatively.
