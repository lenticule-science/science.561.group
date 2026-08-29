---
title: "Materials in Aerospace"
date-created: 2026-03-07T00:00:00
type: concept
aliases:
  - "Materials in Aerospace"
  - "aerospace materials"
  - "materials selection"
defines:
  - "aerospace materials"
keywords:
  - MaterialsScience
  - StructuralEngineering
description: "The materials used in aerospace structures — their properties, trade-offs, and how the choice of material shapes every other design decision."
authors:
  - emsenn
  - claude-opus-4-6
---

Material selection in aerospace is inseparable from structural design. The choice of material determines what loads the structure can carry, how much it weighs, how it is manufactured, what it costs, and how long it lasts. Every material is a bundle of trade-offs, and the right choice depends on the vehicle's mission, lifecycle, and production volume.

The relevant material properties are:

- **[Yield strength](../terms/yield-strength.md)** and **ultimate strength** — how much [stress](../terms/stress.md) the material can sustain before permanent deformation and before fracture.
- **[Young's modulus](../terms/youngs-modulus.md)** — how stiff the material is; how much it deflects under load.
- **Density** — mass per unit volume. The ratio of strength or stiffness to density (specific strength, specific stiffness) governs weight efficiency.
- **[Fatigue](../../topics/uavs/terms/fatigue.md) resistance** — how many load cycles the material survives before cracking. Critical for reusable aircraft; irrelevant for expendable platforms.
- **Fracture toughness** — how resistant the material is to crack propagation. A tough material bends; a brittle material shatters.
- **Thermal resistance** — the temperatures at which properties degrade. Relevant for engines, exhaust areas, and reentry structures.
- **Corrosion resistance** — susceptibility to chemical attack from moisture, salt, fuel, and hydraulic fluid.
- **Manufacturing compatibility** — can the material be formed, machined, welded, bonded, or printed into the required shapes at acceptable cost?

## Material families

### Aluminum alloys

Aluminum has been the primary aerospace structural material since the 1930s. The 2xxx series (e.g., 2024-T3: copper alloyed, good fatigue resistance) and 7xxx series (e.g., 7075-T6: zinc alloyed, highest strength) dominate airframe construction. Aluminum's advantages are excellent specific strength (~180 kN·m/kg for 7075-T6), well-understood behavior, established manufacturing processes (sheet metal forming, machining, riveting), and moderate cost. Its disadvantages are poor corrosion resistance without surface treatment, limited fatigue life at stress concentrations, and lower specific stiffness than carbon fiber.

Aluminum is rare in small UAV construction because the manufacturing processes (CNC machining, sheet metal forming) have high setup costs that are uneconomical for short production runs or one-off prototypes. It remains dominant in commercial and military aircraft produced in quantities of dozens to thousands.

### Carbon fiber reinforced polymer (CFRP)

Carbon fiber [composite](../../topics/uavs/terms/composite.md) — layers of carbon fiber fabric impregnated with epoxy resin — offers the highest specific strength and specific stiffness of any structural material. Unidirectional carbon fiber has a specific stiffness 3–4× that of aluminum. CFRP dominates modern military aircraft (F-35: 35% by weight), commercial aircraft (787: 50% by weight), and high-performance UAVs.

The costs are real: raw material costs 5–20× those of aluminum by weight; manufacturing (layup, autoclave curing, non-destructive inspection) requires skilled labor and expensive equipment; repair is complex; and CFRP is brittle — it fails by delamination and fiber fracture with little warning, unlike metals that yield and deform before breaking.

For UAVs, CFRP appears as pre-made tubes and rods ([spar](../../topics/uavs/terms/spar.md) caps in [printed wings](../../topics/uavs/curricula/designing-a-printed-wing.md)), hand-laid skins on foam cores, and pultruded sections. The material's performance justifies its cost in long-endurance platforms where structural weight directly limits mission capability.

### Glass fiber reinforced polymer (GFRP)

Glass fiber composites offer moderate specific strength (lower than carbon but higher than aluminum by volume) at roughly 1/5 the material cost of carbon. GFRP is the structural material of choice for hobbyist and small commercial UAVs: fiberglass-skinned foam wings, fiberglass fuselage shells, and filament-wound tubes. Its lower stiffness compared to CFRP makes it unsuitable where deflection is the design driver (long-span wings, flutter-critical structures), but for strength-driven applications at small scale, it is cost-effective.

GFRP is also the material of many [expendable](../../topics/uavs/concepts/expendable-airframe-design.md) drone airframes: hand-laid fiberglass over hot-wire-cut foam is cheap, requires minimal tooling, and produces adequate structures for single-use platforms.

### Titanium

Titanium alloys (particularly Ti-6Al-4V) combine high strength, low density, excellent corrosion resistance, and good high-temperature performance. They are used in jet engine components, fasteners, and high-load fittings where aluminum's strength is insufficient and steel's weight is unacceptable. Titanium is expensive to buy and difficult to machine, limiting its use to applications where no other material will do. It has no significant presence in small UAV construction.

### Steel

Steel alloys (4130 chromoly, 300M, maraging steel) offer the highest absolute strength of any structural metal but at the penalty of high density. Steel is used in landing gear, engine mounts, and highly loaded fittings where the required loads exceed what aluminum or titanium can provide in the available volume. In small UAV construction, steel appears only as fasteners and control linkages.

### Thermoplastics (3D-print filaments)

PLA, ABS, PETG, nylon, and their fiber-reinforced variants (CF-nylon, GF-PETG) are the structural materials of [3D-printed UAV airframes](../../topics/uavs/concepts/additive-manufacturing-in-uav-airframes.md). Their specific strength is 5–10× lower than aerospace metals or composites, and their specific stiffness is 10–30× lower. They are competitive only because the manufacturing method — FDM printing — eliminates tooling costs, enables complex geometries (variable [infill](../../topics/uavs/terms/infill-density.md), integrated mounting features), and allows rapid iteration.

The anisotropy of FDM parts — strong along filament lines, weak between layers — is the defining structural constraint. A CF-nylon part printed with filament aligned to the load path can approach the performance of hand-laid GFRP. The same part printed with layers perpendicular to the load path may be 50–70% weaker.

### Foam cores

Expanded polystyrene (EPS), extruded polystyrene (XPS), and expanded polypropylene (EPP) serve as lightweight core materials in sandwich structures. The foam carries [shear](../terms/shear-force.md) loads between composite skins, provides the airfoil shape, and resists buckling of thin skins. Foam-core construction is the basis of most hobby-grade and many expendable UAV wings: hot-wire-cut to shape, skinned with fiberglass or packing tape, and flown.

### Wood

Birch plywood and balsa remain relevant in small UAV construction as [rib](../../topics/uavs/terms/rib.md) material, bulkheads, and motor mounts. Plywood offers moderate strength, good fatigue resistance, easy machining (laser cutting), and very low cost. It is not competitive with composites for primary structure in performance-driven designs, but it is an excellent choice for [expendable](../../topics/uavs/concepts/expendable-airframe-design.md) structures where cost dominates performance.

## Selection by platform class

| Platform class | Primary structure | Why |
|---|---|---|
| Commercial transport | CFRP + aluminum | Maximum efficiency for 30-year, 100,000-flight-hour life |
| Fighter aircraft | CFRP + titanium | Strength, stiffness, stealth shaping |
| MALE/HALE UAV | CFRP | Minimum weight for maximum [endurance](../../topics/uavs/terms/endurance.md) |
| Tactical UAV (25–200 kg) | GFRP + foam core | Adequate performance, low tooling cost |
| Small UAV (sub-25 kg) | 3D-printed + carbon tube | Rapid prototyping, low unit cost at low volume |
| Expendable drone (mass production) | Foam + GFRP, injection-molded nylon | Minimum unit cost at high volume |
| Expendable drone (prototype/small batch) | 3D-printed + plywood | Minimum tooling cost |

## Related concepts

- [Structural Mechanics for Aerospace](./structural-mechanics-for-aerospace.md) — how these materials are loaded and how they fail
- [Forces of Flight](./forces-of-flight.md) — the forces that the structure must resist

## Related terms

- [Yield Strength](../terms/yield-strength.md) — the key strength property
- [Young's Modulus](../terms/youngs-modulus.md) — the key stiffness property
- [Stress](../terms/stress.md) — the internal force per area these materials must sustain
- [Composite](../../topics/uavs/terms/composite.md) — fiber-reinforced materials in detail
- [Infill Density](../../topics/uavs/terms/infill-density.md) — the structural design variable for printed materials
