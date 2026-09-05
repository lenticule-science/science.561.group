---
title: "Zork Completion: Algebraic and Rule Engine Tracks"
description: "Outlines two implementation tracks for completing Zork: an algebraic engine proving the algebra IS computation, and a rule engine implementing all gameplay systems."
date-created: 2026-04-06
type: note
name: predicated-zork-algebraic
keywords:
  - algebraic-engine
  - rule-engine
  - zork
  - state-transitions
  - entity-cascades
  - game-systems
specialization: plan
application: world-sim
project: predicated-zork-project
work-type: procedure
horizon: month
owner: first-officer
priority: "2"
depends-on: [predicated-zork-translation]
---

Plan 1 (predicated-zork-translation) is complete. Two engines exist:

- **Rule engine** (`engine.js`): 72 linear rules, plays the opening sequence (20/20 tests). Needs more rules for the rest of the game.
- **Algebraic engine** (`algebraic-engine.js`): Pure ∨_k/⊙, handles state transitions on individual entities. Needs room navigation and cross-entity cascades to be a real game.

Both share the same world data (`zork-world-generated.json`, 250 entities from the ZIL parser).

## Two tracks

### Track A: Algebraic engine (the research)

The algebraic engine proves the algebra IS the computation. Extending it means solving three problems:

1. **Room navigation** — Player movement is a state change on the player entity's location proposition. The go-north verb fiber asserts `location:north-of-house = t` and denies `location:west-of-house = f`. The ∨_k/⊙ cycle moves the player. But the engine needs to know WHICH room to assert — it must read the current room's exit propositions to construct the verb fiber.

2. **Cross-entity cascades** — Opening the kitchen window should change exit propositions on east-of-house and kitchen. The algebraic engine handles one entity at a time. After settling an entity, check if any settled ⊤→t or ⊤→f transitions should propagate as messages to other entities. This IS the tick — σ∘Δ cascading through the entity graph.

3. **Perception** — "Look" composes the room's fiber with visible objects' fibers. The algebraic engine needs to compose multiple entity fibers to produce a room description. This might be iterated ⊙: room ⊙ object1 ⊙ object2 ⊙ ...

### Track B: Rule engine (the game)

The rule engine is the practical implementation. It needs rules for every Zork system:

- **Combat**: Troll, thief, bat — hit points, weapon effectiveness, death
- **Thief patrol**: The thief moves between rooms, steals treasures, can be fought
- **Darkness**: Rooms without light source → grue. Lamp has limited battery.
- **Scoring**: Treasures placed in trophy case earn points. 350 max.
- **Maze**: 15 rooms with deceptive exits. Solvable by dropping objects.
- **All puzzles**: Dam, volcano, coal mine, Hades ceremony, etc.

Each system is mechanical rule translation from the ZIL source — the same process used for the opening area, just more of it.

## Scope

This plan covers the COMPLETE game, not just representative examples. The final test is a full winning playthrough — every room visited, every puzzle solved, 350 points.
