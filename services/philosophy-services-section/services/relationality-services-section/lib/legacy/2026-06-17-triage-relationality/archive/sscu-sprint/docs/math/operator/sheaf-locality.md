---
title: Sheaf Locality
role: operator
inputs:
- id: hypertensor-site
  alias: site
- id: hypertensor-section
  alias: section-a
- id: hypertensor-section
  alias: section-b
outputs:
- id: recognition
  alias: equality-witness
transformation:
- call
- compare-section-restrictions
- site
- section-a
- section-b
proof_refs:
- hypertensor-site
- compare-section-restrictions
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Witnesses the sheaf locality property: if two sections agree on all members of
a cover, they are equal.

## Definition
- Inputs: two sections over a window `U` in the [Hypertensor Site](../structure/hypertensor-site.md).
- Output: a recognition witness that they are equal if all restrictions to a
  cover of `U` are equal.
- Behaviour: restrict both sections along a cover and compare; if all
  restrictions coincide, produce an equality witness globally.

## Invariants
- Locality: agreement on a cover implies global equality.
- Stable under refinement of covers.

## Proof
- Uses: cover restrictions in the [Hypertensor Site](../structure/hypertensor-site.md)
  and comparison via `compare-section-restrictions`.
- Shows that: sections are determined by their restrictions to a cover,
  earning the locality half of the sheaf condition.
