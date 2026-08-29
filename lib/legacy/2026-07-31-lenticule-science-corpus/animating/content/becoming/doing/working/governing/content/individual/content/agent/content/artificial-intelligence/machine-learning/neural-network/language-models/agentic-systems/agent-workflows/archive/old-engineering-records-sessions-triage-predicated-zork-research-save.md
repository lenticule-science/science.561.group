---
name: predicated-zork-research-save
introduces: session-save
session-id: 8605f87a
date: 2026-04-06
label: predicated-zork-computed-edges
branch: main
plan: predicated-zork-computed-edges
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---


## What WORKED

- **Two-level fiber structure**: Fibers are now `Map<Predicate, Map<Object, BilValue>>` — proper ⟨S,P,O⟩→v triples per the paper. `fget(fiber, pred, obj)`, `fset(fiber, pred, obj, val)`, `fpairs(fiber, pred)` API. Flatten/unflatten at the respondFiber boundary. 20/20 tests pass.
  - File: `operations/science/research/predicated-zork/algebraic-engine.js`

- **Edges as first-class entities**: Each edge is an entity with proper SPO triples (trigger-subject, trigger-predicate, trigger-object, trigger-value, target-subject, target-predicate, assert-object, deny-object, active). Edge index built in initWorld for efficient lookup. 20/20 tests pass.

- **Navigation via send() + room edges**: `send(room, {go-direction: north → T})` fires room's navigation edge entities, which call respondFiber on the player to change location. Meta-edges on kitchen-window create navigation edges when window opens. Transient predicates cycle T→F via the algebra (no fdel hack).

- **contains: via respondFiber**: Location changes propagate contains: to containers through respondFiber, not direct fset. All mutations go through the algebra.

- **Type-directed dispatch**: Type entities (type-room, type-object, type-container, type-actor) declare on-{verb} response patterns. Verb entities declare action and assert-* predicates. The act() switch dispatches on type × verb composition. 20/20 tests pass.

- **Verb asserts as proper triples**: `⟨verb-open, assert-state, open⟩ → T` — the predicate is "assert-state", the object is "open". No colon-splitting.

- **Bug found via audit**: Taking objects from containers was denying location:room instead of location:container. Fixed: reads object's actual current location via floc().

## What Did NOT Work

- **fdel() for transient go-direction**: Tried deleting go-direction from room fiber after navigation. Wrong — the algebra handles transients via the T→F cycle. ∨_k(T, F) = ⊤ → ⊙(⊤, F) = F. Reset by sending F, not deleting.

- **Storing F as initial world data**: Blocked exits were `⟨room, exit-east, "boarded"⟩ → F`. Captain corrected: "door boarded is true" is more sensible than "door unboarded is false." The world at rest should be all T and ⊥. F emerges when entities DEFEND their constraints during settlement, not from pre-stored negation.

- **act() as "algebraic dispatch"**: Replacing 4 behavior ifs with a 5-case switch was claimed as algebraic but was still JS orchestration. The actual move is: eliminate act() entirely, make the player a full actor, inject commands as predicates.

- **Claiming contains: propagation was algebraic when it was direct fset()**: Audit caught this. Fixed to use respondFiber. Honest about what IS vs ISN'T algebra.

## What Has NOT Been Tried

- **Computed edges** (the next plan): Edges that resolve target-subject and message-object from the trigger entity's fiber at fire time. `resolve-target-from: location` means "send to wherever my location predicate points." This is what makes the player a real actor. Plan written at `operations/command/endeavor/records/plans/predicated-zork-computed-edges.md`.

- **EAVT format**: The zork world is in a homebrewed JSON format. Should be standard EAVT `[entity, attribute, value]` like the knowledge graph. All T-valued at rest.

- **Mutual exclusion constraints**: Entities that declare "open and closed can't both be T." When one becomes T, the constraint contests the other via the algebra.

- **Conditional edges (requires predicate)**: Edges that only fire if the trigger entity has a specific other predicate as T. Needed for: boarded door defends against open attempt only if state-boarded is T.

- **Recursive send() for edge cascading**: Currently edge effects use respondFiber directly (don't trigger further edges). Should use send() recursively with depth limit for tick-to-fixpoint.

- **Eliminating act()**: The game loop should be parse → send(player, commands) → tick → assembleResponse → print. Plan written but not implemented.

## Current Work Status

**algebraic-engine.js** (uncommitted): Full rewrite with two-level fibers, edge entities, navigation via send()+edges, contains: via respondFiber, type-directed dispatch, verb asserts as proper triples. 20/20 tests pass. ~720 lines.

**Plan written**: `operations/command/endeavor/records/plans/predicated-zork-computed-edges.md` — 8 steps across 4 phases (Phase 0: EAVT format, Phase 1: computed edges, Phase 2: player as actor, Phase 3: game loop rewrite, Phase 4: verify). All 4 open questions resolved in the plan file.

**Key design insight captured in plan**: The world at rest is all T and ⊥. F emerges when entities defend constraints during settlement. Verbs assert only positives. Entities contest via edges. "The door is boarded" is T; the door's self-edge denies the open attempt, producing F through the algebra.

**Uncommitted files**:
- `operations/science/research/predicated-zork/algebraic-engine.js` (major rewrite)
- `operations/command/endeavor/records/plans/predicated-zork-computed-edges.md` (new plan)

## Exact Next Step

Phase 0 of the plan: Rewrite `operations/science/research/predicated-zork/zil-to-json.js` to produce EAVT format `{attrs: {id: name}, eavt: [[e, a, v], ...]}` — all T-valued, positive facts only. Blocked exits become `exit-east-blocked:reason` instead of `exit-east:reason → F`. Then rewrite `loadWorld()` in algebraic-engine.js to consume EAVT.

## WHAT NOT TO RETRY

- **Storing F as initial data**: The world at rest is T and ⊥. F emerges from settlement (entities defending constraints). Don't encode blocked exits as F-valued triples.
- **fdel() for transient predicates**: Use the T→F cycle via send(). The algebra handles it natively.
- **Direct fset() for cross-entity updates**: Always use respondFiber or send(). Every mutation goes through the algebra.
- **Colon-joining predicate and object**: Use the two-level fiber structure. `fset(fiber, pred, obj, val)` not `fiber.set(pred + ":" + obj, val)`.
- **Encoding edge instructions as fake predicates**: `"edge:go-direction:north:t:player:location:kitchen"` is not an SPO triple. Edges are entities with proper triples.
- **Claiming JS orchestration is "algebraic"**: The act() switch, the edge index, the type resolution — these are JS selecting targets. The algebra computes state changes. Be honest about the boundary.
- **Homebrewed JSON format**: Use EAVT like the rest of the system.

## Required Files

```
operations/science/research/predicated-zork/algebraic-engine.js
operations/science/research/predicated-zork/test-algebraic.js
operations/science/research/predicated-zork/play.js
operations/science/research/predicated-zork/zork-world-generated.json
operations/science/research/predicated-zork/zil-to-json.js
operations/command/endeavor/records/plans/predicated-zork-computed-edges.md
operations/command/endeavor/records/analyses/entity-as-actor-settlement-as-computation.md
operations/engineering/systems/fars/respond.js
operations/engineering/systems/fars/predication.js
library/theories/science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md
```
