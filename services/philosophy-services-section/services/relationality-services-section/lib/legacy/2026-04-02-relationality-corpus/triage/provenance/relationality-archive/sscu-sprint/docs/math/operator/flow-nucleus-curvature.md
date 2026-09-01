---
name: flow-nucleus-curvature
role: operator
derived_from: acts/comonad-curvature
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

## Statement

The earned acts extend the flow–nucleus pair to composite profiles and record
the curvature (obstruction to strict idempotence).

## Definition
- Inputs: [Admissible Morphism](../structure/admissible-morphism.md).
- Outputs: curvature witness for the flow–nucleus comonad/monad pair on composite profiles.
- Behaviour: lifts flow/nucleus to composite profiles and measures curvature via [Comonad Curvature](../acts/comonad-curvature.md).

## Invariants
- Curvature is computed within the admissible morphism class and respects composite profile structure.
- Captures the obstruction to strict idempotence/commutation of flow/nucleus on composite profiles.

## Proof
- Derived from: [Comonad Curvature](../acts/comonad-curvature.md) and the composite-profile lifts (`form-geometry`, `flow-composite-profile`, `geometry-composite-profile`).
- Shows that: extending flow/nucleus to composite profiles yields a curvature witness on admissible morphisms, fixing the obstruction data up to earned equivalence.
