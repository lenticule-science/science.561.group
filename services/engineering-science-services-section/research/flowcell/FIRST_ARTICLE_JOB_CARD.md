# FlowCell T0 blade v0.2-derived — first article job card

**Purpose:** qualify a fabrication process, not a rotating rotor.

## File to slice
`flowcell_T0_blade_NACA4412_v0_2_derived_ROOT_ON_BED.stl`

The file is already oriented with the active blade root at Z=0 and the radial
direction vertical. This orientation is intended to avoid support scars on the
hydrodynamic leading edge. Use a brim if the root footprint needs extra
stability.

## Material gate
Use a known ordinary rigid filament consistent with the research packet
(PETG, ABS, or PA12) **only if that material is physically present and the
machine/profile is qualified for it**. Do not use a TimeMass specialty
filament just because it is interesting.

## Record before starting
- machine (Eugene or Emrys)
- exact filament/spool and dryness state
- nozzle diameter/material
- slicer and printer/material profile
- layer height
- walls / top-bottom / infill
- orientation changes, if any
- estimated grams and duration

## Inspect after printing
- no layer separation, voids, obvious cracks, or severe ringing
- leading edge visually smooth; no support scars
- use `first_article_inspection_targets.csv` for station chord checks
- dimensional target: ±0.25 mm where practical
- record actual mass and print duration
- photograph root, leading edge, tip, and both faces

## Stop condition
A successful first article authorizes fabrication-process learning only.
It does **not** authorize rotation, wet high-speed testing, or use as a rotor
blade. The root socket/hub/shaft interface, three-blade mass matching,
balancing, guard, braking/load system, and full test rig are separate gates.