---
name: mud
keywords:
  - idea
  - mud
  - design
part-of: relational-computer
description: "Describes how a text MUD could exist as a slice of the relational computer with state as recognitions."
---

This is a *design note*, not an implementation. It describes how a small
hack‑and‑slash MUD could exist as a slice of the universal relational computer:
all state is recognitions; all change is via earned rewrites; and gameplay loops
are aligned with measurement, topology, and traceability.

## 1. Purpose and design goals

We want a toy that:

- Feels like a familiar text MUD (telnet/subtelnet I/O, rooms, items, NPCs).
- Lets players live inside a **subgraph of recognitions** rather than a bespoke
  game engine.
- Treats messy phenomena (“stabbed in the kidney, stitched, then kidney
  failure”) as first‑class, explainable relational dynamics.

Design goals:

- **Relational first**: everything is a recognition; mechanics are graph
  rewrites, not ad‑hoc flags.
- **Explainable**: strange outcomes must be reconstructible from
  measurement/topology/traceability.
- **Composable**: the same machinery should handle bodies, ecologies, social
  systems, and story without special casing.
- **Lightweight**: this stays a toy; it should be small enough to implement
  incrementally.

## 2. Core model: MUD concepts as recognitions

We model the MUD domain with a small vocabulary of recognition types (to be
formalized later as specs):

- **World geometry**
  - `RoomRecognition`: spatial node with topology metadata (region, stratum,
    adjacency).
  - `ExitRecognition`: directional relation between rooms (with predicates for
    locked/hidden/conditional).
- **Entities**
  - `CharacterRecognition`: player or NPC; linked to body topology, inventory,
    and social relations.
  - `ItemRecognition`: weapons, armor, tools, consumables; each with usage and
    effect rules.
- **Bodies and conditions**
  - `BodyRecognition`: small graph of organs/tissues under an anatomical
    topology (heart, kidney, lungs, etc.).
  - `InjuryRecognition`: local damage (stab, fracture, infection) attached to a
    body node + cause + time.
  - `TreatmentRecognition`: interventions (stitches, drugs, rest, surgery) with
    expected measurement changes + risks.
  - `ConditionRecognition`: derived chronic states (kidney failure, anemia,
    chronic pain) computed from injury history + measurement.
- **Events and arcs**
  - `EventRecognition`: discrete actions (attack, heal, move, speak).
  - `QuestRecognition`: structured goals (“stabilize this body”, “restore this
    forest”), linking multiple recognitions over time.

Everything above is still just a recognition: it must pass intake, be placed in
topology, have measurement channels as appropriate, and carry traceability.

## 3. Embedding in the existing architecture

### 3.1 Intake and schemas

- MUD entities (characters, rooms, items, bodies, injuries) arrive via the
  **ingestion gateway**, using MUD‑specific JSON/YAML schemas.
- The **intake stack**:
  - checks schema and type constraints,
  - enforces policy (e.g., who may mint characters or run destructive
    runbooks),
  - attaches trace IDs and topology metadata as they enter the system.

### 3.2 Topology: spatial, anatomical, social

We reuse the topology stack for three intertwined graphs:

- **Spatial**: dungeon rooms, regions, wilderness; constrains movement and
  visibility.
- **Anatomical**: body graph; constrains where injuries/treatments attach and
  how effects propagate.
- **Social**: factions, guilds, relationships; constrains who may act on whom
  (healing, harming, negotiating).

The **topology integration service** compiles these into constraint bundles that
the runtime/orchestrator must obey:

- valid moves / exits,
- valid targets for actions,
- propagation rules (bleeding from kidney affects circulation; a faction event
  affects reputation; etc.).

### 3.3 Measurement: vitals, environment, social

We use the measurement stack to track observables:

- **Vitals**: not a single HP scalar but a vector: kidney function, blood loss,
  oxygenation, infection load, fatigue, etc.
- **Environmental**: room danger level, noise, visibility, resource abundance.
- **Social**: trust, fear, reputation between recognitions.

The **measurement fabric**:

- ensures each stat is a typed observable with a schema,
- enforces update rules for injuries/treatments/rest,
- emits events when invariants are violated (e.g., “risk of kidney failure is
  growing”, “forest resilience below threshold”).

### 3.4 Traceability: causal chains as first‑class

Traceability connects everything:

- Every injury knows **what** caused it (event, actor, weapon, location).
- Every treatment records who did it, with what knowledge, and what they
  measured.
- Every chronic condition carries a dependency chain back through events and
  measurements.

A question like “why is this character collapsing now?” becomes a graph query,
not narrative hand‑waving.

## 4. Session model and telnet I/O

We treat telnet as a **view** onto a slice of the recognition graph:

- Each connection has a `SessionRecognition` linked to:
  - a `CharacterRecognition` (avatar),
  - a current `RoomRecognition`,
  - an auth/policy context.
- Every command is a **runbook invocation**:
  - e.g., `move north`, `stab goblin`, `examine wound`, `rest`, `apologize`.
  - The MUD adapter parses the command, resolves it to a runbook, and hands a
    JSON payload to the rewriter engine.
- Text output is synthesized from:
  - which recognitions were touched,
  - how measurement/topology changed,
  - what traceability records were created/updated.

The same underlying graph could later feed richer clients, but telnet gives us a
minimal, legible interface for this toy.

## 5. Gameplay loops (high‑level)

We want loops that are fun *because* the world is relational:

- **Diagnostics / investigation**  
  - Trigger: symptoms (collapse, strange forest behavior, NPC acting “off”).  
  - Play: inspect recognitions, run small tests, follow edges (injury → prior
    events → treatments).  
  - Reward: correctly naming/locating the problem recognition (“this is a
    kidney injury compounded by bad stitches”).

- **Intervention / stewardship**  
  - Trigger: diagnosed problem.  
  - Play: choose and execute runbooks (treatments, ecological interventions,
    social moves) while watching measurement and topology for side‑effects.  
  - Reward: stabilizing a situation without causing worse problems elsewhere.

- **Exploration / attunement**  
  - Trigger: entering new regions or communities.  
  - Play: gentle interactions + observation; watching how structures respond
    over time.  
  - Reward: gaining recognitions that represent genuine understanding (these
    later gate what runbooks you may use or how effective they are).

- **Narrative / counterfactual**  
  - Trigger: major events with rich traceability.  
  - Play: simulate alternate interventions in a sandbox slice, compare
    trajectories, possibly align reality with a safer counterfactual if that
    rewrite passes invariants.  
  - Reward: stories you can *audit* and learn from.

These loops use the same math you already earned, but present it as lived
play instead of abstract reasoning.

## 6. Minimal vertical slice (for future implementation)

When we someday implement this toy, a first slice should be very small:

1. **World**
   - 3 rooms in a linear dungeon.
   - 1 player character + 1 goblin NPC.
2. **Body**
   - Torso with two organs (heart, kidney).
   - Injury: stab to kidney. Treatment: stitches that may or may not fully fix
     underlying damage.
3. **Measurement**
   - Observables: `kidney_function ∈ [0,1]`, `blood_loss ∈ [0,1]`,
     `fatigue ∈ [0,1]`.
4. **Runbooks**
   - `attack`, `treat_wound`, `rest`, `examine`, `move`.
5. **Dynamics**
   - Untreated or poorly treated kidney wounds evolve into a condition
     recognition (`kidney_failure`) that drives measurement and limits what the
     character can do.

This slice is enough to exercise intake, topology, measurement, traceability,
and telnet I/O in one coherent loop.

## 7. Ludic alignment: patterns and anti‑patterns

To keep the toy aligned with your ethos:

- Avoid:
  - opaque RNG deaths (“the dice said so”),
  - grinding that just increments scalars,
  - god‑mode rewrites without traceability.
- Embrace:
  - play as **relational navigation** (understanding edges, not coordinates),
  - **slow variables + fast feedback** (long arcs visible through telemetry),
  - **asymmetric roles** (healer sees vitals, scout sees topology, lorekeeper
    sees traceability),
  - **earned power** (abilities unlocked by recognitions, not arbitrary levels).

## 8. Procedural generation as lazy recognitions

If we layer procgen on top, it should itself be just another runbook:

- A procgen runbook is invoked when:
  - a player moves into unexplored space,
  - a runbook asks to “expand this region,”
  - background processes want to grow topology.
- It:
  - picks **template recognitions** (room/biome/body patterns) consistent with
    current topology and measurement,
  - builds a small candidate subgraph (rooms, exits, entities),
  - runs the normal intake → topology → measurement → traceability sequence,
  - commits new recognitions only if all invariants pass.

The key idea is that procgen never bypasses the relational discipline—it uses
it.

## 9. Status

This document is intentionally a *plan*: it names the recognitions, loops, and
constraints we care about, without pinning down data structures or code. When
the core system is ready for toys, we can turn this into:

- specs for MUD recognitions (rooms, bodies, injuries, etc.),
- runbooks for common actions and procgen,
- rewriter handlers for the minimal act set needed,
- and a small telnet adapter that lets people walk around inside this slice of
  relationality.

