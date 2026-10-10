---
title: "Composite"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Composite"
  - "composite"
  - "composite material"
  - "fiber-reinforced composite"
  - "FRP"
  - "CFRP"
  - "GFRP"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - MaterialScience
  - StructuralEngineering
description: "A material combining reinforcing fibers with a binding matrix, offering high strength-to-weight ratios critical for airframe construction."
---

A composite material combines two or more constituent materials — typically strong, stiff fibers embedded in a lighter, weaker matrix — to produce a material with properties superior to either component alone.
In aerospace, "composite" almost always means fiber-reinforced polymer: fibers carry tension loads; the matrix (usually epoxy, polyester, or vinylester resin) binds the fibers, transfers loads between them, and provides compressive and shear strength.

**Common fiber types in UAV construction:**

| Fiber | Tensile strength | Stiffness | Cost | Typical use |
|---|---|---|---|---|
| E-glass | Moderate | Low-moderate | Very low | Hobby and expendable drone skins, general-purpose reinforcement |
| S-glass | High | Moderate | Low | Structural skins where cost matters more than weight |
| Carbon (standard modulus) | Very high | Very high | Moderate | Spars, skins, and structural components of tactical+ UAVs |
| Carbon (high modulus) | High | Extremely high | High | HALE platforms, stiffness-critical components |
| Aramid (Kevlar) | Very high | Moderate | Moderate | Impact-resistant components, propeller guards, leading edges |

**Layup methods relevant to UAVs:** - **Wet layup** — fibers are laid onto a mold and resin is applied by hand.
Cheapest method, lowest quality control.
Common for hobby and small expendable UAV production. - **Vacuum bagging** — wet layup followed by vacuum consolidation.
Better fiber-to-resin ratio and fewer voids.
The standard for small production runs. - **Pre-preg** — fibers pre-impregnated with resin, cured in an autoclave under heat and pressure.
Highest quality, highest cost.
MALE and HALE UAVs. - **Filament winding** — fibers wound around a rotating mandrel.
Excellent for fuselage tubes and cylindrical structures.

Composites are **anisotropic** — their properties depend on fiber direction.
A unidirectional carbon layup is extremely strong along the fiber axis but weak perpendicular to it.
Designers create **quasi-isotropic** layups (e.g., 0°/±45°/90° ply schedules) to distribute strength in multiple directions, at the cost of not maximizing strength in any single direction.
For UAV wings, the layup is typically biased toward the spanwise direction (0°) for bending strength, with ±45° plies for torsional stiffness.

[3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md) carbon-fiber-filled nylon (CF-PA) is a chopped-fiber composite — short fibers (~0.1–0.5 mm) randomly or partially oriented within the thermoplastic matrix.
It is substantially weaker than continuous-fiber composite but far simpler to manufacture.
Continuous-fiber printing (Markforged and similar) places unbroken fibers along specific load paths within a thermoplastic matrix, approaching the performance of traditional composites with the geometric freedom of additive manufacturing.

## Related terms

- [Skin](./skin.md) — the airframe surface often made from composite material
- [Spar](./spar.md) — the structural member where composite strength-to-weight matters most
- [Monocoque](./monocoque.md) — the structural approach that composites enable most effectively
