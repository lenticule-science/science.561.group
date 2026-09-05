---

name: fixed-physics-profile
act: FixedPhysicsProfile
top: FlowObservation
bottom: FixedFlowProfile
summary: Couple observation traces to the fixed flow by composing `FlowObservation` with `FixedFlowProfile`, yielding the physics of the fixed profile.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

`PhysicsProfile = (FlowObservation FlowProfile)` lifts a profile’s flow to its
physical semantics by coupling dynamics with observation.  In the fixed profile
we want observations of the fixed flow, so we let
[FlowObservation](flow-observation.md) witness
[FixedFlowProfile](fixed-flow-profile.md):
`(FlowObservation FixedFlowProfile)` earns
***FixedPhysicsProfile***.

`FlowObservation` records how observations traverse evaluation contexts under a
given flow, and `FixedFlowProfile` is the shuffle-derived flow restricted to
the fixed recognitions.  The composition couples observation traces to this flow,
yielding a physical semantics in which states evolve according to the shuffle
trace dynamics while remaining inside the fixed profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
