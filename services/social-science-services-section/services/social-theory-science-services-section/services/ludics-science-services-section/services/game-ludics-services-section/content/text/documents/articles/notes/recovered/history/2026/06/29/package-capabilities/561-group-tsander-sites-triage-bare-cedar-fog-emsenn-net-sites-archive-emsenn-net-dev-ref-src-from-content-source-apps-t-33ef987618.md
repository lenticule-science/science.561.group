---
title: "Capability note: @561-group/tsander"
date: 2026-06-29
source-package: "sites/triage.bare-cedar-fog.emsenn.net/sites/archive.emsenn.net/dev/ref/src/from-content-source/apps/tools/tsander"
---

# Capability note: @561-group/tsander

- Package path: `sites/triage.bare-cedar-fog.emsenn.net/sites/archive.emsenn.net/dev/ref/src/from-content-source/apps/tools/tsander`
- Package kind: `archive-site`
- Declared workspace entries: none found in the scanned workspace declarations
- Description: tsander — the GAME ENGINE on @561-group/arnold: terminal/wireframe games (the engine under OKAGA's space-flight design). Three engine-level concerns, lifted from computer/docs/dev/notes/tsander-design.md: (1) the federated-trace WORLD substrate — a 'place' is a subject whose state is the fold of predications about it, unvisited = ⊥, disagreement = ⊤ HELD with both witnesses; (2) a WIREFRAME renderer — 3D vectors projected to Arnold cells, where a ⊤ object renders DOUBLED and JITTERING (the bilattice readout, driven by tick phase not RNG, replay-identical); (3) a tick/realtime loop with NO global clock (aperiodic settling), and a hook to run a unit's flight-'computer' program in @561-group/horsetail (eval = settle; (if ⊤ …) runs BOTH arms held contested). THE LAW: ⊤ held, append-only trace, evidence linear. Named Tsander←Tsander as Bussard←Bussard. Built on computer's substrate/federation + arnold's terminal; games ride this engine.
- Capability tags from manifest/source hints: `cli`, `workspace-analysis`, `game-or-play`, `mathematics`, `persistence`
- Bins: `tsander`
- Export subpaths: `.`, `./world`, `./wireframe`, `./horsetail`, `./engine`, `./math`, `./package.json`
- Scripts: `test`, `demo`
- Dependencies: `@561-group/arnold`

## Local Evidence

- sites/triage.bare-cedar-fog.emsenn.net/sites/archive.emsenn.net/dev/ref/src/from-content-source/apps/tools/tsander/README.md: **The game engine on [Arnold](../arnold/) — terminal/wireframe games.** Tsander is the engine layer of the [Okaga](../../../computer/docs/dev/notes/tsander-design.md) space-flight design: it gives a game the three things a paraconsistent wireframe game needs, and nothing more.
- Source hints: `bin/tsander.mjs`, `src/engine.mjs`, `src/horsetail-hook.mjs`, `src/index.mjs`, `src/math.mjs`, `src/wireframe.mjs`, `src/world.mjs`, `tests/_harness.mjs`

## Relation To Infography Baseline

- Direct surface overlap with `@emsenn/infography`: `.`, `./package.json`
- Capability classes not directly realized by infography's exported package surface: `game-or-play`

This note is generated from manifest, nearby prose, and source-path evidence.
It should be checked against opened source before making migration or deletion decisions.
