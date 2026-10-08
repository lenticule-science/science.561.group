---
title: "MUD and interactive-computation corpus reconciliation"
date-created: 2026-08-18
type: note
status: canonical-summary
sources:
  - "2026-06-20-relational-predication-corpus/windows-archive-2026-08-17-unique/_archive/bucket-4/.../interactive-computation"
description: The recovered MUD material belongs with the existing multi-user-dungeons service.
---


The recovered MUD material belongs with the existing multi-user-dungeons
service. Its useful common claim is that a MUD is not merely a chat protocol or
a collection of rooms: it is an interactive computation whose world state,
command language, social messaging, and extensible library form one running
system.

## Canonical synthesis

- **World building is programming.** A world description is an executable model:
  rooms, objects, actors, rules, and transitions expose a state space for
  players and agents to explore.
- **Messaging is part of the state machine.** Discworld-style messaging drafts
  distinguish local description, directed communication, and broadcast or
  administrative channels. The distinction matters for authority, persistence,
  and replay.
- **Libraries are the extension boundary.** A MUD library is a reusable set of
  verbs, objects, permissions, and persistence conventions, not simply a
  directory of prose. This is why LP-MUD material is a useful comparative case
  for service-oriented world design.
- **Interactive computation is the umbrella concept.** The MUD is a concrete
  instance of a computation whose next state depends on participant actions,
  world rules, and accumulated state; game design and systems architecture meet
  at that boundary.

The source files include overlapping `mud`, `lpmud`, `world-building-as-
programming`, `mud-libraries`, and messaging documents. Existing glossary topics
remain canonical; this note gathers their shared architecture and leaves the
historical variants available for later source comparison.
