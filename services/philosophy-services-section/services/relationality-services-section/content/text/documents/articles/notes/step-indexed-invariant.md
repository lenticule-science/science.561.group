---
title: Step-Indexed Invariants
id: step-indexed-invariant
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Tower and invariant acts induce a step-indexed logic: each tower level refines
equivalence by one step; taking the limit yields the step-indexed invariants
tracked by `reach` and `stabilize-invariant`.

## Definition
- Inputs/Outputs: invariants over tower levels of recognitions.
- Behaviour: refines equivalence step-by-step along the tower; limits yield
  step-indexed invariants tracked by reach/stabilize acts.

## Invariants
- Monotonic refinement along tower levels.
- Limit invariants stable under reach/stabilize acts.

## Proof
- Uses: [Stabilize Invariant](stabilize-invariant.md) over the
  [Profile Tower](./profile-tower.md) to refine equivalence
  level-by-level.
- Shows that: stepwise refinement along the tower yields limit invariants
  stable under reach/stabilize acts.
