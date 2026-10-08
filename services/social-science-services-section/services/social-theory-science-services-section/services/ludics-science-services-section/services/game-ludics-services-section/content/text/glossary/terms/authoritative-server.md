---
name: "Authoritative Server"
description: "A network architecture in which a server holds the single correct copy of a multiplayer game's state and every client's view is a rendering of what the server reports, rather than a peer's own account of itself."
instance-of: concept
date-created: 2026-08-22
references:
  gambettaArchitecture:
    authors: ["Gabriel Gambetta"]
    title: "Client-Server Game Architecture"
    publication: "gabrielgambetta.com"
    year: "n.d."
  bernier2001:
    authors: ["Yahn W. Bernier"]
    title: "Latency Compensating Methods in Client/Server In-game Protocol Design and Optimization"
    publication: "GDC 2001 (Valve)"
    year: 2001
  bharambe2006:
    authors: ["Ashwin Bharambe", "Jeffrey Pang", "Srinivasan Seshan"]
    title: "Colyseus: A Distributed Architecture for Online Multiplayer Games"
    publication: "NSDI 2006"
    year: 2006
---

An authoritative server is a network architecture for real-time multiplayer games in which the server, not any client, holds the single correct copy of the game's state; every client's view is a rendering of what the server reports, and the server's decisions about position, damage, and outcome are final. Gabriel Gambetta's overview of client-server game architecture states the principle plainly: "the game state is managed by the server alone." The design's chief virtue is that it removes the client from the trust boundary — a client can misreport its own position or its own shots, but the server's account is what other players, and the scoring, actually use, which is why the architecture also functions as the industry's standard anti-cheat measure.

Yahn Bernier's 2001 Valve paper, the direct technical ancestor of Gambetta's series, describes the same authoritative-server model for Half-Life-engine multiplayer and its Quake3/UT-derived relatives. The cost of strict server authority is latency: if a client only acted on server-confirmed state, every input would wait a full round trip before the player saw anything happen, which reads as sluggish on any real network. Gambetta's overview names this cost as the reason three companion techniques exist to hide it while leaving server authority intact: client-side prediction, entity interpolation, and lag compensation. Server reconciliation is the mechanism that lets prediction and authority coexist without the two ever visibly diverging for long.

Ashwin Bharambe, Jeffrey Pang, and Srinivasan Seshan's Colyseus architecture generalizes the authoritative-server principle to a distributed setting, applying it per object rather than per world: "objects follow a single-copy consistency model — i.e., all updates to an object are serialized through exactly one primary copy," with the rest of the system built around replicating from that primary outward under interest management. Deterministic lockstep rejects the authoritative-server model outright — no peer's state is privileged, and correctness is enforced by making every peer compute an identical result from an identical input stream, rather than by naming one copy authoritative and correcting the rest toward it.
