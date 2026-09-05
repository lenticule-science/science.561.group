---
name: "Strain"
date-created: 2026-03-07T00:00:00
aliases:
  - "Strain"
  - "strain"
  - "deformation"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - StructuralEngineering
description: "The ratio of deformation to original dimension — the measure of how much a material stretches, compresses, or distorts under load."
---

Strain is the dimensionless measure of deformation in a material under [stress](./stress.md). It is the change in length divided by the original length:

ε = ΔL / L₀

A strain of 0.01 (1%) means the material has stretched or compressed by 1% of its original dimension. Aerospace materials typically operate at strains below 0.5% in normal service — the deformations are real but invisible to the eye.

## Elastic and plastic strain

**Elastic strain** is recoverable: remove the load and the material returns to its original shape. This is the regime aerospace structures are designed to operate in during normal flight. A wing that bends upward under [lift](../../topics/uavs/terms/lift.md) and returns to its original shape after landing is deforming elastically. The relationship between [stress](./stress.md) and elastic strain is linear and governed by [Young's modulus](./youngs-modulus.md):

σ = E × ε

**Plastic strain** is permanent: the material has yielded and will not return to its original shape. An aircraft wing that remains bent after a hard landing has experienced plastic strain. Conventional aerospace design requires no plastic strain at limit load (the maximum expected load). [Expendable](../../topics/uavs/concepts/expendable-airframe-design.md) UAVs may accept some plastic strain under peak loads because the structure only needs to survive one mission.

The transition from elastic to plastic behavior occurs at the [yield strength](./yield-strength.md). Beyond yield, the stress-strain curve flattens — the material deforms much more for each additional increment of stress. Eventually, the material reaches its ultimate tensile strength and fractures.

## Why strain matters for aerospace

**Wing deflection.** A wing in flight bends upward under aerodynamic load. The strain in the [spar](../../topics/uavs/terms/spar.md) caps determines how much. Excessive deflection changes the effective [angle of attack](../../topics/uavs/terms/angle-of-attack.md) distribution along the [span](../../topics/uavs/terms/span.md), degrading aerodynamic performance and potentially inducing [flutter](../../topics/uavs/terms/flutter.md). A 747's wingtips deflect ~3 meters in turbulence; the strains involved are still below 0.3%.

**Fatigue.** Every load cycle imposes a strain cycle. Over thousands of cycles, microscopic damage accumulates at stress concentrations even though the strain stays well within elastic limits. This is [fatigue](../../topics/uavs/terms/fatigue.md), and it is the primary structural life limiter for reusable aircraft.

**Anisotropy in printed parts.** [3D-printed](../../topics/uavs/concepts/additive-manufacturing-in-uav-airframes.md) FDM parts have different strain-to-failure along filament lines versus between layers. The inter-layer strain capacity can be 40–70% lower than the in-plane capacity, making print orientation a structural design variable.

## Related terms

- [Stress](./stress.md) — the force per unit area that produces strain
- [Young's Modulus](./youngs-modulus.md) — the stiffness relating stress to elastic strain
- [Yield Strength](./yield-strength.md) — the stress at which strain becomes permanent
- [Structural Load](./structural-load.md) — the external forces that produce stress and strain
