---
title: Observable Carrier
role: structure
derived_from: acts/measure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: measured quantities obtained by applying the earned measurement act to recognised phenomena.
- Components: each observable pairs a measurable phenomenon with its value in the profile measure space.
- Source: earned from [Measure](../acts/measure.md); profile-specific refinements from [Profile Measure](../acts/profile-measure.md) constrain the value space.

## Invariants
- Observables are stable under profile measurement: re-measuring within the same profile yields the same value.
- Composition of observables along traces respects the measurement functor induced by the profile measure.

## Proof
- Derived from: [Measure](../acts/measure.md), which provides the act of assigning measured values.
- Shows that: the measurement act induces a carrier of measured quantities; incorporating the profile-specific measure space yields the observable carrier as an earned structure.
