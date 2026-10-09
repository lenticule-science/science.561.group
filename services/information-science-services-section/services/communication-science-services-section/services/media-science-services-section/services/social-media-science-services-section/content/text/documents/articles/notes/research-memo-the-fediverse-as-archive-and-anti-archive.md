---
aliases:
  - Fediverse as Archive and Anti-Archive
keywords:
  - fediverse
  - archive
  - public-memory
  - ephemerality
  - deletion
  - consent
  - search
  - preservation
title: "Research memo: The Fediverse as archive and anti-archive"
description: The Fediverse is not a single archive and not a single social platform.
---
# Research memo: The Fediverse as archive and anti-archive  
**Date:** June 11, 2026  
**Question:** Does the ActivityPub Fediverse produce durable public memory, or does federation create fragile, partial, consent-sensitive, hard-to-search archives?

## Abstract

The Fediverse is not a single archive and not a single social platform. It is a loose ActivityPub-conformant web of actors, inboxes, outboxes, object URLs, server policies, software-specific affordances, caches, deletes, blocklists, relays, bridges, hashtags, and publics. Its archival character is therefore contradictory. It remembers through distributed copying, public URLs, RSS-like syndication, bookmarks, boosts, quote posts, media caches, public timelines, search indexes, blocklist histories, moderation logs, and third-party crawls. It forgets through instance shutdowns, account migration limits, remote cache pruning, deletion propagation gaps, defederation, opt-in search norms, fragile media storage, JavaScript-rendered pages, undocumented local policies, and a strong culture of consent around discoverability. The result is neither stable public memory nor clean ephemerality: it is a **patchy consent-sensitive memory system** whose durability depends on who controls the origin server, who received the post, what software interpreted it, which instances cached it, whether search was enabled, and whether administrators can afford to keep storage online.

The protocol itself supports creating, updating, and deleting content, but explicitly cannot enforce deletion after objects have been transmitted to remote servers; receiving servers “SHOULD” remove representations, while enforcement remains social, legal, and implementation-specific. ([w3.org](https://www.w3.org/TR/activitypub/))

## Core thesis

The Fediverse is best understood as an **anti-archive with archival side effects**.

It is archival because ActivityPub objects have IDs, URLs, timestamps, authorship, replies, tags, and distributed copies; long-form platforms such as WordPress, Ghost, WriteFreely, BookWyrm, PeerTube, and blogs can use ActivityPub to syndicate durable works; and Mastodon-compatible software can make posts visible through public URLs, hashtags, search, boosts, and federation. ActivityStreams defines generic object properties such as `id`, `url`, `published`, `updated`, `attributedTo`, `content`, `inReplyTo`, `replies`, `tag`, and audience fields, which are enough to build citable social objects if implementations preserve them well. ([w3.org](https://www.w3.org/TR/activitystreams-vocabulary/))

It is anti-archival because the network’s strongest ethical norms often resist total searchability, context collapse, bulk scraping, and involuntary permanence. Mastodon’s full-text search is deliberately limited for safety reasons, and its `discoverable` and `indexable` flags express a culture in which “public” does not automatically mean “globally searchable forever.” ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/network/))

The important research conclusion is that **federation does not decentralize power evenly**. It relocates archival power into a shifting triangle: origin administrators, remote administrators, and indexers/bridges. Users gain some exit and local governance, but lose the guarantees of a single canonical platform archive. Remote copies are necessary for federation but also create privacy, deletion, provenance, and citation problems.

---

# 1. What the Fediverse remembers

## 1.1 It remembers objects, not just posts

ActivityPub is an object/activity delivery protocol. A “post” may be a Mastodon `Note`, a Lemmy `Page` plus comment `Note`, a PeerTube `Video`, a Pixelfed `Image`, a BookWyrm review, a WriteFreely article, a WordPress post, a Ghost publication item, or a Bonfire object with boundary controls. Mastodon’s implementation documentation says it treats `Note` and `Question` as first-class objects and converts `Article`, `Page`, `Image`, `Audio`, `Video`, and `Event` “as best as possible,” appending URLs and mapping `summary` to content warnings. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

This matters archivally: a “Fediverse post” is not one genre. A PeerTube video, a Lemmy thread, a BookWyrm review, a Pixelfed photograph, a WriteFreely essay, and a Mastodon note have different expectations of persistence, discoverability, edit history, quoting, canonical URL, and reuse.

## 1.2 It remembers through remote replication

Federation requires remote servers to receive, process, and often locally store representations of objects. The ActivityPub server-to-server section says receiving a `Create` activity will likely involve locally storing the activity and object, while `Update` asks receiving servers to update their copy, and `Delete` asks them to remove or tombstone it. ([w3.org](https://www.w3.org/TR/activitypub/))

That is the central archival paradox: remote copies make federation work, but remote copies also mean public memory is **not controlled solely by the originating author or originating instance**.

## 1.3 It remembers through media caches and redundancy

Media is especially archival because it is expensive. Mastodon, GoToSocial, PeerTube, Akkoma, and Pleroma all expose the difference between local media ownership and remote media caching. GoToSocial documents that it stores local user media permanently unless the attached post or profile is deleted, while also caching media from remote instances. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/media_caching/?utm_source=chatgpt.com)) Pleroma and Akkoma state that they do not store remote/federated media by default, but can use reverse-proxy caching and a MediaProxy warming policy to fetch remote media when posts arrive. ([docs.pleroma.social](https://docs.pleroma.social/backend/configuration/storing_remote_media/?utm_source=chatgpt.com))

PeerTube is the strongest archival counterexample to “Fediverse posts are ephemeral.” Its documentation supports ActivityPub `Create`, `Update`, and `Delete` for videos, playlists, comments, and related objects; it also has a built-in video redundancy system in which one platform can duplicate and serve videos from another platform to reduce origin bandwidth and increase availability. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub?utm_source=chatgpt.com))

## 1.4 It remembers through hashtags, not necessarily full text

Hashtags are the Fediverse’s most consent-compatible discovery primitive. Mastodon represents hashtags as ActivityStreams `tag` objects and normalizes them; hashtag search remains a major way to make posts discoverable without enabling full-text search over all words. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

This creates a folk-archival practice: users who want public knowledge circulation tag posts; users who want semi-public conversation omit tags, use unlisted visibility, or avoid search opt-in. It is not perfect consent, but it is a softer discovery mechanism than platform-wide keyword search.

## 1.5 It remembers institutional and long-form publishing differently

WordPress ActivityPub makes a blog function as a federated profile, with a site-wide profile and author profiles; WriteFreely supports ActivityPub federation so people can follow a blog from Fediverse software, while also supporting RSS feeds; Ghost 6.0 shipped social-web publishing and syndication features in August 2025. ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com))

This is where the Fediverse becomes closest to a public-memory infrastructure: **canonical articles live on a domain, while ActivityPub distributes attention, replies, and subscriptions**. That pattern is archivally healthier than treating a Mastodon post as the only copy of an argument.

---

# 2. What the Fediverse forgets

## 2.1 It forgets when instances disappear

The Fediverse is vulnerable to ordinary hosting failure: unpaid bills, burnout, legal seizure, admin illness, domain loss, database corruption, or community collapse. The shutdown of mastodon.technology in 2022 gave users notice to download data and migrate; Mozilla announced in 2024 that it would shut down its Mastodon server in December and let users download data or migrate. ([ashfurrow.com](https://ashfurrow.com/blog/mastodon-technology-shutdown/?utm_source=chatgpt.com))

Account migration does not equal post migration. Mastodon supports moving followers, but long-standing GitHub discussion treats post migration as a separate unsolved problem; user guides and community reports repeatedly note that exported posts/media are backups, not a seamless importable public archive at a new account URL. ([github.com](https://github.com/mastodon/mastodon/issues/12423?utm_source=chatgpt.com))

## 2.2 It forgets through cache pruning

Storage pressure is a governance force. Mastodon’s admin CLI supports media removal and profile-cache pruning; its `self-destruct` command broadcasts account deletes to known servers for a cleaner exit. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/tootctl/?utm_source=chatgpt.com)) Community admin guidance warns that media cache retention and remote content retention have different consequences: media may be reloadable, but some remote content deletion may not be recoverable from the origin. ([fedi.tips](https://fedi.tips/mastodon-admins-leave-the-content-cache-retention-period-blank/?utm_source=chatgpt.com))

This means “the network remembers” only where someone pays to remember.

## 2.3 It forgets through defederation

Defederation is both safety mechanism and archival partition. Mastodon supports importing and exporting blocklists, and research finds community-level blocklists are central to decentralized moderation, with wide variation in goals, inclusion criteria, and transparency. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/?utm_source=chatgpt.com))

A defederated post may still exist at its origin URL, but parts of its circulation history disappear from many users’ reachable context. Conversation threads become cut, replies vanish from some views, and public memory becomes jurisdictional: visible from here, invisible from there.

## 2.4 It forgets through implementation mismatch

Cross-software federation is not semantically lossless. Mastodon converts non-`Note` objects “as best as possible,” which can flatten long-form articles, book reviews, videos, events, or forum threads into status-like representations. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/)) Lemmy maps communities to ActivityPub `Group`, users to `Person`, posts to `Page`, and comments to `Note`; PeerTube maps videos and comments differently; BookWyrm extends Activity types for book data. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html?utm_source=chatgpt.com))

The archive therefore contains lossy translations. A BookWyrm review viewed through Mastodon is not the same archival object as a BookWyrm-native review page with book metadata, shelves, editions, and review context.

---

# 3. Comparison table: archival behavior by software family

| Software / family | Typical object genre | Archival strengths | Anti-archive / fragility | Research implication |
|---|---:|---|---|---|
| **Mastodon** | Short posts, replies, polls, media | Public URLs, hashtags, boosts, edits via `Update`, deletes via `Delete`, opt-in full-text search | Search intentionally limited; remote deletion unenforceable; post migration weak; context depends on instance | Cite origin URL and capture date; do not assume global searchability |
| **Pixelfed** | Images, albums, captions | Strong media-centered public memory; ActivityPub federation with other software | Media caching and privacy expectations are sensitive; photo reuse/scraping risks higher | Treat images as higher-risk human-subject data |
| **PeerTube** | Videos, comments, playlists | Video redundancy can intentionally duplicate media; ActivityPub supports update/delete for videos/comments | Large storage costs; deletion/rights conflicts if redundant copies persist | Strong candidate for intentional public archives, but needs consent/licensing metadata |
| **Lemmy / Mbin / Kbin / PieFed** | Link/forum posts, comments, communities | Threaded discussions, community moderation, public link references | Community moves, defederation, moderation deletion, fork-specific semantics | Better for public deliberation archives than microblogs, but federation context still partial |
| **Misskey / Sharkey / Iceshrimp forks** | Notes, reactions, quote-renotes, rich client culture | Rich interaction formats and quote-like practices existed before Mastodon quote posts | Interop gaps; forks differ; some features appear degraded in Mastodon views | Record software/version and rendered view when citing |
| **Pleroma / Akkoma** | Microblogging, flexible instance policies | Lightweight self-hosting; MRF policies allow local governance | MRF can rewrite/drop content; media proxy behavior varies | Instance policy is part of the archival record |
| **WriteFreely / Plume-like long form** | Blog posts / essays | Strong canonical-page model; RSS plus ActivityPub | Federation may be discovery layer, not full archival layer | Best practice: canonical personal/institutional URL first, AP second |
| **BookWyrm** | Reviews, reading activity, book metadata | Public reviews tied to bibliographic objects | Extended types not fully meaningful to all software | Cite BookWyrm canonical page, not a remote Mastodon rendering |
| **Owncast** | Livestream announcements/chat-adjacent social layer | Good for event notification and live publics | Livestream ephemerality; chat/archive policy varies | Archive event pages and recordings separately |
| **WordPress ActivityPub** | Blog posts, comments, author profiles | Mature CMS permalinks plus federated replies | Replies may federate into comment spaces with moderation differences | Strong model for public scholarship if canonical URLs are stable |
| **Ghost ActivityPub** | Newsletter/blog posts, social web reader | Publisher-owned domain; federation to Mastodon/Threads/Bluesky-like social web clients | Managed-hosting/service architecture and rollout details vary; self-hosting has caveats | Good for durable essays, but verify canonical URL and federation state |
| **Threads federation** | Corporate-scale public profiles/posts | Adds large public sphere and cross-platform circulation | Opt-in federation, incomplete/controlled integration, corporate moderation/search asymmetry | Treat as asymmetric federation, not peer-like decentralization |
| **Bridgy Fed** | Cross-protocol bridged posts | Makes web/Bluesky/Fediverse interaction possible | Search/indexing expectations may not carry across protocols | Bridges need explicit provenance and consent indicators |
| **Bonfire / GoToSocial / smaller implementations** | Boundary-aware social objects, small-instance sociality | Strong local governance experiments; GoToSocial documents media/federation modes | Smaller projects may be less indexed, less interoperable, less archived | Important sites for governance research, not statistical afterthoughts |

Sources: implementation docs for Mastodon, PeerTube, Lemmy, BookWyrm, WriteFreely, GoToSocial, Pleroma/Akkoma, WordPress, Ghost, Bridgy Fed, and Bonfire. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

---

# 4. Edits, deletes, and remote copies

## 4.1 Edits are protocol-supported but socially uneven

ActivityPub `Update` exists. For client-to-server updates, the spec describes partial update behavior; for server-to-server updates, the receiving server should update its copy with the complete supplied object and verify authorization. ([w3.org](https://www.w3.org/TR/activitypub/)) Mastodon supports status edits when an `updated` timestamp is present, and it also has a status edit model in its API surface. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

Archival consequence: an edit is not just “the post changed.” It is a versioning event that may or may not be preserved in remote software, screenshots, search indexes, academic datasets, or third-party crawls.

## 4.2 Deletion is meaningful but not absolute

Deletion is meaningful because many major implementations process `Delete`, remove local representations, and may tombstone objects. Mastodon says `Delete` removes a status from its database; PeerTube supports `Delete` for videos, actors, playlists, and comments. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

Deletion is not absolute because the ActivityPub Recommendation explicitly says that after transmission to a remote server, the protocol cannot enforce remote deletion of an object representation. ([w3.org](https://www.w3.org/TR/activitypub/))

The right interpretation is neither “deletion works” nor “deletion is fake.” It is: **deletion is a federated request backed by norms, code, trust, and law, not a cryptographic erasure guarantee**.

## 4.3 Remote copies are a privacy problem

Remote copies are a privacy problem in at least five ways.

First, every federated post necessarily exposes content and metadata to remote administrators. Second, followers-only and mention-only posts still transit servers outside the author’s control when remote followers or mentioned users are involved. Third, media caches can store images and videos away from the origin. Fourth, bridges can carry posts into networks with different search, moderation, and deletion semantics. Fifth, legal seizure of an instance or backup can expose data that users thought was community-held rather than platform-held; EFF’s 2023 discussion of the Kolektiva.social server-data seizure is an example of why host-level security matters. ([eff.org](https://www.eff.org/deeplinks/2023/07/fbi-seizure-mastodon-server-wakeup-call-fediverse-users-and-hosts-protect-their?utm_source=chatgpt.com))

---

# 5. Search politics: discovery without surveillance

## 5.1 Mastodon search is intentionally incomplete

Mastodon’s own user documentation states that full-text search is optional for admins, available to logged-in users, and limited for safety reasons so people cannot search any text across the entire database to find and harass others. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/network/)) Its API documentation likewise notes that status search depends on backend configuration and authentication. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/search/?utm_source=chatgpt.com))

This is not a missing feature in the narrow sense. It is a governance decision encoded as software default and instance capacity.

## 5.2 Opt-in indexing is a consent signal, not a complete shield

Mastodon’s `indexable` flag recommends that indexing tools respect a user’s preference about full-text search of public statuses; the `discoverable` flag similarly indicates preferences around profile directories and external discovery. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/)) Community documentation emphasizes that full-text search is opt-in and that public posts remain searchable by hashtag even without full-text indexing. ([fedi.tips](https://fedi.tips/how-do-i-opt-into-or-out-of-full-text-search-on-mastodon/?utm_source=chatgpt.com))

But flags are not enforcement. A bad-faith crawler, bridge, screenshot, or archive can ignore them. Robots.txt and platform flags are governance instruments, not physical barriers; recent empirical work on robots.txt compliance finds that some bot categories rarely check robots.txt at all. ([arxiv.org](https://arxiv.org/abs/2505.21733?utm_source=chatgpt.com))

## 5.3 The search dilemma

The Fediverse needs search for accessibility, journalism, research, mutual aid, emergency information, marginalized community discovery, and public accountability. It resists search because full-text search can enable dogpiling, doxxing, quote-mining, harassment, employer surveillance, police monitoring, and context collapse.

A responsible Fediverse search model should therefore distinguish:

| Search target | Safer default | Higher-risk default |
|---|---|---|
| Hashtags | Searchable when public | None, if used maliciously for raids |
| Actor/profile discovery | Respect `discoverable` | Global directories without opt-out |
| Full-text public posts | Opt-in, logged-in, rate-limited | Whole-network unauthenticated search |
| Public-interest archives | Ethics review, minimization, delayed release | Raw post dumps |
| Abuse investigation | Local/moderator-scoped tools | Public vigilante search engines |
| Long-form publications | Canonical page indexing | Indexing every reply as equivalent publication |

## 5.4 A workable model: scoped search

Search can exist without recreating Twitter-like surveillance if it is scoped by consent, role, and context.

A responsible design would use: opt-in full-text indexing; hashtag-first discovery; per-post `indexable` overrides; authenticated search; rate limits; no global people-search by sensitive terms; no indexing of followers-only, mention-only, deleted, or unlisted posts; machine-readable instance research policies; public interest archive exceptions with human review; and transparent crawler identities.

---

# 6. Quote posts, context collapse, and public memory

Quote posts turn posts into citable fragments inside new audiences. Misskey-family software has long had quote-renote-like practices; Mastodon delayed quote posts because of harassment and context-collapse concerns, then introduced quote posts with controls in 2025 and Mastodon 4.5. ([github.com](https://github.com/mastodon/mastodon/issues/18473?utm_source=chatgpt.com))

This is an archival design issue. Quote posts create a secondary record: “what X said” plus “how Y framed it.” They are useful for scholarship, journalism, correction, and public accountability. They also enable dunking, pile-ons, decontextualized evidence, and durable reputational harm.

The best quote-post design treats quoting as a **revocable contextual relation**, not merely as embedded content. Mastodon’s 2025 quote controls move in that direction by offering permissions and withdrawal mechanisms. ([theverge.com](https://www.theverge.com/news/777067/mastodon-quote-posts-fediverse-launch?utm_source=chatgpt.com)) For research archives, quote posts should preserve: original object ID, canonical origin URL, quote author, quote timestamp, quoted object timestamp, quoted visibility at time of quote, whether quote permission existed, and whether the original was later deleted or withdrawn.

---

# 7. Public timelines versus semi-private expectations

The Fediverse complicates the old “public means public” rule. Public posts can appear on local and federated timelines and have web URLs; GoToSocial’s docs are unusually clear that public means visible on the web, local/federated timelines, boostable, and widely available. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/?utm_source=chatgpt.com)) Mastodon, however, also has unlisted, followers-only, and mention-only modes, and its documentation notes that other Fediverse software may display replies differently. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/?utm_source=chatgpt.com))

The social norm is contextual integrity: a post may be technically public but socially addressed to a scene, instance, hashtag community, or follower network. Researchers and journalists should not treat every public ActivityPub object as equally publishable, indexable, or quoteable.

---

# 8. Academic archiving and research ethics

Fediverse research inherits the old social-media data problem but adds instance governance. A 2025 paper on data ethics in the Fediverse argues that many Mastodon instance policies explicitly prohibit or constrain data collection, while published research often shows limited adherence to those policies. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com)) Another 2024 paper on shifting research from X to Mastodon identifies Mastodon-specific computational research ethics issues. ([pmc.ncbi.nlm.nih.gov](https://pmc.ncbi.nlm.nih.gov/articles/PMC10801199/?utm_source=chatgpt.com))

This is not merely IRB bureaucracy. In the Fediverse, instance rules are part of the governance structure. Ignoring them is like scraping a forum after bypassing its posted research policy, except that the forum is also a federated node with reciprocal trust relations.

A responsible academic archive should therefore:

1. Check origin instance rules and privacy policy.
2. Check software visibility and indexing signals.
3. Avoid collecting followers-only, mention-only, deleted, or unlisted posts.
4. Avoid raw content release unless consent or strong public-interest justification exists.
5. Prefer derived, aggregate, or redacted datasets.
6. Respect delete/update propagation in the research dataset.
7. Publish a data statement naming instance-policy handling.
8. Offer opt-out/contact paths where feasible.
9. Preserve enough metadata for reproducibility without maximizing exposure.
10. Treat posts from marginalized, small, or safety-oriented instances as higher-risk.

---

# 9. Journalism

Journalists face a different but related problem: how to cite public Fediverse material without laundering context collapse into news practice.

Recommended practice:

| Use case | Responsible citation practice |
|---|---|
| Public official / institution post | Cite canonical origin URL, author handle, instance, date/time, and capture date |
| Ordinary user quoted for news | Seek consent unless strong public-interest rationale exists |
| Deleted post | Report deletion status; use screenshots cautiously; explain why publication is necessary |
| Remote rendering | Do not cite a remote copy as canonical unless origin is gone and the remote copy is the evidentiary object |
| Thread | Cite first post plus relevant replies; note if replies are partial due to federation |
| Moderation controversy | Include instance rules, block status, and affected federation paths |
| Bridge content | Identify bridge and original network; do not imply native Fediverse consent |

For high-stakes reporting, the canonical citation should include both the ActivityPub object URL and a human-readable page URL when distinct.

---

# 10. Personal sites, canonical URLs, and what should not live only in the Fediverse

The Fediverse is excellent for circulation. It is weak as the sole location for important records.

The following should live on a personal site, institutional repository, DOI-backed archive, wiki, or durable CMS, then federate outward:

| Material | Better canonical home | Why |
|---|---|---|
| Research claims | Personal/institutional site + DOI/repository where possible | Stable citation, versioning, metadata |
| Essays / manifestos | Personal site, WordPress, Ghost, WriteFreely | Domain control and RSS fallback |
| Datasets | Repository with license, data statement, ethics note | Fediverse posts are not dataset infrastructure |
| Corrections | Canonical page with changelog | Edits may not propagate uniformly |
| Public-interest documents | Institutional repository, archive, or wiki | Search and preservation expectations are clearer |
| Community policies | Instance website + version history | Federation cannot preserve governance context by itself |
| Indigenous/community knowledge with access protocols | Community-controlled site/repository | Federation’s public-copy model may violate care obligations |

RSS remains important here because it is a simple syndication layer with long-standing permalink and GUID practices; RSS 2.0 recommends providing `guid`, preferably as a permalink, while `link` may point to the full article. ([rssboard.org](https://www.rssboard.org/rss-specification?utm_source=chatgpt.com)) ActivityPub should complement, not replace, these web publication practices.

---

# 11. Worked examples

## Example A: A scholar posts a claim on Mastodon

A researcher posts: “New preprint: X causes Y,” with a link and hashtag. The post federates to followers’ servers and appears in hashtag searches. Later they correct the claim.

Archival outcome: the origin post may update; some remote copies may update; screenshots and search snippets may not. A responsible citation should cite the preprint, not only the Mastodon post. The Mastodon post can be cited as dissemination evidence.

Best practice: publish the claim on a canonical page with version history; post a Fediverse summary with the canonical URL; use hashtags intentionally; opt into indexing only if broad search is desired.

## Example B: A PeerTube video is mirrored

A PeerTube instance publishes a documentary. Another PeerTube platform uses redundancy and serves duplicated video segments.

Archival outcome: availability improves, but rights and deletion become more complex. If the origin deletes the video, remote redundancy should honor deletion, but compliance depends on implementation and administration.

Best practice: declare license, archival permission, deletion expectations, and whether redundancy is allowed.

## Example C: A Lemmy thread becomes a public record

A Lemmy community discusses a public policy issue. Comments federate to other Lemmy/Mbin/Kbin-compatible sites and may be visible through Mastodon-like software as Notes.

Archival outcome: the thread is stronger as a deliberative archive than a microblog thread, but moderation, community deletion, defederation, and software-specific rendering can fragment the record.

Best practice: cite the origin community thread, include instance/community name, and record moderation state if relevant.

## Example D: A Ghost or WordPress essay federates

A writer publishes an essay on Ghost or WordPress with ActivityPub enabled. Fediverse users follow, reply, and share it.

Archival outcome: the essay has a canonical web URL, RSS-like durability, and federated discussion. This is one of the healthiest public-memory patterns.

Best practice: treat the website as canonical and Fediverse replies as distributed commentary.

## Example E: A user deletes a sensitive public post

A public post is boosted, cached, indexed, and later deleted.

Archival outcome: cooperative servers may delete or tombstone it; the protocol cannot force all remote deletion; screenshots and bad-faith crawlers may persist. ([w3.org](https://www.w3.org/TR/activitypub/))

Best practice: researchers should remove it from datasets unless there is strong public-interest justification; journalists should avoid republishing unless necessary; search engines should deindex deletes.

---

# 12. Who controls archives?

| Actor | Archival power | Accountability gap |
|---|---|---|
| Origin user | Creates, edits, deletes, chooses visibility/indexing where supported | Cannot force all remote copies to comply |
| Origin admin | Stores database/media, sets retention, moderates, shuts down, exports | Users depend on admin capacity and governance |
| Remote admin | Stores/caches copies, blocks, prunes, indexes locally | Not directly accountable to origin user |
| Software maintainers | Define defaults: search, quotes, media, deletes, migration | Defaults become governance |
| Blocklist maintainers | Shape reachability and public memory boundaries | Criteria may be opaque or contested |
| Bridges | Translate across protocols and norms | Consent and deletion semantics may degrade |
| Search/index services | Make public memory findable | Can become surveillance infrastructure |
| Researchers | Stabilize datasets and narratives | May violate instance policies or user expectations |
| Journalists | Amplify and preserve posts as evidence | Can collapse context and override deletion |
| Corporate entrants | Add scale and asymmetry | May federate selectively and reshape norms |

Threads is especially important here because it is not simply “another instance.” Meta describes Threads as compatible with the fediverse and says public conversations/profile material can be shared across servers; its 2024–2025 rollout has been opt-in and staged. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com)) Large corporate federation changes archival power because one actor can combine ActivityPub ingestion with platform-scale search, moderation, and advertising-adjacent infrastructure, even if federation is opt-in.

---

# 13. Risks

## Technical risks

Remote deletes are unenforceable; media caches and redundancy can preserve unwanted copies; software forks interpret objects differently; search flags are advisory; account migration does not preserve public post history; and long-term storage costs push admins toward pruning. ([w3.org](https://www.w3.org/TR/activitypub/))

## Governance risks

Instance policies vary, blocklists can be opaque, and moderation labor is unevenly distributed. Studies of decentralized moderation and blocklists show that blocklisting is powerful but variable, with trade-offs among openness, safety, false positives, and transparency. ([dl.acm.org](https://dl.acm.org/doi/fullHtml/10.1145/3614419.3644016?utm_source=chatgpt.com))

## Political-economic risks

The Fediverse is not outside capital. Hosting, storage, legal compliance, paid moderation, mobile apps, managed services, bridges, and corporate entrants all cost money. Xavier’s 2024 critical analysis argues that the Fediverse faces structural challenges in fulfilling decentralization promises. ([arxiv.org](https://arxiv.org/abs/2408.15383?utm_source=chatgpt.com))

## Epistemic risks

Because search is partial and federation is local, researchers can mistake their instance’s view for the network. A “federated timeline” is not the whole Fediverse; it is what an instance knows about. Fediverse statistics from FediDB and Fediverse Observer are useful but method-sensitive indexes, not an omniscient census. ([fedidb.com](https://fedidb.com/servers?utm_source=chatgpt.com))

---

# 14. Responsible archival design

## 14.1 Design principles

1. **Canonicality:** every serious public object should identify its origin URL and preferred citation URL.
2. **Consent signaling:** indexing, quoting, archiving, AI training, and research reuse should be separate flags, not collapsed into “public.”
3. **Delete/update propagation:** archives should record delete/update events and hide or tombstone content according to policy.
4. **Context preservation:** store thread, audience, software, instance, and moderation context, not just text.
5. **Minimum necessary retention:** preserve public-interest value without maximizing personal exposure.
6. **Instance policy awareness:** crawlers should read machine-readable instance research policies.
7. **Role-scoped access:** moderators, researchers, journalists, and the public should not all receive the same search affordances.
8. **Bridge transparency:** bridged objects should visibly record source network, bridge, and consent limitations.
9. **Community appeal:** archived subjects and instance admins need contact/appeal routes.
10. **Plural preservation:** personal sites, RSS, institutional repositories, and wikis should coexist with ActivityPub.

## 14.2 Proposed metadata schema for claim/provenance posts

A minimal ActivityPub-compatible claim/provenance extension could be represented as JSON-LD terms layered onto ActivityStreams objects. The goal is not to put every post on a blockchain or make every claim permanent; it is to let public research claims carry citation, versioning, and reuse metadata.

| Field | Purpose |
|---|---|
| `canonical` | Preferred human citation URL |
| `objectIntegrity` | Hash/digest of cited content at publication time |
| `claimType` | empirical finding, correction, observation, quotation, dataset release, policy statement |
| `evidence` | URLs/DOIs/CIDs supporting the claim |
| `method` | short method note or link to method page |
| `license` | reuse terms |
| `archiveConsent` | none, local, public-interest, full-public, institutional |
| `searchConsent` | hashtag-only, profile-discovery, full-text, external-index |
| `quotePolicy` | allowed, followers, request, disallowed |
| `researchPolicy` | allowed, aggregate-only, consent-required, prohibited |
| `versionOf` | previous object URL |
| `supersedes` | objects corrected/replaced |
| `retractionOf` | object being retracted |
| `provenance` | software, instance, actor, generated-by |
| `communityContext` | instance/community rules URL |
| `sensitiveContext` | human-subjects, Indigenous/community protocol, legal risk, minor-related, etc. |
| `deletePolicy` | propagate-delete, tombstone-only, archive-redact, public-record-retain |
| `accessibility` | alt text, transcript, language, content warnings |

This schema should not be imposed globally. It should be opt-in for public scholarship, journalism, institutional accounts, repositories, and community archives.

## 14.3 Search without Twitter-like surveillance

A practical architecture:

- Hashtag search remains default public discovery.
- Full-text search is opt-in per account and ideally per post.
- Search engines must honor `indexable`, `discoverable`, robots.txt, deletes, and instance policies.
- Public search excludes unlisted, followers-only, mention-only, deleted, and bridge-prohibited objects.
- Abuse-prevention search exists for moderators but is logged and scoped.
- Research search uses a registered crawler identity, policy compliance, data minimization, and opt-out.
- Long-form `Article`/`Page` objects can be indexed more like web pages if their canonical site permits it.
- Small or vulnerable instances can advertise stricter research/indexing policies.
- Bridges must not silently upgrade non-searchable posts into searchable cross-protocol content.

---

# 15. Answers to the guiding questions

**What does the Fediverse remember?**  
It remembers public objects that are copied, cached, boosted, tagged, quoted, indexed, redundantly stored, or anchored on durable domains. It remembers especially well when content has canonical web URLs, RSS, institutional backing, PeerTube redundancy, or active remote communities.

**What does it forget?**  
It forgets through shutdowns, pruning, broken domains, defederation, deleted objects, software mismatch, missing replies, non-indexed text, private/unlisted expectations, and admin burnout.

**Who controls archives?**  
No one actor. Control is distributed among origin users, origin admins, remote admins, software defaults, blocklists, bridges, search engines, researchers, journalists, and corporate federators.

**Are remote copies a privacy problem?**  
Yes. They are technically necessary for federation but create privacy and deletion problems, especially for media, followers-only circulation, bridges, legal seizure, and bad-faith indexing.

**Is deletion meaningful?**  
Yes, but it is not guaranteed erasure. It is a federated request that cooperative implementations should honor; the protocol cannot force every remote holder to delete. ([w3.org](https://www.w3.org/TR/activitypub/))

**How should researchers cite Fediverse posts?**  
Cite the canonical origin URL, actor handle, instance, software if known, timestamp, access date, visibility/search status if relevant, and whether the post was later edited/deleted. For ordinary users, avoid naming or quoting unless consent or strong public interest exists.

**What should be canonical on a personal site rather than only federated?**  
Research claims, essays, datasets, corrections, public policies, community protocols, long-form arguments, and anything that needs durable citation.

**Can ActivityPub support accountable public research archives?**  
Yes, but not by default. It needs metadata for consent, provenance, versioning, deletion, citation, licensing, instance policy, and research reuse. ActivityPub is a transport and object model; accountable archives require additional governance.

**What metadata schema would support claim/provenance posts?**  
Use canonical URL, evidence, claim type, method, versioning, integrity hash, license, quote/search/research/archive consent, provenance, instance policy, and deletion policy fields.

**How can search exist without recreating Twitter-like surveillance?**  
By making search scoped, opt-in, role-sensitive, rate-limited, policy-aware, delete-aware, and hashtag-forward, with stronger indexing for intentional long-form publications than for casual social posts.

---

# 16. Open questions

1. Can ActivityPub standardize per-object indexing, quote, archive, and research-consent signals without creating false security?
2. Should deletes propagate to third-party research archives, and under what public-interest exceptions?
3. Can long-form ActivityPub publishing converge on stable canonical citation practices across WordPress, Ghost, WriteFreely, BookWyrm, PeerTube, and forums?
4. How should Indigenous, community-governed, and high-risk knowledge protocols be expressed in machine-readable ways without making them easier to violate?
5. Can bridges preserve consent semantics across ActivityPub, AT Protocol, RSS, Webmention, and other systems?
6. What would a Fediverse “institutional repository mode” look like?
7. Should public blocklists and defederation events themselves be archived as governance records?
8. Can instance shutdown tooling produce durable, consent-respecting public archives rather than all-or-nothing deletion?
9. How should search handle posts from software that lacks Mastodon’s `indexable` flag?
10. What legal duties do remote instances have when they receive deletes, takedowns, or research opt-outs?

---

# Annotated bibliography

**W3C ActivityPub Recommendation, 2018.** The core protocol source. Establishes client-to-server and server-to-server APIs for creating, updating, deleting, and delivering content. Most important for this memo: remote deletion is requested but not enforceable after federation. ([w3.org](https://www.w3.org/TR/activitypub/))

**W3C ActivityStreams 2.0 Vocabulary, 2017.** Defines object properties such as `id`, `url`, `published`, `updated`, `attributedTo`, `content`, `inReplyTo`, `replies`, `tag`, and audience fields. Essential for thinking about citation and provenance. ([w3.org](https://www.w3.org/TR/activitystreams-vocabulary/))

**Mastodon ActivityPub implementation docs, updated 2026.** Shows how Mastodon handles `Create`, `Delete`, `Update`, `Announce`, `Flag`, quote requests, hashtags, discoverability, and indexability. Useful because Mastodon is not the whole Fediverse but strongly shapes expectations. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

**Mastodon network/search docs, updated 2025–2026.** Explains the safety rationale for limited full-text search and the difference between personal/library search and public search. Central to search politics. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/network/))

**PeerTube ActivityPub and redundancy docs.** Important counterexample to microblog assumptions: videos, comments, playlists, cache files, updates/deletes, and redundancy make archival questions bandwidth-heavy and rights-sensitive. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub?utm_source=chatgpt.com))

**Lemmy federation docs.** Shows how forum-like software maps ActivityPub concepts: community as `Group`, user as `Person`, post as `Page`, comment as `Note`. Important for not reducing the Fediverse to Mastodon. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html?utm_source=chatgpt.com))

**WriteFreely documentation.** Demonstrates long-form federation and the continued importance of RSS alongside ActivityPub. Useful for canonical personal-site practices. ([writefreely.org](https://writefreely.org/docs/main/writer/federation?utm_source=chatgpt.com))

**BookWyrm ActivityPub docs.** Shows domain-specific ActivityPub extension for book/review objects. Important because archival meaning can be lost when specialized objects render as generic posts elsewhere. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/activitypub.html?utm_source=chatgpt.com))

**GoToSocial media caching and federation docs.** Clear documentation of public visibility, media retention, HTTP signatures, and federation modes. Useful for small-instance infrastructure and privacy analysis. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/media_caching/?utm_source=chatgpt.com))

**Pleroma/Akkoma media and MRF docs.** Shows how local policy can rewrite, reject, delist, proxy, or cache remote content. Useful for understanding instance governance as archival governance. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/configuration/cheatsheet/?utm_source=chatgpt.com))

**WordPress ActivityPub plugin.** Important because it brings ordinary websites/blogs into the Fediverse with site-wide and author profiles. Strong model for canonical web publishing plus federated discussion. ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com))

**Ghost 6.0 and ActivityPub rollout, 2025.** Important for newsletter/blog federation and the merging of publishing platforms with social-web clients. ([ghost.org](https://ghost.org/changelog/6/?utm_source=chatgpt.com))

**Bridgy Fed docs.** Essential for bridge politics: it connects the Fediverse, web, and Bluesky, but cross-protocol search and consent semantics may not align. ([fed.brid.gy](https://fed.brid.gy/docs?utm_source=chatgpt.com))

**Threads federation documentation and reporting, 2024–2025.** Shows corporate, opt-in, staged federation at scale. Important for political economy and asymmetric archival power. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com))

**Bono et al., “An Exploration of Decentralized Moderation on Mastodon,” 2024.** Empirical study of blocklisting and decentralized moderation. Important for the claim that moderation is infrastructure, not merely policy. ([dl.acm.org](https://dl.acm.org/doi/fullHtml/10.1145/3614419.3644016?utm_source=chatgpt.com))

**Zhang et al., “Understanding Community-Level Blocklists in Decentralized Social Media,” 2025.** Analyzes shared blocklists and moderator interviews; highlights variation in goals, criteria, transparency, and false-positive concerns. ([arxiv.org](https://arxiv.org/abs/2506.05522?utm_source=chatgpt.com))

**Colglazier, TeBlunthuis, and Shaw, “The Effects of Group Sanctions on Participation and Toxicity,” 2024.** Studies defederation as group sanction; finds activity drops for blocked servers but no evidence of reduced toxicity. Important for testing liberation/safety claims empirically. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

**Lisker and Mihaljević, “Data Ethics in the Fediverse,” 2025.** Key source for academic archiving ethics; documents mismatch between instance policies and research data practices. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

**Abbing, “Shifting your research from X to Mastodon?” 2024.** Focuses on computational research ethics when moving from centralized platforms to Mastodon. ([pmc.ncbi.nlm.nih.gov](https://pmc.ncbi.nlm.nih.gov/articles/PMC10801199/?utm_source=chatgpt.com))

**Wiegmann et al., “A Mastodon Corpus to Evaluate Federated Microblog Search,” 2024.** Search-research source noting that many posts did not opt into search and that non-Mastodon software complicates indexing signals. ([ceur-ws.org](https://ceur-ws.org/Vol-3689/WOWS_2024_paper_5.pdf?utm_source=chatgpt.com))

**Xavier, “An evidence-based and critical analysis of the Fediverse decentralization promises,” 2024.** Useful corrective to liberation mythology; argues the Fediverse faces major structural challenges in fulfilling decentralization promises. ([arxiv.org](https://arxiv.org/abs/2408.15383?utm_source=chatgpt.com))

**FediDB and Fediverse Observer.** Useful current monitoring services for servers/software/activity, but should be treated as methodological instruments rather than total censuses. ([fedidb.com](https://fedidb.com/servers?utm_source=chatgpt.com))
