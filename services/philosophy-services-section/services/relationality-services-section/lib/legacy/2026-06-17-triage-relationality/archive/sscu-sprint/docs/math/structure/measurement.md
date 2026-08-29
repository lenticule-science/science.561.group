---
title: Measurement
role: structure
emerges_from: measure
proof_refs:
- measure
fields:
- name: value
  type: observation-kernel
  description: measured quantity over an observable/profile.
- name: unit
  type: observation-kernel
  description: normalization/unit context for the measurement.
- name: provenance
  type: trace
  description: `{origin, timestamp, trace}` showing how the measurement was taken.
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---


Carrier for measured quantities over observables/profiles, earned from the act
[Measure](../acts/measure.md). Packages the measured value, its unit/normalization,
and provenance.

## Invariants
- Value/unit are compatible with the underlying observable/profile.
- Provenance is sufficient to replay/verify the measurement.
