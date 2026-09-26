---

title: MUD Session
kind: structure
layer: program
uses: []
produces: []
used_by:
  - program/mud-server/operator/accept-connection
  - program/mud-server/operator/parse-command
  - program/mud-server/operator/execute-command
derives-from: computer/structure/computer-evaluation-state
produced-by:
  - program/mud-server/operator/accept-connection
  - program/mud-server/operator/execute-command
description: Program-level session carrier mapping a connected client to its evaluation context within the MUD world.
name: mud-session
derived_from: computer/structure/computer-evaluation-state
produced_by:
  - program/mud-server/operator/accept-connection
  - program/mud-server/operator/execute-command
status: someday
---

Program-level session carrier mapping a connected client to its evaluation
context within the MUD world.

## Definition
- Carrier: projection of [Computer Evaluation State](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/computer-evaluation-state.md)
  scoped to a player/NPC session (current room, bindings to player entity, ready
  queue for pending actions).
- Fields: player identity, connection handle (abstracted endpoint), current
  room reference, pending command queue, last failure (if any).
- Purpose: bind client I/O to evaluation steps and world updates.

## Invariants
- Isolation: session commands execute with player-scoped bindings; world
  mutations go through execute-command.
- Ordering: commands queued per session preserve arrival order; global ordering
  is enforced by the evaluation state.
- Failure visibility: last failure slot mirrors computer failure; no mutation
  on failure.

## Proof
- Derived from: [Computer Evaluation State](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/computer-evaluation-state.md).
- Shows that: specialising evaluation state per session yields a safe carrier
  for interactive play, preserving kernel scheduling/ordering.
