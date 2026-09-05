---
title: Judgment Dualize
id: judgment-dualize
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Produces the dual of a judgment by reversing flow and swapping premises/conclusions.

## Definition
- Inputs: a [Judgment Triad](../structure/judgment-triad.md).
- Output: its [Judgment Dual](../structure/judgment-dual.md).
- Behaviour: reverse admissible flow, interchange premise/conclusion roles,
  adjust inference direction.

## Invariants
- Duality: applying twice returns the original (up to equivalence).
- Soundness: dual respects earned flow/nucleus constraints.

## Proof
- Uses: judgment triad data and flow reversal rules.
- Produces: dual judgment.
- Shows that: judgments have coherent duals in the relational setting.
