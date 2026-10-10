---
title: "Note on Kerbal Space Program, its successors, and time warp in a shared world"
description: "Game-science research for Farstone's orbital spaceflight game: why Kerbal Space Program works as play, where it and KSP 2 fell short, what Juno, Spaceflight Simulator, Orbiter, Children of a Dead Earth, Principia and Outer Wilds each teach, and how time warp can work in a persistent multiplayer world."
date-created: 2026-10-10
authors: [Lenticule Science Senior]
status: research note
serves: debt-2026-10-09-farstone-beats-kerbal
leader-utterances:
  - "Leader, 2026-10-08T16:44:52Z, claude session 0fbf24cb: 'I want us to start working toward Farstone having a full-on game like Kerbal Space Program in it, but obviously, we want to beat Kerbal Space Program using everything the world has learned between when it was designed and now, and critically, use our own math as much as we can to help us.'; 'I'm picturing orbital launch platforms being one kind of ship that folk can build'"
  - "ni:///sha-256;_nIMrP5nl8HAOJgX84V3fznAY4sY_xF1vZ5yCDrpPu0, ni:///sha-256;SMqPajZ772IphhAPOCRpaWF4PyhALTdEZNysIpjDiZ8, ni:///sha-256;5cC75REqQfY4DO9f86X5Kycgm1p_1ap8v6zN6aJGBHk, ni:///sha-256;Z0rkP6ehmX3BuR4zQ5cQbZV_fGk1JUZUc_T5R90zkNc (2026-10-02: invest in Farstone, meet then beat Grand Theft Auto Online; graphics, with text as fallback and supplement)"
---

## Scope

Farstone is the Group's flagship harbor MMORPG/MUD at farstone.561.group. The Leader asked for a full spaceflight game inside it that meets and then beats Kerbal Space Program (KSP). Orbital launch platforms are one kind of ship players build. The game should use what the field learned after KSP's design and use the Group's own mathematics. The same week the Leader set Farstone the target of meeting then beating Grand Theft Auto Online. An orbital game is how a harbor world grows science-fiction wings: the sea and the sky become one persistent place. This note is the game-science half. Physics and celestial mechanics are in the companion notes at physics-services-section and astronomy-services-section, dated 2026-10-10.

## What KSP's design is

KSP (Squad, early access 2011, 1.0 in 2015, final 1.12.5 in 2023, Unity) is a construction-and-consequence game.
- **The core loop.** Build a craft from parts in the Vehicle Assembly Building, fly it under honest orbital mechanics, fail, learn, build again.
- **Physics as the tutor.** Players learn the rocket equation, staging, the Oberth effect, Hohmann transfers and gravity assists by failing at them. The Kerbals' comic personalities make failure funny rather than punishing.
- **Maneuver nodes.** A drag-handle burn planner that previews the resulting conic lets players reason about orbits visually.
- **Career and science modes.** These give a tech tree and contracts.
- **The modding ecosystem.** Players carry much of the long tail: Principia, Realism Overhaul, kOS, Kerbal Joint Reinforcement, Luna and Dark Multiplayer.

## Known limits of KSP

Each limit below is an opening for Farstone.
1. **Patched conics only.** There are no Lagrange points or perturbations (see the astronomy note).
2. **Single precision and the Kraken.** Floating origin and Krakensbane hide float32 seams, and they leak as phantom forces (see the physics note).
3. **Wobbly joints and autostrut.** Part joints are iterative springs, and autostrut misbehaves when the root changes on docking.
4. **Physics only near the active vessel.** Craft beyond physics range (about 2.5 km) go on rails. Unloaded craft cannot thrust, and atmospheric craft are deleted below a set altitude.
5. **Single-player time.** Time warp is global to one player. Multiplayer came only through mods.
6. **Scale and performance.** Part count bounds frame rate on one CPU core.
7. **No persistent logistics.** Colonies, resource chains and interstellar travel were left to KSP 2.

## KSP 2's history

- **Development.** Take-Two began KSP 2 in 2017 at Star Theory and moved it in 2020 to its own Intercept Games. It slipped from 2020 to 2022 and then 2023.
- **Early access.** Released in early access on 2023-02-24, it promised colonies, interstellar travel, multiplayer and thrust under warp. Early access added thrust under warp, re-entry heating and a science mode ("For Science!", December 2023).
- **Reception.** It shipped with severe performance problems, wobble ranked tenth on the developers' own top-ten issues, and orbital decay bugs.
- **Closure.** Intercept Games was closed: a Washington WARN notice gave 2024-06-28. Take-Two cited pipeline rationalization. The last update was in June 2024. Private Division was sold in November 2024. Development status has been unknown since.

**Lessons.**
- A rewrite on the same engine and architecture did not fix the architectural limits: float32 physics, joint solvers, and single-player time.
- Multiplayer and colonies were promised late, on an architecture never built for them.
- Farstone starts the other way round: a persistent multiplayer world first, with flight added as laws over that world.

## Successors and peers

| Game | What it teaches |
| --- | --- |
| **Juno: New Origins** (Jundroo, formerly SimpleRockets 2) | Procedural parts: fuel tanks, wings and fairings are shaped, not chosen from a catalogue. It also has visual programming (Vizzy) for flight software and a career mode. Its stated reason for the rename was that the game "outgrew its name". It runs on low-end hardware and mobile. |
| **Spaceflight Simulator** (Stefo Mai Morojna, mobile) | A 2D-first design reaches a mass mobile audience. Orbital play survives the loss of a dimension, which matters for Farstone's 3D → 2D → text fallbacks. |
| **Orbiter** (Martin Schweiger, 2000, now open source) | High-fidelity flight with real-scale n-body perturbations and a plugin API. It is a simulator, not a game, but it proves real-scale flight can be learned. |
| **Children of a Dead Earth** (Q-Switched, 2016) | Its developer says the equations came first and the gameplay was extrapolated from the behaviour that emerged. It has a 1:1 solar system with n-body perturbation, and ship modules derived from textbook equations for mass, power and heat. Realism becomes strategy. |
| **Principia** (KSP mod) | N-body and extended-body gravitation in KSP, with flight plans integrated rather than conic. Players fly Lagrange-point missions when trajectories are drawn in the right reference frame. |
| **Outer Wilds** (Mobius Digital, 2019) | Planets move on simulated rather than scripted paths, but the physics is tuned for experience; an astrophysicist's analysis finds deliberate liberties. A 22-minute time loop makes time itself the puzzle. A small hand-made solar system can be richer than a large empty one. |

## Time warp in a shared persistent world

This is the problem KSP never solved and KSP 2 never shipped. One world clock cannot run at one player's warp rate while another player docks. The approaches in use or proposed:
1. **Lowest common rate.** The world warps only as fast as the slowest player allows. Simple, and it makes warp a negotiation.
2. **Subspaces with catch-up (Luna Multiplayer).** Each player has their own clock. A player behind others warps forward to sync before interacting. It worked, "except when bugs crept in, which was often", because craft state was mutable and synchronized.
3. **Time bubbles.** Players are independent until they rendezvous, then synchronized. Proposed, not shipped at scale.
4. **Law, not state (Holofoam's answer).** A vessel's trajectory is a law (coast conic or integrated segment) keyed by (vessel, epoch). Its pose at any time is derived, never ticked. Two players at different warp rates are reading the same laws at different times.
   - They conflict only when one tells a new law (a burn) at an epoch the other has already observed.
   - That conflict is exactly a seam: H¹ ≠ 0 over the merged history, refused rather than silently resolved.
   - Merge order does not matter (H¹ = 0 ⟺ order-independent merge ⟺ confluence, Obsmetrologia settling cohomology).
   - Causality is the constraint: a burn may be told only at an epoch outside the causal past already read by others. Holofoam's kinematic diamonds (Obsmetrologia Book VIII: a segment is a causal diamond, ordered by sequencing, never nesting) give that check.

Farstone's own host already advances world time on requests, at most one overdue tick per request, with idle time owed and caught up (causeway-services/farstone README). Trajectory laws are what let that owed time be paid by evaluation rather than by ticking.

## What "beat KSP" means as play

- **Persistence.** Ships, stations and orbital launch platforms remain in a shared world. Other players use them, trade through them and dock to them. KSP has no shared world.
- **Destinations KSP lacks.** Lagrange points, halo orbits, resonant tours and low-energy transfers.
- **No Kraken, no wobble.** Design-time rigidity cohomology tells the builder about unintended mechanisms before launch. Breakage comes from loads.
- **Logistics.** Resource chains and colonies are part of the harbor economy: Farstone's climate, ecology rate laws and civic arcs extend upward into orbit.
- **One client, three tiers.** Flying works in 3D on QwzSpace, in 2D (as Spaceflight Simulator proves) and in text, as a MUD-style flight console.
- **Agents as crew and players.** Agents fly routines, run stations and take contracts. The MetroPlat vision is that "agents doing routines are really going to work".

## Open questions

- Which warp policy does Farstone expose to players? Holofoam's law model makes per-player clocks cheap. The design question is social: can a player observe another's craft "in the future"?
- What is the smallest solar system that is richer than KSP's Kerbol system, in Outer Wilds' sense?
- How do GTA Online's lessons (heists, owned property, a shared city economy) map to orbital play: launch-platform ownership, contract crews, salvage?
- What does a text-tier flight console look like, so that a MUD player can fly a Hohmann transfer?

## Sources

- Kerbal Space Program 2 (Wikipedia, en.wikipedia.org/wiki/Kerbal_Space_Program_2); Game Informer 2024-05-02 on Take-Two's closures; Insider Gaming on Intercept Games layoffs; Business Wire 2022-10-21 early-access announcement.
- KSP forum threads on multiplayer time warp (topics 155297, 159396, 187358) and Luna Multiplayer catch-up (informal).
- Juno: New Origins Steam page (app 870200).
- Children of a Dead Earth Steam description.
- Vice, "How Outer Wilds developers Mobius Digital made space physics fun"; The Physics Mill (2024-09-20) on Outer Wilds' physics.
- causeway-services/farstone README (world clock, one Durable Object per world, QwzSpace client).
