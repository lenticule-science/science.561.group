---
title: Dialogue Update
id: dialogue-update
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Coordinated epistemic updates between agents engaged in dialogue.

## Definition
- Inputs: two or more [Agents](../structure/agent.md) and a
  [Message Channel](../structure/message-channel.md) carrying utterances as
  observations.
- Output: updated [Agent](../structure/agent.md) states after processing the
  dialogue turn.
- Behaviour: treat each utterance as an [Observation](../structure/observation.md),
  apply [Epistemic Update](epistemic-update.md) to speaker and listener, and
  optionally broadcast refined recognitions back through the channel.

## Invariants
- Order-respecting: updates follow channel order; no out-of-order beliefs.
- Convergence: repeated application can reach a fixed point (consensus) if no
  contradictions remain.
- Monotonicity: each turn refines (does not expand) epistemic possibilities.

## Proof
- Uses: [Agent](../structure/agent.md), [Message Channel](../structure/message-channel.md),
  [Epistemic Update](epistemic-update.md).
- Produces: updated [Agent](../structure/agent.md).
- Shows that: dialogue induces coupled epistemic updates consistent with channel
  observations and agent flow/norm structure.
