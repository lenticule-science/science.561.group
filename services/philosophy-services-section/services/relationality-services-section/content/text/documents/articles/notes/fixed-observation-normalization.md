---
title: Fixed Observation Normalization
id: fixed-observation-normalization
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Statement

The act [`fixed-normalize-observation`](./fixed-normalize-observation.md)
applied to fixed observables earns that their associated reduction traces
stabilize along `StepTrace`.

## Proof sketch

`FixedNormalizeObservation = (Normalization FixedObserve)` collapses any
admissible reduction on fixed observables; since domains/codomains are in the
fixed profile, the normalization is internal to that profile.

## Uniqueness

Given `FixedObservationCarrier` and the normalization act, this property is
fixed up to earned equivalence.
