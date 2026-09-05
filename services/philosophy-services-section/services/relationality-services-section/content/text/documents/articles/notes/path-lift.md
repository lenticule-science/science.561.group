---
title: Path Lift
id: path-lift
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Lifts a path in a modality/profile tower to a path in a hypertensor section,
completing the fibre-bundle analogy.

## Definition
- Inputs: a path in the [Modality Tower](./modality-tower.md) or
  profile tower, and a [Hypertensor Section](./hypertensor-section.md)
  over the base.
- Output: a [Directed Path](./directed-path.md) in the section that
  projects to the given base path.
- Behaviour: use sheaf restriction/gluing to construct section-level lifts for
  each step; compose via [Path Compose](./path-compose.md).

## Invariants
- Lifting: projection of the lifted path equals the base path.
- Compatibility: lifts respect sheaf/coverage structure and nucleus equivalence.
- Holonomy readiness: lifted paths support holonomy/curvature measurements.

## Proof
- Uses: [Modality Tower](./modality-tower.md) as base path carrier,
  [Hypertensor Section](./hypertensor-section.md) as fibre, and
  [Path Compose](./path-compose.md) for composition.
- Produces: [Directed Path](./directed-path.md) in the section.
- Shows that: paths in base towers can be lifted to section-level paths, enabling
  holonomy analysis.
