---
title: Compare Section Restrictions
id: compare-section-restrictions
role: operator
status: plan
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
description: Restricts two Hypertensor Sections along a cover in the Hypertensor Site and checks equality of all restrictions, yielding an equality witness when they coincide.
---


Restricts two [Hypertensor Sections](./hypertensor-section.md) along
a cover in the [Hypertensor Site](./hypertensor-site.md) and checks
equality of all restrictions, yielding an equality witness when they coincide.

## Proof
- Uses: restriction maps defined by the hypertensor site to project sections to
  cover elements, then compare.
- Shows that: agreement on a cover implies global equality, supporting the
  sheaf locality property.

## Earlier material

Restricts two [Hypertensor Sections](hypertensor-section.md) along
a cover in the [Hypertensor Site](hypertensor-site.md) and checks
equality of all restrictions, yielding an equality witness when they coincide.
