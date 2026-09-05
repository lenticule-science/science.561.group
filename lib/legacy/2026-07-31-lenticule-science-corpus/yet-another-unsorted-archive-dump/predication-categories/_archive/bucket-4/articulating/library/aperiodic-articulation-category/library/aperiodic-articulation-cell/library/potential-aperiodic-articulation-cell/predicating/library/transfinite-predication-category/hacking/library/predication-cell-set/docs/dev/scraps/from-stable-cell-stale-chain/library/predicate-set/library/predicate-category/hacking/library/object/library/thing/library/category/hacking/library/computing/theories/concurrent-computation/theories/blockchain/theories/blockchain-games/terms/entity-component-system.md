---
name: Entity Component System
description: "An architectural pattern in game development that separates data (components) from behavior (systems), using composition over inheritance. Applied to blockchains in MUD for fully on-chain games."
date-created: 2026-04-05
domain: blockchain-games
aliases:
  - ECS
subjects:
  - game-architecture
  - design-patterns
  - composition
sources:
  - title: "Entity component system - Wikipedia"
    url: "https://en.wikipedia.org/wiki/Entity_component_system"
  - title: "ECS Pattern in Game Development - Game Programming Patterns"
    url: "https://gameprogrammingpatterns.com/"
  - title: "Unleashing the Potential of Onchain Web3 Gaming: Exploring MUD Framework"
    url: "https://medium.com/coinmonks/unleashing-the-potential-of-onchain-web3-gaming-exploring-mud-framework-1dadb57dbdad"
---

An Entity Component System (ECS) is a software architecture for games and simulations where:

- **Entities** are containers (typically just unique identifiers) with no inherent properties
- **Components** are data attached to entities (e.g., Position, Health, Velocity)
- **Systems** are functions that operate on entities with specific components (e.g., MovementSystem reads Position and Velocity, writes new Position)

ECS uses composition over inheritance: instead of defining a class hierarchy (Player < Creature < Entity), every entity is just an ID, and behavior emerges from the set of components attached to it.

## Core Principle

Traditional OOP game design creates type hierarchies:

```
Entity
  ├── Creature
  │   ├── Monster
  │   └── Player
  └── Item
      ├── Weapon
      └── Armor
```

This creates problems: a player might be able to polymorph into a monster; a monster might pick up a weapon. The hierarchy becomes brittle.

ECS inverts this: instead of asking "what is this thing?", ask "what components does it have?"

```
Entity 1: {Position, Health, Inventory, PlayerControl}
Entity 2: {Position, Health, MonsterAI}
Entity 3: {Position, Weapon}
```

A system that heals checks for the Health component; it doesn't care whether the entity is a Player or Monster. A system that applies AI only runs on entities with MonsterAI.

## Benefits

1. **Flexibility** — Add or remove capabilities by adding/removing components. No special classes needed.
2. **Performance** — In traditional game engines, components are laid out contiguously in memory (cache-friendly). Systems iterate only over entities with relevant components.
3. **Modularity** — Systems are independent. A new system can be added without modifying existing code.
4. **Testability** — Systems are pure functions (given components, produce components). Easy to unit test.

## ECS in Traditional Game Engines

ECS is standard in modern game development:

- **Bevy** (Rust) — ECS-first engine
- **Unity DOTS** — Data-Oriented Technology Stack, ECS for high-performance games
- **Unreal Engine** — Entity Subsystem framework uses ECS principles
- **Godot** — Node-based scene system is ECS-adjacent

## ECS on Blockchains

MUD applies ECS to Solidity smart contracts. Instead of the engine managing entity-component data, smart contracts do:

- **Entities** are keys in tables (e.g., player address)
- **Components** are table columns (e.g., Position, Health stored in separate tables)
- **Systems** are smart contracts that read and write to tables

The pattern is the same, but implementation differs because:

- Blockchain storage is permanent and costly (gas), not volatile
- Access is mediated by the World contract and access control rules
- All state is public and cryptographically verifiable

This allows games to be fully on-chain: all state is stored in smart contracts, all logic is encoded in Systems, and the world persists indefinitely regardless of client or server status.

---

## See Also

- [MUD Framework Architecture](../texts/mud-framework-architecture.md) — ECS applied to blockchain
- [Autonomous Worlds](../texts/autonomous-worlds-concept.md) — games built on ECS architectures
