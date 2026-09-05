---
name: path-lift
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Lifts a path in a modality/profile tower to a path in a hypertensor section,
completing the fibre-bundle analogy.

## Definition
- Inputs: a path in the [Modality Tower](../structure/modality-tower.md) or
  profile tower, and a [Hypertensor Section](../structure/hypertensor-section.md)
  over the base.
- Output: a [Directed Path](../structure/directed-path.md) in the section that
  projects to the given base path.
- Behaviour: use sheaf restriction/gluing to construct section-level lifts for
  each step; compose via [Path Compose](path-compose.md).

## Invariants
- Lifting: projection of the lifted path equals the base path.
- Compatibility: lifts respect sheaf/coverage structure and nucleus equivalence.
- Holonomy readiness: lifted paths support holonomy/curvature measurements.

## Proof
- Uses: [Modality Tower](../structure/modality-tower.md) as base path carrier,
  [Hypertensor Section](../structure/hypertensor-section.md) as fibre, and
  [Path Compose](path-compose.md) for composition.
- Produces: [Directed Path](../structure/directed-path.md) in the section.
- Shows that: paths in base towers can be lifted to section-level paths, enabling
  holonomy analysis.
