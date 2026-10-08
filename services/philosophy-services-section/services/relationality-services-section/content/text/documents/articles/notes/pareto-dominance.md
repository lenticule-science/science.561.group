---
title: Pareto Dominance
id: pareto-dominance
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Computes recognitions that are Pareto-superior across agents’ preference profiles.
---



Computes recognitions that are Pareto-superior across agents’ preference profiles.

## Definition
- Inputs: a collection of [Preference Profiles](./preference-profile.md).
- Output: recognition of states that no agent strictly prefers less (Pareto
  front).
- Behaviour: intersect preference orders to identify non-dominated recognitions.

## Invariants
- Soundness: outputs are non-dominated across given profiles.
- Monotonicity: adding stricter preferences shrinks the Pareto set.

## Proof
- Uses: preference orders to compute non-domination.
- Produces: [Recognition Carrier](./recognition.md) marking
  Pareto-superior recognitions.
- Shows that: multi-agent rankings can be combined via Pareto criteria.
