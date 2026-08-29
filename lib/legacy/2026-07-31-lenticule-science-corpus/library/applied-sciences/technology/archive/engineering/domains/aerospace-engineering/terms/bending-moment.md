---
title: "Bending Moment"
date-created: 2026-03-07T00:00:00
type: term
aliases:
  - "Bending Moment"
  - "bending moment"
  - "bending"
  - "beam bending"
defines:
  - "bending moment"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - StructuralEngineering
description: "The internal moment at a cross-section of a structural member caused by transverse loads — the dominant structural load in aircraft wings."
---

A bending moment is the internal torque at a cross-section of a beam or structural member that results from transverse (perpendicular) loads. When a wing generates [lift](../../topics/uavs/terms/lift.md), the aerodynamic pressure distributed along the [span](../../topics/uavs/terms/span.md) creates a bending moment that is maximum at the wing root and zero at the tip. This root bending moment is the single most important [structural load](./structural-load.md) in wing design.

M = F × d

where M is the bending moment, F is the applied force, and d is the distance from the force to the cross-section. For a distributed load (like aerodynamic lift), the bending moment at any spanwise station is the integral of the lift distribution outboard of that station multiplied by its distance.

## How bending moment produces stress

A bending moment creates [stress](./stress.md) that varies linearly across the cross-section: one side is in tension, the other in compression, and a neutral axis between them has zero stress.

σ = M × y / I

where σ is the bending stress at distance y from the neutral axis, M is the bending moment, and I is the second moment of area (moment of inertia) of the cross-section. This equation is the foundation of structural sizing in aerospace: it tells the engineer how much material is needed, and where, to keep bending stresses below the [yield strength](./yield-strength.md).

The stress is highest at the surfaces farthest from the neutral axis. This is why efficient beam cross-sections (I-beams, C-channels, hollow tubes) concentrate material at the top and bottom — where the stress is highest — and use thin webs in the middle. A wing [spar](../../topics/uavs/terms/spar.md) follows the same logic: thick spar caps at the top and bottom of the [airfoil](../../topics/uavs/terms/airfoil.md) carry bending loads; a thin web between them carries [shear](./shear-force.md).

## Bending in aircraft wings

For a wing generating 1g lift on an aircraft of weight W, the total lift per semi-span equals W/2. Assuming an approximately elliptical lift distribution, the root bending moment is roughly:

M_root ≈ (W/2) × (b/2) × 0.42

where b is the total wingspan and 0.42 is the centroid factor for an elliptical distribution. For a 1.5 kg UAV with 1.2 m wingspan at 3g:

M_root ≈ (1.5 × 9.81 × 3 / 2) × (1.2 / 2) × 0.42 ≈ 11.1 N·m

This number drives every structural decision: [spar](../../topics/uavs/terms/spar.md) cross-section, [infill density](../../topics/uavs/terms/infill-density.md) at the root, wall thickness, and print orientation (for [3D-printed](../../topics/uavs/concepts/additive-manufacturing-in-uav-airframes.md) wings, filament alignment along the span resists bending; alignment across the span does not).

## Aspect ratio and bending

High [aspect ratio](../../topics/uavs/terms/aspect-ratio.md) wings produce the same total lift as low-AR wings but distribute it over a longer span. The bending moment at the root increases with span for the same total lift — roughly proportional to b for an elliptical distribution. This is the structural cost of aerodynamic efficiency: a high-AR wing has less [induced drag](../../topics/uavs/terms/induced-drag.md) but needs a heavier [spar](../../topics/uavs/terms/spar.md) to resist the higher root bending moment. Low-AR [delta planforms](../../topics/uavs/concepts/wing-planform-selection-for-uavs.md) trade aerodynamic efficiency for structural simplicity precisely because their short spans produce modest bending moments.

## Related terms

- [Shear Force](./shear-force.md) — the transverse force that accompanies bending moment in loaded beams
- [Torsion](./torsion.md) — the twisting load that accompanies bending in swept and asymmetrically loaded wings
- [Stress](./stress.md) — the internal force per unit area that bending moment produces
- [Structural Load](./structural-load.md) — the external forces that create bending moments
