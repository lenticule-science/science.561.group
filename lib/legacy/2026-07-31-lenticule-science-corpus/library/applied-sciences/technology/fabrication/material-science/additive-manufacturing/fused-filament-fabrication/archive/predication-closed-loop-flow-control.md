---
type: question
status: open
explores: [extrusion]
---

# Closed-loop flow control for FFF

Open: a real-time, closed-loop control system that measures actual deposited bead width during printing and adjusts extrusion rate to compensate, eliminating the need for spool-by-spool [extrusion-multiplier](teaching/explanations/extrusion-multiplier.md) calibration.

Why this matters. The extrusion multiplier exists because the slicer's open-loop model can't see the actual bead. A spool with diameter $1.78$ mm (advertised $1.75$) is over-extruding by $\sim 6\%$, producing wider beads than nominal — the effect is visible in measurements but invisible to the slicer in real time. Closed-loop flow control would dissolve this whole class of calibration.

What's been tried.

- **Filament-diameter sensors.** Some printers (Prusa with the IR sensor, Bambu via filament profile) compensate for bulk diameter via a measurement *upstream* of the hotend. Effective for diameter variance but doesn't catch melt-zone or extrusion-side errors.
- **Extruder-load sensing.** Klipper can measure extruder motor torque and infer flow restrictions; current applications are clog detection, not active flow control.
- **Optical bead-width sensing.** Research-grade systems use a downward-facing camera or laser profilometer behind the nozzle to measure deposited bead width directly. None in consumer hardware.
- **Acoustic emission monitoring.** Nozzle acoustics correlate with extrusion behavior (clogs sound different from clean extrusion). Research only.

Obstacles.

1. **Sensor placement.** A bead-width sensor must look at the deposited bead within milliseconds of deposition (before the bead has cooled and shrunk to its final width). The sensor must be small enough to fit on the moving print head without adding significant mass.
2. **Closed-loop response time.** Extrusion has $\sim 100$–$500$ ms thermal response time; flow corrections must be filtered to not chase noise.
3. **Calibration data.** Even a sensor reading "bead width" needs to know what bead width was *commanded* — requires slicer-firmware integration that doesn't currently exist.
4. **Cost.** A profilometer adds $\$200$+ to BOM; consumer 3D printers are price-sensitive.

The closest commercial systems: Inkbit (uses inkjet printheads, layer-by-layer optical scanning, $\$10^5$+ machine), AON3D, and a few European industrial FFF vendors. Desktop closed-loop flow remains a research topic.

A user-side workaround: print profiles version-controlled with $f$ logged per spool. Imperfect, but eliminates the most common failure mode.
