---
name: "Boundary Layer"
type: "term"
date-created: 2026-03-06
---

The thin layer of air adjacent to a surface where viscosity decelerates the flow from freestream velocity to zero, governing skin friction and stall.

The boundary layer is the thin region of air immediately adjacent to an aircraft&rsquo;s surface where the flow velocity transitions from zero (at the surface, the no-slip condition) to the freestream velocity. Its behavior determines skin friction [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md), the onset of flow separation ([stall](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/stall.md)), and the effectiveness of [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) design.

The boundary layer exists in two states:

**Laminar** — smooth, orderly flow in parallel layers. Low friction drag but fragile: it separates easily when the pressure gradient becomes adverse (increasing pressure in the flow direction, as occurs on the aft portion of an airfoil&rsquo;s upper surface). Dominant at low [Reynolds numbers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md).

**Turbulent** — chaotic, mixing flow. Higher friction drag but much more resistant to separation. The turbulent boundary layer&rsquo;s momentum mixing brings high-energy air from the freestream down to the surface, enabling it to push through adverse pressure gradients that would cause a laminar layer to separate.

The transition from laminar to turbulent occurs at a critical Reynolds number that depends on surface roughness, pressure gradient, and freestream turbulence. On a smooth airfoil at moderate Re, transition typically occurs between 30–70% of the chord from the leading edge.

For UAV design, boundary layer management is critical at two scales:

- **Small UAVs (Re  300,000, the roughness is small relative to the boundary layer thickness and has minimal effect. At Re < 100,000, the roughness can be comparable to the boundary layer thickness and substantially alter the transition point and separation behavior.
