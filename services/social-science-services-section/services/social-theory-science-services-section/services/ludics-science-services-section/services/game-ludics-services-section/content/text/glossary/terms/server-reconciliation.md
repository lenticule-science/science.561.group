---
name: "Server Reconciliation"
description: "The correction process by which a game client, upon receiving the server's authoritative account of its own past input, discards its predicted state, snaps to the server's state, and replays its still-unacknowledged inputs forward."
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

Server reconciliation is the correction process that keeps client-side prediction honest under an authoritative server. The server periodically acknowledges the last input command it has processed — "last processed command #N" — along with its own authoritative state as of that command; the client then discards its confirmed predicted history, snaps its local state to the server's authoritative state, and replays only its still-unacknowledged commands forward to arrive back at a corrected present. Gabriel Gambetta's series gives the canonical worked example of the mechanism: a client predicts its position as x=12, learns from the server that the true position after the acknowledged command was x=11, snaps to x=11, and replays its remaining unacknowledged input to arrive again at x=12 — now on solid ground.

Both Gambetta and Yahn Bernier's earlier Valve paper are explicit that this is overwrite-and-replay, not blending or averaging. Bernier states the consequence directly: "the server's results will eventually correct the client's incorrect simulation... this can cause a very perceptible shift in the player's position." The correction is visible precisely because it is a discard-and-snap rather than a gradual reconciliation of two views.

Server reconciliation is inseparable from client-side prediction, which it exists to correct, and it operates inside the authoritative-server architecture, which it exists to preserve without making the local player wait a full round trip for every action. Per the settlement-substrate research program's own framing, this predict-and-correct family is read by the section as one instance of a client-visible presentation being overwritten rather than monotonically extended — a reading the sources' own vocabulary of "shift" and "correct" supports but do not themselves state in those terms; lag compensation and rollback netcode are sharper instances of the same overwrite pattern elsewhere in this glossary.
