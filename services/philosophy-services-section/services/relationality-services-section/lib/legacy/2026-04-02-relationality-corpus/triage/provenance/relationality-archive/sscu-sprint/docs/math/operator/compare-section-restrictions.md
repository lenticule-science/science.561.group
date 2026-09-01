---
name: compare-section-restrictions
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
- return
- equality-witness
proof_refs:
- hypertensor-site
- hypertensor-section
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Restricts two [Hypertensor Sections](../structure/hypertensor-section.md) along
a cover in the [Hypertensor Site](../structure/hypertensor-site.md) and checks
equality of all restrictions, yielding an equality witness when they coincide.

## Proof
- Uses: restriction maps defined by the hypertensor site to project sections to
  cover elements, then compare.
- Shows that: agreement on a cover implies global equality, supporting the
  sheaf locality property.
