---
title: "Note on integrators, coordinates and joints for a spaceflight game"
description: "Symplectic integration, large-world coordinates and floating origin, part-joint stability, and deterministic arithmetic: the physics a Kerbal Space Program-class game rests on, what KSP got wrong, and what the house already holds."
date-created: 2026-10-10
authors: [Lenticule Science Senior]
status: research note
serves: debt-2026-10-09-farstone-beats-kerbal
leader-utterances:
  - "Leader, 2026-10-08T16:44:52Z, claude session 0fbf24cb: 'make sure that you improve Holofoam to be able to use it as our physics simulation engine (right now it's kind of biased toward web browser toy)'; 'everything should be SignCells'"
---

## What the theory holds

### Symplectic integration

A Hamiltonian system conserves phase-space volume, and a *symplectic* integrator preserves that structure exactly. Because of this, its energy error stays bounded and oscillates for exponentially long times instead of drifting. A non-symplectic method of any order, such as classical RK4, lets an orbit spiral in or out under long integration.
- **Order 2.** Semi-implicit (symplectic) Euler is order 1. Leapfrog / velocity Verlet / Störmer is order 2, at one force evaluation per step.
- **Higher orders.** Yoshida's composition gives order 4 from three leapfrog substeps and order 6 or 8 from more. Kahan–Li and Blanes–Moan publish optimized coefficient sets.
- **Mixed-variable methods.** Wisdom–Holman splits Keplerian motion, solved exactly, from the interaction perturbation. It is the standard for planetary systems. Rein, Tamayo & Brown report up to six orders of magnitude better accuracy than plain Wisdom–Holman with high-order variants in REBOUND (arXiv:1907.11335).
- **Limits.** Symplecticity holds only at a fixed step. Adaptive steps break it unless time is transformed (Mikkola, or a Sundman transform). Thrust and drag are not Hamiltonian, so powered flight needs a non-symplectic or split treatment.

### Large-world coordinates and floating origin

IEEE single precision carries 24 significant bits. At 6×10⁵ m from the origin (Kerbin's radius) its spacing is about 0.06 m, and at interplanetary distances it is kilometres. Unity's PhysX ran in single precision, so KSP:
- moves the world so the active vessel stays near the origin (*floating origin*);
- uses "Krakensbane", which subtracts the vessel's velocity from the frame so physics sees small velocities;
- keeps planetary positions in doubles on a separate path.

The bugs that follow, such as craft jittering, "the Kraken" and phantom forces, come from the seams between the double and single domains. The standard modern answers:
- 64-bit world coordinates throughout, as Unreal Engine 5's Large World Coordinates do;
- camera-relative rendering, where the GPU sees only small offsets;
- hierarchical frames, with a body-fixed frame per celestial body and a local frame per vessel.

### Part-joint stability

KSP joins parts with PhysX configurable joints. Long stacks wobble because the joint chain is a compliant spring network solved iteratively at a fixed iteration count, and a mass ratio between neighbours makes the iterative solver converge badly. KSP added "autostrut", hidden extra joints to the heaviest or root part. Autostrut misbehaves when the root changes on docking and undocking. KSP 2's developers listed "overly wobbly rockets" as issue 10 of their top ten and planned to move away from autostrut. Joint compliance in both games is elastic only, never plastic.

What has been learned since:
- Reduced-coordinate articulations (Featherstone; PhysX 4 articulations; MuJoCo) solve a tree of joints exactly in O(n).
- Most of a rocket should be one rigid body. Compliance should exist only where design calls for it.
- Breakage should be computed from loads, not from joint drift.

### Deterministic arithmetic

Lockstep and replay-verified multiplayer need bit-identical results on every node. That rules out fused multiply-add variance, transcendental functions that differ by platform, and order-dependent parallel sums. The answer is a fixed operation order and portable implementations of sin, cos and log, or fixed-point arithmetic.

## What the house already holds

Holofoam (computer-simulation-system-services-section/apps/holofoam) already has the right shape on every axis above:
- **Integrator.** `flight.mjs` integrates rigid bodies with fixed-dt semi-implicit (symplectic) Euler, dt a power of two (default 1/64) so tick times are exact. `orbit.mjs` propagates coasts analytically, which is exact.
- **Determinism.** Only + − × ÷ and sqrt in fixed order, plus `deterministic-math` (computer-data-engineering-services-section/src/number/deterministic-math.mjs) for transcendentals. Every node derives identical poses and the same history head.
- **Joints.** `structure.mjs` fuses welds into rigid clusters. Struts, decouplers (ball joints) and hinges are constraints, read as a body-bar rigidity sheaf (`signgraph/cellular-sheaf`) exactly over the rationals:
  - H⁰ gives motions;
  - mechanisms are motions minus six per connected piece;
  - self-stresses are H¹, with the Maxwell identity.
  Loads solve Rᵀf = −p by deterministic conjugate gradients. A member over strength fires as a FOUR-⊤ settlement event and vanishes (foam topological transitions T1/T2). This is exactly the "one rigid body, compliance only where designed, breakage from loads" answer, and it was reached from the Group's own mathematics.
- **Gaps.** The integrator is first order. Mass is constant, with no propellant flow in `flight.mjs`. Coordinates are plain doubles, with no frame hierarchy. A rigid ship is not coupled to central gravity: the slice-3 rocket flies under uniform gravity.

## What the Group's own mathematics adds

- **Rigidity is cohomology.** It rests on the cellular-sheaf machinery in SignGraph and on the Obsmetrologia sheaf-cohomology layer (settling cohomology H⁰/H¹; cellular sheaf over the clopen lattice, framework 3 in `cohomological-framework.md`). Wobble is the presence of an unintended mechanism (dim H⁰ > 6 per piece), so it is detectable at design time, before flight.
- **Breakage is settlement.** It rests on FOUR (Belnap–Ginsberg bilattice) and the settling closure law, "for any closure operator c, c(a) is the least fixed point above a". The failure flow re-settles until nothing fires, which is a strict-regime closure (κ < ω).
- **Thermal and re-entry diffusion.** Heat across a part graph is a Laplacian flow. It rests on Obsmetrologia `Dynamics/Flow/LawvereLaplacianSpectralGap.lean` and `FreeEnergyLyapunov.lean`: the spectral gap bounds the relaxation rate, and free energy is a Lyapunov function.
- **No house result yet** states symplecticity or a Hamiltonian structure. Obsmetrologia's `Dynamics` namespace holds closure flows, not Hamiltonian flows. This is a gap, not a contradiction.

## Open questions

- Should Holofoam's rigid-body integrator move from symplectic Euler to leapfrog or Yoshida-4 at the same fixed dt, and does the deterministic-math operation order survive the composition?
- Does Obsmetrologia's continuous-state regime classification (`continuous-state-regime-classification.md`, which proves value-continuity and time-continuity are independent axes) give a reading of symplectic integration as a regime? A bounded oscillating energy error is neither strict nor asymptotic convergence.
- Can 64-bit coordinates plus body-fixed frames be expressed as a SignCell frame tree, so that a pose is always (frame cell, local offset) and never a global float?
- What is the smallest articulated-joint model (hinge, piston, rotor) that keeps the rigidity sheaf exact over the rationals?

## Sources

- KSP and KSP 2 forum threads on wobble and autostrut (forum.kerbalspaceprogram.com topics 214159, 203282, 171527); KSP 2 developer statement quoted there.
- Rein, Tamayo & Brown (arXiv:1907.11335); Chambers & Murison, "Pseudo-high-order symplectic integrators" (arXiv:astro-ph/9910263).
- Yoshida, "Construction of higher order symplectic integrators", Phys. Lett. A 150 (1990).
- Featherstone, *Rigid Body Dynamics Algorithms* (2008).
- House: holofoam `src/flight.mjs`, `src/structure.mjs`, `src/orbit.mjs`; deterministic-math; the Obsmetrologia core survey (561-group-services-section notes 2026-08-11).
