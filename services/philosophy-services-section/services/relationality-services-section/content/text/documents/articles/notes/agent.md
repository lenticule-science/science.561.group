---
title: Agent
id: agent
role: structure
status: plan
proof_refs: []
description: Relational agent with epistemic and normative profiles and local flow/nucleus.
---



Relational agent with epistemic and normative profiles and local flow/nucleus.

## Definition
- Components: an [Epistemic Profile](./epistemic-profile.md), a
  [Norm Regime](./norm-regime.md), and local flow/nucleus data from
  [Flow–Nucleus Adjunction](./flow-nucleus-adjunction.md).
- Behaviour: epistemic updates and norm enforcement act on the agent’s local
  recognitions and contexts.

## Invariants
- Commutation: epistemic updates and norm enforcement commute with the local
  flow/nucleus.
- Stability: agent state remains inside admissible recognitions given its norm
  regime.
- Monotonicity: new observations refine, not expand, epistemic possibilities.

## Proof
- Uses: [Epistemic Profile](./epistemic-profile.md), [Norm Regime](./norm-regime.md),
  and [Flow–Nucleus Adjunction](./flow-nucleus-adjunction.md) to define the
  agent’s state/evolution.
- Shows that: agents can evolve under observations and norms without breaking
  earned flow/nucleus structure.
