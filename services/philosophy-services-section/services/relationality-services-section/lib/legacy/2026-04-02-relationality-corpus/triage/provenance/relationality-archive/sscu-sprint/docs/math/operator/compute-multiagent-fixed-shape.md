---
name: compute-multiagent-fixed-shape
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Computes shapes stable under joint flows of multiple agents.

## Definition
- Inputs: a set of [Agents](../structure/agent.md) and their joint
  [Social Flow](social-flow.md).
- Output: [MultiAgent Fixed Shape](../structure/multiagent-fixed-shape.md).
- Behaviour: iterate joint flow to find invariant recognitions/sections.

## Invariants
- Stability: outputs remain unchanged under further joint flow.
- Robustness: nearby states converge to the fixed shape under joint flow.

## Proof
- Uses: social flow to test invariance.
- Produces: fixed shapes.
- Shows that: multi-agent invariants can be computed from joint dynamics.
