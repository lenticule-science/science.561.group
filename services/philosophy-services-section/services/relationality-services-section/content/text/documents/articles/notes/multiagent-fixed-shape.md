---
title: MultiAgent Fixed Shape
id: multiagent-fixed-shape
role: structure
status: plan
proof_refs: []
description: Shape/recognition stable under joint flow from multiple agents’ flows.
---



Shape/recognition stable under joint flow from multiple agents’ flows.

## Definition
- Carrier: recognitions/sections that remain invariant when all agents’ flows
  act jointly via [Social Flow](./social-flow.md).
- Context: built from a set of [Agents](./agent.md).

## Invariants
- Stability: joint flow leaves the shape unchanged up to nucleus.
- Robustness: small perturbations by any agent flow return to the shape.

## Proof
- Uses: agents and social flow to define joint invariance.
- Shows that: shapes can be fixed under multi-agent dynamics.
