---
title: "Note on the orbital mechanics of Farstone's sky"
date-created: 2026-10-10
description: "The orbital mechanics and rocketry that Farstone's KSP-like game rests on, which results are classical and which are the Group's own, how far patched conics can be trusted, and the research the next jobs need: atmosphere, rotation, n-body error."
keywords:
  - orbital-mechanics
  - patched-conics
  - rocketry
  - farstone
provenance:
  serves:
    - lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/content/requirements/farstone-orbital-flight-game-beyond-kerbal-space-program.json
    - ../../../../../../requirements/farstone-orbital-mechanics-research.json
  engineering: lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/computer-mud-engineering-services-section/content/text/documents/articles/specifications/2026-10-10-specification-farstone-orbital-flight.md
---

The Leader asked for a Kerbal Space Program-like game in Farstone that uses "everything the
world has learned between when it was designed and now, and critically, use our own math as much
as we can" (2026-10-08). Science comes before engineering in the Group's order, so this note
holds what the engineering rests on. The glossary term `orbital-mechanics` is the section's
definition; this note is about its use.

## What the game computes, and on what result

- **Two-body motion.** Coasting flight is the Kepler problem about one body. Holofoam solves it
  in universal variables (the Stumpff functions C(z), S(z)), which treat elliptic and hyperbolic
  orbits by one formula and avoid the singularity of the classical anomalies near e = 1 (Battin,
  *An Introduction to the Mathematics and Methods of Astrodynamics*, ch. 4; Vallado,
  *Fundamentals of Astrodynamics and Applications*, §2.3). Exactly parabolic orbits are refused.
- **Patched conics.** Inside a body's sphere of influence only that body attracts. The radius is
  Laplace's r_SOI = a (m/M)^(2/5). The approximation is KSP's own, which states it simplifies "the
  n-body problem to a one-body problem". Its error is largest near the sphere's edge and for slow
  transfers (low-energy transfers, Lagrange-point orbits), which a patched-conic sky cannot hold.
- **The rocket equation.** Each stage gives Δv = Isp·g₀·ln(m₀/m₁) (Tsiolkovsky), with m₀ the
  whole vehicle still attached; staging is why multi-stage rockets reach orbit at all.
- **Ascent.** A gravity turn: a vertical climb, a small pitch-over, then thrust along the
  velocity, so gravity turns the path and the vehicle never fights it sideways. Without air, the
  optimal ascent would be a near-horizontal burn; the turn here keeps it KSP-like.
- **Determinism.** Every quantity is computed in the deterministic arithmetic of
  `computer-data-engineering-services-section/number/deterministic-math`, so a flight is
  reproducible to the bit on any node.

## The Group's own results in use

The engineering specification names them: Obsmetrologia Book VIII (segments of flight as causal
diamonds ordered by sequencing; visibility and communication as kinematic regions); merge
cohomology (two laws at one vessel and epoch are a seam, H¹, never silently resolved); and the
body-bar rigidity sheaf for the vehicle's structure. The relationality idea note
`space-program.md` frames the whole as a "Relational Space Program".

## Research the next jobs need

1. **Atmosphere.** An isothermal exponential atmosphere, p(h) = p₀ e^(−h/H), and drag
   ½ρv²C_dA, with engine Isp interpolated between sea level and vacuum by pressure; KSP's wiki
   states the same exponential law. The open question for the Group is whether drag can be
   written as a dissipative flow in the relational-physics sense (`relational-physics-sim.md`),
   rather than added as a force term.
2. **Rotation.** A body's sidereal period gives the launch site's surface velocity ω × r. Kerbin's
   is 21,549.425 s (174.94 m/s at the equator).
3. **How wrong patched conics are.** Measure, for Holofoam's default sky, the position error of a
   patched-conic Moon transfer against a direct n-body integration of the same initial state, as
   a function of flight time. That bounds where Farstone can trust its sky and where a richer law
   (an n-body segment kind) is needed.
