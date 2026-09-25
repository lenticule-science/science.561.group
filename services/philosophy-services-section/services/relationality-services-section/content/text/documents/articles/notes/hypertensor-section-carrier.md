---
title: Hypertensor Section Carrier
id: hypertensor-section-carrier
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/sheafification
description: Global section carrier of the hypertensor sheaf, defining math-level state.
---



Global section carrier of the hypertensor sheaf, defining math-level state.

## Definition
- Carrier: `Section` of the [Hypertensor Sheaf](./hypertensor-sheaf.md) over the
  hypertensor site.
- Fields: sections assign to each [Hypertensor Window](./hypertensor-window.md)
  a compatible element of the [Hypertensor Fiber](./hypertensor-fiber.md),
  respecting restriction/gluing.

## Invariants
- Sheaf compatibility: respects restriction, gluing, locality from the sheaf
  condition.
- Flow/nucleus commute with section operations (earned in sheaf acts).

## Proof
- Derived from: [Sheafification](./sheafification.md) producing the
  section carrier.
- Uses: [Hypertensor Sheaf](./hypertensor-sheaf.md).
- Shows that: the section carrier is well-defined and forms the math-level
  state for hypertensor constructions.

## Earlier material

## Definition
- Carrier: `Section` of the [Hypertensor Sheaf](hypertensor-sheaf.md) over the
  hypertensor site.
- Fields: sections assign to each [Hypertensor Window](hypertensor-window.md)
  a compatible element of the [Hypertensor Fiber](hypertensor-fiber.md),
  respecting restriction/gluing.

## Proof
- Derived from: [Sheafification](sheafification.md) producing the
  section carrier.
- Uses: [Hypertensor Sheaf](hypertensor-sheaf.md).
- Shows that: the section carrier is well-defined and forms the math-level
  state for hypertensor constructions.
