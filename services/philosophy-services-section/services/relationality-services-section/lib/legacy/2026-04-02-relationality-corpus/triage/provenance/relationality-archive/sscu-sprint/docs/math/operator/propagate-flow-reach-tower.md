---
name: propagate-flow-reach-tower
role: operator
derived_from:
- acts/reach
- acts/flow-profile
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



The **Propagate Flow and Reach on Tower** operator applies the earned flow and
reach along the levels of a [Modality Tower](docs/math/structure/modality-tower.md).

## Definition
- Input: a modality tower.
- Output: an updated modality tower with flow/reach propagated.
- Behaviour: applies the flow profile and reach acts levelwise, ensuring
  compatibility with tower composition.

## Invariants
- Flow and reach respect tower faces/degeneracies.
- Propagation stays within the earned tower structure.

## Proof
Built from [`acts/flow-profile`](docs/math/acts/flow-profile.md) and
[`acts/reach`](docs/math/acts/reach.md), applied levelwise to the modality
tower. The acts ensure compatibility with tower laws.
