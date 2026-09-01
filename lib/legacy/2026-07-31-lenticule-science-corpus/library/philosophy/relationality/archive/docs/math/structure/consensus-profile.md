---
title: Consensus Profile
id: consensus-profile
role: structure
status: plan
proof_refs: []
---



Fixed point of multi-agent dialogue updates where epistemic states agree.

## Definition
- Carrier: tuple of [Agents](agent.md) whose epistemic profiles align on all
  stable recognitions after repeated [Dialogue Update](../operator/dialogue-update.md).
- Condition: no agent can further refine beliefs without others agreeing.

## Invariants
- Agreement: epistemic recognitions coincide across agents.
- Stability: further dialogue updates leave the consensus unchanged.

## Proof
- Uses: [Agent](agent.md) and [Dialogue Update](../operator/dialogue-update.md).
- Shows that: a dialogue-induced fixed point yields collective knowledge across
  the agent set.
