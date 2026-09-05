---
type: concept
class: internal-structure
symbol: \rho
depends-on: [layer]
---

# Infill

The internal structure of an additively manufactured part — the volumetric region between the outer [shells](shell.md) — represented as a sparse pattern (grid, gyroid, honeycomb, triangle, cubic, …) at a specified **infill density** $\rho \in [0, 1]$, where $\rho = 0$ is hollow and $\rho = 1$ is fully solid.

Infill is an AM-specific design degree of freedom with no analog in subtractive or formative manufacturing: a part can be made in any density between hollow and solid without redesigning the part. It trades off:

- **Material and time:** linear in $\rho$ to first order.
- **Stiffness:** sub-linear in $\rho$; doubling infill from $0.20$ to $0.40$ typically yields $\sim 30$–$50\%$ stiffness gain, not $100\%$.
- **Strength:** depends on pattern. For uniaxial tension along the print plane, gyroid and honeycomb outperform rectilinear at the same $\rho$. For impact, gyroid's lack of internal stress concentrators wins.
- **Print time:** sub-linear in $\rho$ for sparse patterns due to perimeter-dominated time at low $\rho$.

A common heuristic: **functional FFF parts default to $\rho = 0.20$ with three perimeters and three solid top/bottom layers** — this captures most of the strength at a fraction of the material. Higher $\rho$ rarely pays off until $\rho \to 1$, because the structural contribution of perimeters dominates for thin-walled geometries.

For load-bearing parts, infill is a poor substitute for designed-in [ribs](rib.md) and gussets: a $\rho = 0.40$ infill is mechanically inferior to a $\rho = 0.15$ infill plus rib geometry of equal mass.

Patterns:

- **Rectilinear / lines:** fastest, weakest, anisotropic.
- **Grid:** rectilinear with crossings; stronger but extruder-stress-prone.
- **Triangle / tri-hexagon:** isotropic in plane, moderate strength.
- **Honeycomb / hex:** strong, slow.
- **Gyroid:** isotropic, smooth toolpath, no stress concentrators, prints fast at moderate density. Generally the default for functional parts.
- **Cubic / octet:** 3D-isotropic; useful when load direction is uncertain.
