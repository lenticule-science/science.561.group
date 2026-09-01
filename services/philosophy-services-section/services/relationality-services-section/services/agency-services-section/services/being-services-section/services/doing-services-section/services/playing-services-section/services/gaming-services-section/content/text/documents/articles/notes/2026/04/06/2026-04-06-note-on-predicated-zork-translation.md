---
title: Predicated Zork Translation
description: Implementation plan for representing Zork's action routines as linear logic rules with persistence tracking and cross-fiber state queries.
date-created: 2026-04-06
type: note
name: predicated-zork-translation
keywords:
  - linear-logic
  - zork-translation
  - predicated-rules
  - action-routines
  - state-persistence
  - cross-fiber-queries
specialization: plan
application: world-sim
project: predicated-zork-project
work-type: procedure
horizon: month
owner: first-officer
priority: "2"
depends-on: []
---

## User prompt (2026-04-06)

> So let's make a new project based on that zork idea and then start developing it into plans, etc. not based on our wild weird ideas but just, iunno, can you grab zork's source code and put it in ops/eng/src/ and then legit just... we do ops/sci/research/predicated-zork/ and try and write, iunno, maybe a JSON file that has the "source" as predication that our systems/fars can work with?

## Context

Zork I ZIL source is at `operations/engineering/fars/src/zork1/` (MIT, historicalsource/zork1). Research now preserved in `lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-04-06-predicated-zork/triage/` established:

- The ⊙/⇒ algebra IS linear logic (Jakl 2025 via Chu construction)
- Linear logic is computationally universal for interactive systems (Abramsky 1993, Hyland-Ong 2000)
- Martens (2015, CMU/Northeastern) built Ceptre, a working interactive fiction engine on linear logic
- ZIL action routines map systematically to linear rules: preconditions consumed → postconditions produced

See `linear-logic-as-interactive-computation.md` (library) and `linear-logic-as-zork-engine.md` (research).

## Source inventory

| File | Contents | Size |
|------|----------|------|
| `1dungeon.zil` | 110 rooms, 120 objects | 2660 lines |
| `1actions.zil` | 186 object-specific action routines | 4177 lines |
| `gverbs.zil` | 189 generic verb handlers + helpers | 2216 lines |
| `gsyntax.zil` | 267 verb/syntax definitions | 561 lines |
| `gparser.zil` | NL parser | 1407 lines |
| `gglobals.zil` | 18 global objects, game state | 308 lines |
| `gmain.zil` | game loop, scoring | 313 lines |
| `gclock.zil` | timed events (3 routines) | 60 lines |

## Design decisions

**Rule format** (Ceptre-influenced): Each rule is `{ preconditions: [...], postconditions: [...], response: "text" }` where preconditions are consumed and postconditions are produced. Preconditions and postconditions are `[entity, predicate, value]` triples.

**Linear vs persistent**: Predicates have a `persistence` flag. `"!"` means persistent (room exits, descriptions — survive consumption). Unmarked means linear (object locations, door states — consumed by use).

**Cross-fiber queries**: When a rule's precondition references another entity's state, the engine resolves it by reading that entity's fiber. This is a read, not a consumption — the other entity's state is unchanged unless the rule explicitly includes it in postconditions.

## Scope

Opening area first (west of house through cellar), then expand. The full game has ~60 puzzles; we target the first 5-10 (mailbox, window, trap door, troll) to prove the pattern, then the rest is mechanical translation.
