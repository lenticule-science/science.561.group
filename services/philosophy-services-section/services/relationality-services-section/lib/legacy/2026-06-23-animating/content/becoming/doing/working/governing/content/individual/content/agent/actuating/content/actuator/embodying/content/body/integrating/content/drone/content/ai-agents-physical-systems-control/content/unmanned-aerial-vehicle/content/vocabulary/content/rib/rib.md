---
title: "Rib"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Rib"
  - "rib"
  - "wing rib"
defines:
  - "rib"
  - "wing rib"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - StructuralEngineering
description: "A chordwise structural member that maintains the airfoil cross-section and transfers aerodynamic loads to the spar."
---

A rib is a structural member oriented along the [chord](./chord.md) direction (perpendicular to the [spar](./spar.md)).
Ribs define and maintain the [airfoil](./airfoil.md) cross-section, prevent the wing [skin](./skin.md) from buckling, and transfer distributed aerodynamic pressure loads to the spar.

Rib spacing is a design trade-off: closer spacing provides better skin support (preventing buckling and maintaining airfoil accuracy) but adds weight and assembly time.
Typical rib spacing ranges from 50–100 mm for small model-scale wings to 200–500 mm for tactical UAVs.

**Rib construction methods in UAVs:** - **Laser-cut plywood or balsa** — light, cheap, precise.
The traditional model aircraft method.
A laser cutter produces a complete rib set from a 3 mm plywood sheet in minutes. - **[3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md)** — can be printed integrally with the skin, eliminating assembly.
Alternatively, printed as separate pieces that slide onto the spar. - **CNC-cut foam** — ribs can be integral with a foam wing core, cut by hot-wire or CNC router. - **Sheet aluminum** — stamped or CNC-routed.
Used in larger tactical and MALE UAVs.

In fully [3D-printed wings](../concepts/additive-manufacturing-in-uav-airframes.md), the distinction between rib and infill blurs: the internal lattice structure (gyroid, rectilinear, etc.) serves the rib's function of supporting the skin and transferring loads, without being a discrete chordwise member.
This is one reason printed wings can use fewer or no separate ribs — the [infill](./infill-density.md) does the work.

## Related terms

- [Spar](./spar.md) — the spanwise member that ribs transfer loads to
- [Skin](./skin.md) — the outer covering that ribs support
- [Airfoil](./airfoil.md) — the cross-sectional shape that ribs define
