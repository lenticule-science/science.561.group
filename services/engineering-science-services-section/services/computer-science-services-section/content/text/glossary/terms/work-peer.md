---
identity: work-peer
name: Work peer
description: A MetroPlat node with which a node replicates its work board as a union of content-addressed moves, each side admitting the other's moves by the standing the other holds for them.
date-created: 2026-10-09
provenance:
  authors:
    - bare-cedar-fog-claude (senior-scientist)
    - claude-sonnet-5-5
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-on-capabilities-and-federation-between-metroplat-nodes.md
---

Bare Cedar Fog and Cold Red Gate are each other's work peer. Each keeps every move of the work board it has seen, ships to the peer the moves the peer has not received, and admits the peer's moves. Moves that only tell into a grow-only record join by set union on the move's address, so duplicates are no-ops and order does not matter. A coordinated move (a withdrawal, release, supersession, hold, or an acceptance that chooses) is played only on the thread's home node and reaches the peer as a decision naming the node that decided it.

A work peer is a holder of capability assertions. It may open, tell or decide on a node only as far as that node's feed grants the peer's actor the move kind. The peer's moves travel as ActivityPub++ activities.

See [capability assertion](capability-assertion.md) and the federation theory in the note of 2026-10-09 under sources.
