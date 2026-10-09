---
title: Hypertensor Coverage
id: hypertensor-coverage
role: structure
status: plan
proof_refs:
- hypertensor-window
fields:
- name: base
  type: hypertensor-window
  description: window poset forming the base.
- name: covers
  type: matching-family
  description: admissible cover families over windows.
- name: overlaps
  type: matching-family
  description: intersections/overlaps used for matching.
description: Coverage (pretopology) on hypertensor windows defining admissible covers and overlaps.
---



Coverage (pretopology) on hypertensor windows defining admissible covers and
overlaps.

## Definition
- Base: [Hypertensor Window](./hypertensor-window.md) poset.
- Covers: families of sub-windows that jointly cover a window, as earned by the
  hypertensor window act.
- Overlaps: intersections of cover elements used for matching.

## Invariants
- Covers are stable under refinement and pullback along inclusions.
- Finite intersections of cover elements are admissible overlaps.

## Proof
- Uses: [Hypertensor Window](./hypertensor-window.md) act that provides
  window refinements and admissible covers/overlaps.
- Shows that: the window poset carries an earned coverage suitable for sheaf
  definitions and matching/gluing.
