---
title: Measure Collapse Depth
id: measure-collapse-depth
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Measures how many nucleus applications are needed to reach section normal form.
---



Measures how many nucleus applications are needed to reach section normal form.

## Definition
- Inputs: a [Hypertensor Section](./hypertensor-section.md).
- Output: [Section Collapse Depth](./section-collapse-depth.md).
- Behaviour: run normalization, count nucleus steps, report depth.

## Invariants
- Zero for normal forms; increases with complexity.
- Deterministic given the section and normalization strategy.

## Proof
- Uses: normalization algorithm to count steps.
- Produces: collapse depth metric.
- Shows that: collapse depth is consistent with normalization.
