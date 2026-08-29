---
title: Utility Recognition
id: utility-recognition
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Utility Recognition

Recognises the “goodness” or desirability of states for an agent as a
recognition-valued utility.

## Definition
- Inputs: an [Agent](../structure/agent.md) and a recognition/state candidate.
- Output: recognition reflecting agent-specific utility (not numeric).
- Behaviour: evaluate the state against the agent’s norms/epistemics and encode
  desirability as a recognition in the logic lattice.

## Invariants
- Contextual: utility depends on agent’s current epistemic/norm state.
- Monotone: improving compliance/knowledge raises utility recognition.

## Proof
- Uses: [Agent](../structure/agent.md) and [Recognition Carrier](../structure/recognition.md).
- Produces: utility-valued [Recognition Carrier](../structure/recognition.md) element.
- Shows that: utility can be represented recognitionally for strategic updates.
