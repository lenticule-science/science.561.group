---
title: "Note on patched conics and n-body gravitation for a shared spaceflight world"
description: "What celestial mechanics a Kerbal Space Program-class game can simulate, what patched conics give up, what n-body integration costs, and the hybrid a persistent multiplayer world such as Farstone needs."
date-created: 2026-10-10
authors: [Lenticule Science Senior]
status: research note
serves: debt-2026-10-09-farstone-beats-kerbal
leader-utterances:
  - "Leader, 2026-10-08T16:44:52Z, claude session 0fbf24cb (cited in farstone-orbital-flight-game-beyond-kerbal-space-program.json): 'beat Kerbal Space Program using everything the world has learned between when it was designed and now, and critically, use our own math as much as we can'"---

## What the theory holds

A spaceflight game simulates gravitation under one of three regimes, and the choice decides what the player can do.

1. **Patched conics.** The craft feels exactly one body at a time. Inside that body's *sphere of influence* (SOI, radius r_SOI ≈ a·(m/M)^(2/5), Laplace's form) the trajectory is an exact two-body conic. At the SOI boundary the state vector is re-expressed in the next body's frame and a new conic begins. Kerbal Space Program (Squad, 2011–2015 to 1.0; last update 1.12.5 in 2023) uses this regime, with planets on fixed rails.
2. **Restricted n-body.** The craft is a massless test particle under every body. The bodies themselves still move on rails or ephemerides. Lagrange points, halo orbits, low-energy transfers, resonances and lunar perturbation all exist in this regime. Principia (the KSP mod by eggrobin and pleroy, github.com/mockingbirdnest/Principia) runs KSP in this regime, and it also integrates the bodies themselves.
3. **Full n-body.** Every body attracts every other. Children of a Dead Earth (Q-Switched, 2016) markets a full-scale solar system with Lagrange points and perturbation simulated. Universe Sandbox does it as a toy at astronomical scale.

What patched conics give up, as the KSP community states it. These sources are informal.
- A craft near the Mun feels only the Mun. Kerbin's pull vanishes at the boundary.
- The gravitational force jumps where the SOI is crossed.
- There are no Lagrange points, halo orbits or lunar perturbations, and a parking orbit never decays from third-body forcing.
- Bodies are point masses (no J2 oblateness), so there are no sun-synchronous or frozen orbits.

What patched conics buy:
- a closed-form position at any time, so time warp costs nothing;
- on-rails craft that cost nothing while unloaded;
- maneuver nodes that predict exactly.

The community's own summary is the trade: without patched conics there is no cheap time acceleration.

## What the house already holds

Holofoam's `orbit` module (computer-simulation-system-services-section/apps/holofoam/src/orbit.mjs) is a patched-conic system, written as *law, not state*:
- A coast is a two-body conic propagated by universal variables (Stumpff functions), elliptic and hyperbolic, using only `deterministic-math` so every node derives identical bits.
- A powered segment is fixed-dt semi-implicit Euler under the parent's point gravity.
- SOI exit, SOI entry and impact are found by deterministic bisection.
- The successor coast is the same worldline in the new parent's frame.
- `poseAt(plan, t)` answers for any t, years ahead included, without ticking.
- Multiplayer merge is a SignCraft history union. A conflict at one (vessel, epoch) is a seam with H¹ ≠ 0, and the vessel's pose is refused from that epoch on.

The house therefore already holds regime 1, and it holds it better than KSP in three ways:
- it is deterministic across nodes;
- it stores no per-tick state;
- it detects merge conflicts.

Its own docstring states its limits. A vessel is a point mass. A powered segment does not check entry into a child's SOI. The default system is three bodies at KSP scale.

## What the field learned since KSP's design (2011)

- **Hybrid propagation is the settled answer.** A craft coasts under an analytic or semi-analytic law and is integrated numerically only when a perturbation matters or thrust is applied. Principia's flight plans do this on top of a symplectic n-body ephemeris. Its prediction is a numerically integrated trajectory, not a conic.
- **Ephemerides can be precomputed.** In restricted n-body the bodies' motion does not depend on craft. One integration of the bodies, stored as Chebyshev segments (as JPL's DE ephemerides are), serves every player and every warp rate.
- **Players learn n-body when the interface shows it.** Principia players fly Lagrange-point and low-energy transfers because the mod draws trajectories in rotating and body-fixed frames. The difficulty was the display, not the physics.
- **Scale is a design parameter.** KSP's 1/10-scale Kerbin (600 km radius, μ = 3.5316×10¹² m³/s²) keeps orbital velocity near 2.3 km/s and launches short. Real-scale mods (RSS/RO) show that a dedicated audience wants 1:1. Holofoam's `DEFAULT_SYSTEM` already uses the KSP-scale homeworld.

## What this means for Farstone

- Restricted n-body is the right default. Craft are test particles. Bodies follow one precomputed, content-addressed ephemeris that every node reads identically.
- A patched conic stays as the coast law far from third bodies. There it is exact enough and free under warp.
- A coast is promoted to an integrated segment when the third-body acceleration ratio exceeds a declared threshold. Each segment remains a law keyed by (vessel, epoch), so `poseAt` and history merge carry over unchanged.
- Lagrange points, halo orbits and resonances become playable destinations for orbital launch platforms and stations, which KSP cannot offer.

## Open questions

- What threshold of third-body acceleration ratio promotes a coast to integration without visible discontinuity, and should the promotion itself be a settlement cell (FOUR-valued: conic-adequate, integrate, both, unknown)?
- Can a precomputed ephemeris be stored as SignCells with a content address per Chebyshev segment, so that two nodes holding the same address hold the same sky?
- Does an Obsmetrologia result bound the merge of two n-body plans the way H¹ = 0 ⟺ confluent merge bounds patched-conic plans? Integrated segments still key on (vessel, epoch), so the merge law should carry over unchanged, but no house text states it.
- Should Farstone ship at KSP scale, real scale, or both as server settings?

## Sources

- KSP forum explanations of patched conics and SOI: forum.kerbalspaceprogram.com topics 113588, 124639, 203248, 101400 (informal).
- Principia: github.com/mockingbirdnest/Principia.
- Children of a Dead Earth developer description (Steam store, Q-Switched Productions); claims are the developer's own.
- Rein, Tamayo & Brown, "High order symplectic integrators for planetary dynamics and their implementation in REBOUND" (arXiv:1907.11335).
- House: holofoam `src/orbit.mjs`, `README.md` "Orbits".
