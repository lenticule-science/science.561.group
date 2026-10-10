---
name: federated-learning-for-drone-swarm-task
description: Model-delta-pass federation between drone instances under the bilattice merge.
category: sdk
requires:
  objects:
    - marl-policy-record
    - federated-peer-record
  morphisms:
    - composing-via-merge
    - emitting-federation-envelope
adds:
  objects:
    - model-delta-record
  morphisms:
    - merging-model-deltas
capability-delta: Drones share model deltas rather than raw observations; bandwidth use drops; the shared model converges by bilattice merge.
has-kind: task
has-status: open
owned-by: emsenn
---
