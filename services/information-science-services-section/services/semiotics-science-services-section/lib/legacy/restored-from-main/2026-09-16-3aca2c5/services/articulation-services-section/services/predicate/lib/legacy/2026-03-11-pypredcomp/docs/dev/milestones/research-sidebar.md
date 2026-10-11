---
title: "Milestone (parallel): Research sidebar"
description: "Research artefacts and content that runs on the OS. Predicated Zork, world-sim, Hevî Mala, paracosms. Their porting is conformance fixture, not release deliverable. Runs in parallel with the main release sequence."
kind: milestone
status: active
version: "research"
of-campaign: campaign:ship-pypredcomp
horizon: doing
completion-percent: 0
---


## Position in hierarchy

- Of campaign: [campaigns/ship-pypredcomp.md](../campaigns/ship-pypredcomp.md) (parallel; non-gating).
- Decomposes into: research artefacts under `operations/science/research/` and conformance fixtures under [`tests/fixtures/`](../../tests/fixtures/).

This is **not a release plan**.
The work here proceeds in parallel with OS development and is sometimes useful as conformance evidence that the substrate is correct, but it is not gating any OS release.

## What lives here

The captain has years of research artefacts and content commitments that run on (or will run on) the OS:

- **Predicated Zork** — 250 entities, 72 closure rules, 20-test suite passing.
  Two engines (rule-based and pure algebraic).
  Source: `operations/engineering/fars/src/zork1/`.
  Research: `operations/science/research/predicated-zork/`.
- **Predication world-sim** — ~880-line design.
  Source: `operations/engineering/triage/operations/command/ideas/triage/predication-world-sim.md`.
- **Hevî Mala** — captain's praxonic-worldmaking setting.
  World guide at `theories/engineering/theories/games/theories/role-playing-games/texts/hevi-mala.md`.
  Paracosm at `operations/science/research/domains/paracosms/hevi-mala/`.
- **Teraum** — MUD universe with Eastlands, Westlands, South Arathel.
  Multiple implementations (Racket qtMUD, Fennel TAB, Rust MASH).
- **Okaga** — space-station MUD universe.
- **Other paracosms** — Turntide Islands, Durham 2030, Groundhog Autonomous Zone, Earth (folktales).
- **MUD architecture theory** — driver/mudlib/map/recipes/builders pattern.
- **Voidfleet Academy** — agent training program.
  Becomes an app on the OS at v0.8.

## Why these are not OS releases

These are **content** the OS hosts, not OS components.
The OS provides the substrate; these run on it.

The 561 group needs the OS to be a real OS, not a vehicle for these research artefacts.
Hyper-focusing on Predicated Zork or Hevî Mala produced a wrong-shaped sprint in a prior session — apps in `apps/` for things that should have been "specifications of an OS."
This sprint reframes: build the OS first.
