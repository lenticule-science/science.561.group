---
type: concept
class: geometric-feature
depends-on: [overhang, layer]
---

# Bridging

A horizontal span of material laid down between two anchored endpoints with no support beneath — formally, a path of deposited bead $\gamma : [0, L] \to \mathbb{R}^3$ at constant $z$ whose endpoints rest on previously-deposited material but whose interior crosses unsupported air.

Bridging is the limiting case of [overhang](./predication-overhang.md) at $\theta = 90°$ (horizontal downward surface). Unlike a sloping overhang, a bridge cannot be supported layer-by-layer by the slope below; it must span the gap in a single deposition pass.

In FFF, bridging works because:

1. The deposited bead has tensile strength (cooled polymer is solid) immediately on the trailing side of the nozzle.
2. Anchored endpoints provide reaction force.
3. Active part-cooling air freezes the bead before gravitational sag becomes significant.

Bridging-specific slicer parameters: bridge speed (typically slower, $30$–$60$ mm/s, to give cooling time per unit length), bridge fan (typically $100\%$ regardless of normal cooling setting), bridge flow (typically $90$–$95\%$ of normal — slightly under-extruded to keep the bead taut rather than sagging).

Maximum bridgeable distance in FFF:

- PLA, $0.4$ mm nozzle, full cooling: $50$–$80$ mm comfortably; $100$+ mm with bridge-tuning.
- PETG: $30$–$50$ mm (poorer cooling response, more stringy).
- ABS: typically requires support beyond $20$–$30$ mm (slow-crystallizing, prone to droop without enclosure-controlled cooling).
- Engineering plastics (PA, PC): $\leq 20$ mm reliably; longer needs support.

For SLA, "bridging" in the FFF sense does not apply because the resin is liquid before cure; SLA uses supports for any unsupported region. For SLS/MJF, the surrounding powder bed acts as natural support and bridging is not a separate concern.

Bridging is the AM-specific feature that lets a designer place horizontal holes without supports — a horizontal cylindrical hole is two short bridges (top of the hole) plus the sloping sides which are within $\theta_{\max}$.
