---
title: Irrational Weight
id: irrational-weight
role: structure
status: plan
emerges_from: irrational-modality
proof_refs:
- irrational-modality
- irrational-commutation
- measurement
fields:
- name: magnitude
  type: measurement
  description: measured irrational scaling factor on admissible reorderings.
- name: witness
  type: recognition
  description: recognition that the scaling factor is irrational (non-rational ratio) and admissible.
- name: provenance
  type: trace
  description: "`{origin, timestamp, trace}` documenting how the weight was earned."
description: Carrier for the irrational scaling factor used by the irrational modality.
---

# Irrational Weight

Carrier for the irrational scaling factor used by the irrational modality.
Packages the measured magnitude, a recognition witnessing irrationality, and
provenance.

## Invariants
- Magnitude is a well-formed measurement compatible with the flow/nucleus context.
- Irrationality witness rules out rational ratios while keeping admissible reorderings.
- Provenance is sufficient to replay/verify how the weight was established.
