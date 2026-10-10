---
name: Patched conic approximation
component-of: astronomy
date-created: 2026-10-10
---

The **patched conic approximation** computes a spacecraft trajectory as a sequence of exact two-body conic sections, each about the one body whose [sphere of influence](sphere-of-influence.md) the craft is in, with the state vector re-expressed in the next body's frame at each boundary. It gives closed-form positions at any time — so time acceleration is free and craft off the active scene cost nothing — and it is accurate enough for preliminary interplanetary design. It cannot represent Lagrange points, halo orbits, third-body perturbation, resonances or low-energy transfers, and the force on the craft is discontinuous at each boundary. Kerbal Space Program uses it with planets on fixed rails; Holofoam's `orbit.mjs` implements it deterministically as segment laws keyed by (vessel, epoch). The restricted n-body alternative, and the hybrid a shared world needs, are in the [note on patched conics and n-body gravitation](../../documents/articles/notes/2026/10/10/2026-10-10-note-on-patched-conics-and-n-body-gravitation-for-a-shared-spaceflight-world.md).
