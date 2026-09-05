---
type: example
status: documented
instantiates: [application-sublocale, application-nucleus, sublocale-as-application]
---

# A MUD as an application sublocale

A multi-user dungeon (MUD) is a worked example of an [application sublocale](../objects/application-sublocale.md) running on a predicated computer. This file traces the sublocale structure: which predicates the MUD admits, which closure rules operate within the MUD's scope, and what the MUD's nucleus projects out of the underlying [predication-graph store](../objects/predication-graph-store.md).

## The MUD's predicate vocabulary

A MUD admits a small, focused set of predicates:

- `room` (entity is a room — has cardinal-direction exits, contains objects, holds players)
- `exit` (room ↔ room, with direction and conditions)
- `contains` (container holds object — bag holds sword, room holds chair, player holds inventory)
- `at` (player ↔ room — where the player currently is)
- `player` (entity is a player — has identity, inventory, stats)
- `npc` (entity is a non-player character — autonomous, with behaviors)
- `description` (entity has narrative text describing itself)
- `command` (player issues command — go-north, take-sword, look)

The MUD's $\Pi_{\mathcal{A}}$ is this set. Predications outside this vocabulary — task predicates, plan predicates, deployment predicates — do not appear in the MUD's projection of the predication graph; they exist in the underlying store but are not visible through the MUD's nucleus.

## The MUD's closure rules

A MUD admits closure rules specific to its mechanics:

- The `at` predicate's sub-rule: a player at room $r$ that issues a `go-north` command, when room $r$ has a `north` exit to room $r'$, has its `at` predication updated to $r'$. This is one closure rule in the closure-rule system, scoped to the MUD's nucleus.
- The `contains` predicate's sub-rule: when a player issues a `take` command on object $o$ in room $r$ where the player is at $r$, the predications `contains(room, o)` and `contains(player, o)` are updated by retraction-and-insertion. Per the [retraction discipline](../morphisms/retraction.md), this is a declared repair: the closure rule's recipe specifies the retraction-and-insertion sequence.
- The `description` predicate's read-rule: when a player issues `look`, the closure rule traverses the room's description, the room's contained objects' descriptions, and the room's exit descriptions to compose the response.

The MUD's $\mathcal{S}_{\mathcal{A}}$ is the subset of the substrate's full $\mathcal{S}$ that operates on this vocabulary. Closure rules in the substrate that do not pattern-match on MUD predicates do not run in the MUD's nucleus.

## The MUD's nucleus

The MUD's nucleus $j_{\mathcal{A}}$ projects out the MUD's vocabulary from the underlying [predication-graph store](../objects/predication-graph-store.md) and closes the projection under $\mathcal{S}_{\mathcal{A}}$. The nucleus's three properties:

- **Idempotence.** Applying the nucleus to its own output produces no further change.
- **Monotonicity.** A larger sub-store (with more predications in the MUD vocabulary) projects to a larger MUD-visible region.
- **Meet-preservation.** The intersection of two sub-stores' MUD projections equals the MUD projection of their intersection.

These three are what make the MUD's nucleus a nucleus and not just an arbitrary projection.

## What the MUD shares with other applications

A MUD running on the same [predicated computer](../objects/predicated-computer.md) as an ERP application shares the substrate, the [event log](../objects/event-log.md), the closure-rule system, and the underlying predication-graph store. It does not share predicate vocabulary (room and task are different predicates) or closure-rule subset (the room-traversal rule and the task-deadline rule are different rules).

The two applications interact only when their predicate vocabularies overlap — typically not at all for room and task, but possibly for shared concerns like player-as-employee or task-as-quest. When the vocabularies overlap, the intersection of the two nuclei is itself a nucleus, defining a third sublocale (the MUD-and-ERP-shared region) where the shared predicates live.

## Why this matters engineering-wise

The MUD is *not* a separate codebase. There is no MUD server process, no MUD database, no MUD-specific deployment. The MUD is a nucleus on the substrate. Adding a new room is inserting `room` predications into the predication graph. Adding a new exit is inserting `exit` predications. Adding a new mechanic (combat, weather, NPCs with behavior) is adding closure rules to the closure-rule system, scoped to the MUD's nucleus.

The engineering benefit is structural compositionality: when the underlying substrate has a [merge](../morphisms/merge.md) operator (CRDT-style), the MUD inherits multi-instance support automatically. Two players on two clients of the same MUD see consistent state because the substrate's merge is consistent. When the substrate has [federation](theories/agential-orchestration-platform/concepts/federation.md), the MUD inherits inter-server transit automatically. None of this is MUD-specific code; it is substrate-level discipline that the MUD's nucleus participates in.

The same pattern applies to ERPs, knowledge bases, publishing systems, and any other application this corpus characterizes. The pattern is general beyond MUDs.


