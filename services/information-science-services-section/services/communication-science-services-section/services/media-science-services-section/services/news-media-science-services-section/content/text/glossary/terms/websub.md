---
name: "WebSub"
description: "WebSub is a W3C Recommendation (23 January 2018) for a hub-and-spoke publish/subscribe push protocol that lets a subscriber receive an HTTP web-hook notification the moment a publisher's feed changes, descended from Google's PubSubHubbub (circa 2009-2010, renamed October 2017), and is read in this section as the push half of a correction-propagation substrate that on its own carries no semantics of what changed."
aliases:
  - "WebSub"
  - "PubSubHubbub"
date-created: 2026-08-22
instance-of: w3c-standard
---

WebSub is the W3C Recommendation, published 23 January 2018 by the Social Web Working Group, for a publish/subscribe push protocol built on plain HTTP web hooks: [w3.org/TR/2018/REC-websub-20180123](https://www.w3.org/TR/2018/REC-websub-20180123/), announced at [W3C News](https://www.w3.org/news/2018/websub-is-now-a-w3c-recommendation/).
A publisher notifies a hub when its content changes; the hub relays that notification to every subscriber that registered a callback URL for that topic.
The mechanism is push rather than poll: subscribers learn of an update within one HTTP round trip of the hub receiving it, instead of periodically re-fetching the feed.

WebSub descends from PubSubHubbub, created by Brett Slatkin and Brad Fitzpatrick and deployed inside Google products (FeedBurner, Google Reader Shared Items, Blogger) from around 2009-2010, then renamed WebSub in October 2017 as part of its move onto the W3C standards track.

For this section's engineering scope, WebSub is the push component a correction-propagation substrate would use to tell subscribers that a claim's page has changed the moment it changes, rather than waiting for a poll cycle — but the protocol carries no payload semantics of its own: a WebSub notification says "this changed," not "this specific prior claim was corrected." Pairing it with a typed event vocabulary (see [ActivityPub](./activitypub.md)) and a replayable archive (see [Link Rot](./link-rot.md) and the archived-feed pattern) is the combination this section's study argues no one has yet assembled for news corrections.

See the fuller citation trail in [Study of Syndication and Propagation Protocols](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols.md), section 1.
