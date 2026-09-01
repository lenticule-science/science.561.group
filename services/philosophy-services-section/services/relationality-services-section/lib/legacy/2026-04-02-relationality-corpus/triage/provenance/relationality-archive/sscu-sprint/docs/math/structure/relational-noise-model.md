---
name: relational-noise-model
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Describes perturbations in flow or context: errors in recognitions or mislabeled
observations.

## Definition
- Components: alternative flow branches, observation distortion probabilities,
  and admissible noise recognitions.
- Role: specify how noise is injected and how it is collapsed via nucleus.

## Invariants
- Bounded distortion: noise stays within admissible perturbation bounds.
- Collapse: noisy branches eventually collapse via nucleus/flow to valid
  recognitions or failures.

## Proof
- Uses: [Flow Context](../operator/flow-context.md) and [Observation](../structure/observation.md)
  to define perturbations.
- Shows that: noise can be modelled structurally within the relational system.
