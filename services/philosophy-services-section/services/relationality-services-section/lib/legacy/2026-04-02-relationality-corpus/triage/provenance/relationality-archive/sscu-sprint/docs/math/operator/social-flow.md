---
name: social-flow
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



Evolves agents’ epistemic and norm profiles under message exchange.

## Definition
- Inputs: a set of [Agents](../structure/agent.md) and
  [Message Channels](../structure/message-channel.md) carrying observations.
- Output: updated agents with refined epistemic profiles (and potential norm
  reactions) after processing channel observations.
- Behaviour: for each channel, push observations through
  [Epistemic Update](epistemic-update.md) of sender/receiver; apply
  [Flow Context](flow-context.md) jointly to advance contexts; optionally apply
  norm violation checks.

## Invariants
- Causality: respects channel ordering; no observation is applied out of order.
- Commutation: epistemic updates and norms commute with joint flow when
  admissible.
- Stability: agents remain within admissible recognitions/norm regimes.

## Proof
- Uses: [Agent](../structure/agent.md), [Message Channel](../structure/message-channel.md),
  [Epistemic Update](epistemic-update.md), and [Flow Context](flow-context.md)
  to define the evolution.
- Produces: updated [Agent](../structure/agent.md) states.
- Shows that: message exchange refines epistemic/normative state while
  respecting earned flow/nucleus structure.
