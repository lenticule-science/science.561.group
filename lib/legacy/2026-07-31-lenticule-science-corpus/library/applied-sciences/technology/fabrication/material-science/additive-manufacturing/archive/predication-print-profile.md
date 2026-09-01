---
type: object
class: parameter-set
depends-on: [slicer]
---

# Print profile

A named set of slicer parameters tuned for a specific (printer, material, intent) triple. A print profile is the unit of reproducibility for AM: "I printed this in PLA on a Prusa MK4 with the 0.20mm-Speed profile" is a complete reproducible specification; "I printed this in PLA at 0.20mm" is not.

A typical FFF profile contains $50$–$200$ parameters, of which roughly $20$ matter most for outcome:

**Geometry:**
- Layer height (e.g. $0.20$ mm)
- First-layer height (e.g. $0.25$ mm)
- Extrusion width (e.g. $0.45$ mm for a $0.4$ mm nozzle)
- Perimeter count (e.g. 3)
- Top/bottom solid layers (e.g. 5/5)
- Infill density and pattern (e.g. $20\%$ gyroid)

**Thermal:**
- Nozzle temperature (e.g. $215$ °C for PLA)
- First-layer nozzle temperature (often higher for adhesion)
- Bed temperature (e.g. $60$ °C for PLA on PEI)
- Chamber temperature (for enclosed printers)

**Motion:**
- Print speed (perimeters, infill, travel — usually distinct)
- Acceleration (X/Y, Z, extruder)
- Jerk / junction deviation
- Pressure advance / linear advance constant (for Klipper / Marlin respectively)

**Extrusion:**
- Flow multiplier (e.g. $0.95$–$1.05$, calibrated per filament)
- Retraction distance and speed
- Z-hop on retract

**Cooling:**
- Part fan speed (typically $0\%$ on first layer, ramping to $100\%$ by layer 3 for PLA; lower for ABS/PA)
- Minimum layer time (slow down short layers to prevent heat accumulation)

A print profile is *not* a property of the printer alone, nor the material alone, nor the slicer alone — it is the joint calibration. Profiles ship from manufacturers as starting points; serious users develop and version-control their own. PrusaSlicer / OrcaSlicer / SuperSlicer use a `.ini`-format `.config` file that round-trips cleanly through git.
