---
type: morphism
class: software-compensation
depends-on: [extrusion]
---

# Pressure advance (linear advance)

A firmware-side compensation for the pressure-response lag in the FFF [extrusion](./predication-extrusion.md) morphism. Klipper calls it **pressure advance**; Marlin calls it **linear advance**; the underlying model is identical.

Model. The melt zone in the hotend is treated as a compressible volume with pressure $P$ proportional to instantaneous extrusion rate $Q$:

$$P(t) = K \cdot Q(t)$$

where $K$ is the **pressure-advance coefficient** (units: seconds), specific to the (hotend, extruder, filament) system.

When the toolpath velocity $v$ changes, the *deposited* bead width should remain constant (the slicer assumes so), which requires $Q$ to track $v$ in lockstep. But $Q$ tracks commanded extruder velocity $\dot{E}$, which is *not* the same as deposited rate when melt-zone pressure is changing. Pressure advance corrects by pre-feeding extra filament during acceleration phases and pre-retracting during deceleration phases:

$$\dot{E}_{\mathrm{actual}}(t) = \dot{E}_{\mathrm{nominal}}(t) + K \cdot \ddot{E}_{\mathrm{nominal}}(t)$$

— so the extruder leads the toolpath velocity profile by $K$ seconds.

Tuning. Print a [pressure-advance test pattern](https://www.klipper3d.org/Pressure_Advance.html) — a series of short bands at varying $K$ values — and visually identify the $K$ at which corner over-extrusion just disappears without triggering corner-edge gaps. Typical values:
- Direct-drive, PLA: $K \approx 0.02$–$0.05$.
- Direct-drive, PETG: $K \approx 0.04$–$0.08$.
- Bowden, PLA: $K \approx 0.4$–$0.8$.
- Bowden, PETG: $K \approx 0.6$–$1.0$.

The order-of-magnitude difference between direct-drive and Bowden reflects the additional compressible volume of the Bowden tube between extruder and hotend.

Effect on print quality:
- **Corner sharpness.** Without pressure advance, corners are rounded outward by over-extrusion (the bulge at corner exit). With it, corners are sharp.
- **First-bead-of-perimeter blob.** Without pressure advance, the first 1–3 mm of each perimeter has excess material (a small blob). With it, the perimeter starts at correct width.
- **Seam visibility.** Reduced (the seam is where pressure advance has the most work to do).
- **Stringing.** Slight reduction (less residual pressure at travel-move starts means less ooze).

Pressure advance is one of the highest-impact firmware-level tuning levers and one of the few that requires no slicer-side change to use. Klipper users should tune it for every filament; Marlin users should enable Linear Advance and tune $K$ once per (extruder, hotend) pair if not per material.
