---
title: Merge Bindings
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Extends an [Evaluation State](../structure/evaluation-state.md) with additional
binding mappings.

## Proof
- Uses: state binding map to merge new entries.
- Shows that: binding extension is available as an explicit operator update.
