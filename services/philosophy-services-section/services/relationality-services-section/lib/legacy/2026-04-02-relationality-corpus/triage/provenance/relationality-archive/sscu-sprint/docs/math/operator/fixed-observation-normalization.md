---
name: fixed-observation-normalization
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



## Statement

The act [`fixed-normalize-observation`](../acts/fixed-normalize-observation.md)
applied to fixed observables earns that their associated reduction traces
stabilize along `StepTrace`.

## Proof sketch

`FixedNormalizeObservation = (Normalization FixedObserve)` collapses any
admissible reduction on fixed observables; since domains/codomains are in the
fixed profile, the normalization is internal to that profile.

## Uniqueness

Given `FixedObservationCarrier` and the normalization act, this property is
fixed up to earned equivalence.
