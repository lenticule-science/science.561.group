---
name: "Boundary Layer"
date-created: 2026-03-06
aliases:
  - "Boundary Layer"
  - "boundary layer"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - FluidMechanics
description: "The thin layer of air adjacent to a surface where viscosity decelerates the flow from freestream velocity to zero, governing skin friction and stall."
---

The boundary layer is the thin region of air immediately adjacent to an aircraft's surface where the flow velocity transitions from zero (at the surface, the no-slip condition) to the freestream velocity. Its behavior determines skin friction [drag](./drag.md), the onset of flow separation ([stall](./stall.md)), and the effectiveness of [airfoil](./airfoil.md) design.

The boundary layer exists in two states:

**Laminar** — smooth, orderly flow in parallel layers. Low friction drag but fragile: it separates easily when the pressure gradient becomes adverse (increasing pressure in the flow direction, as occurs on the aft portion of an airfoil's upper surface). Dominant at low [Reynolds numbers](./reynolds-number.md).

**Turbulent** — chaotic, mixing flow. Higher friction drag but much more resistant to separation. The turbulent boundary layer's momentum mixing brings high-energy air from the freestream down to the surface, enabling it to push through adverse pressure gradients that would cause a laminar layer to separate.

The transition from laminar to turbulent occurs at a critical Reynolds number that depends on surface roughness, pressure gradient, and freestream turbulence. On a smooth airfoil at moderate Re, transition typically occurs between 30–70% of the chord from the leading edge.

For UAV design, boundary layer management is critical at two scales:

- **Small UAVs (Re < 200,000)**: The boundary layer may remain laminar over the entire airfoil but separate before reaching the trailing edge, forming a laminar separation bubble that increases drag by 50–200%. Turbulators (small strips or zigzag tape on the upper surface) can force early transition to turbulent flow, which stays attached longer and ultimately produces less total drag despite higher friction.

- **Printed airframes**: FDM layer lines (typically 0.1–0.3 mm height) act as distributed roughness that affects boundary layer transition. At Re > 300,000, the roughness is small relative to the boundary layer thickness and has minimal effect. At Re < 100,000, the roughness can be comparable to the boundary layer thickness and substantially alter the transition point and separation behavior.

## Related terms

- [Reynolds Number](./reynolds-number.md) — the parameter governing boundary layer state
- [Drag](./drag.md) — the force that boundary layer behavior directly determines
- [Stall](./stall.md) — the consequence of boundary layer separation over the entire upper surface
