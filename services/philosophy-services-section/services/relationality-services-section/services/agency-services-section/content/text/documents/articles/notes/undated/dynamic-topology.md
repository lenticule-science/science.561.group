---
title: The Fediverse as a Dynamic ActivityPub Federation Graph
description: Topology memo arguing the Fediverse is not one graph but a multiplex, temporal, partially observable, socially governed graph whose shape changes with what is measured, actor follows, server deliveries, software interoperability, relays, blocklists, topic publics, or cross-protocol bridges. Describes the realized network as clustered, archipelagic, core-periphery, and discontinuously cut by governance decisions rather than simply decentralized or scale-free, produced by software defaults, moderation, hosting costs, bridges, and admin labor.
keywords: ["fediverse", "dynamic-topology", "federation-graph", "multiplex-network", "relays", "blocklists", "core-periphery", "nodeinfo"]
---

# Topology memo: the Fediverse as a dynamic ActivityPub federation graph  
**Access date:** June 11, 2026  
**Scope:** ActivityPub-conformant and ActivityPub-adjacent Web: Mastodon, Pixelfed, PeerTube, Lemmy/Mbin/Kbin, Misskey-family forks, Pleroma/Akkoma, WriteFreely, BookWyrm, Owncast, WordPress ActivityPub, Ghost ActivityPub, Threads federation, Bridgy Fed, Bonfire, GoToSocial, relays, public blocklists, and emerging implementations.

## Abstract

The Fediverse is not one graph. It is a **multiplex, temporal, partially observable, socially governed graph** whose “shape” changes depending on whether one measures actor follows, server deliveries, software interoperability, relays, blocklists, topic publics, or cross-protocol bridges. ActivityPub supplies a federation protocol for distributing activities among actors on different servers, but the realized network is produced by software defaults, moderation rules, discovery surfaces, signed-fetch policies, admin labor, hosting costs, bridges, and corporate gateway decisions. The best current description is **clustered, archipelagic, core-periphery, and discontinuously cut by governance decisions**, rather than simply “decentralized” or “scale-free.” ActivityPub formally defines client-to-server and server-to-server federation layers, with server-to-server distribution tying actors on different servers into a shared social graph; WebFinger and NodeInfo provide common discovery and server metadata surfaces, but both are privacy-sensitive and incomplete. ([w3.org](https://www.w3.org/TR/activitypub/))

## Core thesis

The Fediverse is best modeled as a **dynamic federation topology with at least six coupled layers**:

1. **Actor graph:** follows, replies, mentions, boosts/announces, likes, group/community memberships.
2. **Instance graph:** server-to-server delivery, observed peers, follows between instances, cache visibility, signed fetch, allowlist/blocklist reachability.
3. **Software graph:** Mastodon-compatible microblogging, Lemmy-style group/community fanout, PeerTube instance-follow/video topology, Pixelfed media graphs, BookWyrm bibliographic graphs, blog/publisher actors, livestream actors, and fork-specific extensions.
4. **Moderation graph:** silence/limit/suspend/reject-media/report-rejection/domain-allow policies, public and private blocklists, relay exclusion, and opt-in limited federation.
5. **Discovery graph:** local/federated timelines, hashtags, search, relays, directories, Fediverse Observer/FediDB-style crawlers, recommendation systems, and publisher feeds.
6. **Bridge and corporate graph:** Threads, WordPress, Ghost, Bridgy Fed, and other gateways that create high-centrality boundary nodes rather than merely adding more users.

So the question is not “is the Fediverse decentralized?” but: **which layer is decentralized, for whom, under which moderation regime, and with what failures or choke points?**

---

## 1. What are the meaningful nodes and edges?

| Layer | Meaningful nodes | Meaningful edges | What the edge means | Observability | Main ethical risk |
|---|---|---|---|---|---|
| Actor graph | ActivityPub actors: people, groups, services, bots, apps | Follow, Accept, Create, Announce, Like, Reply, Mention | Social relation or activity delivery | Partly exposed by actor JSON, timelines, APIs, logs | Reconstructing personal networks, stalking, exposing small communities |
| Instance graph | Domains / servers / hosts | Delivery, shared actors, known peers, platform follows, federation capability | Server A can or does exchange AP activity with server B | NodeInfo, peer APIs, crawls, admin logs, datasets | Treating incomplete crawler view as total reality |
| Moderation graph | Instances, admins, blocklists, policy objects | Silence, suspend, limit, reject media, allowlist, report rejection | Governance cut, friction, or filtering relation | Public about pages, APIs, blocklists, admin disclosures | Exposing sensitive safety strategies |
| Relay graph | Relays, relay actors, subscribing instances | Relay subscription, Accept/Follow, Announce fanout | Shortcut distribution of public posts | Relay pages, server config, delivery logs | Mapping dependence on fragile infrastructure |
| Software graph | Mastodon, Misskey, Lemmy, PeerTube, Pixelfed, etc. | Successful interop of object/activity types | Whether software can meaningfully see, render, reply, moderate | Docs, tests, issue trackers, conformance tests | Mistaking nominal AP compatibility for practical interop |
| Topic/public graph | Hashtags, communities, languages, media genres, identity publics | Co-tagging, cross-posting, follow overlap, reply chains | Formation of publics across servers | Search, public timelines, sampled posts | Exposing marginalized publics to harassment |
| Bridge graph | Threads, WordPress, Ghost, Bridgy Fed, Flipboard-like publisher nodes | Protocol translation, federated profile following, cross-network replies | Gateway between AP and corporate/publisher/other-protocol systems | Docs, bridge repos, observed profiles | Corporate capture, consent mismatch, synthetic identity confusion |

---

## 2. The likely macro-shape: not one topology, but several overlapping ones

### A. Core-periphery, but only on some layers

Large general-purpose servers such as major Mastodon instances function as **gravity wells**: they host many actors, generate many outbound follows, appear in many federated timelines, and are frequent default references in documentation and journalism. But this is not the whole story. A Mastodon-focused 2024 study found that new accounts on the largest general instances were less likely to remain potential than those on smaller or more focused servers, and that account migrations tended to move from larger to smaller or niche servers; it also emphasizes that local and federated timelines create server-specific discovery conditions. ([workshop-proceedings.icwsm.org](https://workshop-proceedings.icwsm.org/pdf/2024_43.pdf))

**Interpretation:** large instances increase reachability and visibility, but may also produce weaker local identity, worse moderation load, and less durable attachment. Their centrality is infrastructural and discursive, not necessarily affective or community-positive.

### B. Clustered by software family

Software strongly shapes topology. Lemmy communities behave differently from Mastodon accounts; PeerTube instances follow other video platforms and can mirror/redundantly serve media; Pixelfed emphasizes image-sharing actors; BookWyrm extends ActivityPub around books and reviews; WriteFreely, WordPress, and Ghost produce publisher/blog actor topologies rather than primarily conversational timelines. Pixelfed documents ActivityPub interoperability with other Fediverse software; Lemmy maps communities to ActivityPub Groups, posts to Pages, comments to Notes; PeerTube federation is based on instances following compatible servers; BookWyrm uses ActivityPub for statuses and book data; and WordPress ActivityPub exposes blog-wide and author-level federated profiles. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com))

**Interpretation:** there is no neutral “Fediverse user graph.” There are microblog graphs, community graphs, media graphs, bibliographic graphs, publishing graphs, and bridge graphs that overlap unevenly.

### C. Archipelagic rather than flat

Small-community and single-user instances can be autonomous but not automatically visible. A blog or single-user server with no followers may technically be federated but socially unseen. WordPress ActivityPub explicitly notes that if no one follows a blog, posts remain unseen in the Fediverse; WriteFreely similarly frames federation through people following a blog from Mastodon/Pleroma/other ActivityPub platforms. ([wordpress.org](https://wordpress.org/plugins/activitypub/))

**Interpretation:** ActivityPub gives addressability, not automatic publicness. The topology is “archipelagic”: islands become visible through follows, relays, hashtags, directories, bridges, and large-server timelines.

### D. Fragmented by moderation cuts

Mastodon documents whole-domain moderation actions including limiting, suspending, rejecting media, and blocklisting; Mastodon’s API exposes domain-block severity values such as `silence`, `suspend`, and `noop`. It also supports limited federation mode, which restricts federation to manually approved servers and effectively creates an allowlisted silo. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/))

Community blocklists are a major topological force. A 2025 blocklist study argues that community-level blocklists are a key tool for preventing bad-faith communities from interacting, but also finds variation in goals, inclusion criteria, transparency, and risks of overblocking or norm conflict. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Interpretation:** defederation is not a side issue; it is one of the main graph operations. It deletes, attenuates, or filters edges and can protect communities while also producing collateral isolation.

### E. Corporate federation creates boundary hubs

Threads federation is opt-in and has been rolled out incrementally. Meta says Threads is working toward compatibility with open interoperable networks, and by June 2024 users who enabled sharing could see and like replies from other fediverse servers. In 2025, Threads added a dedicated fediverse feed/search surface, but reporting noted that federated posts remained separated from the main Threads experience and not fully first-class. ([about.fb.com](https://about.fb.com/news/2023/07/introducing-threads-new-app-text-sharing/))

Ghost launched ActivityPub beta support for Ghost(Pro) in March 2025, allowing people on platforms such as Mastodon, Pixelfed, and Threads to follow Ghost content and comment; Ghost’s own 2024 materials described ActivityPub as a way to federate with Mastodon, Threads, Flipboard, WriteFreely, Tumblr, WordPress, PeerTube, Pixelfed, and others. ([theverge.com](https://www.theverge.com/news/632880/ghost-newsletter-blog-fediverse-activitypub-beta-live))

**Interpretation:** corporate and publisher federation does not simply “add nodes.” It creates **gateway centrality**, new moderation jurisdiction problems, new discovery asymmetries, and new questions about whose norms govern cross-network interaction.

---

## 3. Software topology comparison

| Software / family | Primary topology | Characteristic edges | Topological effect | Risk / uncertainty |
|---|---|---|---|---|
| Mastodon / compatible forks | Person-to-person microblog graph | Follows, boosts, replies, domain blocks | Large visible hubs; local/federated timelines create server-specific publics | Mastodon often overrepresents “the Fediverse” in datasets and narratives |
| Pixelfed | Image-centered actor graph | Follows, likes, comments, image activities | Media publics bridge into Mastodon-like timelines | Media UI differences alter visibility |
| PeerTube | Video/channel/instance graph | Instance follows, video federation, possible redundancy | Platform-follow topology; high storage/bandwidth costs | Heavy media nodes are more infrastructure-sensitive |
| Lemmy / Mbin / Kbin | Group/community graph | Community subscription, posts/comments/votes, mod actions | Community host acts as fanout center | Not equivalent to microblog follower graph |
| Misskey / Sharkey / Iceshrimp | Microblog plus richer reactions/drive/extensions | Follows, reactions, notes, AP interop | Fork clusters with UI and object-extension differences | Compatibility varies by fork/version |
| Pleroma / Akkoma | Microblog graph with strong policy layer | Message Rewrite Facility, relays, custom policies | Admin policy can transform or drop flows before users see them | Invisible topology changes if policies are private |
| GoToSocial | Small/lightweight AP server | Signed server-to-server GET/POST, microblog follows | Good for small/single-community nodes; stricter fetch behavior | Signed-fetch compatibility can affect reachability |
| WriteFreely | Blog/follower graph | Blog posts delivered to followers | Publisher island; reader-follow topology | Low visibility without followers |
| WordPress ActivityPub | Blog and author profile graph | Blog/author follows, post delivery, replies | Mass publishing surface enters AP | WordPress scale could alter topology sharply |
| Ghost ActivityPub | Newsletter/blog/publisher graph | Followed publication feeds, comments/replies | Professional publishing enters AP | Governance differs from small-community fediverse norms |
| BookWyrm | Bibliographic social graph | Follows, reviews, book metadata, statuses | Topic graph tied to books and metadata | Extended objects may be most meaningful inside BookWyrm |
| Owncast | Livestream/event graph | Single-server livestream actor, chat/social announcements | Star-like, temporal, bandwidth-heavy node | Live events create bursty traffic |
| Bonfire | Boundary/privacy-oriented social graph | AP objects plus custom boundaries/experimental FEPs | More explicit social-boundary topology | Emerging; interoperability still evolving |
| Threads / Flipboard / publishers | Corporate/publisher gateway graph | Opt-in federated profiles, follows, replies | Very high potential centrality | Corporate policy can reshape reachability suddenly |
| Bridgy Fed | Cross-protocol bridge graph | AP ↔ AT Protocol ↔ IndieWeb translation | Creates synthetic cross-network edges | Bridge outage/policy becomes network cut |

Bridgy Fed explicitly describes itself as connecting decentralized social-network protocols including ActivityPub, AT Protocol, and IndieWeb, translating profiles, likes, reposts, mentions, follows, and related interactions; Bluesky’s 2023 discussion described the bridge goal as bidirectional interaction across supported decentralized networks. ([github.com](https://github.com/snarfed/bridgy-fed))

---

## 4. Graph models to use

### Model A: Multiplex temporal graph

Let:

\[
G_t = (V_t, E_t, L, \tau)
\]

where nodes include actors, instances, software packages, relays, topics, blocklists, and bridges; edges are typed by layer; and `t` tracks snapshots.

Edge types should include:

| Edge type | Direction | Weight | Example |
|---|---:|---:|---|
| `actor_follows_actor` | Directed | Follow age, interaction count | `@a@x` follows `@b@y` |
| `instance_delivers_to_instance` | Directed | Activity count, unique actors, success rate | server X sends Create/Announce to Y |
| `instance_blocks_instance` | Directed | Severity | X suspends/limits Y |
| `instance_subscribes_relay` | Directed/bipartite | Public activity volume | X subscribes to relay R |
| `software_interops_with_software` | Directed/weighted | Successful object round trips | Lemmy Group post visible on Mastodon |
| `actor_uses_topic` | Bipartite | Post count, time decay | actor uses hashtag/community/topic |
| `bridge_translates_actor` | Directed/proxy | Translated activity count | Bridgy Fed proxy actor connects AP and Bluesky |

### Model B: Signed governance graph

Moderation should not be represented as missing data. It is a graph layer:

| Sign | Edge | Meaning |
|---|---|---|
| Positive | Follow, relay, delivery, allowlist | Enables circulation |
| Negative | Silence, suspend, reject media, reject reports | Blocks or attenuates circulation |
| Ambiguous | Limited federation, authorized fetch, private block | Makes circulation conditional or unobservable |

### Model C: Hypergraph for group/community systems

Lemmy-style communities should often be modeled as **hyperedges** rather than simple pairwise follows. Lemmy maps ActivityPub `Community` to `Group`, posts to `Page`, and comments to `Note`; federation discussions describe actions such as upvotes being sent to the community’s home server, which then forwards to instances where at least one user follows the community. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html?utm_source=chatgpt.com))

**Implication:** a Lemmy community hosted on one instance can connect many otherwise weakly connected instances through a group-centered fanout pattern.

---

## 5. Metrics

| Research question | Useful metrics |
|---|---|
| Is the network scale-free? | Degree distributions by layer; compare power-law, lognormal, truncated power-law; do not assume scale-free without model comparison |
| Is it clustered? | Modularity, assortativity by software/language/region/topic, clustering coefficient, conductance |
| Is it core-periphery? | k-core, rich-club coefficient, weighted betweenness, eigenvector/PageRank by instance |
| Where are the cuts? | Articulation points, bridge edges, min-cut under relay/large-instance/bridge removal |
| How does defederation reshape reachability? | Component count before/after blocks, reachability matrix, block reciprocity, Jaccard similarity of blocklists |
| How fragile is it? | Node churn, instance disappearance, domain migration, relay outage simulations, admin-maintenance risk |
| How do publics form? | Hashtag/topic bipartite graphs, community detection, language/topic assortativity, cross-software diffusion |
| How much do large servers dominate? | Active-user Gini, traffic share, in-degree centrality, follower concentration, discovery exposure |
| How do bridges matter? | Betweenness of bridge nodes, cross-protocol edge volume, failure impact, proxy-account ambiguity |
| How interoperable is it really? | Object/activity success matrix by software/version; reply/render/delete/edit/report propagation tests |

A major caution: empirical snapshots are unstable. The Fedivertex dataset, which studied multiple platforms with weekly crawls, explicitly treats erratic node-count variation as a natural Fediverse phenomenon rather than merely a crawler artifact. ([arxiv.org](https://arxiv.org/html/2505.20882v1))

---

## 6. Worked examples

### Example 1: A small instance follows one Pixelfed account and one Lemmy community

A single-user GoToSocial or Mastodon-compatible instance may have almost no visible Fediverse until its actor follows remote actors or subscribes to relays. Following a Pixelfed account creates actor-level delivery edges for image posts. Following a Lemmy community creates group-mediated fanout, where the community’s host becomes a distribution center. If the instance uses stricter signed-fetch behavior, some unauthenticated discovery or fetching may fail. GoToSocial documents that it requires valid HTTP signatures on all server-to-server GET and POST endpoints, similar in effect to Mastodon secure/authorized fetch behavior. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/federation/http_signatures/))

### Example 2: A relay creates a shortcut

Relays are not just neutral pipes. A relay can make small instances visible by redistributing public posts, but it also becomes a dependency and a moderation boundary. SocialHub’s FEP-3416 describes relay behavior as fragile and attempts to standardize relay actors; Fedify distinguishes Mastodon-style relays that forward activities directly to subscribers from LitePub-style relays that follow back and wrap activities in `Announce`. ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/fediverse-relays/4626))

### Example 3: Domain suspension deletes a region of the graph

If instance A suspends instance B, actor follows, replies, boosts, media fetches, and reports may no longer traverse the A–B boundary. If many instances import the same public blocklist, B’s reachability can collapse across a region of the network. This can protect communities from harassment or spam, but it can also isolate innocent users hosted on the blocked domain. Research on Pleroma moderation found that federation policies can have unintended consequences for innocent users, and toxicity research on Pleroma emphasizes the difficulty of automating moderation across independently governed instances. ([arxiv.org](https://arxiv.org/abs/2110.13500?utm_source=chatgpt.com))

### Example 4: A Ghost or WordPress publication enters the network

A Ghost or WordPress site is not topologically equivalent to a Mastodon community. It is often a publisher actor, author actor, or blog actor, with many readers following it from other platforms. WordPress ActivityPub supports blog-level and author-level federated profiles; Ghost’s ActivityPub work frames the publication as a federated feed with replies/interactions that can appear on the site. ([wordpress.org](https://wordpress.org/plugins/activitypub/))

### Example 5: Bridgy Fed creates a cross-protocol cut point

A Bridgy Fed connection can allow ActivityPub actors to interact with Bluesky/AT Protocol or IndieWeb actors, but this creates proxy identities and translation edges. The bridge is a high-betweenness node: if it changes policy, fails, or is blocked by many instances, a whole cross-protocol channel can disappear. ([github.com](https://github.com/snarfed/bridgy-fed))

---

## 7. Data sources

| Source | What it gives | Limits |
|---|---|---|
| W3C ActivityPub spec | Protocol model: actors, activities, inbox/outbox, federation | Spec does not determine actual social topology |
| WebFinger | Discovery of actor/account resources | Privacy-sensitive; enumeration risk |
| NodeInfo / FEP-0151 | Server metadata, software, protocols, usage fields | Optional, incomplete, can be disabled; not protocol negotiation |
| FediDB | Current directory/statistics on servers, software, accounts | Methodology and freshness vary |
| Fediverse Observer | Public server/software directory and historical graphs | Only servers sharing/visible in public data; methodology matters |
| Fedivertex | Multi-platform crawled graph dataset, 2025 | Snapshot/crawl bias; not whole Fediverse |
| Mastodon APIs/docs | Domain blocks, moderation actions, timelines, limited federation | Mastodon-specific |
| Lemmy docs/issues | Group/community federation behavior | Lemmy-specific |
| PeerTube docs | Instance follows, video federation, redundancy | Media-heavy topology |
| Public blocklists | Defederation/moderation graph | Sensitive; may encode contested judgments |
| Instance about/rule pages | Governance and policy data | Labor-intensive; may be outdated |
| GitHub repos/issues | Implementation reality, bugs, interop debates | Skews toward developer-visible problems |
| SocialHub/FEP discussions | Emerging protocol conventions | Drafts may not be widely implemented |
| Admin interviews / HCI studies | Governance, care labor, burnout, community norms | Qualitative, not full-network measurement |

Current directory estimates should be treated cautiously. FediDB describes itself as a Fediverse directory and analytics platform and reports active-account/server counts, while Fediverse Observer emphasizes public server data and supports many software filters including Mastodon, Misskey, Pixelfed, PeerTube, Lemmy, WriteFreely, Pleroma, BookWyrm, WordPress, Sharkey, Friendica, and others. Reported totals differ across trackers, so a memo should cite tracker, access date, and methodology rather than present a single definitive Fediverse size. ([fedidb.com](https://fedidb.com/?utm_source=chatgpt.com))

---

## 8. Diagrams to produce

1. **Multiplex topology diagram:** actors, instances, software, moderation, relays, bridges as separate layers with inter-layer edges.
2. **Instance graph by software:** nodes sized by active accounts or observed activity; colored by software family; edges weighted by delivery/follow/crawl co-visibility.
3. **Moderation cut map:** positive federation edges in one layer, block/silence/suspend edges in another; show reachability before/after a major block.
4. **Relay bipartite graph:** instances connected to relays; identify relay betweenness and failure impact.
5. **Lemmy community fanout diagram:** user instance → community host → subscribed instances.
6. **Publisher federation diagram:** WordPress/Ghost/Flipboard-like publication actor followed by many AP actors across software.
7. **Corporate gateway diagram:** Threads as opt-in boundary network, with separate feed/search surface and partial integration.
8. **Temporal churn chart:** births, deaths, domain changes, and software migrations of instances over weekly/monthly snapshots.
9. **Interop matrix:** software family by software family; rows/columns for follow, reply, boost, like, delete, edit, report, media rendering, group/community handling.
10. **Ethical visibility map:** classify data as public-safe aggregate, public-but-sensitive, consent-required, or do-not-collect.

---

## 9. Ethical limits

The central research danger is treating federation as consent. A 2025 Fediverse data-ethics paper argues that centralized-platform research assumptions do not translate cleanly to the Fediverse; it emphasizes localized privacy, consent, and trust, and notes that API availability should not be equated with consent to include data in research. ([arxiv.org](https://arxiv.org/html/2505.07606v1))

Do **not** collect or publish:

| Avoid | Why |
|---|---|
| Full actor-level follow graphs at scale | Enables stalking, deanonymization, community mapping |
| Small-instance membership lists | Can expose marginalized, political, or vulnerable communities |
| Exact public posts as quoted evidence without consent | Searchable traceability risk |
| Deleted, protected, followers-only, or access-controlled content | Violates contextual privacy |
| Private moderation notes, reports, admin conversations | Safety-critical governance data |
| Obfuscated blocked domains | Admins may intentionally hide targets to reduce brigading |
| DM-like or limited-audience AP objects | Not appropriate for topology mapping |
| WebFinger enumeration of likely usernames | Converts addressability into surveillance |
| Bridge identity mappings without consent | Cross-protocol identity collapse risk |

Better practice: begin with server-level aggregate data, public docs, opt-in admin collaboration, thresholding for small nodes, removal requests, and clear publication of methods. Treat instances as communities or research participants when mapping governance choices, especially where marginalized groups use blocklists or limited federation for safety.

---

## 10. Risks and fragilities

| Risk | Topological effect |
|---|---|
| Instance shutdown | Node deletion; actors may migrate but post archives and old links can remain stranded |
| Domain change | Identity discontinuity; follow migration may be partial |
| Admin burnout | Moderation edges become stale; abuse response slows; server may close |
| Hosting cost spikes | Media-heavy PeerTube, Pixelfed, Owncast nodes are especially exposed |
| Relay outage | Small instances lose discovery shortcuts |
| Bridge outage/block | Cross-protocol component disconnects |
| Corporate gateway policy shift | Large boundary node rewires visibility or moderation conditions |
| Blocklist cascade | Many simultaneous edge deletions from shared list adoption |
| Software fork divergence | Object rendering and moderation semantics drift |
| Search/discovery centralization | Publics become dependent on a few crawlers, indexes, or large-instance timelines |
| Legal/regulatory pressure | Instances in some jurisdictions may block, geofence, or shut down |

Admin labor is not incidental. A 2024 CSCW study of Mastodon administrators found that decentralized social media can support safety, identity, and privacy needs, especially for marginalized communities, but admins face serious challenges around content moderation, community building, and governance. ([ora.ox.ac.uk](https://ora.ox.ac.uk/objects/uuid%3A9e9ea5d1-f02b-4f65-8f83-9a72e9e46213))

---

## 11. Open questions

1. **Topology type:** Which layers are actually heavy-tailed, and which are merely crawler-biased?  
2. **Reachability:** What percentage of theoretically addressable ActivityPub actors are reachable from a given instance under its moderation and signed-fetch settings?  
3. **Defederation effect:** How often does defederation reduce harm versus produce collateral isolation?  
4. **Relay dependence:** How many small instances rely on relays for discovery, and what happens when major relays disappear?  
5. **Corporate gravity:** Does Threads federation increase cross-network pluralism, or does it recentralize attention through Meta-controlled interfaces?  
6. **Publisher topology:** How will Ghost, WordPress, Flipboard-like publishers, and newsletters reshape the Fediverse from conversational publics toward subscription media graphs?  
7. **Software interop:** Which ActivityPub object types actually round-trip across Mastodon, Lemmy, Pixelfed, PeerTube, Misskey-family, BookWyrm, and blogs?  
8. **Marginalized-community governance:** How can topology research measure safety strategies without exposing them?  
9. **Instance lifecycle:** What predicts shutdown, domain migration, or admin burnout?  
10. **Bridge consent:** When a bridge translates identities across protocols, what counts as informed consent?  
11. **Public mythology:** How do claims of decentralization obscure concentration in hosting, search, relays, defaults, and large instances?  
12. **Archival holes:** Which posts, media, replies, and profiles become inaccessible after shutdowns, deletions, or blocks?

---

## 12. Annotated bibliography

**W3C ActivityPub Recommendation, 2018.** Defines the ActivityPub model, including client-to-server and server-to-server federation protocols, actors, activities, inboxes, and outboxes. Essential for distinguishing protocol affordance from actual topology. ([w3.org](https://www.w3.org/TR/activitypub/))

**RFC 7033 WebFinger, 2013.** Defines WebFinger discovery for account-like identifiers and warns about privacy implications of exposing information about people or entities. Important for actor discovery and enumeration ethics. ([rfc-editor.org](https://www.rfc-editor.org/rfc/rfc7033.html))

**FEP-0151 / NodeInfo, 2025–2026.** Standardizes public server metadata and warns that some information may be sensitive; also says NodeInfo should not be used for protocol negotiation. Crucial for server-level data collection limits. ([fediverse.codeberg.page](https://fediverse.codeberg.page/fep/fep/0151/))

**Fedivertex dataset paper, 2025.** Multi-platform Fediverse graph dataset covering platforms including Mastodon, PeerTube, Pleroma, Misskey, Friendica, BookWyrm, and Lemmy, with weekly crawls and explicit attention to defederation. Useful baseline for topology research beyond Mastodon. ([arxiv.org](https://arxiv.org/html/2505.20882v1))

**Colglazier et al., “Do Servers Matter on Mastodon?”, 2024.** Shows that server choice affects discovery and retention, and that users may migrate from large general instances toward smaller or niche servers. Important evidence against simple “bigger server is better” assumptions. ([workshop-proceedings.icwsm.org](https://workshop-proceedings.icwsm.org/pdf/2024_43.pdf))

**Zhang et al., “Trouble in Paradise: Accountable Content Moderation in the Fediverse,” CSCW 2024.** Interview study of Mastodon administrators, emphasizing moderation, governance, safety, and community-building challenges. Key for admin labor and care infrastructure. ([ora.ox.ac.uk](https://ora.ox.ac.uk/objects/uuid%3A9e9ea5d1-f02b-4f65-8f83-9a72e9e46213))

**Liu et al., “Community-level Blocklists and Inter-community Conflicts in the Fediverse,” 2025.** Studies public blocklists and moderator practices; important for modeling defederation as a governance graph. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Lisker & Mihaljević, Fediverse data ethics, 2025.** Argues that platform research norms do not translate cleanly to the Fediverse and that API availability is not consent. Central for ethical limits on scraping. ([arxiv.org](https://arxiv.org/html/2505.07606v1))

**Zia et al., toxicity in Pleroma, 2022.** Studies toxic content and decentralized moderation challenges in Pleroma, showing both prevalence and difficulty of per-instance automated moderation. Useful for moderation topology and harms. ([arxiv.org](https://arxiv.org/abs/2204.12709))

**Mastodon administration and federation docs, current.** Documents domain-level moderation actions, limited federation mode, and domain-block API semantics. Key for operational edge labels such as suspend, silence, and allowlist. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/))

**Fedify relay documentation and FEP-3416 relay actors, 2024–2025.** Describes Mastodon-style and LitePub-style relay behavior and the effort to standardize relay actors. Important for modeling discovery shortcuts and relay fragility. ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/fediverse-relays/4626))

**Lemmy ActivityPub documentation and federation scaling issue.** Explains Lemmy’s ActivityPub mapping and community-centered fanout. Essential for avoiding Mastodon-centric actor graph assumptions. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html?utm_source=chatgpt.com))

**WordPress ActivityPub plugin documentation.** Shows how blogs and authors become Fediverse actors, and that posts require followers to become visible in feeds. Important for publisher/blog topology. ([wordpress.org](https://wordpress.org/plugins/activitypub/))

**Ghost ActivityPub materials and 2025 beta reporting.** Documents professional publishing entering ActivityPub through Ghost(Pro), with follows and comments from Mastodon, Pixelfed, Threads, and others. Key for publisher-gateway analysis. ([activitypub.ghost.org](https://activitypub.ghost.org/))

**Threads federation announcements/reporting, 2024–2025.** Shows corporate federation as opt-in, staged, and interface-mediated rather than simply open federation. Central for corporate gateway topology. ([about.fb.com](https://about.fb.com/news/2023/07/introducing-threads-new-app-text-sharing/))

**Bridgy Fed repository and Bluesky bridge discussion, 2023–current.** Documents cross-protocol translation among ActivityPub, AT Protocol, and IndieWeb. Important for bridge nodes, synthetic identities, and cross-network cuts. ([github.com](https://github.com/snarfed/bridgy-fed))

## Bottom line

The Fediverse’s actual shape is **not a universal decentralized mesh**. It is a layered, uneven, changing federation of **server communities, software publics, moderation borders, relay shortcuts, publisher gateways, corporate apertures, and bridge-mediated identities**. The right empirical object is a **multiplex temporal graph with governance edges**, not a single follower network. Any serious topology study must therefore measure not only who can talk to whom, but also **who can discover whom, who refuses whom, who carries whom, who pays for the infrastructure, who moderates the edges, and who becomes invisible when a server, relay, bridge, or admin disappears.**
