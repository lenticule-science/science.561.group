---
title: Preference Profile
id: preference-profile
role: structure
status: plan
proof_refs: []
description: Agent’s ranked recognitions represented as stable nucleus-based orderings.
---



Agent’s ranked recognitions represented as stable nucleus-based orderings.

## Definition
- Carrier: ordering over recognitions for an [Agent](./agent.md), reflecting
  desirability/priority.
- Structure: preorder/partial order consistent with the recognition lattice and
  agent norms/epistemics.

## Invariants
- Stability: preferences respect agent’s norm regime and epistemic state.
- Transitivity: rankings form a preorder; nucleus-equivalent recognitions share
  rank.

## Proof
- Uses: agent data and recognition order to define preferences.
- Shows that: preferences can be encoded as ordered recognitions.
