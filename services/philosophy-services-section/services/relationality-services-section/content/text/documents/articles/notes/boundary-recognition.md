---
title: Boundary Recognition
id: boundary-recognition
role: structure
status: plan
proof_refs: []
---


# Boundary Recognition

Identifies the “edge” of a relational region: those recognitions where context
flow cannot extend without violating admissibility.

## Definition
- Carrier: subset of a [Hypertensor Section](./hypertensor-section.md) over a
  [Hypertensor Window](./hypertensor-window.md) consisting of points with no
  admissible outward extension.
- Witness: recognition marking boundary points and their local obstructions.

## Invariants
- Minimality: every boundary point is adjacent to inadmissible extension.
- Stability: applying nucleus/flow within the window preserves boundary marks.
- Coverage compatibility: boundaries respect window covers and restriction maps.

## Proof
- Uses: section/window to define admissibility and flow; boundary is the locus
  where extension fails.
- Shows that: boundaries are recognisable carriers suitable for holonomy and
  sheaf-gluing diagnostics.
