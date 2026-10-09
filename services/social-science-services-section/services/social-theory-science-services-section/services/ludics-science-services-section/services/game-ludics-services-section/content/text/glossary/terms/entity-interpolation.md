---
name: "Entity Interpolation"
description: "The technique of rendering other players' avatars roughly one hundred milliseconds behind the present, interpolated between the two most recent authoritative server snapshots, to produce smooth movement without predicting or extrapolating unconfirmed positions."
instance-of: concept
date-created: 2026-08-22
references:
  gambettaInterpolation:
    authors: ["Gabriel Gambetta"]
    title: "Fast-Paced Multiplayer (Part III): Entity Interpolation"
    publication: "gabrielgambetta.com"
    year: "n.d."
  bernier2001:
    authors: ["Yahn W. Bernier"]
    title: "Latency Compensating Methods in Client/Server In-game Protocol Design and Optimization"
    publication: "GDC 2001 (Valve)"
    year: 2001
---

Entity interpolation is the technique of rendering other players' avatars deliberately in the past — Gabriel Gambetta's phrase is "rendering other players in the past" — buffered between the last two authoritative snapshots the client has received from the server, typically about one hundred milliseconds behind the true present. Gambetta's third installment in his fast-paced-multiplayer series is the source for the technique as named; Yahn Bernier's earlier Valve paper documents the same practice as part of the Half-Life engine's networking model, alongside client-side prediction and lag compensation, from which Gambetta's account descends.

The technique uses only real server data and never predicts. Its purpose is to avoid the visibly choppy motion that results from rendering other players' positions only at the raw rate the server sends updates, typically well under the client's frame rate, without resorting to speculative extrapolation of where an entity might be. The tradeoff is stated deliberately in the source, not incidentally: entity interpolation trades currency for smoothness, always showing a slightly stale but visually continuous position rather than a current but jittery one.

This is the direct point of contrast with client-side prediction, which the same architecture applies only to the local player's own avatar: the local player's position is kept as current as possible by predicting ahead of confirmed server data, while every other player's position is kept smooth by deliberately lagging behind it. Lag compensation, the fourth technique in this family, handles a related but distinct problem — not how other players are rendered, but how the server adjudicates one player's shot against another player's position as it existed in the past.
