---
title: Extend Bindings
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
- call
  - merge-bindings
  - state
  - bindings
proof_refs:
- evaluation-state
- binding-environment
- merge-bindings
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Produces a new [Evaluation State](../structure/evaluation-state.md) whose
bindings map is extended with the supplied binding map.

## Proof
- Uses: the binding map structure in `evaluation-state`.
- Shows that: local bindings can be layered without mutating the original state.
