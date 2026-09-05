---
title: Influence Recognition
id: influence-recognition
role: structure
status: plan
proof_refs: []
---



Detects how much one agent’s recognitions alter another’s flow evolution.

## Definition
- Carrier: mapping from pairs of [Agents](./agent.md) to recognitions indicating
  sensitivity of one agent’s state to the other’s messages/updates.
- Computation: derivative-like effect measured via [Social Flow](./social-flow.md)
  responses when perturbing one agent.

## Invariants
- Monotonicity: stronger influence yields higher recognition.
- Symmetry: influence need not be symmetric; structure records directionality.

## Proof
- Uses: agent interactions under social flow to measure impact.
- Shows that: inter-agent influence can be recognised and reasoned about.
