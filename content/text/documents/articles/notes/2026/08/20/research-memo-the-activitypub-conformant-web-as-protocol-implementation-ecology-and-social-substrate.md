---
title: "Research memo: the ActivityPub-conformant Web as protocol, implementation ecology, and social substrate"
description: "Date: June 11, 2026 Scope: Fediverse as the ActivityPub/ActivityStreams-centered social web, not as a synonym for Mastodon."
---
# Research memo: the ActivityPub-conformant Web as protocol, implementation ecology, and social substrate

**Date:** June 11, 2026  
**Scope:** Fediverse as the ActivityPub/ActivityStreams-centered social web, not as a synonym for Mastodon.  
**Caution:** Public Fediverse statistics are crawler-dependent, differ by source, and can include unreachable, spam, test, or partially federating servers; I treat them as indicators, not ground truth.

## Abstract

ActivityPub creates a federated social substrate by standardizing actor documents, activity/object vocabularies, inboxes, outboxes, collections, addressing fields, and server-to-server delivery. It does **not** standardize a complete social network. It leaves unresolved or externalized many features that users experience as “the Fediverse”: handles, authentication, search, media upload, quote posts, moderation workflow, reports, blocks, relays, ranking, local timelines, mobile-client APIs, discovery, and most governance practices. The W3C ActivityPub Recommendation was published on January 23, 2018, building on ActivityStreams 2.0, which became a W3C Recommendation on May 23, 2017. ActivityPub defines both client-to-server and server-to-server APIs, but deployed Fediverse practice is overwhelmingly shaped by server-to-server federation plus implementation-specific client APIs and conventions. ([w3.org](https://www.w3.org/TR/activitypub/))

The central finding is that **ActivityPub standardizes routed social speech acts, not social order**. It makes it possible for actors on different servers to send Activities about Objects to one another’s inboxes, but the resulting social forms depend on software dialects, instance governance, moderation labor, server capacity, discovery mechanisms, and political economy. “Interoperability” therefore means not only whether a JSON Activity can be delivered, but whether it can be authenticated, interpreted, rendered, moderated, searched, cached, deleted, replied to, quoted, reported, and socially contextualized across heterogeneous systems.

## Core thesis

The ActivityPub-conformant Web is best understood as a **federated relation machine**. Its minimal technical unit is not simply a post, a server, or an app. At the protocol layer, the key unit is an **Actor with an inbox/outbox and a globally identified object graph**. At the network layer, the key unit is a **delivery relation** between one actor’s activity and another actor’s inbox. At the governance layer, the key unit is often an **instance-to-instance relation**: allow, block, silence, limit, bridge, relay, cache, or refuse.

This means the Fediverse is not a single public sphere. It is a patchwork of partially overlapping publics, each produced by local software affordances, server policies, moderation capacity, blocklists, followers collections, shared inboxes, bridges, indexes, and user cultures.

---

## 1. What ActivityPub actually standardizes

ActivityPub provides a vocabulary and delivery architecture for decentralized social networking. It defines Actors, Objects, Activities, inboxes, outboxes, collections, followers, following, liked collections, addressing, and delivery behavior. Actors must have `inbox` and `outbox` properties; ActivityPub actors often also expose `following`, `followers`, `liked`, `streams`, `preferredUsername`, and endpoint metadata. Distributed objects are expected to have globally unique IDs, commonly dereferenceable HTTPS URIs. ([w3.org](https://www.w3.org/TR/activitypub/))

ActivityPub’s server-to-server model works roughly like this: an actor creates an Activity, the server determines intended recipients from addressing fields such as `to`, `cc`, `bto`, `bcc`, and `audience`, resolves recipient inboxes, and POSTs the activity to those inboxes. The spec also defines shared inboxes as an optimization, especially for fan-out to many actors on the same server. It recommends asynchronous delivery and retries, but much operational detail is left to implementations. ([w3.org](https://www.w3.org/TR/activitypub/))

ActivityStreams 2.0 supplies the underlying JSON-based vocabulary for representing actors, objects, and activities: for example `Person`, `Group`, `Service`, `Note`, `Article`, `Image`, `Video`, `Create`, `Follow`, `Accept`, `Reject`, `Like`, `Announce`, `Update`, `Delete`, `Undo`, `Block`, and `Flag`. ActivityPub then defines a federated delivery and API model around that vocabulary. ([w3.org](https://www.w3.org/TR/activitystreams-core/))

### Table 1 — What is standardized versus left open

| Layer | Standardized by ActivityPub / ActivityStreams | Commonly external, conventional, or implementation-specific |
|---|---|---|
| Identity | Actor objects with IDs, inboxes, outboxes, actor types | Human-readable handles, WebFinger lookup, account migration, verification, profile fields, relays, directories |
| Content model | Activities and Objects using ActivityStreams vocabulary and JSON-LD | Product semantics: posts, toot/status, thread, video channel, book review, community post, livestream |
| Delivery | Addressing fields, inbox delivery, followers collections, shared inbox pattern | Retry queues, rate limits, spam handling, authorized fetch, signature profiles, relays, partial delivery repair |
| Visibility | Addressed recipients and collections | UI privacy labels, local-only posts, followers-only enforcement, search indexing, screenshots, caching, quoteability |
| Interaction | Follow, Accept, Reject, Like, Announce, Undo, Delete, Update, Flag, etc. | Favorites versus likes, boosts versus reposts, quote posts, emoji reactions, votes, reports workflow, moderation appeals |
| Clients | Client-to-server API exists in the spec | Most mainstream clients use app-specific APIs, especially Mastodon-compatible APIs |
| Search/discovery | Not a global search protocol | Hashtag search, full-text search, opt-in indexing, instance directories, crawlers, trends, recommendation systems |
| Governance | No full governance model | Instance rules, domain blocks, allowlists, blocklists, moderator teams, legal response, federation diplomacy |

The practical result is that **ActivityPub standardizes transportable acts more than social meanings**. A `Like` can mean favorite, reaction, acknowledgement, endorsement, bookmark-like signal, or vote-like signal depending on software. An `Announce` can be a boost, share, channel publication, relay behavior, or moderation-relevant redistribution. A `Delete` can be a best-effort instruction, not a cryptographic erasure guarantee.

---

## 2. ActivityPub is not the whole stack

Several dependencies often experienced as “ActivityPub” are not part of the core Recommendation.

### WebFinger

Fediverse users usually expect handles like `@alice@example.social`, but ActivityPub actor IDs are commonly HTTPS URIs. WebFinger bridges this gap by resolving an `acct:` URI such as `acct:alice@example.social` through `/.well-known/webfinger` into a JSON Resource Descriptor pointing to the actor document. A 2024 SocialCG report notes that ActivityPub identifiers tend to be HTTPS URIs, while WebFinger is used to resolve username/hostname identifiers to those actors; it also warns that exposing actors through WebFinger can enable spam or unwanted messages in some systems. ([w3.org](https://www.w3.org/community/reports/socialcg/CG-FINAL-apwf-20240608/))

### HTTP Signatures and authorized fetch

ActivityPub itself does not fully specify the authentication mechanism used by the contemporary Fediverse. In practice, server-to-server federation commonly relies on HTTP Signatures: inbox POSTs are signed, and many servers also require signed GET requests for actor and object retrieval. The 2025 SWICG draft on ActivityPub and HTTP Signatures describes this as a custodial model in which the instance holds actor private keys and signs on users’ behalf. ([swicg.github.io](https://swicg.github.io/activitypub-http-signature/))

Mastodon’s “secure mode” requires signed cross-server requests, including GET requests for public resources, allowing a server to reject fetches from blocked servers. GoToSocial similarly documents a mode equivalent to Mastodon authorized fetch, requiring signed GET and POST requests to server-to-server endpoints. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

### NodeInfo, discovery, and measurement

NodeInfo is a convention for publishing server metadata through `/.well-known/nodeinfo`, including links to schema documents describing software and usage information. It is useful for discovery and measurement, but it is not a capability-negotiation solution; a 2025 FEP explicitly warns that servers should not rely on NodeInfo’s software name/version for capability detection. ([github.com](https://github.com/jhass/nodeinfo/blob/main/PROTOCOL.md))

### Relays

Relays are not core ActivityPub, but they matter in practice because they amplify distribution among instances that opt into them. Public relay descriptions usually define them as ActivityPub servers that reblog or redistribute statuses for subscribed actors or servers. This changes discovery, moderation surface area, and spam exposure. ([fediverse.party](https://fediverse.party/en/tools/?utm_source=chatgpt.com))

### JSON-LD and extension vocabularies

ActivityPub and ActivityStreams use JSON-LD contexts. This supports extensibility, but deployed systems often behave less like fully general linked-data processors and more like JSON applications with recognized fields. This matters because software-specific extensions can be valid JSON-LD yet socially invisible if other implementations ignore or misrender them. ([w3.org](https://www.w3.org/TR/activitypub/))

---

## 3. Client-to-server versus server-to-server ActivityPub

ActivityPub defines two APIs: a client-to-server API for creating, updating, and deleting content, and a server-to-server federation API for delivery and notifications. ([w3.org](https://www.w3.org/TR/activitypub/))

In deployed practice, the server-to-server side is the real center of gravity. Mastodon clients, for example, generally use the Mastodon API rather than generic ActivityPub client-to-server. Other software families expose their own APIs or web UIs. This creates an important distinction:

| Claim | Accurate interpretation |
|---|---|
| “ActivityPub is a social-network API.” | Partly. It includes C2S, but the commonly deployed Fediverse uses it mainly as S2S federation. |
| “Any ActivityPub client should work with any ActivityPub server.” | Usually false in practice. Product-specific APIs, auth flows, object types, timelines, and affordances differ. |
| “Mastodon API compatibility equals ActivityPub compatibility.” | False. It may improve app support, but Mastodon API compatibility is a product dialect, not the protocol itself. |
| “ActivityPub conformance guarantees user-facing interoperability.” | False. It guarantees a common framework, not uniform rendering, moderation, search, or semantics. |

The social consequence is client monoculture. A server can be ActivityPub-conformant yet still feel “unsupported” if popular mobile apps assume Mastodon’s API and status model.

---

## 4. Implementation ecology: one protocol, many social objects

The Fediverse is not one application. It is a multi-software ecology where each implementation maps ActivityPub primitives onto its own idea of social life.

### Table 2 — Major implementation families and their social forms

| Software / family | ActivityPub idiom | Social form produced | Interoperability stress |
|---|---|---|---|
| **Mastodon** | Mostly `Person` actors creating `Note` and `Question` objects; `Like` as favorite; `Announce` as boost; `Flag` as report | Microblogging with content warnings, boosts, follows, local/federated timelines | Mastodon-compatible behavior becomes a de facto dialect; non-Note objects are converted “best effort” into statuses ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/)) |
| **Pixelfed** | Photo/media-centered posting over ActivityPub | Image-sharing publics, portfolios, visual communities | Media display, albums, captions, sensitive media, and discoverability differ from text-first software ([pixelfed.org](https://pixelfed.org/?utm_source=chatgpt.com)) |
| **PeerTube** | Channels are `Group` actors owned by `Person` actors; videos are `Video` objects; channels may `Announce` videos | Federated video hosting, channels, comments, watch interactions | Video metadata, comments, caching, dislikes, views, and playlist semantics exceed microblog status assumptions ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub)) |
| **Lemmy / Mbin / Kbin** | `Community` as `Group`, users as `Person`, posts as `Page`, comments as `Note` | Federated forums, link aggregation, community threads | Votes, ranking, group moderation, and thread context are hard to preserve in microblog clients ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html)) |
| **Misskey / Sharkey / Iceshrimp forks** | Note-based microblogging with richer reactions, quotes, custom emoji, drive/media affordances | Expressive microblogging, emoji culture, quote/renote cultures | Quote and reaction extensions differ across forks and from Mastodon conventions ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/pre-fep-quote-posts-quote-policies-and-quote-controls/5031?page=4)) |
| **Pleroma / Akkoma** | Lightweight AP microblogging; extensions such as `EmojiReact` | Lower-resource instances, flexible UI/front-end culture | Emoji reactions, quote fields, and LitePub-derived conventions can be legible only to compatible peers ([docs.akkoma.dev](https://docs.akkoma.dev/stable/?utm_source=chatgpt.com)) |
| **WriteFreely** | Blogs become followable ActivityPub actors | Long-form writing distributed into social feeds | Often asymmetric: following and reading work better than rich cross-software interaction ([writefreely.org](https://writefreely.org/docs/main/writer/federation?utm_source=chatgpt.com)) |
| **BookWyrm** | Reading activity, books, reviews, shelves, and relationships using ActivityPub plus extended types | Federated reading publics and book communities | Book metadata and review semantics are richer than generic status rendering ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/activitypub.html)) |
| **Owncast** | A livestream instance presents as a `Service` actor; sends go-live and post activities | Livestreams as federated social actors | Not every actor is a person; Owncast does not follow others and its following collection may 404 ([github.com](https://github.com/owncast/owncast/blob/develop/FEDERATION.md)) |
| **WordPress ActivityPub** | WordPress authors/sites publish posts into ActivityPub networks | CMS-to-Fediverse publishing | Comment mapping, author identity, plugin behavior, and theme integration vary ([github.com](https://github.com/Automattic/wordpress-activitypub?utm_source=chatgpt.com)) |
| **Ghost ActivityPub** | Ghost publications become social-web actors/readers; current beta uses ActivityPub-oriented infrastructure | Newsletters/blogs as federated publications | Ghost documents rough edges across Threads, Bluesky via Bridgy Fed, and other platforms ([ghost.org](https://ghost.org/help/social-web/)) |
| **Threads federation** | Opt-in public Threads profiles federate with ActivityPub servers | Corporate gateway into Fediverse-style following, replies, likes, reposts | Scale, moderation mismatch, separate fediverse feed/search, opt-in limits, and corporate incentives reshape federation politics ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/)) |
| **Bridgy Fed** | Protocol bridge among ActivityPub, AT Protocol/Bluesky, and IndieWeb | Cross-protocol identities and conversations | Semantic conversion, consent, blocking, quote incompatibility, and duplicate identity problems ([fed.brid.gy](https://fed.brid.gy/docs)) |
| **Bonfire** | Modular federated framework with optional extensions and “flavours” | Custom social applications: groups, boundaries, privacy experiments | Advanced privacy and experimental FEPs may not degrade cleanly across older peers ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html)) |
| **GoToSocial** | Lightweight, safety-focused ActivityPub server | Small-instance microblogging with stronger admin control | Authorized fetch, allowlist/blocklist modes, and stricter federation can break assumptions of open public fetching ([docs.gotosocial.org](https://docs.gotosocial.org/?utm_source=chatgpt.com)) |

The table shows why the Fediverse cannot be reduced to Mastodon. Mastodon is a powerful dialect and user-experience reference point, but the ActivityPub-conformant Web also includes video channels, reading communities, livestreams, blogs, CMS publishing, forums, bridges, corporate gateways, and experimental social frameworks.

---

## 5. Mastodon-compatible is not the same as ActivityPub-conformant

Mastodon’s influence is structural. It supplies a dominant UI grammar: profile, status, boost, favorite, reply, content warning, local timeline, federated timeline, followers-only, hashtag, mute, block, report. Mastodon’s documentation describes how it handles ActivityPub activities such as `Create`, `Delete`, `Like`, `Announce`, `Update`, `Undo`, and `Flag`; it also explains that non-primary object types such as `Article`, `Page`, `Image`, `Audio`, `Video`, and `Event` may be converted into statuses on a best-effort basis. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

That best-effort conversion is not a neutral technical detail. It produces a social hierarchy of objects. `Note` objects fit the dominant microblog timeline. A PeerTube `Video`, Lemmy `Page`, BookWyrm review, Owncast livestream notice, or Ghost long-form post may be delivered correctly while losing native context, affordances, ranking, metadata, or interaction expectations.

Mastodon also defines extensions and expectations around profile metadata, featured collections, hashtags, custom emojis, sensitive-content warnings, discoverability, and indexability. These affordances are important, but they are not identical to ActivityPub itself. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

---

## 6. Interoperability in practice: where it works and where it fails

Interoperability has at least eight meanings:

1. **Discovery interoperability:** Can I find the actor?  
2. **Delivery interoperability:** Can my server deliver the activity to the remote inbox?  
3. **Authentication interoperability:** Will the remote server accept the signature or fetch?  
4. **Vocabulary interoperability:** Does the remote server understand the activity/object type?  
5. **Rendering interoperability:** Does the UI display it intelligibly?  
6. **Interaction interoperability:** Can users reply, like, boost, quote, vote, react, follow, block, or report in meaningful ways?  
7. **Moderation interoperability:** Can abuse reports, blocks, content warnings, and removals travel or be acted on?  
8. **Governance interoperability:** Do the two servers’ norms, laws, resources, and risk tolerances permit an ongoing relation?

ActivityPub mostly addresses the middle of this list. The lived Fediverse depends on all eight.

### Partial and broken federation

Federation can fail because an actor cannot be discovered through WebFinger, an actor document cannot be fetched, a signature is rejected, an object type is unknown, media is too large, HTML is sanitized differently, replies are not attached to the same thread, a server is blocked, an authorized fetch fails, a relay amplifies spam, or a UI silently drops unsupported fields.

Ghost’s beta documentation is unusually explicit about this: it says Ghost-to-WordPress and Ghost-to-WriteFreely work well, Ghost-to-Threads works only “a little bit,” Bluesky works via Bridgy Fed, and other platforms may work partially with rough edges. It frames the open web as difficult, chaotic, and messy because thousands of people and companies are implementing it independently. ([ghost.org](https://ghost.org/help/social-web/))

### Quote posts

Quote posts illustrate how protocol ambiguity becomes social conflict. For years, quote posting was common in Misskey-derived systems but absent or resisted in Mastodon culture, partly because of harassment and context-collapse concerns. Mastodon announced in February 2025 that it was developing quote posts with ActivityPub extensions, public API changes, UI changes, moderation/admin changes, and mobile app support; in September 2025, Mastodon launched quote posts with consent-oriented controls on mastodon.social/mastodon.online and in Mastodon 4.5. ([github.com](https://github.com/mastodon/blog/blob/master/content/posts/2025-02-14_mastodon-quote-posts/2026-06-17-emsemioverse-terms-index.md))

But the ecosystem already had multiple quote dialects. SocialHub discussions document variants such as Akkoma’s `quoteUri`/`quoteUrl`, Sharkey and Misskey’s `_misskey_quote`, and other properties used by Hollo, Bridgy, Threads, Pleroma, Friendica, and Iceshrimp.NET. Bridgy Fed’s own docs note quote incompatibility with Mastodon because different quote FEPs are in use. ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/pre-fep-quote-posts-quote-policies-and-quote-controls/5031?page=4))

The lesson is that ActivityPub can move objects, but it does not by itself settle the ethics or semantics of recontextualization.

### Emoji reactions

Emoji reactions show the same pattern. Akkoma documents `EmojiReact` as distinct from `Like`, allowing multiple emoji reactions with different meanings; it also notes that Misskey’s behavior differs by treating likes and reactions differently and allowing only one reaction. A 2024 SocialHub FEP discussion says `EmojiReact` emerged from existing Pleroma and Misskey practices and debates whether emoji reactions should be modeled as `Like`, `React`, or another activity because negative or neutral emoji could be misread as likes. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/development/ap_extensions/))

### Search

ActivityPub has no global search or ranking layer. Search is produced by local indexing, hashtag conventions, opt-in discoverability/indexability flags, crawlers, app-specific search, and corporate or third-party indexes. Mastodon documents `discoverable` and `indexable` profile properties; Threads added a separate fediverse feed and search in 2025, but The Verge reported that the fediverse remained separate rather than a first-class part of Threads’ main experience. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

This matters socially because search is power. A network with weak search favors already-followed actors, relays, hashtags, directories, large instances, and externally promoted accounts.

---

## 7. Worked examples

### Example A — Following a WriteFreely or Ghost publication from Mastodon

A user enters a handle. The local server uses WebFinger to resolve the handle into an actor URI, fetches the actor, sends a `Follow` to its inbox, and waits for `Accept`. Future posts arrive as activities addressed to followers or public recipients. ([w3.org](https://www.w3.org/community/reports/socialcg/CG-FINAL-apwf-20240608/))

Technically, this may work. Socially, the object may change genre. A long-form blog post becomes a timeline item, preview card, excerpt, or link. Comments may map poorly. Rich publication identity may collapse into an account-like profile. The publication is federated, but not necessarily experienced as a publication.

### Example B — PeerTube video in a Mastodon timeline

PeerTube models channels as `Group` actors owned by `Person` actors, and videos as `Video` objects that may be announced by the channel. It also supports activities and objects beyond simple notes, including video, comments, playlists, watch actions, likes, dislikes, flags, and reply approval. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub))

A Mastodon user may see a video post, thumbnail, link, and comments. But Mastodon’s native grammar is not a video platform. Watch state, dislike semantics, playlists, channel ownership, transcoding, and moderation of video comments may not fully survive the cross-software translation.

### Example C — Lemmy community thread seen from microblogging software

Lemmy maps `Community` to `Group`, user to `Person`, post to `Page`, and comment to `Note`; almost every action happens inside a group. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html))

When a Lemmy thread crosses into microblogging software, the comments may look like replies, but the forum context can degrade. Voting, ranking, community moderation, post sorting, and “which group owns this discussion?” are not generic ActivityPub properties. The same JSON graph can therefore instantiate different publics: a forum thread in Lemmy, a reply chain in Mastodon, a set of notes in another client.

### Example D — Owncast livestream as a non-person actor

Owncast’s federation design presents a stream as a `Service` actor, not a `Person`. It supports server-to-server ActivityPub, WebFinger, HTTP Signatures, and NodeInfo; it sends `Create Note` activities when a stream goes live or when manual posts are made, sends `Update Service`, accepts follows, and receives follow/undo/like activities. It does not follow others, and its `following` endpoint may return 404. ([github.com](https://github.com/owncast/owncast/blob/develop/FEDERATION.md))

This is ActivityPub-conformant sociality without a human-profile premise. The actor is a livestream service. The “social form” is presence notification, not mutual posting.

### Example E — Defederation as social boundary-making

Defederation is not just a technical block. It is a governance act that changes who can deliver, fetch, reply, harass, observe, and belong. Empirical work on Mastodon defederation found that group sanctions can reduce activity on blocked servers, but did not find clear evidence of reduced message toxicity. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

Blocklists are another layer of this boundary-making. A 2025 CSCW study of community-level blocklists found substantial variation in goals, criteria, transparency, and concerns about opacity, over-blocking, and conflicting definitions of harmful content. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

### Example F — Threads federates

Meta announced in March 2024 that Threads users over 18 with public profiles in selected countries could opt into federation, allowing people on ActivityPub servers to follow, like, reply to, and repost Threads content. Meta framed this as user choice and acknowledged that servers set their own community standards and moderation. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

A large corporate actor changes the meaning of federation. It adds scale, product power, brand legitimacy, moderation asymmetry, legal departments, advertising incentives, analytics capacity, and the ability to make de facto standards. Wired reported in 2023 that Fediverse communities were split over preemptive blocking of Meta, with concerns that Threads could dwarf the existing network and reshape its norms. ([wired.com](https://www.wired.com/story/metas-threads-could-make-or-break-the-fediverse))

---

## 8. Social forms that follow from ActivityPub affordances

### 8.1 Actors become identities, but identity is layered

The ActivityPub actor is the protocol identity. The WebFinger handle is the social identity. The server domain is the governance identity. The software implementation is the affordance identity. These can diverge.

A user may think “I am `@alice@server`.” Technically, that maps to an actor URI, a key pair controlled by the server, profile metadata, followers collection, local database row, and domain reputation. If the server disappears, the identity problem is not just protocol portability; it is also social graph continuity, search continuity, moderation continuity, and trust continuity.

### 8.2 Inboxes create publics by delivery, not by universal publication

The Fediverse is not one global feed. It is a set of deliveries into inboxes, later rendered by local servers. “Public” means something closer to “addressed to the public collection and fetchable under current server policy” than “visible everywhere.” ActivityPub’s delivery model therefore produces **partial publics**: publics bounded by follows, shared inboxes, relays, caches, instance blocks, search indexes, and UI choices.

### 8.3 Visibility is a bundle, not a guarantee

Visibility is made from addressing, delivery, fetch authorization, caching, UI rendering, search indexing, and moderation policy. A followers-only post may be addressed to followers, but server admins, software bugs, screenshots, bridges, or malicious recipients can still change its circulation. Conversely, a public post may not be widely visible if it is not indexed, relayed, boosted, followed, or rendered.

### 8.4 Moderation becomes infrastructure

ActivityPub enables server autonomy, but autonomy creates labor. Server operators must handle abuse reports, spam, law enforcement or legal risk, user disputes, blocklist decisions, appeals, upgrades, storage, backups, federation breakage, and interpersonal conflict. Kissane and Kazemi’s 2024 governance study found strong moderation in parts of the Fediverse, but also less formal server leadership and federated diplomacy; they identify risks including bus factor, finances, legal burden, burnout, technical instability, spam, appeals tooling, and culturally attuned moderation. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

The practical social form is not “leaderless decentralization.” It is often **small-scale custodial governance**: a few admins and moderators hold technical keys, legal exposure, social trust, and emotional burden.

### 8.5 Federation is not automatically liberatory

ActivityPub distributes control, but it does not eliminate hierarchy. Power appears through large instances, dominant software defaults, client API compatibility, cloud hosting, app-store visibility, bridge operators, search indexes, blocklist maintainers, protocol working groups, corporate actors, and admin capacity. Research comparing decentralized protocols argues that protocol choices distribute control differently and embed political values into infrastructure. ([arxiv.org](https://arxiv.org/abs/2505.22962?utm_source=chatgpt.com))

A critical analysis of Fediverse decentralization likewise argues that the network faces serious challenges in fulfilling decentralization promises, drawing on protocol analysis, statistics, and comparison with systems such as email and the Web. ([arxiv.org](https://arxiv.org/abs/2408.15383?utm_source=chatgpt.com))

---

## 9. Direct answers to the core questions

### What is the minimum technical object of the Fediverse?

There is no single adequate answer.

| Perspective | Minimum object |
|---|---|
| Protocol | Actor with an ID, inbox, and outbox |
| Delivery | Activity addressed to recipients and delivered to inboxes |
| Social graph | Follow relation between actors |
| Moderation | Instance-to-instance relation: allow, limit, suspend, block |
| User experience | Rendered object in a local software context |
| Political economy | Maintained server with domain, storage, labor, money, rules, and risk |

The most precise answer is: **the Fediverse’s minimal operational unit is a governed delivery relation between actors mediated by servers**.

### What does ActivityPub standardize?

It standardizes a model for actors, objects, activities, inbox/outbox collections, addressing, and federated delivery. It also defines a client-to-server API, though this is not the dominant general client substrate in practice. ([w3.org](https://www.w3.org/TR/activitypub/))

### What does ActivityPub leave to local software?

It leaves timelines, ranking, search, media upload, UI labels, quote-post semantics, reaction semantics, reports workflow, blocklist policy, content-warning culture, account migration details, discovery, relays, spam controls, moderation tooling, and most client APIs to implementations or conventions. The spec explicitly leaves media upload out of scope. ([w3.org](https://www.w3.org/TR/activitypub/))

### What are the hidden dependencies outside the protocol?

WebFinger for handles; HTTP Signatures for authenticated federation; NodeInfo for server metadata; shared-inbox conventions; relays; Mastodon-compatible APIs; public crawlers and directories; DNS, TLS, queues, object storage, CDNs, spam filtering, admin labor, blocklists, and legal compliance. ([w3.org](https://www.w3.org/community/reports/socialcg/CG-FINAL-apwf-20240608/))

### How do identity, delivery, addressing, visibility, and moderation become social structure?

They define who can be found, who can speak to whom, whose speech is delivered, whose speech is rendered, whose posts are searchable, which communities are insulated, which admins carry risk, and which software dialects become normative. The result is a network of partially connected publics, not a single decentralized town square.

### Where are protocol ambiguities socially consequential?

The highest-impact ambiguities include quote posts, emoji reactions, deletes, edits, replies, context/thread ownership, search indexing, followers-only semantics, reports, blocks, media handling, and bridges. Quote posts and emoji reactions are especially clear cases where multiple ActivityPub-compatible dialects encode different social norms. ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/pre-fep-quote-posts-quote-policies-and-quote-controls/5031?page=4))

### What breaks when a large corporate actor federates?

Scale breaks assumptions. Small instances often rely on volunteer moderation, tacit norms, and personal trust. A corporate actor brings millions of users, legal teams, product roadmaps, algorithmic feeds, monetization pressure, moderation policies designed for scale, and the capacity to set de facto standards. Threads’ federation is opt-in and partial, and by 2025 its fediverse feed/search remained separate from the main Threads experience, which shows that corporate federation can be both technically real and socially compartmentalized. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

### What would an ActivityPub-conformant but non-Mastodon social system look like?

It might not have “statuses” at all. Imagine a federated community archive:

| Component | ActivityPub design |
|---|---|
| Actors | `Group` actors for archives, `Person` actors for contributors, `Service` actors for ingest bots |
| Objects | `Article`, `Image`, `Audio`, `Video`, `Collection`, plus custom JSON-LD vocabulary for provenance, consent, access conditions, and cultural protocols |
| Activities | `Create`, `Update`, `Delete`, `Announce`, `Invite`, `Accept`, `Reject`, `Flag`, perhaps custom review/annotation activities |
| Visibility | Collection-specific access, allowlisted federation, signed fetch, no global search by default |
| Moderation | Steward groups approve follows, remove objects, reject extraction, and document takedown norms |
| UI | Archive collections, timelines by topic/provenance, annotation layers, review queues, not a microblog feed |

Such a system could be ActivityPub-conformant while rejecting Mastodon’s central metaphors of toot/status, boost, favorite, and public timeline.

---

## 10. Risks

### Technical risks

| Risk | Why it matters |
|---|---|
| Mastodon monoculture | Non-Mastodon objects become second-class if clients and servers assume Mastodon status semantics. |
| Extension drift | JSON-LD extensibility enables innovation but creates dialects that other software ignores. |
| Signature fragmentation | Secure fetch and HTTP Signature profiles improve control but can break passive fetching, archives, and old software. |
| Weak capability negotiation | Servers often infer behavior from software names or known dialects rather than explicit capabilities. |
| Delete/edit uncertainty | Federated deletes and edits are best-effort across caches, bridges, screenshots, and hostile servers. |
| Media costs | Video, images, avatars, previews, and remote caching create bandwidth and storage burdens. |
| Search/index conflict | Users want discovery, but communities often oppose scraping, profiling, and context collapse. |
| Bridge ambiguity | Bridging can preserve connection but blur consent, audience, blocking, and quote semantics. |

### Governance and care risks

| Risk | Why it matters |
|---|---|
| Admin burnout | Small teams carry moderation, uptime, legal, financial, and emotional labor. |
| Opaque defederation | Blocking can protect communities, but unclear criteria can produce rumor, exclusion, or unappealable sanctions. |
| Unequal capacity | Large instances and corporations can absorb abuse, legal threats, and engineering work better than small servers. |
| Cultural mismatch | Federation connects communities with incompatible norms around speech, harassment, nudity, politics, identity, and archiving. |
| Moderation tooling gaps | Reports, appeals, cross-instance evidence, and culturally specific moderation remain uneven. |
| Infrastructure dependence | “Decentralized” servers may still rely on centralized DNS, cloud providers, app stores, payment processors, and CDNs. |

The 2024 governance study by Kissane and Kazemi is especially important here because it refuses the myth that good governance is automatic. It argues that the Fediverse’s optimistic potential requires funding and support across cultural, financial, legal, and technical gaps. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

---

## 11. Open research questions

1. **Capability negotiation:** How can servers advertise support for quotes, reactions, edits, reports, groups, authorized fetch, media limits, and privacy semantics without relying on software-name heuristics?

2. **Deletion and consent:** What should deletion mean in a federated network with caches, bridges, archives, relays, hostile servers, and screenshots?

3. **Bridge governance:** How should consent, blocking, identity mapping, and quote semantics work when ActivityPub is bridged to AT Protocol, IndieWeb, or future networks?

4. **Moderation portability:** Can reports, evidence, appeals, and sanctions federate without creating surveillance infrastructure or administrator overload?

5. **Search ethics:** What would search look like if it respected `indexable`, robots-like norms, community consent, and anti-harassment needs?

6. **Instance democracy:** Which governance models work for small, medium, and large instances: benevolent dictator, cooperative, nonprofit, municipal, university, affinity group, paid hosting, or platform cooperative?

7. **Corporate federation:** Can a large corporate actor federate without becoming the de facto standard-setter?

8. **Non-Mastodon design:** What social applications become possible when ActivityPub is treated as a vocabulary for federated relations rather than a microblogging backend?

9. **Metrics and measurement:** How can researchers count the Fediverse without amplifying spam, violating instance policies, or mistaking crawler visibility for social reality?

10. **Care labor funding:** What funding models support moderation, server maintenance, accessibility, localization, and incident response without recreating extractive platform economics?

---

## 12. Annotated bibliography

### Primary specifications and protocol conventions

**W3C ActivityStreams 2.0, Recommendation, May 23, 2017.** Defines the JSON-based model for representing activities, actors, and objects that ActivityPub uses as its vocabulary substrate. ([w3.org](https://www.w3.org/TR/activitystreams-core/))

**W3C ActivityPub, Recommendation, January 23, 2018.** Defines decentralized social networking via client-to-server and server-to-server APIs, including actors, inboxes, outboxes, collections, addressing, and delivery. ([w3.org](https://www.w3.org/TR/activitypub/))

**SocialCG, “ActivityPub and WebFinger,” final report, June 8, 2024.** Documents how Fediverse-style handles are resolved to ActivityPub actors through WebFinger and identifies security/spam implications. ([w3.org](https://www.w3.org/community/reports/socialcg/CG-FINAL-apwf-20240608/))

**NodeInfo 2.1 protocol.** Defines the `/.well-known/nodeinfo` discovery pattern for server metadata; useful for statistics and directories but insufficient for capability negotiation. ([github.com](https://github.com/jhass/nodeinfo/blob/main/PROTOCOL.md))

**SWICG, “ActivityPub and HTTP Signatures,” draft, August 3, 2025.** Documents the de facto Fediverse use of HTTP Signatures for signed inbox POSTs and signed fetches, while noting that ActivityPub itself did not specify this authentication layer. ([swicg.github.io](https://swicg.github.io/activitypub-http-signature/))

### Implementation documentation

**Mastodon ActivityPub documentation.** Shows Mastodon’s ActivityPub dialect: `Note`/`Question`, `Create`, `Delete`, `Like`, `Announce`, `Update`, `Flag`, content warnings, profile metadata, discoverability, hashtags, custom emoji, and best-effort conversion of other object types. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

**Mastodon quote-post announcements, February and September 2025.** Important case study of safety, standardization, consent, and extension politics around a socially consequential feature. ([github.com](https://github.com/mastodon/blog/blob/master/content/posts/2025-02-14_mastodon-quote-posts/2026-06-17-emsemioverse-terms-index.md))

**PeerTube ActivityPub documentation.** Demonstrates non-microblogging ActivityPub: video objects, channels as groups, account/channel ownership, comments, playlists, views, likes/dislikes, and moderation-related activities. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub))

**Lemmy federation documentation.** Maps forum software to ActivityPub using `Group` communities, `Person` users, `Page` posts, and `Note` comments, showing how group-centered sociality differs from microblogging. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html))

**BookWyrm ActivityPub documentation.** Shows ActivityPub applied to books, reviews, follows, blocks, shelves, and extended book metadata. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/activitypub.html))

**Owncast federation documentation.** Presents livestream federation through a `Service` actor rather than a person-like account, illustrating ActivityPub’s broader actor model. ([github.com](https://github.com/owncast/owncast/blob/develop/FEDERATION.md))

**Ghost social web beta documentation and Ghost ActivityPub repository.** Shows long-form publishing and newsletters moving into ActivityPub, while explicitly acknowledging partial interoperability across other platforms. ([ghost.org](https://ghost.org/help/social-web/))

**WordPress ActivityPub plugin documentation.** Illustrates CMS-based publishing into ActivityPub networks, including follow/profile/reaction blocks and plugin-mediated federation. ([github.com](https://github.com/Automattic/wordpress-activitypub?utm_source=chatgpt.com))

**Bridgy Fed documentation.** Critical for understanding cross-protocol federation, semantic conversion, opt-out/blocking behavior, public-post limitations, and quote incompatibility. ([fed.brid.gy](https://fed.brid.gy/docs))

**Bonfire Federation Interoperability Guide, September 25, 2025.** Documents modular ActivityPub applications with advanced privacy, custom boundaries, and experimental FEP support. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html))

**GoToSocial documentation.** Shows a lightweight, safety-focused implementation with blocklist/allowlist federation modes and authorized-fetch expectations. ([docs.gotosocial.org](https://docs.gotosocial.org/?utm_source=chatgpt.com))

### Corporate federation, bridges, and political economy

**Meta Engineering, Threads federation announcement, March 21, 2024.** Documents Threads’ opt-in ActivityPub federation for public adult profiles and remote follow/like/reply/repost interactions. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

**The Verge, Threads fediverse feed/search, June 17, 2025.** Reports Threads’ dedicated fediverse feed and search, while noting federation remains separate from the main Threads experience. ([theverge.com](https://www.theverge.com/news/688267/threads-fediverse-feed-search))

**Wired, Fediverse responses to Meta/Threads, July 2023.** Captures early community conflict over whether to preemptively block Meta and what corporate scale could do to a small federated ecosystem. ([wired.com](https://www.wired.com/story/metas-threads-could-make-or-break-the-fediverse))

**FediverseSharing study, 2025.** Empirical work on Threads and Mastodon interactions after Threads entered the Fediverse, useful for studying corporate-entry effects beyond speculation. ([arxiv.org](https://arxiv.org/abs/2502.17926?utm_source=chatgpt.com))

### Governance, moderation, and social research

**Kissane and Kazemi, “Governance on Fediverse Microblogging Servers,” August 20, 2024.** Major governance study emphasizing moderation strength, informal leadership, federated diplomacy, burnout, funding, tooling, legal, and technical risks. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

**Zhang, Hwang, Liu, Ribeiro, and Monroy-Hernández, “Community-level Blocklists,” CSCW 2025.** Studies blocklists as a key Fediverse moderation practice and analyzes variation in goals, criteria, transparency, opacity, and over-blocking concerns. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Colglazier, TeBlunthuis, and Shaw, “Effects of Group Sanctions,” 2024.** Empirical analysis of defederation showing reduced activity on blocked servers but no clear evidence of reduced toxicity. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

**Anaobi et al., “Will Admins Cope?”, 2023.** Studies moderation burden and admin strategies as the Mastodon user base grows, especially resource strain on larger instances. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

**Spencer-Smith, “Labour pains,” 2025.** Investigates moderation labor in Mastodon communities and how admins/moderators manage community safety. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges?utm_source=chatgpt.com))

**“Federating Governance: How Community Rules Scale with Mastodon Instances,” 2026.** Finds that community size predicts rule development, with larger servers developing more extensive and topically diverse but often less readable rules. ([arxiv.org](https://arxiv.org/abs/2606.05069?utm_source=chatgpt.com))

**“Seeing the Politics of Decentralized Social Media Protocols,” 2025.** Compares ActivityPub, AT Protocol, Nostr, and Farcaster, arguing that protocol designs distribute control differently and encode political values. ([arxiv.org](https://arxiv.org/abs/2505.22962?utm_source=chatgpt.com))

**Xavier, critical analysis of Fediverse decentralization, 2024.** Argues that the Fediverse faces challenges fulfilling decentralization promises, drawing on protocol analysis, statistics, and comparison with older decentralized systems. ([arxiv.org](https://arxiv.org/abs/2408.15383?utm_source=chatgpt.com))

**Data Ethics in the Fediverse, 2025.** Examines how research can violate instance policies and community expectations, a crucial concern for studying publicly reachable but socially governed federated data. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

---

## Bottom line

ActivityPub creates a powerful affordance: **independently governed servers can exchange typed social activities among globally identified actors through inbox/outbox delivery**. From that affordance follow many possible social forms: microblogs, forums, video channels, livestreams, book communities, blogs, CMS publications, bridges, bots, archives, and corporate gateways.

But the protocol does not guarantee liberation, democracy, safety, privacy, portability, or interoperability. Those are produced—or undermined—by implementation choices, admin labor, moderation tooling, funding, search and bridge design, instance governance, and the political economy of infrastructure. The Fediverse is therefore not best described as “decentralized social media.” It is an uneven, contested, ActivityPub-conformant social web in which technical affordances become social structure only through software, governance, and care.
