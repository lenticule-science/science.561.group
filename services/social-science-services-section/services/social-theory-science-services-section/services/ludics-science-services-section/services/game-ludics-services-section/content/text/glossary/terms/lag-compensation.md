---
name: "Lag Compensation"
description: "The server-side technique of rewinding the authoritative world state backward to the exact instant a player's action was issued, adjudicating that action against the historical state, then restoring current positions, to compensate for the fact that a player aims at what they see, which is already stale by their round-trip latency."
instance-of: concept
date-created: 2026-08-22
references:
  bernier2001:
    authors: ["Yahn W. Bernier"]
    title: "Latency Compensating Methods in Client/Server In-game Protocol Design and Optimization"
    publication: "GDC 2001 (Valve)"
    year: 2001
  gambettaArchitecture:
    authors: ["Gabriel Gambetta"]
    title: "Client-Server Game Architecture"
    publication: "gabrielgambetta.com"
    year: "n.d."
---

Lag compensation is the technique, documented as the primary industry account by Yahn Bernier's 2001 Valve paper, by which a server rewinds its own authoritative world state backward in time to the exact instant a player issued an action — canonically, firing a shot — adjudicates that action against the historical state, and then restores current positions before continuing. Bernier's own phrase for the procedure is exact: lag compensation is "a step back in time, on the server, and looking at the state of the world at the exact instant that the user performed some action." Concretely, on receiving a fire command the server moves other players backward to the positions they held at the moment the shooter's command was issued, runs the raycast against that historical arrangement, and then restores everyone to their current positions. Gambetta's overview names it as the fourth of the four companion techniques, alongside client-side prediction, server reconciliation, and entity interpolation, that jointly hide latency under an authoritative server.

The technique exists because a player aims at what they see, and what they see is already stale by their connection's round-trip latency; without compensation, a shooter would need to lead a moving target by an amount proportional to lag, which reads as unfair and inconsistent across players with different connections. Bernier documents the resulting artifact candidly rather than treating it as a defect to be eliminated: "shot around a corner," in which a low-ping player standing near a high-ping shooter can be hit despite having already moved to safety, because from the shooter's rewound point of view they had not yet moved. This is presented as an acknowledged, undissolved inconsistency built into the design's tradeoffs, not a bug awaiting a fix.

Lag compensation is the one technique in this family that is not evidence accumulation at all: rather than gradually confirming a state, the server deliberately re-instantiates a retracted past state to adjudicate a single claim, then discards that reinstated state again once the adjudication is done. The settlement-substrate research program poses, as one of its own motivating questions, what per-observer local time — the parameter this rewind makes visible — is evidence of, formally; the section reads Bernier's artifact as a case where settlement turns on a genuinely local, per-observer question ("what did this shooter see") that resists being folded into one global, monotone climb toward agreement without treating per-observer local time as a real parameter of the arena. This is the section's own proposed reading of the material, not a claim Bernier's paper itself makes; Bernier frames "shot around a corner" purely as a design tradeoff.
