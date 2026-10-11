---
title: "Note on the atmosphere of Farstone's world"
date-created: 2026-10-10
description: "The atmosphere law Holofoam implements for Farstone's KSP-scale world (density, cut height, drag against turning air), where it comes from, what it leaves out, and the open question of drag as a relational dissipative flow."
keywords:
  - atmosphere
  - drag
  - farstone
  - holofoam
provenance:
  serves:
    - ../../../../../../requirements/farstone-orbital-mechanics-research.json
    - lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-simulation-system-services-section/content/requirements/farstone-ksp-atmosphere-and-drag.json
  sibling: 2026-10-10-note-on-the-orbital-mechanics-of-farstones-sky.md
---

KSP's wiki states the law it plays by: "Like all other atmospheres in the game, Kerbin's atmosphere
fades exponentially as altitude increases", "the scale height is about 5600m", "Unlike in real
life, atmospheres in KSP are cut abruptly at fixed height" (70,000 m for Kerbin), and drag is
½ρv²·d·A (rendered from wiki.kerbalspaceprogram.com, 2026-10-10). Holofoam implements this law for
Farstone's world.

## The law

- **Density.** ρ(h) = ρ₀ e^(−h/H) for 0 ≤ h < h_top, and 0 above. ρ₀ = 1.225 kg/m³ (the
  International Standard Atmosphere's sea-level density, p₀/(R_specific·T₀) = 101 325 /
  (287.05·288.15)), H = 5,600 m, h_top = 70 km. It is a single isothermal scale height. KSP
  since 1.0 varies the scale height with altitude through its three temperature layers; one
  scale height is the first approximation.
- **Drag.** a = −½ ρ |u| u · CdA / m, with u = v − ω × r, the velocity relative to air that
  turns with the body. CdA is the sum of the drag areas of the parts still attached. KSP computes
  drag per part from its "drag cube" and attachment nodes; summing per-part areas is the first
  approximation of that.
- **Stable orbit.** A periapsis above h_top never meets air. That is KSP's minimum stable orbit,
  and Farstone counts an orbit only above it.

With the Society's starter rocket, orbit costs about 3,200 m/s with air and about 3,000 m/s
without. KSP's Kerbin is about 3,400 m/s.

## What it leaves out

- Engine Isp falling with pressure (KSP interpolates between sea-level and vacuum Isp).
- Lift, Mach-dependent drag, and heating. The physics section's note on integrators and the
  capabilities requirement's F17 ask for heating as diffusion over the part graph.
- Drag on coasts. A coast is an exact conic, so a coast that dips into the air is still drag-free.
  Re-entry and aerobraking need such a coast to become an integrated segment, which is the same
  promotion F6 asks for under third-body gravitation.

## The open question

The founder asked for the Group's own mathematics wherever it has a result. Drag is dissipation:
it lowers the orbital energy monotonically. The relationality section's idea note
`relational-physics-sim.md` frames physics as "flows, nuclei, profiles, and towers evolving
recognitions". The engineering specification lists free energy as a Lyapunov function
(`Dynamics/Flow/FreeEnergyLyapunov.lean`) for heating. Whether aerodynamic drag can be written as
such a flow, with orbital energy as its Lyapunov function, is the research question that would
put Group mathematics where the field's formula is used today.
