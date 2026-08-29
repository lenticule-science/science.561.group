---
title: Inject Noise
id: inject-noise
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Inject Noise

Injects perturbations into flow/context according to a relational noise model.

## Definition
- Inputs: a [Relational Noise Model](./relational-noise-model.md)
  and the earned [Flow Context](./flow-context.md).
- Output: noisy recognitions in the [Recognition Carrier](./recognition.md),
  ready for collapse via nucleus.
- Behaviour: branch flow along noise channels, apply distortions, then collapse
  or propagate as appropriate.

## Invariants
- Respect bounds: noise never exceeds modelled distortion limits.
- Collapse: noisy branches eventually collapse or signal failure.

## Proof
- Uses: noise model to generate perturbations; flow context to propagate them.
- Produces: noisy recognitions for further processing/collapse.
- Shows that: noise injection can be handled structurally.
