---
name: multiagent-fixed-shape
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Shape/recognition stable under joint flow from multiple agents’ flows.

## Definition
- Carrier: recognitions/sections that remain invariant when all agents’ flows
  act jointly via [Social Flow](../operator/social-flow.md).
- Context: built from a set of [Agents](agent.md).

## Invariants
- Stability: joint flow leaves the shape unchanged up to nucleus.
- Robustness: small perturbations by any agent flow return to the shape.

## Proof
- Uses: agents and social flow to define joint invariance.
- Shows that: shapes can be fixed under multi-agent dynamics.
