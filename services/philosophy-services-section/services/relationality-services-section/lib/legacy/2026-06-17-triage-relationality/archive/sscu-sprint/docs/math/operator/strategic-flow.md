---
title: Strategic Flow
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



Flow variant where agents adjust contexts to maximise recognition survival given
others’ strategies.

## Definition
- Inputs: a set of [Agents](../structure/agent.md) and current strategies.
- Output: updated agents after applying [Strategic Update](strategic-update.md)
  and [Social Flow](social-flow.md).
- Behaviour: at each step, agents update strategies to improve utility while
  interacting via social flow; seek Nash-like fixed points.

## Invariants
- Norm compliance: updates respect each agent’s norm regime.
- Fixed points: Nash points correspond to flow/nucleus fixed points.

## Proof
- Uses: [Strategic Update](strategic-update.md) and [Social Flow](social-flow.md).
- Produces: updated agents.
- Shows that: strategic adaptation can be encoded as a flow on agents.
