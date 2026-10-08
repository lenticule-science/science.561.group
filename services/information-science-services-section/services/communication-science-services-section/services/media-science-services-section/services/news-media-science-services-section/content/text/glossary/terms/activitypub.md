---
name: "ActivityPub"
description: "ActivityPub is a W3C Recommendation (23 January 2018, the same day as WebSub) for a decentralized social-networking protocol built on ActivityStreams 2.0 (W3C Recommendation, 23 May 2017) that defines typed Update, Delete, and Undo activities as a working precedent for correction propagation, qualified in this section's study by an open W3C issue on Delete side-effect semantics and a documented (and since-fixed) activity-ordering bug in a fediverse deployment framework that produced \"zombie\" posts."
aliases:
  - "ActivityPub"
  - "ActivityStreams 2.0"
date-created: 2026-08-22
instance-of: w3c-standard
---

ActivityPub is a W3C Recommendation, published 23 January 2018, for a decentralized social-networking protocol: [w3.org/TR/activitypub](https://www.w3.org/TR/activitypub/), announced at [W3C News](https://www.w3.org/news/2018/activitypub-is-now-a-w3c-recommendation/).
It layers a client-to-server and server-to-server delivery model on top of ActivityStreams 2.0, itself a W3C Recommendation published 23 May 2017 and edited by James Snell and Evan Prodromou: [W3C News](https://www.w3.org/news/2017/activitystreams-2-0-is-now-a-w3c-recommendation/), [w3.org/TR/activitystreams-core](https://www.w3.org/TR/activitystreams-core/).

The specification's `Update`, `Delete`, and `Undo` activity types are this term's load-bearing content for correction propagation: `Undo` reverses a prior `Follow`, `Like`, or `Block` (requiring the same actor and reversing side effects such as decremented counters), while `Create`-based objects are reversed with `Delete` rather than `Undo`.
This typed-inverse pattern is the nearest existing standard to a graph event that names *what specific prior statement* is being retracted, rather than merely signaling that a page changed.

Two documented qualifications keep this precedent from being treated as solved.
First, the W3C's own specification repository carries an open issue asking how `Delete` should unwind side effects: [w3c/activitypub#472](https://github.com/w3c/activitypub/issues/472).
Second, an implementation issue in the Fedify ActivityPub framework documented activities arriving out of order across federated servers — a `Delete` reaching a remote instance before the `Create` it targets, leaving a "zombie post": [fedify-dev/fedify#536](https://github.com/fedify-dev/fedify/issues/536), opened 25 January 2026 and closed as completed two days later once an `orderingKey` mechanism landed to guarantee per-object delivery order — evidence the hazard is real enough to require a dedicated fix, not evidence of an open, unresolved problem.
Fediverse-scale consistency problems are documented as predating the 2022-2023 growth wave (Raman et al., ["Challenges in the Decentralised Web: The Mastodon Case,"](https://arxiv.org/pdf/1909.05801) ACM IMC 2019); a peer-reviewed measurement specific to post-2023 deployment scale was not located and is marked **[UNVERIFIED]**.

See [Study of Syndication and Propagation Protocols](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols.md), section 2, for the fuller citation trail and the mapping to the program's correction-propagation bet.
