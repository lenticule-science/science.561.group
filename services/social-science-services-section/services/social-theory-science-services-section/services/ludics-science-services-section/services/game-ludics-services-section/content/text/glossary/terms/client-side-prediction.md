---
name: "Client-Side Prediction"
description: "The technique by which a networked game client immediately simulates its own player's movement or actions locally, before the authoritative server has confirmed them, in order to hide round-trip latency from the local player."
instance-of: concept
date-created: 2026-08-22
references:
  gambettaPrediction:
    authors: ["Gabriel Gambetta"]
    title: "Client-Side Prediction and Server Reconciliation"
    publication: "gabrielgambetta.com"
    year: "n.d."
  bernier2001:
    authors: ["Yahn W. Bernier"]
    title: "Latency Compensating Methods in Client/Server In-game Protocol Design and Optimization"
    publication: "GDC 2001 (Valve)"
    year: 2001
---

Client-side prediction is the technique by which a networked game client runs its own copy of the movement or firing simulation on the local player's input the instant that input is sampled, rather than waiting for the round trip to the authoritative server and back. Gabriel Gambetta's "Client-Side Prediction and Server Reconciliation" is the canonical accessible explainer of the technique; Yahn Bernier's 2001 Valve paper, "Latency Compensating Methods in Client/Server In-game Protocol Design and Optimization," is the earlier industry account that predates and directly informs Gambetta's series and the Source engine documentation built on it. Both describe the same underlying algorithm.

The technique works because the client predicts using logic that mirrors the server's own simulation closely enough that predictions usually turn out correct. In Half-Life's case this was not mere approximation but literally the same code: Bernier documents a shared `pm_shared` movement module compiled into both client and server, so the two run identical physics on identical input. Bernier's pseudocode for the prediction loop is explicit about its structure — every input is run forward against the client's local state (`while(true){ run command on from-state → to-state; if latest, break }`) — and every input carries a sequence number, which is what later lets the server tell the client precisely which of its predictions have been confirmed.

Client-side prediction does not, by itself, resolve what happens when a prediction turns out wrong; that correction is the job of server reconciliation, its constant companion in both sources. It is also only one of the four techniques Gambetta's overview groups together under the authoritative-server architecture: entity interpolation handles the rendering of other players' avatars by contrast — never predicting, only replaying real server data slightly in the past — and lag compensation is a separate, server-side technique for adjudicating hit detection fairly despite the same latency that client-side prediction is built to mask.
