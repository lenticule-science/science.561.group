---
title: "Linear logic as a Zork engine — how ⊙/⇒ handles what ZIL routines do"
project: predicated-zork-project
date-created: 2026-04-06
grounded-in:
  - library/domains/science/domains/math/domains/logic/texts/linear-logic-as-interactive-computation.md
  - library/domains/science/domains/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md
source-citations:
  - "Martens 2015 — Programming Interactive Worlds with Linear Logic (CMU dissertation)"
  - "Abramsky 1993 — Computational Interpretations of Linear Logic"
aliases:
  - linear-logic-as-zork-engine
description: "ZIL action routines are imperative: they check flags with COND, flip state with FSET/FCLEAR, branch on verb type, and produce text output."
---

## The question

ZIL action routines are imperative: they check flags with COND, flip state with FSET/FCLEAR, branch on verb type, and produce text output. Can the ⊙/⇒ algebra on bilattice-valued fibers reproduce this behavior without imperative code?

## The answer

Yes. This is a known result. Martens (2015) built Ceptre, a linear logic programming language that runs interactive fiction, combat games, and social simulations. The translation from imperative game logic to linear logic rules is systematic. Our algebra IS linear logic (via the Chu construction, Jakl 2025), so everything Ceptre can do, we can do on fibers.

## How ZIL constructs map to predication

### COND (conditional branching) → fiber composition filtering

ZIL:
```
<ROUTINE KITCHEN-WINDOW-F ()
  <COND (<VERB? OPEN>
         <COND (<FSET? ,KITCHEN-WINDOW ,OPENBIT>
                <TELL "It is already open.">)
               (T <OPEN-CLOSE ...>)>)>>
```

Predication: The message `{action: "open", target: "kitchen-window"}` composes with kitchen-window's fiber via ⊙. If `["open", true, "t"]` is already in the fiber, then extending by `{action: "open"}` produces a response where the "already-open" response predicate is `t`. If `["open", false, "_"]`, the extension produces the "now-opening" response.

The branching is not imperative — it falls out of which predicates compose to `t` vs `f` vs `⊥` vs `⊤`. The bilattice value IS the branch condition.

### FSET / FCLEAR (state mutation) → linear resource consumption

ZIL: `<FSET ,KITCHEN-WINDOW ,OPENBIT>` sets the open flag.

In linear logic terms (Martens 2015): the rule `window_state(closed), action(open, window) -o window_state(open)` consumes the closed state and produces the open state. The old proposition is gone — linear logic's resource sensitivity ensures the state is updated, not duplicated.

In our terms: respond() over the window entity with message `{action: "open"}` produces a settlement where `["open", false, "_"]` is replaced by `["open", true, "t"]`. The tick writes the new fiber. The old predicate is consumed by the composition.

### Verb dispatch → message channel matching

ZIL: `<VERB? OPEN>` checks which verb was parsed.

Predication: The message carries `{action: "open"}`. The entity's fiber has `["responds-to", "open", "t"]`. Composition via ⊙ between the message's action predicate and the entity's responds-to predicate yields `t` when they match, `⊥` when they don't. Verb dispatch IS fiber composition filtering.

### Text output → response fiber content

ZIL: `<TELL "You are standing in an open field west of a white house.">` prints text.

Predication: The entity's fiber includes `["description-long", "You are standing in...", "t"]`. When respond(entity, {action: "look"}) composes the look-action with the entity's fiber, the description predicates compose to `t` and are included in the response. The text is not "printed" — it is the `t`-valued content of the response fiber.

### Conditional exits → gated predicates

ZIL: `(WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN)` — an exit conditional on another entity's state.

Predication: The room's fiber has `["exit-west", "kitchen", "_"]` — unknown/conditional. The condition is a composition: respond(east-of-house, {query: "exit-west"}) must compose east-of-house's exit predicate with kitchen-window's open predicate. If the window is open (`["open", true, "t"]`), the composition yields `t` for exit-west. If closed, it stays `_` (no information — the exit doesn't resolve).

This is where the ⇒ (restrict) operation earns its keep. Restricting the conditional exit by the window's state tests whether the exit's condition is satisfied: `exit ⇒ condition`. If the condition is `t`, restriction yields `t` (the exit holds). If `_`, restriction yields `⊥ ⇒ _ = t` — wait. This needs care.

**Open design question:** The exact mechanics of conditional predicates need formal specification. The algebra handles binary composition well, but gating one entity's predicate on another entity's state requires cross-fiber composition — respond(room, {query: exit}) must reach into the window entity's fiber to check state. This might be:
1. A pre-composition step where the room's fiber is enriched with referenced entities' states before the main composition
2. An iterated respond() where the first call identifies the condition, a second call resolves it, and a third composes the result
3. A settlement cascade where the tick resolves all cross-references before the player's response is computed

### Inventory (containment) → nested fibers

ZIL: Objects have `(IN container)` — a containment tree.

Predication: Containment is `["contains", "object-id", "t"]`. The player's perception of what's "here" is the composition of the room's fiber (which contains object references) with each contained object's fiber. Taking an object moves the containment predicate: the room loses `["contains", "sword", "t"]`, the player gains `["carrying", "sword", "t"]`. Both changes are linear — the sword can't be in two places.

### The ! modality → persistent state

Some Zork state is persistent and reusable: the player's score, the game's WON-FLAG, the maximum score. In linear logic, the $!$ modality marks propositions as reusable — they survive consumption. In our terms: predicates marked as persistent (or structural) are not consumed by composition. They're available every turn.

The distinction: the sword's location is linear (it moves when taken). The player's score is persistent (checking it doesn't consume it). The door's state is linear (opening it changes the state). The room's exits are persistent (traversing north doesn't remove the north exit).

## What we need to build

1. **A rule format** — Each ZIL action routine becomes one or more linear rules in the style of Ceptre: preconditions (consumed predicates) → postconditions (produced predicates). Store these alongside entity definitions in the JSON.

2. **A rule engine** — Given a game state (multiset of predicates) and an action (rule to apply), consume preconditions, produce postconditions, return the new state. This IS respond() with state mutation.

3. **Cross-fiber composition** — Mechanism for one entity's respond() to query another entity's fiber. Needed for conditional exits, line-of-sight, and any interaction between entities.

4. **The ! modality** — Distinguish linear predicates (consumed by use) from persistent predicates (survive composition). Rooms' structural properties are persistent. Object locations and states are linear.

## What we should read next

- Martens 2015, chapters 3–5: the Ceptre language design, its operational semantics, and the case studies (especially the dungeon crawler example)
- Abramsky 1993, section 4: the CHAM interpretation of classical linear logic — this is the concurrent process model
- Our own respond.js: it already does fiber composition, but doesn't yet handle state mutation (linear consumption) or cross-fiber queries
