---
name: 824a5c4c-save
introduces: session-save
session-id: 824a5c4c
date: 2026-04-06
label: predicated-zork-breakthrough
branch: main
plan: predicated-zork-algebraic
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: 824a5c4c-save
date-created: 2026-04-06
description: "Start pz-alg-navigation: extend algebraic-engine.js to handle room movement."
---


## What WORKED

### Rule engine (Ceptre-style linear rules)
- ZIL parser (`zil-to-json.js`) correctly extracts 110 rooms, 140 objects from Zork I source. Fixed two bugs: `flag-` prefix on all flags (should only be on room-structural), and blocked exits being skipped instead of emitted with value `f`.
- Rule schema (`rule-schema.json`) with priority-based dispatch, `consume: true/false` for linear vs persistent predicates, `_is` meta-predicate for entity identity checks, and `$prso/$here/$player` variable references.
- 72 rules total (49 generic verbs in `zork-verbs.json`, 23 object-specific in `zork-object-rules.json`).
- Engine (`engine.js`) with accessibility fallback for taking from open containers. Key fix: the fallback only triggers for `location = $here-id` checks, NOT `location = $player-id` checks (otherwise "already carried" false-positives).
- CLI (`play.js`) with synonym resolution, direction shortcuts, preposition splitting.
- 20/20 regression tests pass (`test-opening.js`): look, open mailbox, take leaflet, read, inventory, navigation, blocked exits.

### Algebraic engine (the breakthrough)
- **The algebra itself computes state transitions.** No rules needed. Verified on open/close mailbox, take/drop objects, open/close window.
- **The two-phase cycle**: ∨_k (knowledge join) introduces ⊤ where entity and message disagree. ⊙ (extend) resolves ⊤ using message evidence. This is σ∘Δ.
- **Key properties that make it work**: f absorbs under ⊙ (settled denials resist change), ⊤ is identity for ⊙ (contested values accept resolution), t ∨_k t = t (agreement = no change = idempotence for free).
- Verbs are fibers: open = `{state:open: t, state:closed: f}`. Entity behavior is in the entity's fiber, not external rules.
- Written up as a library text: `library/theories/science/theories/information/texts/state-change-as-passage-through-contestation.md`.

### Research grounding
- Chris Martens (Northeastern, CMU PhD 2015) built Ceptre — a linear logic programming language for interactive fiction. Validates rule-based approach.
- Abramsky 1993 proves Curry-Howard for linear logic: proofs ARE interactive programs.
- Hyland-Ong 2000: game semantics fully models PCF (Turing-complete).
- Library text: `linear-logic-as-interactive-computation.md` documents the chain from bilattice algebra → linear logic → interactive programs → working game engines.
- Research note: `linear-logic-as-zork-engine.md` maps every ZIL construct to predication.

## What Did NOT Work

### respond.js's original algorithm
- `(entity ⊙ message) ⇒ entity` flattens everything to `t` because self-implication (a ⇒ a) is always `t` for definite values. This is a QUERY (does the composed state imply the entity?) not a STATE CHANGE. The restrict step is wrong for interactive computation — it's the right operation for testing consistency, not for producing state transitions. Don't re-attempt this framing.

### Direct ⊙ composition without ∨_k
- f ⊙ t = f (Proposition 2: f absorbs). A message asserting t cannot override an entity's f via ⊙ alone. You MUST go through ∨_k first to introduce ⊤, then ⊙ resolves the ⊤. The two-phase cycle is mandatory.

### Worktree isolation for agents writing files
- First dispatch (ZIL parser) used `isolation: "worktree"`. The agent wrote the code and validated it, but the worktree was cleaned up and the file didn't make it back to main. Had to re-dispatch without worktree. Use worktree only when you don't need the files to land in main.

## What Has NOT Been Tried

### Algebraic engine: room navigation
- Player movement needs the engine to read room exit propositions to construct the go-verb fiber dynamically. Not attempted — deferred to `pz-alg-navigation` task.

### Algebraic engine: cross-entity cascades
- Opening kitchen window should propagate to east-of-house and kitchen room entities. Needs: after settling an entity, check if state transitions should cascade as messages to connected entities. This is the tick. Deferred to `pz-alg-cascades`.

### Algebraic engine: perception via iterated ⊙
- Look = compose room fiber with all visible object fibers. Might work via iterated ⊙. Not attempted. Deferred to `pz-alg-perception`.

### Rule engine: beyond opening area
- Combat, thief, darkness, scoring, maze, all remaining puzzles. 11 tasks created in `predicated-zork-algebraic` plan. Mostly mechanical ZIL translation.

### Full winning playthrough test
- Need a complete walkthrough command sequence with expected outputs. Not written yet.

## Current Work Status

### Committed: nothing yet
All work is uncommitted. Git status shows many modified and untracked files.

### Files created this session
- `operations/engineering/fars/src/zork1/` — cloned Zork I MIT source
- `operations/science/research/predicated-zork/` — research workspace:
  - `_index.md` — directory index
  - `zil-to-json.js` — ZIL parser (working, produces valid JSON)
  - `zork-world.json` — hand-translated opening area (test oracle, superseded by generated)
  - `zork-world-generated.json` — 250 entities, 12K lines (from parser)
  - `rule-schema.json` — linear rule schema with 12 example rules
  - `zork-verbs.json` — 49 generic verb rules
  - `zork-object-rules.json` — 23 object-specific rules
  - `engine.js` — rule engine (20/20 tests pass)
  - `play.js` — interactive CLI
  - `test-opening.js` — regression test (20/20 pass)
  - `algebraic-engine.js` — pure ∨_k/⊙ engine (the breakthrough)
  - `translation-notes.md` — mapping decisions and rule schema documentation
  - `linear-logic-as-zork-engine.md` — research: ZIL constructs → predication
  - `algebraic-vs-rule-engine.md` — comparison of the two engines
- `library/theories/science/theories/math/theories/logic/texts/linear-logic-as-interactive-computation.md` — survey text
- `library/theories/science/theories/information/texts/state-change-as-passage-through-contestation.md` — the key paper
- `operations/command/endeavor/records/projects/predicated-zork-project.md` — project record
- `operations/command/endeavor/records/plans/predicated-zork-translation.md` — plan 1 (complete)
- `operations/command/endeavor/records/plans/predicated-zork-algebraic.md` — plan 2 (active)
- 20 task files in `operations/command/endeavor/records/tasks/pz-*.md`
- `operations/command/ideas/zork-and-rogue-on-fars.md` — updated status
- `operations/command/ideas/predication-world-sim.md` — fixed relationship (extends, not supersedes)

### Task status
Plan 1 (predicated-zork-translation): ALL 9 TASKS COMPLETE.
Plan 2 (predicated-zork-algebraic): 11 tasks, all open.

## Exact Next Step

Start `pz-alg-navigation`: extend `algebraic-engine.js` to handle room movement. The go-verb fiber needs to be constructed DYNAMICALLY from the current room's exit propositions:

1. Read player's `location` proposition to find current room
2. Read current room's `exit-{direction}` propositions
3. If exit exists with value `t`, construct verb fiber: `{location:$current-room = f, location:$destination = t}`
4. Run ∨_k/⊙ cycle on the player entity
5. After settling, run perception on the new room

Start by adding a `go(world, playerEntity, direction)` function to `algebraic-engine.js` that reads room exits and constructs the verb fiber. Test with the west-of-house → north-of-house → path circuit.

## WHAT NOT TO RETRY

- **Do NOT use `(entity ⊙ message) ⇒ entity` as the respond computation.** It flattens everything to t via self-implication. The correct cycle is ∨_k then ⊙.
- **Do NOT try to override f via ⊙ alone.** f is absorbing (Proposition 2). State change REQUIRES passage through ⊤ via ∨_k.
- **Do NOT dispatch agents with `isolation: "worktree"` when you need files to land in main.** The worktree gets cleaned up and changes are lost.
- **Do NOT assume entity IDs match ZIL object names literally.** The ZIL `ADVERTISEMENT` object is the entity `advertisement`, but players call it "leaflet" (a synonym). The CLI's synonym resolution handles this, but the engine tests must use entity IDs, not display names.
- **Do NOT add `flag-` prefix to all FLAG_MAP entries in zil-to-json.js.** Only ONBIT→flag-lit, RLANDBIT→flag-land, SACREDBIT→flag-sacred have the prefix. All others (TAKEBIT→takeable, DOORBIT→door, etc.) do not.

## Required Files

```
operations/science/research/predicated-zork/algebraic-engine.js
operations/science/research/predicated-zork/engine.js
operations/science/research/predicated-zork/rule-schema.json
operations/science/research/predicated-zork/zork-verbs.json
operations/science/research/predicated-zork/zork-object-rules.json
operations/science/research/predicated-zork/zork-world-generated.json
operations/science/research/predicated-zork/test-opening.js
operations/engineering/fars/agentic/tools/predication.js
operations/command/endeavor/records/plans/predicated-zork-algebraic.md
library/theories/science/theories/information/texts/state-change-as-passage-through-contestation.md
```
