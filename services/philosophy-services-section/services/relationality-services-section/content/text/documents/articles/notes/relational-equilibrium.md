---
title: Relational Equilibrium
id: relational-equilibrium
role: structure
status: plan
proof_refs: []
description: "Fixed point of social flow across an agent network: no agent can update epistemic/norm profile unilaterally."
---



Fixed point of social flow across an agent network: no agent can update
epistemic/norm profile unilaterally.

## Definition
- Carrier: configurations of [Agents](./agent.md) and channels such that applying
  [Social Flow](./social-flow.md) yields no change.
- Condition: each agent’s epistemic/norm state is stable given others’ states
  and messages.

## Invariants
- Stability: social flow is idempotent at equilibrium.
- No unilateral improvement: agents cannot unilaterally refine beliefs/norms to
  gain advantage (given the model’s utilities).

## Proof
- Uses: [Social Flow](./social-flow.md) over [Agents](./agent.md).
- Shows that: the configuration is a fixed point for social interaction.
