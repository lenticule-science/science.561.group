---
type: object
class: engineering-polymer
depends-on: [glass-transition]
title: Polycarbonate (PC)
description: An amorphous engineering polymer combining high $Tg$ (147°C), high impact strength (the bullet-resistant material in laminated form), and optical transparency.
---

# Polycarbonate (PC)

An amorphous engineering polymer combining high $T_g$ (147°C), high impact strength (the bullet-resistant material in laminated form), and optical transparency. The "engineering polymer" benchmark in injection molding; in FFF it occupies a difficult middle ground — much harder to print than ABS but less rewarding than PEEK.

## Properties

| Property | Value | Notes |
|---|---|---|
| $T_g$ | 147°C | Service temperature ceiling |
| $T_m$ | (amorphous, no $T_m$) | Softens through $T_g$ |
| Tensile strength | 60–70 MPa | |
| Modulus | 2.3 GPa | |
| Impact strength (notched Izod) | 600–900 J/m | Among the highest of unfilled polymers |
| Density | 1.20 g/cm³ | |
| CTE | $0.7 \times 10^{-4}$ /°C | Low for unfilled polymer |
| Optical transparency | 90% | Approaches glass for thin sections |
| UV stability | Poor | Yellows; needs UV-stabilized grade outdoors |

## Why FFF-PC is hard

1. **Nozzle temperature 270–310°C.** Above the limit of PTFE-lined hot-ends; all-metal required. Standard E3D V6 with brass nozzle works at the lower end.

2. **Bed temperature 110–125°C.** Above the limit of most desktop printers without insulation; requires PEI build sheet.

3. **Chamber temperature ≥70°C.** Without enclosure, severe warping and inter-layer cracking. PC is amorphous so does not crystallize, but its CTE is relevant and its $T_g$ is high — same cooling-warping mechanism as ABS but more severe.

4. **Hygroscopic.** Absorbs 0.3–0.5% water at saturation. Wet PC at 290°C undergoes hydrolytic chain scission, producing voids and brittleness. Drying at 100°C for 4 h required.

5. **Layer adhesion.** Even with full chamber control, FFF-PC Z-strength is 60–70% of XY — comparable to ABS, lower than ABS-PC blends.

## Why use it

- **High impact + temperature combination.** Not matched by ABS (lower $T_g$), PETG (lower $T_g$, lower impact), nylon (lower modulus, hygroscopic dimensional instability), or PEEK (vastly more expensive).
- **Optical transparency.** Light pipes, lenses (rough), enclosures with see-through windows.
- **Electrical insulation at temperature.** Replaces ABS in transformer housings, motor brackets.

## ABS-PC blends

Commercial ABS-PC blends (e.g., Stratasys PC-ABS, Polymaker PolyMax PC) print closer to ABS difficulty (240–270°C, ~100°C bed) while delivering 80% of PC's mechanical envelope. Standard practical compromise.

## Open issues

- *UV stability.* Outdoor PC parts yellow and embrittle within months without UV-stabilized grade. PC alone is not an outdoor-use material; ASA replaces it for outdoor applications.
- *Stress cracking.* PC is susceptible to environmental stress cracking in contact with many solvents (acetone, IPA, brake fluid). Selection considerations limit service environment.

## References

- Cantrell, J. T., et al. (2017). "Experimental characterization of the mechanical properties of 3D-printed ABS and polycarbonate parts." *Rapid Prototyping Journal* 23(4).
- Park, S.-I., et al. (2014). "Mechanical and printing properties of PC/ABS blends manufactured by fused deposition modeling." *Composites: Part B* 67.
