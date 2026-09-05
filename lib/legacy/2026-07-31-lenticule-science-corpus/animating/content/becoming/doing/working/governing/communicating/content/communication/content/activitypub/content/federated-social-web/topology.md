---
title: Fediverse Topology, Sheaves, Fibers, and Graph Intelligence
description: Research memo modeling the Fediverse as a federated, typed, temporal, multilayer socio-technical graph fibered over instances, software, visibility regimes, and governance contexts, best captured as a presheaf or stack of local typed graphs that glue only when identity, delivery, semantics, visibility, signatures, and moderation acceptance agree. Treats defederation, lossy bridges, incompatible features, follower-only visibility, deleted objects, and moderation disagreement as obstructions to gluing rather than data errors.
keywords: ["fediverse", "topology", "sheaf", "presheaf", "fiber", "graph-theory", "gluing-obstruction", "federation-graph"]
---

# Research memo: Fediverse topology, sheaves, fibers, and graph intelligence  
**Status:** current to **2026-06-11**.  
**Scope:** the ActivityPub-conformant social Web, not Mastodon alone.

## Abstract

The Fediverse is best modeled neither as “a graph” nor as “a decentralized platform,” but as a **federated, typed, temporal, multilayer socio-technical graph fibered over instances, software, visibility regimes, and governance contexts**. ActivityPub supplies actor/object/activity semantics, inbox/outbox delivery, addressing, follows, likes, shares, deletes, and blocks; but it does not produce a single coherent global database. Servers cache, filter, transform, sign, reject, delete, block, bridge, and reinterpret objects under local software affordances and policy regimes. ActivityPub itself is a W3C Recommendation from 2018; its server-to-server model delivers activities to actor inboxes, and ActivityPub objects are expected to have globally unique identifiers, but many observable structures are partial, filtered, cached, or locally transformed. ([w3.org](https://www.w3.org/TR/activitypub/))

The strongest mathematical model is therefore a **presheaf or stack of local typed graphs**: each instance has local sections consisting of the actors, objects, activities, policies, caches, timelines, reports, and trust decisions visible there. These sections glue only when identity, delivery, software semantics, visibility, signatures, and moderation acceptance agree. Defederation, lossy bridges, incompatible software features, follower-only visibility, deleted objects, account moves, and moderation disagreement are not data errors; they are **obstructions to gluing**.

The practical research program should combine typed temporal graphs, multilayer networks, hypergraphs, sheaves on graphs, category-theoretic translation maps, and ethical aggregate-only metrics. The central warning is that graph intelligence on the Fediverse easily becomes surveillance of small communities, moderators, marginalized publics, and inter-instance trust networks. Instance policies and research-ethics work show that Fediverse data collection is often explicitly restricted by local norms, and prior Mastodon-data research has not always respected those policies. ([arxiv.org](https://arxiv.org/abs/2505.07606))

---

## Core thesis

The Fediverse should be modeled as a **federated fibered graph system**:

\[
\mathcal F : \mathcal B^{op} \to \mathbf{TypedTemporalGraphs}
\]

where the base \(\mathcal B\) is not merely a set of servers. Its objects are situated observation contexts such as:

\[
U = (\text{instance}, \text{software/version}, \text{policy regime}, \text{visibility stratum}, \text{time window}, \text{query/public})
\]

and \(\mathcal F(U)\) is the locally observable typed graph of actors, objects, activities, policies, reports, blocks, follows, boosts, replies, tags, bridges, and caches in that context.

This is usually a **presheaf**, not a clean sheaf. The sheaf condition says that compatible local data on overlapping contexts should glue to a unique global object. The Fediverse routinely violates both existence and uniqueness of gluing. Content may be visible on one instance and absent on another; an actor may be trusted locally but blocked remotely; a bridge may translate posts while losing polls, event semantics, formatting, or moderation metadata; a moved account may retain a handle but lose reputation; a reply tree may be complete from one server and fragmented from another. The mathematics should preserve those failures rather than smoothing them away.

---

## 1. Protocol facts versus social facts

ActivityPub defines a decentralized social networking protocol based on ActivityStreams 2.0, with both client-to-server and server-to-server APIs. Server-to-server federation works by posting activities to actors’ inbox endpoints; clients and servers use ActivityStreams objects, collections, actors, and activities such as `Create`, `Follow`, `Accept`, `Reject`, `Update`, `Delete`, `Like`, `Announce`, and `Block`. ([w3.org](https://www.w3.org/TR/activitypub/))

But “ActivityPub-conformant” does not imply one uniform social ontology. PeerTube represents video channels as `Group` actors and videos through video metadata and activities; Lemmy maps communities to `Group`, users to `Person`, posts to `Page`, and comments to `Note`; Owncast exposes a single `Service` actor for a livestream; WordPress ActivityPub can expose blog-wide and author profiles; BookWyrm extends ActivityPub with book-specific activities; Pixelfed, Misskey-family software, GoToSocial, Akkoma/Pleroma, WriteFreely, Ghost, Threads, Bridgy Fed, Bonfire, and other implementations each introduce distinct affordances and constraints. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub))

Mastodon remains important, especially because its implementation choices influence the de facto protocol layer. Its documentation now discusses signed cross-server requests, limited federation mode, partial follower synchronization, quote-post interaction policies, and content-warning affordances. Those are not merely UI details; they change what graph edges can be observed, delivered, trusted, or rendered. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

A current model also has to include corporate and bridge actors. Threads began limited ActivityPub federation in 2024 for public profiles in supported regions, with initially limited feature coverage; Ghost has been developing ActivityPub/social-web publishing and reading as an open-source add-on; Bridgy Fed translates interactions across networks, but its own documentation warns that formatting, events, polls, moderation, blocks, labels, and signatures do not translate perfectly. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

---

## 2. Candidate mathematical objects

| Object | What it captures well | Fediverse example | What it misses | Use |
|---|---|---|---|---|
| Simple directed graph | Follows, replies, blocks, instance links | Actor \(a\) follows actor \(b\); instance \(i\) blocks instance \(j\) | Types, time, visibility, local policy, deleted or hidden edges | Only for coarse first approximations |
| Typed temporal multigraph | Multiple relation types over time | Follow, reply, boost, like, mention, report, defederation, bridge translation | Higher-order conversations and local-to-global inconsistency | Core empirical model |
| Multilayer network | Separate but coupled layers | Actor layer, instance layer, software layer, topic layer, moderation layer | Gluing failure and local semantics | Necessary but insufficient; multilayer network theory is designed for heterogeneous, time-varying systems. ([academic.oup.com](https://academic.oup.com/comnet/article/2/3/203/2841130)) |
| Hypergraph / simplicial complex | Multi-actor events and conversations | A Lemmy post involves author, community `Group`, commenters, voters, remote instances | Direction, policy, visibility, local disagreement | Good for conversations, topics, reports, and moderation incidents |
| Presheaf / sheaf on a base of contexts | Local observations and conditions for gluing | Instance-local timelines, caches, follower collections, report queues, blocklists | May over-formalize if data are poor | Best conceptual model |
| Stack / fibered category | Non-unique gluing, translations, equivalences | Same post rendered differently by Mastodon, Misskey, Bridgy Fed, Threads, Ghost | Harder to compute | Best high-level mathematical object |
| Category of servers, actors, activities, bridges | Delivery, translation, trust, migration | Inbox delivery, WebFinger resolution, Move, bridge translation | Metrics are less direct | Best for protocol semantics |
| Topological data analysis | Holes, cuts, persistent communities, bridges | Defederation cuts, topic clusters, relay/bridge corridors | Risk of false geometric interpretation | Use on safe aggregate projections |

The key mathematical point is that **graphs are fibers, not the whole object**. A local graph observed from one server is a section over one context. The Fediverse itself is closer to a family of related local graphs with restriction maps, failed gluing, and policy boundaries.

---

## 3. Base space: what is the Fediverse “over”?

There is no single natural base space. Several bases are useful, and the right choice depends on the question.

| Base | Object | Use | Danger |
|---|---|---|---|
| Instance base \(B_I\) | Servers/domains as nodes | Federation, defederation, hosting, moderation, cost, trust | Treats users as passengers of servers only |
| Actor base \(B_A\) | ActivityPub actors | Follow, reply, boost, identity, migration | Ignores instance governance and software mediation |
| Object/conversation base \(B_O\) | Posts, videos, books, streams, comments | Thread completeness, cascades, archives | Assumes object identity is stable across renderings |
| Software base \(B_S\) | Implementations and versions | Compatibility, FEPs, feature loss | Flattens culture and governance into software |
| Policy base \(B_P\) | Moderation rules, blocklists, report practices | Governance topology, boundaries, care labor | Risks exposing sensitive defensive infrastructure |
| Visibility base \(B_V\) | Public, unlisted, followers-only, local-only, direct, bridged | Who can see what | Often not ethically collectable |
| Situated context base \(\mathcal B\) | Tuples of instance, software, policy, visibility, time, query | Full socio-technical model | More complex, but most accurate |

The recommended base is the **situated context category** \(\mathcal B\). A morphism \(V \to U\) means that \(V\) is a restriction, projection, or local rendering of \(U\): a smaller time window, a lower-visibility view, a remote cached view, a software-specific projection, a policy-filtered view, or a bridge-translated view.

A **local section** over \(U\) is the data structure available in that context: local actors, remote actors known to the instance, cached remote objects, local posts, remote posts, follows, replies, boosts, hashtags, reports, moderation labels, block decisions, software capabilities, and rendering transformations.

A **global section** would be a coherent Fediverse-wide account of the same actors, objects, relations, policies, and meanings. In practice, global sections often do not exist.

---

## 4. Layered graph model

| Layer | Nodes | Edges / relations | Mathematical form | Notes |
|---|---|---|---|---|
| Actor graph | ActivityPub actors: `Person`, `Group`, `Service`, `Application`, etc. | Follow, mention, reply, like, boost, block, mute | Typed temporal directed multigraph | Do not assume all actors are people; PeerTube, Lemmy, Owncast, WordPress, BookWyrm, bots, bridges, and groups matter. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub)) |
| Instance graph | Domains / servers | Federation, delivery, allowlist, blocklist, silence, relay, shared inbox | Signed directed graph with boundary labels | Defederation is a boundary operation, not just edge absence. |
| Follow graph | Actors | `Follow` accepted by `Accept`; possibly private or filtered collections | Directed graph with partial observability | ActivityPub follow semantics require acceptance; Mastodon follower collections may be partial or filtered. ([w3.org](https://www.w3.org/TR/activitypub/)) |
| Reply graph | Objects and actors | `inReplyTo`, mentions, conversation links | Directed acyclic-ish graph, often fragmented | Research on decentralized moderation emphasizes incomplete conversations across servers. ([arxiv.org](https://arxiv.org/abs/2404.03048)) |
| Boost/share graph | Actors and objects | `Announce`, reposts, quotes/renotes | Temporal cascade graph | Mastodon, Misskey, Lemmy, and bridges treat shares/quotes differently. |
| Hashtag/topic graph | Hashtags, posts, actors, instances | Tag co-occurrence, participation, local trends | Bipartite or hypergraph | Topic visibility is policy- and software-mediated. |
| Block/defederation graph | Actors, instances, domains | Block, suspend, silence, reject media, limit federation | Boundary-labeled graph / cut system | Shared blocklists are governance infrastructure, not neutral data. ([arxiv.org](https://arxiv.org/html/2506.05522v1)) |
| Moderation report graph | Reports, reporters, reported actors, moderators, policies | Report, resolve, escalate, appeal | Sensitive hypergraph | Should usually remain private or aggregate-only. |
| Software compatibility graph | Implementations, versions, FEPs, extensions | Supports, partially supports, drops, translates | Typed graph / capability lattice | Capability negotiation remains uneven; FEP discussions explicitly address interoperability detection. ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/fep-9fde-mechanism-for-servers-to-expose-supported-operations/3999)) |
| Bridge graph | Networks, bridges, actors, transformed objects | Translate, mirror, opt in/out, block bridge | Functor with loss terms | Bridgy Fed documents imperfect translation and moderation mapping. ([fed.brid.gy](https://fed.brid.gy/docs)) |

---

## 5. Ecosystem table: why Mastodon is only one fiber

| Implementation / family | Affordance or actor-object structure | Modeling implication |
|---|---|---|
| Mastodon | Microblogging; content warnings; signed fetch / secure mode; partial follower synchronization; quote-post interaction policies in newer docs | Strongly shapes de facto semantics, but its local timeline, CW norms, and follower-sync behavior are one fiber, not the Fediverse. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/)) |
| Pixelfed | Image-centered social publishing using ActivityPub; docs discuss Pixelfed-specific extensions and compatibility fields | Media objects, alt text, sensitive flags, albums, and image affordances require richer object typing than text-note graphs. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html)) |
| PeerTube | Video federation; channels as `Group` actors owned by account actors; comments interact with textual platforms | Video objects and channel actors create hyperedges among account, channel, video, comments, and remote subscribers. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub)) |
| Lemmy / Mbin / Kbin lineage | Community-centered link aggregation; Lemmy maps Community to `Group`, Post to `Page`, Comment to `Note`; Mbin continues /kbin-like aggregator/microblogging patterns | Community actors mediate replies and votes; model as group-centered conversation hypergraphs, not individual-only timelines. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html)) |
| Misskey / Sharkey / Iceshrimp / forks | Misskey uses ActivityPub federation, Renote/share affordances, custom emoji, CWs, and instance-specific culture; Iceshrimp describes itself as an ActivityPub Misskey-family fork; Sharkey is a Misskey fork with added features | Requires software-family compatibility layer for reactions, renotes, note editing, custom emoji, MFM-like rendering, and fork-specific behavior. ([misskey-hub.net](https://misskey-hub.net/en/docs/for-users/resources/glossary//)) |
| Pleroma / Akkoma | Lightweight microblogging lineage; Akkoma documents compatibility with Mastodon and other ActivityPub software | Useful for moderation research because Pleroma/Akkoma expose different federation and moderation practices than Mastodon. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/)) |
| WriteFreely | Long-form/blog federation; following blogs from other Fediverse software; username changes can require refollowing | Identity and reputation transport are nontrivial; migration is not simply graph isomorphism. ([writefreely.org](https://writefreely.org/docs/main/writer/federation)) |
| BookWyrm | Book-centered social reading; uses ActivityPub plus BookWyrm-specific types; supports Follow, Block, Move, and book-related activities | Domain objects such as books, editions, reviews, shelves, and moves require typed semantic layers. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/activitypub.html)) |
| Owncast | Livestreaming; single `Service` actor; supports ActivityPub server-to-server, WebFinger, HTTP Signatures, NodeInfo, selected FEPs | Actor graph must include non-person service actors; incoming activities may be selectively ignored. ([github.com](https://github.com/owncast/owncast/blob/develop/FEDERATION.md)) |
| WordPress ActivityPub | Blog-wide and author profiles; posts appear in followers’ home feeds; tested with multiple Fediverse implementations | Blog publishing creates publication-feed fibers distinct from conversational microblogging. ([wordpress.org](https://wordpress.org/plugins/activitypub/)) |
| Ghost ActivityPub | ActivityPub/social-web publishing and reading under public beta/open-source add-on development | Newsletter/blog publishing adds a political-economy layer: publishers, subscriptions, readers, and social interactions meet federation. ([ghost.org](https://ghost.org/changelog/social-web-beta/)) |
| Threads federation | Large corporate platform with opt-in public-profile federation and initially limited feature coverage | Corporate-scale nodes can dominate flows and compatibility pressure; decentralization is not automatically anti-capitalist. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/)) |
| Bridgy Fed | Bridge across Fediverse, Bluesky/AT Protocol, IndieWeb, etc.; translates follows, blocks, labels, replies, and formats imperfectly | Model bridges as lossy functors, not identity maps. ([fed.brid.gy](https://fed.brid.gy/docs)) |
| Bonfire / GoToSocial | Bonfire emphasizes modular boundaries and privacy; GoToSocial emphasizes lightweight, safety-focused, chronological/non-recommendation use and allowlist/blocklist modes | Governance and affordance choices are first-class topology: some servers intentionally reduce discovery or restrict federation. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html)) |

---

## 6. Sheaf model

Let \(\mathcal B\) be the category of situated contexts. Define a presheaf:

\[
\mathcal F(U)
=
(A_U, O_U, E_U, P_U, M_U, C_U, R_U)
\]

where:

- \(A_U\): actors visible in context \(U\)
- \(O_U\): objects/posts/videos/comments/books/streams visible in \(U\)
- \(E_U\): typed temporal relations: follow, reply, boost, like, mention, tag, report, block, bridge, delete, move
- \(P_U\): local policy state: rules, allowlists, blocklists, silences, report categories
- \(M_U\): moderation state: labels, reports, decisions, appeals
- \(C_U\): software capability state: implementation, version, FEPs, extensions, rendering support
- \(R_U\): rendering/translation state: content-warning behavior, quote/renote support, bridge transforms, media handling

For a restriction \(V \to U\), the map

\[
\rho_{U,V}: \mathcal F(U) \to \mathcal F(V)
\]

drops, transforms, redacts, rejects, or reinterprets data. Examples include: public-to-followers-only restriction, remote cached copy to local timeline, Mastodon rendering of a Misskey note, Bridgy Fed translation of a Bluesky object, or an instance block that maps remote objects to \(\bot\).

### What is a local section?

A local section is the locally coherent graph-state available from one situated standpoint. For example, from `instance A` during week \(T\), under its software version and moderation policy, a local section might include:

\[
s_A =
\{\text{known actors, cached posts, local replies, accepted follows, blocked domains, reports, local timelines}\}
\]

This section is not “wrong” because it is partial. It is the actual social world available to that instance.

### What does it mean for data to glue?

Two local sections \(s_A\) and \(s_B\) glue over an overlap if they agree on:

1. ActivityPub IDs and object identity.
2. Actor identity and key/signature trust.
3. Delivery history and cache freshness.
4. Visibility permissions.
5. Delete, edit, move, and tombstone state.
6. Software-level interpretation.
7. Moderation acceptability.
8. Bridge translation equivalence.
9. Cultural or semantic rendering enough for the research question.

When these conditions hold, one can form a larger section \(s_{A \cup B}\). When they fail, the failure is an **obstruction**.

Sheaves on graphs are attractive here because they are explicitly designed to attach local data to graph elements and study how local relationships combine into global structure. ([jakobhansen.org](https://www.jakobhansen.org/publications/gentleintroduction.pdf)) But the Fediverse requires a presheaf/stack orientation because non-gluing is normal.

---

## 7. Federation obstructions

| Obstruction | Mathematical form | Fediverse example |
|---|---|---|
| Visibility mismatch | Restriction undefined or maps to \(\bot\) | Followers-only post visible on one server but not another |
| Defederation | Boundary/cut; edge removal with policy label | Instance A suspends instance B |
| Actor block | Local morphism rejected | ActivityPub `Block` says one actor does not want interaction, and servers should prevent interaction. ([w3.org](https://www.w3.org/TR/activitypub/)) |
| Signature failure | Trust morphism absent | HTTP Signatures are common de facto authentication, though not specified by ActivityPub itself. ([swicg.github.io](https://swicg.github.io/activitypub-http-signature/)) |
| Software incompatibility | Translation functor loses structure | Polls, quote policies, Markdown/MFM, custom emoji, events, labels, or book/video semantics |
| Cache divergence | Non-unique object state | One instance has an old copy, another has deletion/tombstone |
| Migration failure | Nontrivial transport / monodromy | WriteFreely username change can require refollowing; BookWyrm handles Move but requires confirmation. ([writefreely.org](https://writefreely.org/docs/main/writer/federation)) |
| Report privacy | Fiber cannot be published | Moderator reports are local confidential governance data |
| Cultural reinterpretation | Semantic fiber changes | A phrase, CW, quote, or meme has different meaning across instances |
| Bridge loss | Non-faithful functor | Bridgy Fed notes imperfect formatting, events, polls, moderation labels, and block translation. ([fed.brid.gy](https://fed.brid.gy/docs)) |

This is why “crawl the Fediverse graph” is usually the wrong research ontology. A crawler sees a shadow of many local sections, not the global object.

---

## 8. Defederation as boundary formation

Defederation should be modeled as **active boundary formation**, not missing data.

Let \(G_I(t)\) be the instance graph. An edge \(i \to j\) may carry delivery, acceptance, silence, block, allowlist, media-proxy, or signed-fetch status. A defederation action is a policy-labeled transformation:

\[
G_I(t) \longrightarrow G_I(t+1)
\]

that may remove or attenuate deliveries from \(j\) to \(i\), hide old content, reject future activities, or alter media handling.

This resembles a **cut** in the instance graph, but the cut has meaning: care, defense, anti-abuse work, political boundary, spam control, liability reduction, cultural autonomy, or sometimes overreach. Governance research emphasizes that Fediverse moderation is socio-technical, often volunteer-run, locally normed, and affected by burnout, legal concern, lack of tooling, peer diplomacy, and admin capacity. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

A public blocklist is not merely a list of bad servers. It is a shared policy object. Research on blocklists notes their importance for community-level moderation while also identifying concerns about opacity, overblocking, inconsistent criteria, and conflicting harm definitions. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

So the blocklist model should be:

\[
\mathcal P : \mathcal B^{op} \to \mathbf{PolicyLattices}
\]

where \(\mathcal P(U)\) contains local rules, domain dispositions, evidence thresholds, labels, provenance, import sources, and expiration/review state.

Shared blocklists are attempted sections of \(\mathcal P\). Conflicts between blocklists are not inconsistencies to eliminate automatically; they may encode real differences in safety needs, language communities, political commitments, and tolerance for collateral damage.

---

## 9. Attention as flow

Attention can be modeled as a time-dependent flow on a multilayer network:

\[
\phi_t : E_{\text{attention}} \to \mathbb R_{\ge 0}
\]

with commodities such as local timeline exposure, home timeline exposure, boost cascades, hashtag search, link previews, replies, recommendations, bridge delivery, and external embeds.

But attention flow is not just popularity. It is constrained by:

- follows and accepted follows;
- instance blocks and silences;
- content warnings and media hiding;
- software defaults;
- search/discovery affordances;
- bridge translation;
- local timeline policies;
- chronological versus algorithmic feeds;
- server capacity and downtime;
- moderation interventions.

GoToSocial, for example, explicitly emphasizes chronological timelines and lack of recommendation algorithms, while Threads federation introduces a corporate-scale source of activity with limited and evolving federation semantics. ([docs.gotosocial.org](https://docs.gotosocial.org/))

Thus attention-flow metrics should be interpreted as **movement through governed pipes**, not as a measure of collective value.

---

## 10. Worked examples

### Example 1: Lemmy community post as hypergraph

A Lemmy community is modeled as a `Group`; a user is a `Person`; a post is a `Page`; a comment is a `Note`; the community actor forwards posts and comments through `Announce`. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html))

A single Lemmy thread is therefore not just:

\[
\text{user} \to \text{post}
\]

It is a hyperedge:

\[
(\text{author}, \text{community Group}, \text{post Page}, \text{comment Notes}, \text{voters}, \text{remote instances})
\]

Flattening this into a Mastodon-like reply tree loses the role of the community actor as a governance and distribution object.

### Example 2: PeerTube video as layered object

PeerTube federation shares video metadata through ActivityPub; channels are `Group` actors owned by account actors, and comments can interoperate with textual Fediverse platforms. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub))

A PeerTube video has at least four layers:

1. account actor;
2. channel actor;
3. video object;
4. comment/reply graph.

A boost graph alone misses subscription, channel governance, video hosting cost, transcoding infrastructure, and media moderation.

### Example 3: Mastodon follower-only post and partial gluing

Mastodon documentation describes followers-only delivery, partial follower synchronization, and signed/secure modes. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

Suppose actor \(x@A\) posts to followers only. Instance \(B\) has follower \(y@B\), while instance \(C\) does not. Then:

\[
s_B(o) = \text{visible}, \quad s_C(o) = \bot
\]

There is no global public section containing \(o\). Publishing \(o\) in a research graph as if it were public would be both mathematically wrong and ethically dangerous.

### Example 4: Shared blocklist as policy sheaf

Instances \(A\), \(B\), and \(C\) import a shared blocklist \(L\), but each modifies it locally:

\[
L_A \neq L_B \neq L_C
\]

The overlap is not a bug. It reflects local governance. A sheaf of policy should track provenance, local overrides, review dates, severity labels, and evidence thresholds, not only binary block/not-block values.

### Example 5: Bridgy Fed as lossy functor

A bridge from one network to another is a functor-like map:

\[
T : \mathcal C_{\text{source}} \to \mathcal C_{\text{target}}
\]

But Bridgy Fed’s own documentation notes that formatting, events, polls, moderation labels, blocks, and signatures may require imperfect translation. ([fed.brid.gy](https://fed.brid.gy/docs))

So \(T\) is not generally full, faithful, or essentially surjective. It may preserve enough structure for conversation, while losing enough structure to break moderation, consent, or meaning.

### Example 6: Account migration and reputation transport

WriteFreely documentation says changing a username creates a new handle and previous followers may need to refollow; BookWyrm documents `Move` semantics but also requires follower confirmation for migration. ([writefreely.org](https://writefreely.org/docs/main/writer/federation))

So identity migration is not simply:

\[
a \cong a'
\]

It is a transport problem with possible loss of followers, trust, moderation history, reputation, and social recognition. Mathematically, this resembles **parallel transport with holonomy**: moving around the network can return a formally similar identity but not the same social fiber.

---

## 11. Graph intelligence: what can be computed?

| Computation | Possible use | Risk |
|---|---|---|
| Instance-level federation graph | Detect centralization, bridges, isolated clusters, defederation cuts | Can expose defensive moderation topology |
| Temporal community detection | Track persistent communities and topic drift | Can flatten culture into clusters |
| Flow / cascade models | Study boost diffusion, hashtag movement, video spread | Can become virality engineering |
| Persistent homology | Detect holes, bridges, durable clusters | May overinterpret missing data |
| Defederation prediction | Study governance shocks and safety boundaries | Can assist harassment campaigns or evade moderation |
| Federated GNNs | Local model training without centralizing raw data | Still risks inference leakage and policy violation |
| Report-network analysis | Improve moderation tooling | Highly sensitive; should rarely leave the instance |
| Software compatibility graph | Identify broken feature translation | Can pressure smaller projects to conform to dominant software |

Recent research already points toward this direction. Fedivertex frames Fediverse graphs as useful datasets for decentralized machine learning and includes a defederation task; moderation research on decentralized conversation graphs emphasizes partial local views; a 2026 preprint proposes federated graph neural moderation where each instance keeps local data. These are promising technically, but they also raise severe privacy and governance questions. ([arxiv.org](https://arxiv.org/abs/2505.20882?utm_source=chatgpt.com))

---

## 12. Metrics: safe, aggregate-only, or private

| Metric | Publication level | Reason |
|---|---|---|
| Number of known instances by software family | Public aggregate, with methodology caveats | Directories such as Fediverse Observer and FediDB are useful sampling frames, but not perfect censuses. ([fediverse.observer](https://fediverse.observer/)) |
| Software compatibility matrix | Public if based on documentation/tests | Helps implementers; avoid ranking communities |
| Instance-level uptime / version exposure | Aggregate or opt-in | Can expose vulnerable small servers |
| Public instance block counts | Aggregate, binned | Exact lists may endanger moderators or facilitate evasion |
| Raw blocklists | Context-dependent; often sensitive | Shared blocklists are defensive infrastructure |
| Actor-level follows | Usually private or consent-based | Social graph can expose marginalized users |
| Follower-only content | Private | Not public data |
| Moderation reports | Private; local aggregate only | Contains sensitive harm, identity, and labor data |
| Bridge opt-in/out patterns | Aggregate only | Can reveal cross-network identity choices |
| Centrality of small instances | Aggregate or suppressed | Can identify vulnerable community hubs |
| Topic participation on small instances | Aggregate with \(k\)-anonymity thresholds | Topic graphs can reveal political, health, sexuality, or identity publics |

The safest rule: **publish topology at the coarsest level compatible with the research question**. Do not publish raw graph data merely because it can be fetched.

---

## 13. Risks and failure modes

### Mathematical risks

The biggest mathematical error is treating absence as nonexistence. A missing edge may mean no relation, blocked delivery, hidden visibility, deleted object, unsupported software, stale cache, unreachable server, private account, bridge loss, or ethical non-collection.

A second error is treating URL identity as social identity. ActivityPub IDs help object identity, but social meaning depends on rendering, trust, account history, software semantics, migration, and local policy.

A third error is flattening instance culture into scalar scores. “Safety,” “civility,” “toxicity,” “openness,” and “centrality” are not neutral mathematical variables. They are contested social categories.

### Governance risks

Governance research stresses that Fediverse moderation is not automatically democratic or liberatory. Many servers are run by individuals or small teams; governance can be informal, autocratic, opaque, exhausted, caring, experimental, or all of these at once. The 2024 Kissane/Kazemi report explicitly warns that good governance is not innate to the Fediverse and documents risks such as bus factor, finance, legal liability, burnout, brittle leadership, and tooling gaps. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

### Political-economy risks

Federation does not abolish capital or scale asymmetry. Hosting costs, admin labor, software maintenance, moderation work, legal exposure, corporate federation, app-store dynamics, search visibility, and default client affordances all shape topology. Threads, Ghost, WordPress, and large hosted services must be modeled as political-economic actors, not merely additional nodes. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

### Research-ethics risks

Fediverse graph research can expose vulnerable publics. A dataset of follows, blocks, reports, bridges, or local timelines may become a map for harassment, surveillance, deanonymization, or moderation evasion. Research on Mastodon-data ethics found that instance policies often explicitly prohibit data collection, yet prior studies showed limited adherence to those local expectations. ([arxiv.org](https://arxiv.org/abs/2505.07606))

---

## 14. Open questions

1. **What is the right base category?** Instances are natural, but insufficient. A better base combines instance, software, policy, visibility, time, and query context.

2. **When are two rendered posts equivalent?** Is a Misskey note with MFM, emoji reactions, and quote context equivalent to its Mastodon rendering? Usually only relative to a research purpose.

3. **Can blocklists be audited without exposing defensive infrastructure?** A policy sheaf needs provenance and accountability, but public raw lists can harm moderators and targets alike.

4. **Can instance culture be modeled non-reductively?** Promising approaches include qualitative fibers, rule-text embeddings with human interpretation, narrative codes, and community self-description. Avoid global culture scores.

5. **Can federated graph learning respect local policy?** Technically, yes in part; ethically, only if local consent, policy, privacy budgets, and opt-out mechanisms are built into the protocol of research.

6. **What counts as a bridge?** Bridgy Fed, Threads, Ghost, WordPress, Flipboard-like systems, relays, RSS/AP converters, bots, and archive mirrors all move content across boundaries differently.

7. **How should persistent homology interpret holes?** A hole may be a real community boundary, a defederation cut, a missing crawl, a private-public boundary, or an ethical non-observation.

8. **What is reputation transport?** Account migration, handle changes, domain moves, and bridge identities require models of trust transport that are not reducible to identifier persistence.

9. **Can local moderation reports produce global safety knowledge?** Perhaps only through differentially private, opt-in, local-first aggregate systems.

10. **What metrics should never be public?** Raw report networks, small-instance actor graphs, exact defensive block topology, and follower-only interaction graphs are strong candidates.

---

## 15. Annotated bibliography

**W3C ActivityPub Recommendation.** The protocol anchor: actors, inboxes, outboxes, collections, activities, addressing, follows, likes, shares, blocks, deletes, and server-to-server delivery. Essential, but insufficient for de facto Fediverse behavior. ([w3.org](https://www.w3.org/TR/activitypub/))

**ActivityPub and HTTP Signatures / SWICG note.** Important because ActivityPub itself does not fully specify authentication practice; Fediverse implementations widely rely on HTTP signatures and custodial server-held keys. This shapes trust topology. ([swicg.github.io](https://swicg.github.io/activitypub-http-signature/))

**Mastodon ActivityPub documentation.** Important for de facto behavior: secure mode, signed requests, content warnings, partial follower sync, quote controls, and limited federation. Use as one major implementation, not as the universal model. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

**Pixelfed, PeerTube, Lemmy, Mbin, Misskey, Akkoma, WriteFreely, BookWyrm, Owncast, WordPress, Ghost, Threads, Bridgy Fed, Bonfire, GoToSocial documentation.** These sources show that the ActivityPub Web is multi-software and multi-ontology: images, videos, groups, books, blogs, streams, bridges, corporate federation, and safety-focused servers all produce different graph fibers. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

**Kissane and Kazemi, “Governance on Fediverse Microblogging Servers” (2024).** Crucial governance source. It treats governance as socio-technical practice and foregrounds local norms, federated diplomacy, burnout, finance, bus factor, policy gaps, and moderation tooling. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

**Blocklist research.** Useful for modeling blocklists as policy sheaves: shared defensive infrastructure with opacity, overblocking, and conflicting criteria. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Pleroma and decentralized moderation studies.** Important for partial conversation graphs, moderation-policy effects, and the fact that conversation data are fragmented across servers. ([arxiv.org](https://arxiv.org/abs/2110.13500))

**Fedivertex dataset paper (2025).** Useful for benchmarking decentralized learning on Fediverse graphs and for treating defederation as link deletion rather than noise. ([arxiv.org](https://arxiv.org/abs/2505.20882?utm_source=chatgpt.com))

**DeTox-Fed preprint (2026).** A recent example of federated graph learning for moderation, useful but ethically sensitive because it models local conversation graphs and toxicity detection across instances. ([arxiv.org](https://arxiv.org/abs/2605.21054))

**Fediverse governance and decentralization critique.** Important corrective against mythology: decentralization does not guarantee liberation, democracy, safety, or resistance to centralization. ([arxiv.org](https://arxiv.org/abs/2408.15383?utm_source=chatgpt.com))

**Hansen, “A gentle introduction to sheaves on graphs.”** Useful mathematical background: sheaves attach local data to networks and study how local relationships combine into global structure. ([jakobhansen.org](https://www.jakobhansen.org/publications/gentleintroduction.pdf))

**Multilayer network theory.** Provides the correct network-science vocabulary for heterogeneous systems with multiple kinds of nodes, edges, layers, and temporal dynamics. ([academic.oup.com](https://academic.oup.com/comnet/article/2/3/203/2841130))

---

## Bottom line

The Fediverse is not one graph. It is a **governed family of local graphs** whose partial overlaps are mediated by ActivityPub, software affordances, signatures, visibility rules, moderation, bridges, and culture.

The best mathematical object is:

> a **typed temporal multilayer hypergraph-valued presheaf or stack over situated instance contexts**, with defederation and incompatibility represented as boundary conditions and obstructions to gluing.

That model is strong because it treats local governance, partial observation, moderation, software difference, and ethical non-publication as part of the topology rather than as inconveniences to be normalized away.
