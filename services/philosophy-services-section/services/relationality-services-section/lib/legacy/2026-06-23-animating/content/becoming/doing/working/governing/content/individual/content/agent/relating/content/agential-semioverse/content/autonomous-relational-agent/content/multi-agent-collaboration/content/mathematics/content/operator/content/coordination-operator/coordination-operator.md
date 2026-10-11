---
title: Coordination Operator
id: coordination-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


Attempts to align recognitions across agents by flowing until a stable intersection is reached.

## Definition - Inputs: a set of [Agents](../structure/agent.md) and their channels. - Output: updated [Agents](../structure/agent.md) with maximally aligned recognitions. - Behaviour: iterate [Social Flow](social-flow.md) and project onto the shared intersection of epistemic/norm profiles; stop at fixed point or failure.

## Invariants - Convergence: if a stable intersection exists, iterations converge. - Monotonicity: shared recognitions expand monotonically across iterations.

## Proof - Uses: [Social Flow](social-flow.md) and agent data. - Produces: aligned agents. - Shows that: coordination can be modelled as a flow to stable intersections.
