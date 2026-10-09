---
title: Zork and Rogue on FARS
description: Proposes implementing Zork and Rogue games entirely through the FARS API to prove FARS handles spatial navigation, inventory management, state machines, and procedural generation.
date-created: 2026-04-06
type: note
name: zork-and-rogue-on-fars
keywords:
  - spatial-navigation
  - inventory-management
  - procedural-generation
  - state-machines
  - quantitative-mechanics
  - operational-game
specialization: idea
source: captain-directive
serves: [ordering-first-computation, paradigm-applications, system-architecture-refactor]
related-ideas:
  - fars-core-algebra-native
  - fars-faoh-mash-architecture-from-first-principles
  - gamification-as-enrichment-prioritizer
  - token-economy-from-predication
related-research:
  - library/theories/engineering/theories/tech/theories/computing/theories/multi-user-dungeons/the-mud-as-system-architecture.md
  - operations/command/endeavor/records/analyses/tab-vs-qtops-source-read.md
  - operations/engineering/toys/tab
  - operations/engineering/toys/qtops
aliases:
  - Implement Zork and Rogue entirely through FARS API to prove the algebra
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

## The idea

Build minimal Zork (text adventure) and Rogue (dungeon crawl) that run entirely through the FARS API — respond() as the only computation, entities as rooms/objects/actors, predicates as state, settlement as game logic. No game engine. No special code. Just FARS.

## Why these two games

**Zork** proves: spatial navigation (rooms with exits), object interaction (take/drop/use), state mutation (doors open/close, inventory changes), natural language parsing (verb-noun commands). These are exactly what the operational game needs — "navigate the knowledge base," "take a task," "use a skill."

**Rogue** proves: procedural generation (rooms from templates), inventory management (items with properties), state machines (combat turns), quantitative mechanics (HP, damage, defense). These are exactly what the token economy needs — "generate quests from plans," "manage capability inventory," "resolve dispatch conflicts," "compute XP."

## What "entirely through FARS API" means

- Every room, object, actor, item is a markdown file with frontmatter
- Every game command is respond(entity, message): `respond(room, {action: "look"})`, `respond(player, {action: "take", object: "sword"})`
- Every state change is a new predicate settling into an entity's fiber
- The game world IS the EAVT graph
- The game logic IS the ⊙/⇒ algebra
- No code beyond the FARS-Core module and a thin CLI that sends messages and formats responses

## What this proves about FARS

If Zork and Rogue work on FARS, then FARS handles:
- Spatial relations (room exits = directed predicates = bypass structure)
- Inventory (containment = entity-within-entity)
- State machines (door open/closed = bilattice values on predicates)
- Procedural generation (template composition = ⊙ on room-type fibers)
- Quantitative mechanics (HP/damage = numerical predicates, combat = respond() on attacker×defender)
- Turn sequencing (the tick = each turn is σ∘Δ on the game state)

And if FARS handles all that, it handles the operational game — because the operational game IS Zork (navigate knowledge, interact with tasks) plus Rogue (manage inventory, resolve conflicts, level up).

## Connection to TAB/qtOps

We already have MUD engines. TAB's thing-model is `{name, behaviors, additive-attributes, grammar}`. qtOps's thing-model is a closure over a procedure hash. Both run Zork-like games. The question is: can FARS's predication algebra reproduce what TAB's merge-models and qtOps's quality-composition do? If yes, FARS subsumes them. If not, we learn what's missing.
