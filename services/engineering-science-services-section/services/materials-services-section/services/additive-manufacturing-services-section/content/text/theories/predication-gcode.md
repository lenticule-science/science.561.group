---
type: object
class: machine-program
depends-on: [slicer]
---

# G-code (in additive manufacturing)

The line-oriented machine-control program emitted by the [slicer](./predication-slicer.md) and executed by the printer's motion controller. G-code is a half-century-old NC-machine convention (RS-274) repurposed for FFF; the dialect actually used is firmware-specific (Marlin, Klipper, RepRapFirmware, Prusa, Bambu) and not strictly compatible across firmwares.

A typical FFF G-code line:

```
G1 X120.50 Y100.25 Z0.40 E5.123 F1800
```

— a coordinated linear move to absolute position $(120.50, 100.25, 0.40)$ mm with extruder advancement to position $E = 5.123$ mm at feedrate $1800$ mm/min. The extruder is treated as a fourth axis $E$ whose distance moved is the *length of filament fed*, not the *length of bead deposited*; the conversion factor is the slicer's flow calculation accounting for nozzle diameter, layer height, and extrusion width.

Key command families:

- `G0` / `G1` — linear travel / linear extrude.
- `G2` / `G3` — clockwise / counterclockwise arc (used by some slicers for circular features; not all firmwares support).
- `G28` — home (referenced position).
- `G29` — bed-mesh probe (auto-leveling).
- `G92` — set logical position (used at print start to zero $E$).
- `M104` / `M109` — set / set-and-wait nozzle temperature.
- `M140` / `M190` — set / set-and-wait bed temperature.
- `M106` / `M107` — fan on/off.
- `M204` — set acceleration.
- `M220` / `M221` — feedrate and flow scaling.

G-code is essentially a stream-of-consciousness motion program: there is no concept of "this line is part of the third perimeter of layer 47", only "go here, extrude this much". Slicer-emitted comments (`; LAYER:47`, `; TYPE:WALL-OUTER`) are the only structural information present, and firmware ignores them.

This flatness is a design choice with consequences: in-print modification is limited to the slicer's pre-emitted "modifier" sections (Klipper's `EXCLUDE_OBJECT`, layer-change scripts), and adaptive in-process control (e.g. closed-loop extrusion correction) requires firmware-side intelligence the G-code does not encode.
