---
type: example
class: calibration-result
instantiates: [nozzle-temperature-vs-layer-adhesion-tradeoff, extrusion-multiplier]
title: Worked example — temperature tower for PETG
description: A representative calibration result for a new spool of generic PETG on a Prusa MK4 with the stock $0.4$ mm nozzle, run as Step 3 of the FFF tuning loop.
---

# Worked example — temperature tower for PETG

A representative calibration result for a new spool of generic PETG on a Prusa MK4 with the stock $0.4$ mm nozzle, run as Step 3 of the [FFF tuning loop](./predication-the-fff-tuning-loop.md).

**Setup.**
- Printer: Prusa MK4, stock hotend, stock E3D Revo $0.4$ mm nozzle.
- Profile: PrusaSlicer "0.20mm SPEED" PETG profile, modified to print a temperature tower (TeachingTech generator).
- Material: generic PETG, dried 6h at 60°C in a Sunlu S2.
- Layers: $0.20$ mm.
- Speed: $80$ mm/s perimeters.
- Retraction: $1.0$ mm (default for direct-drive).
- Test segments: $230$°C, $235$°C, $240$°C, $245$°C, $250$°C, $255$°C.

**Observations per segment.**

| Temp (°C) | Surface | Overhang | Stringing | Bridge (20 mm) | Notes |
|---|---|---|---|---|---|
| 230 | Slightly matte, rough | Curls visible at 60° | Heavy | Sagged 1.5 mm | Under-temp; extrusion gummy |
| 235 | Glossy | Acceptable to 55° | Moderate | Sagged 0.8 mm | Borderline |
| 240 | Glossy, smooth | Clean to 60° | Light | Sagged 0.4 mm | Good |
| 245 | Glossy, very smooth | Clean to 65° | Light | Sagged 0.3 mm | Best surface |
| 250 | Slight color shift toward darker | Clean | Moderate | Sagged 0.5 mm | Some over-melt |
| 255 | Visibly darker, sticky-looking | Clean but blob at corner | Heavy | Sagged 0.7 mm | Over-temp; degradation onset |

**Layer-adhesion measurement.**

Z-tensile coupons printed at each temperature, pulled on a benchtop tester:

| Temp (°C) | $\sigma_Z$ (MPa) | $\sigma_{XY}$ (MPa, ref) | $r = \sigma_Z / \sigma_{XY}$ |
|---|---|---|---|
| 230 | 22 | 49 | 0.45 |
| 235 | 28 | 49 | 0.57 |
| 240 | 33 | 49 | 0.67 |
| 245 | 36 | 49 | 0.73 |
| 250 | 35 | 48 | 0.73 |
| 255 | 28 | 45 | 0.62 |

**Decision.** $245$°C maximizes $\sigma_Z$ while keeping all aesthetic metrics acceptable. Surface is best; stringing is light and treatable with retraction tuning; overhang clean to $65°$; bridge sag $0.3$ mm (acceptable).

Setting profile nozzle temperature to $245$°C.

**Validation.** A standard print (Benchy at 0.20 mm, ~50 min) at $245$°C produces an excellent surface, clean overhang on the bow, no stringing between the cabin and the chimney. Layer adhesion (verified by hand-stress on the printed test bar) qualitatively matches the $\sigma_Z = 36$ MPa measurement.

**Generalization.** This result applies *only* to this (printer, hotend, material) triple. A different spool of PETG from another manufacturer required $250$°C for the same outcomes; a different printer with a different hotend (Bambu X1 with high-flow hotend) required $240$°C. The tower must be re-run on every change.

**Cost-benefit.** Tower print: 1.5h. Z-coupon prints: 6 × 30 min = 3h. Total tuning: ~5h. Payoff: prints at $245$°C are stronger by $30\%$ over an untuned $230$°C print, and the part now matches the slicer's geometric assumptions.
