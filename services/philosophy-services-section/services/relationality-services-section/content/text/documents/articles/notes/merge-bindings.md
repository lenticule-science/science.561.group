---
title: Merge Bindings
id: merge-bindings
role: operator
status: plan
inputs:
- id: evaluation-state
  alias: state
- id: binding-environment
  alias: bindings
outputs:
- id: evaluation-state
  alias: extended
transformation:
- return
  - extended
proof_refs:
- evaluation-state
- binding-environment
---


Extends an [Evaluation State](./evaluation-state.md) with additional
binding mappings.

## Proof
- Uses: state binding map to merge new entries.
- Shows that: binding extension is available as an explicit operator update.
