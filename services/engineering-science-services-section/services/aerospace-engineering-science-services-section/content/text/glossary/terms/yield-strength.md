---
name: "Yield Strength"
date-created: 2026-03-07
aliases:
  - "Yield Strength"
  - "yield strength"
  - "yield stress"
  - "ultimate strength"
  - "tensile strength"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - StructuralEngineering
  - MaterialsScience
description: "The stress at which a material begins to deform permanently — the boundary between recoverable elastic behavior and irreversible plastic deformation."
---

Yield strength is the [stress](./stress.md) at which a material transitions from elastic (recoverable) to plastic (permanent) deformation. Below yield, remove the load and the material returns to its original shape. Above yield, the material retains a permanent set — it is deformed and will not spring back.

For metals, the yield point is usually defined as the 0.2% offset stress: the stress at which the material has accumulated 0.2% permanent [strain](./strain.md). This is a practical convention because most metals do not have a sharp, unambiguous yield point.

## Yield strength vs. ultimate strength

**Yield strength** — the onset of permanent deformation. This is the primary design limit for reusable aerospace structures because permanent deformation changes part geometry, introduces residual stresses, and can initiate [fatigue](../../../../services/uavs-services-section/content/text/glossary/terms/fatigue.md) cracks.

**Ultimate tensile strength (UTS)** — the maximum stress the material can sustain before fracturing. For ductile metals, UTS is 10–50% higher than yield strength. For brittle materials ([composites](../../../../services/uavs-services-section/content/text/glossary/terms/composite.md), ceramics, some cast alloys), yield and ultimate strength may be nearly identical — the material fractures with little or no warning.

Aerospace structural design uses both:
- The structure must show **no permanent deformation at limit load** (1× maximum expected load) — this is a yield criterion.
- The structure must **not rupture at ultimate load** (1.5× limit load for crewed aircraft) — this is an ultimate criterion.

## Values for aerospace materials

| Material | Yield strength (MPa) | Ultimate strength (MPa) | Density (kg/m³) | Specific strength (σ_y/ρ) |
|---|---|---|---|---|
| 7075-T6 aluminum | 503 | 572 | 2,810 | 179 |
| 4130 steel (normalized) | 435 | 670 | 7,850 | 55 |
| Ti-6Al-4V titanium | 880 | 950 | 4,430 | 199 |
| Carbon fiber composite (quasi-iso) | — | 500–800 | 1,550 | 320–520 |
| PLA (printed, along layers) | 50–60 | 50–65 | 1,240 | 40–48 |
| PLA (printed, between layers) | 20–35 | 25–40 | 1,240 | 16–28 |
| CF-nylon (printed, along layers) | 70–90 | 80–100 | 1,150 | 61–78 |

The last column — specific strength (yield strength divided by density) — governs weight-efficient design. Titanium and carbon fiber composite dominate because they combine high strength with low density. 3D-print filaments are dramatically weaker, especially between layers, which is why [printed UAV](../../../../services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) structures rely on geometric efficiency (closed sections, infill) and supplementary materials (carbon rods as [spar](../../../../services/uavs-services-section/content/text/glossary/terms/spar.md) caps) to carry flight loads.

The PLA inter-layer values are notable: at 40–60% of the along-layer strength, the layer boundary is the weakest point in any printed airframe. Print orientation relative to the primary load path — discussed in [Designing a Printed Wing](../../../../services/uavs-services-section/content/text/documents/articles/notes/designing-a-printed-wing.md) — is the most consequential structural decision in FDM UAV construction.

## Yield in expendable design

[Expendable airframes](../../../../services/uavs-services-section/content/text/glossary/terms/expendable-airframe-design.md) can relax the yield criterion: accepting plastic deformation under peak loads (catapult launch, terminal maneuver) as long as the structure does not fracture. This allows lower [safety factors](../../../../services/uavs-services-section/content/text/glossary/terms/safety-factor.md) (1.1–1.25 on ultimate) and lighter structures, because the designer sizes to ultimate strength rather than yield strength.

## Related terms

- [Stress](./stress.md) — the quantity that yield strength bounds
- [Strain](./strain.md) — the deformation that becomes permanent beyond yield
- [Young's Modulus](./youngs-modulus.md) — the stiffness in the elastic regime below yield
- [Safety Factor](../../../../services/uavs-services-section/content/text/glossary/terms/safety-factor.md) — the margin applied to yield and ultimate criteria
- [Structural Load](./structural-load.md) — the external loads that produce the stresses compared against yield
