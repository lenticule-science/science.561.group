---
title: Extend Bindings
id: extend-bindings
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
- call
  - merge-bindings
  - state
  - bindings
proof_refs:
- evaluation-state
- binding-environment
- merge-bindings
---


Produces a new [Evaluation State](../structure/evaluation-state.md) whose
bindings map is extended with the supplied binding map.

## Proof
- Uses: the binding map structure in `evaluation-state`.
- Shows that: local bindings can be layered without mutating the original state.
