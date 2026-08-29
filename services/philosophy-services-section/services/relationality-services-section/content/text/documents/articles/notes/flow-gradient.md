---
title: Flow Gradient
id: flow-gradient
role: structure
status: plan
proof_refs: []
---


# Flow Gradient

Measures the “steepness” of flow evolution within a profile.

## Definition
- Data: rate of change of recognitions under [Flow Context](flow-context.md),
  possibly annotated with entropy or metric.
- Role: quantify how rapidly recognitions evolve.

## Invariants
- Non-negativity; zero indicates fixed under flow.
- Compatible with metrics/neighborhoods if defined.

## Proof
- Uses: flow dynamics and recognition carrier.
- Shows that: flow rate can be encoded as a structure for analysis/optimization.
