---
title: "Stress"
date-created: 2026-03-07T00:00:00
type: term
aliases:
  - "Stress"
  - "stress"
  - "mechanical stress"
  - "tensile stress"
  - "compressive stress"
defines:
  - "stress"
  - "tensile stress"
  - "compressive stress"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - StructuralEngineering
description: "Force per unit area within a material — the fundamental quantity governing whether a structure holds or fails."
---

Stress is the internal force per unit area that develops within a material when external loads are applied. It is measured in pascals (Pa) or, more practically in aerospace, in megapascals (MPa). Stress is what the material *feels*; [structural load](./structural-load.md) is what the vehicle *experiences*. The engineer's task is to ensure that the stresses produced by the worst expected loads remain below the material's capacity.

σ = F / A

where σ is stress, F is force, and A is the cross-sectional area over which that force is distributed. The same force applied over a smaller area produces higher stress — this is why a thin [spar](../../topics/uavs/terms/spar.md) web fails before a thick one under the same load, and why [safety factors](../../topics/uavs/terms/safety-factor.md) in aerospace must account for stress concentrations at holes, notches, and joints.

## Types of stress

**Tensile stress** — the material is being pulled apart. The lower surface of a wing under aerodynamic [lift](../../topics/uavs/terms/lift.md) is in tension: the wing bends upward, stretching the bottom skin and [spar](../../topics/uavs/terms/spar.md) cap. Tensile failure is usually the critical mode for metals.

**Compressive stress** — the material is being pushed together. The upper surface of a loaded wing is in compression. Thin structures under compression can buckle — fail by geometric instability rather than material fracture — which is why aircraft skins are stiffened with stringers and [ribs](../../topics/uavs/terms/rib.md).

**Shear stress** — the material is being loaded parallel to a surface rather than perpendicular to it. [Spar](../../topics/uavs/terms/spar.md) webs carry shear loads from aerodynamic forces. Adhesive bond lines in [composite](../../topics/uavs/terms/composite.md) structures fail in shear. See [shear force](./shear-force.md).

**Bearing stress** — compressive stress at the contact point between a fastener (bolt, rivet, pin) and the hole it passes through. A common failure mode in bolted composite joints: the bolt crushes the laminate around the hole.

## Stress in aerospace design

Aerospace structures are designed to be as light as possible while keeping stresses below allowable limits. This means operating at higher stress levels (closer to the material's capacity) than most engineering disciplines — a bridge might use 30% of its steel's [yield strength](./yield-strength.md); an aircraft wing skin might use 70–80%. The [safety factor](../../topics/uavs/terms/safety-factor.md) (typically 1.5 for crewed aircraft, 1.1–1.3 for [expendable](../../topics/uavs/concepts/expendable-airframe-design.md) UAVs) is the margin that prevents this approach from killing people.

Stress concentrations — local increases in stress around geometric discontinuities (holes, notches, fillets, ply drops) — are the source of most aerospace structural failures. A circular hole in a plate under tension produces a stress concentration factor of 3.0: the stress at the edge of the hole is three times the average stress in the plate. Design around stress concentrations is a central preoccupation of aerospace structural engineering.

## Related terms

- [Strain](./strain.md) — the deformation that stress produces
- [Young's Modulus](./youngs-modulus.md) — the ratio of stress to strain in the elastic region
- [Yield Strength](./yield-strength.md) — the stress at which permanent deformation begins
- [Structural Load](./structural-load.md) — the external forces that produce internal stresses
- [Shear Force](./shear-force.md) — the load type that produces shear stress
