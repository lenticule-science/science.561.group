---

title: Relational MUD Server Program
kind: structure
layer: program
uses: []
produces: []
used_by:
  - program/mud-server/operator/accept-connection
  - program/mud-server/operator/parse-command
  - program/mud-server/operator/execute-command
  - program/mud-server/operator/persist-world
derives-from: computer/structure/computer-kernel
produced-by:
  - computer/structure/computer-kernel
description: Program-level packaging of the kernel into a runnable multi-user dungeon server.
name: mud-server-program
derived_from: computer/structure/computer-kernel
produced_by:
  - computer/structure/computer-kernel
status: someday
---

Program-level packaging of the kernel into a runnable multi-user dungeon
server. It wires computer-layer carriers and operators into a persistent,
multi-session world with telnet-like I/O.

## Definition
- Scope: single shard/world served over line-oriented clients (telnet/WebSocket
  frontends map onto the same session carrier).
- Carriers: uses program-level structures
  ([MUD World State](mud-world-state.md), [MUD Session](mud-session.md),
  [MUD Command](mud-command.md), [MUD Transcript](mud-transcript.md)) derived
  from computer carriers.
- Operators: composes program operators
  ([Accept Connection](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/accept-connection.md),
  [Parse Command](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/parse-command.md),
  [Execute Command](../operator/execute-command.md),
  [Persist World](../operator/persist-world.md)) which refine the computer API.
- Runbook: a [Computer Wiring Plan](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/computer-wiring-plan.md)
  wired to expose network ingress, command parsing/execution, and persistence
  over the computer kernel.

## Invariants
- All state transitions flow through computer operators; no bypass of machine
  semantics.
- Sessions are isolated; shared world updates respect the evaluation/trace
  ordering earned in the computer layer.
- Persistence uses computer snapshots; crash recovery replays from the last
  persisted snapshot plus transcripts.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: instantiating the computer kernel with MUD-specific carriers and
  operators yields an implementable server without extending the kernel.
