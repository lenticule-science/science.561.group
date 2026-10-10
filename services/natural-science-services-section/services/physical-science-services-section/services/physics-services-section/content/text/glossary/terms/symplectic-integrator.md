---
name: Symplectic integrator
date-created: 2026-10-10
references:
  yoshida1990:
    authors: ["Haruo Yoshida"]
    title: "Construction of higher order symplectic integrators"
    publication: "Physics Letters A 150"
    year: 1990
  rein2019:
    authors: ["Hanno Rein", "Daniel Tamayo", "Garett Brown"]
    title: "High order symplectic integrators for planetary dynamics and their implementation in REBOUND"
    publication: "arXiv:1907.11335"
    year: 2019
---

A **symplectic integrator** is a numerical method for Hamiltonian equations of motion whose step map preserves the symplectic form, and so preserves phase-space volume, exactly. Its energy error therefore stays bounded and oscillates over exponentially long times instead of drifting, which is why orbits integrated with it neither spiral in nor out. Semi-implicit Euler is first order; leapfrog (Störmer–Verlet) is second order at one force evaluation per step; Yoshida's composition builds orders 4, 6 and 8 from leapfrog substeps; Wisdom–Holman splits exact Keplerian motion from the perturbation and is the standard for planetary systems. Symplecticity holds only at a fixed step size, and thrust and drag are not Hamiltonian, so powered flight needs a split or non-symplectic treatment.

In the house, Holofoam's `flight.mjs` integrates rigid bodies with fixed-dt semi-implicit Euler at a power-of-two dt so tick times are exact, and the [note on integrators, coordinates and joints](../../documents/articles/notes/2026/10/10/2026-10-10-note-on-integrators-coordinates-and-joints-for-a-spaceflight-game.md) records the case for leapfrog or Yoshida-4 at the same dt. No Obsmetrologia result yet states symplecticity.
