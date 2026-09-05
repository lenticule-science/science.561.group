---
title: Strategic Flow
id: strategic-flow
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Flow variant where agents adjust contexts to maximise recognition survival given
others’ strategies.

## Definition
- Inputs: a set of [Agents](./agent.md) and current strategies.
- Output: updated agents after applying [Strategic Update](./strategic-update.md)
  and [Social Flow](./social-flow.md).
- Behaviour: at each step, agents update strategies to improve utility while
  interacting via social flow; seek Nash-like fixed points.

## Invariants
- Norm compliance: updates respect each agent’s norm regime.
- Fixed points: Nash points correspond to flow/nucleus fixed points.

## Proof
- Uses: [Strategic Update](./strategic-update.md) and [Social Flow](./social-flow.md).
- Produces: updated agents.
- Shows that: strategic adaptation can be encoded as a flow on agents.
