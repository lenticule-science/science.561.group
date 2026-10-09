---
description: "In concurrent game semantics, a receptive, innocent, symmetric prestrategy: an event structure mapped polarity-preservingly into an arena."
identity: strategy
name: Strategy
date-created: 2026-09-06
provenance:
  sources:
    - ../../../documents/articles/notes/2026/07/07/2026-07-07-note-on-gaming-arenas.md#definition-86-strategy
relations:
  uses:
    - arena
---
A strategy, in the concurrent-game account used here, is a receptive, innocent, symmetric prestrategy `σ : S → A`: an event structure `S` with a polarity-preserving map into an [arena](../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/arena.md). The source definition requires receptivity to legal Opponent moves, innocence about hidden history, and stability under the arena’s symmetry.

This differs from a simple function from positions to moves. A concurrent strategy can expose causal dependence, concurrency, and nondeterministic branching; its set of admitted plays is only an extensional trace of that event-structure account.

For a concurrent game model, strategy therefore has to preserve the arena interface and the causal structure that makes the behavior testable. The source paper’s result that arenas and strategies form a category is stated there as a theorem of its specified construction; its wider research-frontier claims remain targets, not settled equivalences.

Source: [Arenas, Plays, and Strategies: A Mathematical Account of Concurrent Games](../../documents/articles/notes/2026/07/07/2026-07-07-note-on-gaming-arenas.md), §§8–9 and §16.
