---
aliases:
  - Fediverse Attention Topology and Discovery Infrastructure
keywords:
  - fediverse
  - attention
  - discovery
  - polyalgorithmic
  - feeds
  - hashtags
  - relays
  - search
title: "Research memo: Fediverse attention topology and discovery infrastructure"
description: The Fediverse is often described as “non-algorithmic,” but that description is misleading.
status: domain-qualified-research
---

## Topology measurement is not ATT

The named subject of this historical memo is **Fediverse discovery and reach**. Candidate observables are delivery graph edges, relays, fetched posts, local/remote timeline inclusion, followers, public interactions, searches and instance-specific visibility policies. Each variable must include observation time, instance/scope and the documented query. Calling their aggregation “attention” is a sociological name, not a WIT-denominated reconciliation budget or an individual WIT of ACK.

An ActivityPub message being delivered to an inbox is not automatically a canonical ACK. A protocol Accept activity may be an explicit uptake for the particular Follow request it references; to classify it as the Group's ACK, exhibit the original WIT, genuinely separate receiving party and matched case. WIT/ATT counts cannot be reconstructed simply by counting Likes, Announces, feeds or impressions. The social topology findings must not be stated as H¹ calculations unless the required cover/restrictions/cochains and a non-exact cocycle are supplied.

The old title is retained as the study's published research label, NOT a new synonym for the canonical mathematical term.

---

## Historical research text (retained as source, not terminological authority)

# Research memo: Fediverse attention topology and discovery infrastructure  
**Scope:** ActivityPub-conformant Web, not Mastodon alone.  
**Date:** June 11, 2026.  
**Status:** Current-source synthesis; crawler statistics and some implementation details are unstable and should be treated as approximate.

## Abstract

The Fediverse is often described as “non-algorithmic,” but that description is misleading. It is better understood as **polyalgorithmic, seamful, and socially routed**. Attention moves through chronological feeds, follower graphs, hashtags, boosts, replies, local timelines, federated timelines, trends, search indexes, relays, directories, moderation boundaries, software defaults, bridges, and human curation. These systems are usually less centralized and less engagement-maximizing than corporate recommender feeds, but they are not neutral, unranked, or power-free.

ActivityPub supplies a protocol vocabulary—actors, inboxes, outboxes, Follow, Like, Announce, Create, collections, public addressing—but the actual attention system is produced by software implementations, instance governance, admin capacity, moderation practices, social norms, cultural prestige, infrastructure costs, and bridge/directory operators. The result is not “the algorithm is gone,” but rather: **attention routing has been decomposed into many smaller mechanisms, many of which are visible, contestable, under-resourced, and unevenly governed**. The W3C ActivityPub Recommendation was published on January 23, 2018, and defines both client-to-server and server-to-server federation around actors with inboxes and outboxes. ([w3.org](https://www.w3.org/TR/activitypub/))

## Core thesis

The Fediverse does not abolish algorithmic attention. It **redistributes attention governance** from a small number of corporate ranking systems into a mixed ecology of:

1. **Protocol affordances**: Follow, Like, Announce/boost, replies, inbox/outbox delivery, followers collections, public addressing.
2. **Software affordances**: Mastodon trends, lists, opt-in search, quote posts; Misskey-family reactions and antennas; Lemmy ranking; PeerTube search and trending; Pixelfed discovery; blog/newsletter-style federation in Ghost, WordPress, and WriteFreely.
3. **Instance governance**: local timelines, server rules, defederation, allow/block lists, relay choices, signup policy, moderation labor.
4. **User culture**: hashtags, mutual-aid boosting, content warnings, alt-text norms, quote-post norms, “no algorithm” ideology, manual curation.
5. **Infrastructure and political economy**: hosting capacity, admin burnout, search indexes, directories, bridge operators, Threads federation, and the unequal ability to make one’s posts visible.

The key research claim is: **Fediverse attention is less a feed than a topology of partial publics.** Every actor sees a different Fediverse because servers only know what their users, peers, relays, crawlers, and bridges have brought into view.

---

## 1. What ActivityPub does—and does not—decide

ActivityPub defines transport and activity semantics, not a universal discovery layer. Actors have inboxes and outboxes; Follow requests create follower relations; Like activities may be collected; Announce activities are shares/boosts; objects can have likes and shares collections. But the protocol does not dictate ranking, global search, trending, quote-post behavior, local timelines, moderation policy, or what counts as “relevance.” ([w3.org](https://www.w3.org/TR/activitypub/))

Mastodon’s ActivityPub documentation makes this concrete: Mastodon maps `Like` to favourite, `Announce` to boost, and `Create` to status publication. It also documents object/activity support such as Notes, Questions, Articles, media objects, and quote-request-related activity. That mapping is implementation-specific; other ActivityPub software makes different choices. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

**Implication:** ActivityPub provides the grammar of circulation, but not the culture or economy of attention. “Federation” means activities can travel; it does not mean they will be found, ranked, welcomed, indexed, moderated, boosted, or remembered.

---

## 2. The Fediverse is not Mastodon

Mastodon is the largest and most culturally visible microblogging implementation, but the ActivityPub Web includes many different attention systems. Fediverse Observer’s crawler-style directory, as viewed June 2026, listed hundreds of software types and substantial non-Mastodon presence: Mastodon, WordPress ActivityPub, Ghost, PeerTube, Pixelfed, Lemmy, WriteFreely, Misskey, Sharkey, Akkoma, BookWyrm, Owncast-related systems, Mbin, Iceshrimp, and many others. These numbers should be treated as approximate because crawler directories depend on what they can see, classify, and refresh. ([fediverse.observer](https://fediverse.observer/allsoftwares))

The diversity matters because “attention” means different things in different genres:

| Software family | Primary attention object | Main routing forms | Distinctive issue |
|---|---:|---|---|
| Mastodon / GoToSocial / Pleroma / Akkoma | Short posts | follows, boosts, hashtags, local/federated timelines, trends, search | microblog visibility and moderation boundaries |
| Misskey / Sharkey / Iceshrimp-family | Notes, renotes, reactions | timelines, emoji reactions, antennas, channels, quote-renotes | more expressive routing; more affordance mismatch across software |
| Pixelfed | Images, albums, profiles | follows, hashtags, discover pages, local/global timelines | visual discovery without Instagram-style ranking |
| PeerTube | Videos, channels, livestream-like media | instance following, tags, search, Sepia Search, trending, subscriptions | video discovery without a single YouTube-like recommender |
| Lemmy / Mbin / Kbin / PieFed | Posts and comments in communities | votes, ranking modes, communities, federation | ranking is central, not incidental |
| WriteFreely / WordPress ActivityPub / Ghost | Articles, blogs, newsletters | followers, RSS/email, replies/comments, publication pages | attention via publication subscription more than timeline virality |
| BookWyrm | Books, reviews, shelves | follows, book/review activity, local trusted communities | niche social graph around reading |
| Owncast | Live streams | followers, go-live notifications, social sharing | burst attention around events |
| Threads / Bridgy Fed | Bridged or corporate-fed accounts | opt-in federation, cross-protocol translation, dedicated feeds | corporate scale and bridge consent/governance |

Pixelfed explicitly uses ActivityPub to federate with other Pixelfed servers and other Fediverse software; its project materials emphasize chronological, ad-free image sharing and hashtag/discover mechanisms. PeerTube uses ActivityPub federation among video instances and other Fediverse software, while Lemmy maps communities, users, posts, and comments into ActivityPub types and uses ranking algorithms such as Active, Hot, and Scaled. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com))

---

## 3. Is the Fediverse really non-algorithmic?

No. The Fediverse is not non-algorithmic. It is **differently algorithmic**.

The “no algorithm” ideology usually means “no opaque corporate engagement-maximizing For You feed.” That distinction matters, but it should not be inflated into the claim that attention is unmediated. Mastodon, for example, has API-supported home, public, local, remote, hashtag, list, link, and trends timelines. Trends are explicitly returned according to an internal trending score, not simple chronological order. Mastodon search is also conditional: full-text search depends on search infrastructure and includes opt-in/indexability rules rather than arbitrary full-database search. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

The actual Fediverse attention algorithms include:

| Attention mechanism | Algorithmic logic | Political meaning |
|---|---|---|
| Home timeline | merge of followed actors, boosts, sometimes followed hashtags | agency through following, but cold-start scarcity |
| Local timeline | posts from one instance | instance as ambient public |
| Federated timeline | posts known to the server through federation | partial-world illusion; not global |
| Hashtags | user-supplied semantic indexing | publics by self-description |
| Boosts / Announces | follower fan-out via human amplification | social recommendation and reputational transfer |
| Favourites / Likes / reactions | affective signal, notification, sometimes ranking input | varies sharply by software |
| Replies / mentions | conversational and notification routing | community, harassment, “reply guy” dynamics |
| Lists / antennas / channels | user-defined or software-defined filters | manual curation, labor-intensive |
| Trends | scored recent activity | algorithmic discovery under a softer brand |
| Search | index availability, permissions, opt-in rules | safety/invisibility trade-off |
| Relays | admin-level redistribution | bootstrapping and centralization risk |
| Directories / landing pages | curated entry points | gatekeeping, onboarding, legitimacy |
| Defederation / blocklists | negative routing | safety, sovereignty, fragmentation |
| Bridges | protocol translation | expanded reach plus consent/moderation risk |

The strongest formulation is: **the Fediverse replaces one dominant engagement-ranking stack with many smaller routing stacks.** Some are computational, some social, some administrative, and some cultural.

---

## 4. Home timeline: attention by chosen attachment

The home timeline is the most ideologically important Fediverse feed. In Mastodon, it shows statuses from followed accounts and, since Mastodon 4.0, can include posts from followed hashtags. This creates a feed whose baseline logic is not “what maximizes engagement?” but “what have I chosen to attach to?” ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

But home timelines still route attention through defaults and inequalities. A newcomer with few follows has an empty or thin feed. A well-connected user sees a rich network. A famous journalist joining with an imported audience, a server admin, an artist boosted by a known curator, and a small-instance newcomer do not enter the same topology.

**Research finding:** The home timeline is not neutral chronology. It is a chronological surface over a socially unequal graph.

---

## 5. Local timeline: instance as community-making machine

The local timeline is one of the Fediverse’s most distinctive attention forms. It makes the instance—not the whole network—the ambient public. On Mastodon, the public timeline endpoint can be filtered to local posts; this produces a feed of public statuses from the same server. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

Local timelines can produce community because they make co-presence visible. A server for academics, artists, queer/trans users, regional activists, Indigenous communities, programmers, or mutual-aid networks can turn “same host” into a weak public. The local timeline lets users encounter people they did not follow but who share an institutional, political, linguistic, or cultural home.

But local timelines also concentrate conflict. They can intensify norm enforcement, gossip, call-outs, admin pressure, and informal status hierarchies. They depend on instance size: very small servers may have no ambient life; very large servers may feel like ungoverned plazas.

**Worked example:** A new Indigenous media collective on a medium-sized, values-aligned instance may receive more relevant attention from the local timeline than from the global Fediverse. The local feed functions as a community bulletin board. On a giant general-purpose server, the same posts may disappear unless boosted or hashtagged.

---

## 6. Federated timeline: the myth of the global feed

The federated timeline is often mistaken for “the Fediverse.” It is not. It is the set of posts known to a server, shaped by who its users follow, which servers it has encountered, which relays it uses, what it blocks, and what software it runs. Mastodon’s public timeline API supports remote/federated variants, but that does not create a universal global index. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

This is a central attention fact: **every server has a horizon.** If no one on your server follows an account, no relay delivers it, no hashtag service sees it, and no search crawler indexes it, the content may be publicly posted yet socially invisible.

**Research term:** *federation horizon* — the practical boundary of what a server can see and circulate.

---

## 7. Hashtags: opt-in publics and fragile discovery

Hashtags are among the Fediverse’s most important discovery systems. Mastodon exposes hashtag timelines for public statuses containing a tag, with additional filters for tag combinations. Pixelfed help materials similarly tell users that public posts with hashtags may appear in discover pages. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

Hashtags produce publics because they let users name an audience: `#MutualAid`, `#BlackMastodon`, `#Bookstodon`, `#FediHire`, `#Indigenous`, `#AltText`, `#PeerTube`, `#ActivityPub`. They are not just metadata; they are invitations into a conversation.

But hashtags have weaknesses:

| Strength | Weakness |
|---|---|
| user-controlled discoverability | tag spam |
| cross-instance topic formation | no guarantee every server has seen every tagged post |
| safer than arbitrary full-text search | requires users to know the right tag culture |
| good for events and mutual aid | can create pile-ons when contentious |
| supports manual curation | labor shifts to posters and curators |

**Answer:** Hashtags produce publics by making posts intentionally addressable beyond the follower graph. They also reproduce inequalities: users who know tag conventions, post in dominant languages, and are boosted by known curators get more attention.

---

## 8. Boosts: human recommender systems

In ActivityPub/Mastodon terms, a boost is an `Announce`. Mastodon maps Announce to boost. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

A boost resembles a retweet, but it operates in a different attention economy. On corporate platforms, retweets often feed centralized ranking systems that infer engagement value. In Mastodon-style Fediverse software, boosts are more directly a **fan-out mechanism**: the booster republishes a post into their followers’ timelines. It is still amplification, but it is less tightly coupled to a universal engagement-ranking model.

A boost can mean:

| Boost meaning | Example |
|---|---|
| endorsement | “Read this analysis.” |
| care work | “Donate to this mutual aid fund.” |
| curation | “This artist deserves attention.” |
| distribution repair | “This small server/post needs visibility.” |
| affiliation | “This is part of my community.” |
| tactical amplification | “Make this safety warning travel.” |
| aggression | quote/boost into hostile audience, depending software/norms |

**Key distinction:** A retweet on X/Twitter historically participates in a centralized attention market. A boost in much of the Fediverse is closer to a **manual relay of trust**, although large accounts can still create pile-ons.

---

## 9. Favorites, likes, emoji reactions: affective signal or ranking fuel?

Mastodon maps ActivityPub `Like` to favourite. A favourite often means “I saw this,” “thank you,” “I agree,” “I want to send appreciation,” or “I want the author to receive a small notification.” It is not generally equivalent to an Instagram/TikTok/YouTube like whose primary platform function is to train ranking and recommendation. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

But this varies by software. In Lemmy, votes are central to post/comment ranking; Lemmy’s Active, Hot, and Scaled algorithms use votes, time, comment activity, and community-size adjustments. In PeerTube, configured trending modes can include “hot” and “most-viewed” algorithms. So “likes do not drive the algorithm” may be approximately true in some Mastodon contexts and false in other Fediverse contexts. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/07-ranking-algo.html?utm_source=chatgpt.com))

**Answer:** A favourite is not one thing across the Fediverse. It is a protocol-level Like, an interface-level affective gesture, and sometimes a software-level ranking input.

---

## 10. Replies, quote posts, and attention attacks

Replies route attention through conversation and notification. They can create genuine publics: thread-building, expertise exchange, collective troubleshooting, shared grief, and mutual aid. They also create harassment vectors: reply guys, sealioning, dogpiling, and forced debate.

Quote posts are especially contested. Historically, Mastodon resisted quote posts partly because of harassment and dunking concerns. Mastodon 4.5 introduced quote-post-related API fields and quote approval policy controls, including policies such as public, followers, and nobody; private/direct posts are not quotable under those controls. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/statuses/))

Misskey-family software has long had richer renote/quote-renote and reaction cultures than Mastodon, along with affordances such as antennas and channels in Misskey-related ecosystems. This means cross-software federation can create **affordance mismatch**: one community’s normal interaction grammar may be another community’s harassment vector. Misskey’s own materials describe it as federated social software with a broader, customizable feature set, and Fediverse software directories describe features such as emoji reactions, antennas, widgets, and rich chatting. ([misskey-hub.net](https://misskey-hub.net/en/?utm_source=chatgpt.com))

**Research claim:** Quote-post governance is a test case for whether ActivityPub software can support plural interaction norms without collapsing them into one dominant platform grammar.

---

## 11. Search: safety through obscurity, invisibility through safety

Search absence is one of the Fediverse’s most important and misunderstood design choices. Mastodon full-text search exists, but it is conditional: it depends on search infrastructure such as Elasticsearch/OpenSearch, account/post indexability, authentication context, and software settings. The docs emphasize that search does not mean arbitrary full-database search across everything. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/elasticsearch/))

This creates a real trade-off:

| Limited search helps | Limited search harms |
|---|---|
| reduces drive-by harassment | makes newcomers invisible |
| protects “quiet public” speech | hurts artists, writers, journalists, institutions |
| reduces surveillance and context collapse | weakens archives and public-interest discovery |
| supports local/community publics | makes expertise harder to find |
| slows pile-ons | increases dependence on boosts and insider networks |

**Answer:** Search absence produces safety by limiting hostile discovery, but it also produces invisibility. In practice, the burden shifts to hashtags, boosts, directories, instance choice, and social capital.

---

## 12. Trends and recommendations: the algorithm returns

Mastodon’s trends API returns tags, statuses, and links with increased activity according to an internal trending score; it is explicitly not simple chronological listing. Mastodon also has link timelines for public statuses containing trending article links, limited to content from users opted into discoverability features. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/trends/))

PeerTube includes configurable video discovery and trending mechanisms, including “hot” and “most-viewed” algorithms. Sepia Search, released as a PeerTube-oriented search engine, exists because video discovery across distributed instances is otherwise hard. ([github.com](https://github.com/Chocobozzz/PeerTube/blob/develop/config/production.yaml.example?utm_source=chatgpt.com))

Lemmy is even more clearly algorithmic: community posts and comments are organized around voting and ranking modes such as Active, Hot, and Scaled. Here, ranking is not a betrayal of Fediverse values; it is central to the forum/link-aggregation genre. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/07-ranking-algo.html?utm_source=chatgpt.com))

**Conclusion:** The Fediverse contains recommender systems. They are usually smaller, more legible, and more configurable than corporate feeds, but they are still algorithms.

---

## 13. Relays, directories, and landing pages: bootstrap infrastructure

Relays and directories matter because federation is not automatically global. Relay actors have been discussed in Fediverse Enhancement Proposal work, and Mastodon issue history frames relays as a way to bootstrap new servers with public activity when they otherwise have little content. ([socialhub.activitypub.rocks](https://socialhub.activitypub.rocks/t/fediverse-relays/4626?utm_source=chatgpt.com))

Newer discovery services such as hashtag redistribution projects also show the same problem: if your server has not heard of a post, the post may be invisible even when public. Hashtag relays/directories attempt to repair this by collecting and redistributing public tagged content. ([activitypub.blog](https://activitypub.blog/2026/04/02/discover-more-of-the-fediverse-with-tags-pub/?utm_source=chatgpt.com))

Instance landing pages also route attention. A server homepage, directory, “about” page, public timeline preview, featured users, recommended follows, and signup policy all shape who arrives and who is seen. This is governance by onboarding.

---

## 14. Software-specific attention patterns

### Mastodon
Mastodon’s main attention grammar is follows, boosts, replies, hashtags, lists, local/federated/public timelines, trends, opt-in search, and now controlled quote posts. It is the strongest source of the “chronological, no algorithm” myth, but its own APIs and docs show many ranking/discovery systems. ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

### Misskey / Sharkey / Iceshrimp-family
Misskey-family software tends to foreground richer expressive and routing features: reactions, renotes/quote-renotes, antennas, channels, clips, widgets, and more playful UI cultures. Forks vary, so claims about Sharkey or Iceshrimp should be version-specific. The research problem is not simply “more features,” but **more routes for attention to become affective, playful, memetic, or overwhelming**. ([misskey-hub.net](https://misskey-hub.net/en/?utm_source=chatgpt.com))

### Pixelfed
Pixelfed routes attention around images, profiles, hashtags, public discoverability, and visual culture. Its project materials position it against algorithmic barriers, but its discovery pages and hashtag mechanisms still route attention. For artists and photographers, hashtags and boosts are not optional decoration; they are core distribution infrastructure. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com))

### PeerTube
PeerTube lacks a single YouTube-scale recommender. Instead, discovery occurs through instance following, channels, subscriptions, tags, search, Sepia Search, ActivityPub federation, RSS-like subscription practices, and configured trending modes. That reduces central recommender power but creates a discoverability burden for creators. ([docs.joinpeertube.org](https://docs.joinpeertube.org/use/search?utm_source=chatgpt.com))

### Lemmy / Mbin / Kbin / PieFed
Social-news Fediverse software is openly algorithmic. Lemmy’s ranking documentation describes Active, Hot, and Scaled algorithms using votes, time, comment activity, and community-size effects. This makes Lemmy closer to Reddit-like attention than Mastodon-like chronology, even though it federates through ActivityPub. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/07-ranking-algo.html?utm_source=chatgpt.com))

### WriteFreely, WordPress ActivityPub, Ghost
Blog and publication software routes attention through subscription, publication identity, comments/replies, RSS/email adjacency, and ActivityPub follows. WriteFreely supports ActivityPub following for blogs; WordPress ActivityPub broadcasts blogs into the Fediverse; Ghost is building ActivityPub feeds, follows, replies, and publication discovery directly into its publishing system. ([writefreely.org](https://writefreely.org/docs/main/writer/federation?utm_source=chatgpt.com))

### BookWyrm
BookWyrm routes attention through books, reviews, shelves, reading status, and trusted communities. Its ActivityPub model extends beyond generic microblogging because book data and review activity are central. Attention is topic-structured around reading rather than status-structured around posting. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/?utm_source=chatgpt.com))

### Owncast
Owncast routes attention around live presence: follow the stream, get notified, share the broadcast, and gather around an event. This is burst attention rather than feed attention. Owncast’s Fediverse social features allow people to follow and discover streams through ActivityPub. ([owncast.online](https://owncast.online/docs/social/?utm_source=chatgpt.com))

### Threads federation and Bridgy Fed
Threads and Bridgy Fed introduce cross-network attention. Threads federation is opt-in and allows users on other servers to search, follow, view, interact with, and share Threads profiles/posts, according to Meta help materials. Reporting in 2025 described a dedicated Threads Fediverse feed and fediverse user search, while also noting that Fediverse content remains somewhat separate from Threads’ main experience. Bridgy Fed translates profiles, likes, reposts, mentions, follows, and more across decentralized social protocols. ([help.instagram.com](https://help.instagram.com/169559812696339?utm_source=chatgpt.com))

**Risk:** bridges solve discovery and portability problems while reintroducing scale asymmetry, consent conflicts, and moderation mismatch.

---

## 15. Worked examples

### Example A: A new visual artist joins Pixelfed

The artist posts strong work but has few followers. There is no Instagram-style recommender pushing them into strangers’ feeds. Their actual discovery stack is:

1. use relevant hashtags;
2. join an instance whose local audience cares about their medium;
3. follow and interact with peers;
4. get boosted by curators;
5. appear in discover surfaces if public and tagged;
6. cross-post or bridge carefully;
7. rely on directories, profile links, and off-Fediverse reputation.

This is more consentful than engagement-maximizing discovery, but it is not automatically fair. It rewards hashtag literacy, network literacy, and proximity to curators.

### Example B: A mutual-aid request circulates

A mutual-aid post may move through hashtags, local timelines, boosts, group chats, and trusted accounts. The boost here is not merely content sharing; it is **social warranty**. A known account’s boost tells followers: “this is worth your attention and maybe your money.”

But the same mechanism can create harm. A post boosted into the wrong audience can attract scrutiny, harassment, or fraud accusations. Ethical mutual-aid boosting often includes context, consent, verification practices, and sensitivity to the poster’s exposure.

### Example C: A journalist or institution arrives

An institution has advantages: recognizable name, external audience, verification channels, and staff capacity. It can route attention through domain verification, profile directories, landing pages, newsletters, and cross-posting. A small community scholar or independent journalist may rely far more on hashtags, boosts, and instance reputation.

This means the Fediverse may reject corporate recommender feeds while still reproducing institutional advantage.

### Example D: A Lemmy post rises

A Lemmy post’s attention is not primarily produced by boosts. It rises through community subscription, votes, comment activity, and ranking mode. “Hot” and “Active” are not cultural metaphors; they are sorting algorithms. This makes Lemmy a crucial counterexample to the idea that the Fediverse is mostly chronological. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/07-ranking-algo.html?utm_source=chatgpt.com))

### Example E: A PeerTube video tries to find an audience

A PeerTube video may be discovered by followers, tags, instance federation, channel subscription, remote search by URL/handle, Sepia Search, or trending configuration. Without centralized recommendation, video creators gain autonomy but lose the massive accidental discovery pipeline that YouTube provides. ([docs.joinpeertube.org](https://docs.joinpeertube.org/use/search?utm_source=chatgpt.com))

### Example F: A pile-on crosses instance boundaries

A contentious post is boosted or quote-posted by a large account. Replies and mentions flood in. Moderators may respond with account blocks, instance blocks, post visibility changes, report handling, or defederation. Research on Fediverse moderation shows that blocklists, defederation, and community-level moderation are central governance tools, but they also create uneven effects and labor burdens. ([arxiv.org](https://arxiv.org/html/2506.05522v1?utm_source=chatgpt.com))

---

## 16. Power analysis: what converts into attention?

Fediverse attention is often described as more organic, but it still converts social capital into visibility.

| Capital form | How it converts into attention |
|---|---|
| follower count | larger boost/fan-out capacity |
| admin status | control over local norms, blocks, relays, landing pages |
| instance reputation | trust or suspicion follows the domain |
| early adoption | entrenched follow graph |
| technical literacy | better use of clients, lists, filters, relays, APIs |
| hashtag literacy | better public discovery |
| cultural fluency | knowing CW, alt text, boost etiquette, quote norms |
| institutional prestige | easier verification and follower migration |
| cross-platform fame | external audience import |
| moderation capacity | safer publics attract participation |
| infrastructure money | stable hosting, search, media storage, uptime |
| bridge/directory access | reach beyond local federation horizon |

This is why “decentralized” does not automatically mean egalitarian. It may reduce one kind of platform power while amplifying other forms: admin power, curator power, software-default power, server-size power, and bridge/search-directory power.

---

## 17. Moderation as negative attention routing

Defederation, silencing, domain blocks, allowlists, report handling, and blocklists are not separate from attention. They are attention infrastructure. They decide what will not appear, who cannot reply, which servers are treated as unsafe, and whose posts are made less reachable.

Recent research treats decentralized moderation as labor-intensive, community-level governance rather than a purely technical feature. Studies of blocklists and defederation show that instance-level blocking can shape network structure and user activity, and policy work emphasizes defederation as a key response to spam, harassment, and coordinated abuse. ([arxiv.org](https://arxiv.org/html/2506.05522v1?utm_source=chatgpt.com))

A useful distinction:

| Moderation action | Attention effect |
|---|---|
| account mute/block | removes person from individual attention |
| domain block | removes server from community attention |
| defederation | breaks or limits inter-server circulation |
| limited federation / allowlist | creates gated public |
| search opt-out | prevents hostile discovery |
| CW norms | routes attention through consent |
| rate limits | slows attention attacks |
| quote controls | limits hostile reframing |
| local-only posting, where supported | keeps attention within community boundary |

Moderation is not the opposite of discovery. It is the condition under which discovery remains bearable.

---

## 18. Ethical attention routing without corporate recommender systems

The Fediverse needs discovery, but not necessarily extractive recommendation. Ethical attention routing should be:

1. **Transparent**: users should know why they are seeing something.
2. **Configurable**: users and instances should be able to choose chronological, topical, local, trusted-curator, or experimental feeds.
3. **Consent-aware**: search, quote-posting, indexing, and bridging should respect visibility choices.
4. **Moderation-budgeted**: every new discovery surface should include abuse handling, not just growth promises.
5. **Reciprocal**: discovery should not merely extract from small communities into large audiences.
6. **Plural**: different publics need different defaults.
7. **Accessible**: curation should reward alt text, captions, transcripts, and content warnings without turning accessibility into engagement bait.
8. **Auditable**: trends, directories, relays, and search indexes should publish criteria and appeal paths.
9. **Anti-capture**: major bridges, corporate instances, and directory operators should not become de facto central platforms.
10. **Newcomer-sensitive**: onboarding should include follow packs, local guides, hashtag maps, and community directories without imposing a single global recommender.

A promising design direction is **seamful recommender infrastructure**: systems that expose their seams—source, scope, ranking rule, moderation boundary, opt-in status—instead of pretending to be neutral. A 2025 CSCW study on Mastodon feed curation found that users often prefer chronological feeds but are still open to some algorithmic curation, especially when it is understandable and controllable. ([arxiv.org](https://arxiv.org/abs/2504.18817?utm_source=chatgpt.com))

---

## 19. Risks

| Risk | Description |
|---|---|
| Recentralization | Large instances, search engines, relays, Threads, or directories become de facto attention centers. |
| Discovery poverty | Newcomers, artists, writers, and small servers remain invisible without boosts or insider knowledge. |
| Admin burnout | Attention safety depends on unpaid or underpaid moderation labor. |
| Myth of no algorithm | Hidden routing systems escape scrutiny because users believe there is no algorithm. |
| Bridge consent failure | Cross-protocol visibility may violate expectations formed inside smaller publics. |
| Search/crawl conflict | Public posts are technically visible but socially expected not to be mass-indexed. |
| Local tyranny | Instance community can support care or intensify gossip and exclusion. |
| Blocklist politics | Shared blocklists can protect communities but also concentrate governance power. |
| Format inequality | Text, image, video, livestream, and long-form publication software have different discovery affordances. |
| Corporate capture | Threads and other large actors can import massive attention asymmetry into a small-network ecology. |

Research ethics are especially important because many instance policies restrict scraping or data collection, and recent data-ethics work notes that Fediverse research often confronts explicit community norms against large-scale collection. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

---

## 20. Open research questions

1. Can Fediverse software build recommender systems that are transparent, opt-in, and community-governed rather than engagement-maximizing?
2. How do quote-post controls interoperate across Mastodon, Misskey-family software, Pleroma/Akkoma, Threads, and bridges?
3. What is the minimum viable discovery infrastructure for a small instance?
4. How should public-interest search work without enabling harassment and surveillance?
5. Can hashtag publics be made more multilingual and less insider-dependent?
6. How do relays and tag redistributors change moderation obligations?
7. What compensation models can sustain admin and moderator care labor?
8. How do Threads federation and Bridgy Fed alter attention asymmetry?
9. How should directories disclose curation criteria?
10. What metrics can study Fediverse attention without violating instance norms?
11. Do local timelines actually increase belonging, or mainly increase ambient conflict?
12. How do artists, journalists, scholars, sex workers, activists, and marginalized communities experience discovery differently?
13. Can ActivityPub support “quiet public” speech as a first-class visibility mode?
14. What forms of defederation reduce harm without isolating vulnerable users?
15. How can archives preserve public memory while respecting deletion, migration, and safety expectations?

---

## Annotated bibliography

**W3C ActivityPub Recommendation, January 23, 2018.** Foundational protocol source for actors, inboxes, outboxes, Follow, Like, Announce, public addressing, and server-to-server federation. Essential for distinguishing protocol facts from software conventions. ([w3.org](https://www.w3.org/TR/activitypub/))

**Mastodon API and ActivityPub documentation, current through 2026 docs.** Documents home, public, local, federated, hashtag, list, link, trends, search, boost/favourite mappings, and quote-post controls. Useful for showing that Mastodon itself is not simply “chronological and non-algorithmic.” ([docs.joinmastodon.org](https://docs.joinmastodon.org/methods/timelines/))

**Fediverse Observer software directory, retrieved June 2026.** Crawler-style snapshot of Fediverse software diversity and approximate server/user counts. Useful for resisting Mastodon reduction, though not a definitive census. ([fediverse.observer](https://fediverse.observer/allsoftwares))

**Lemmy documentation on ranking and federation.** Shows that ActivityPub social-news software is explicitly ranking-based, with Active, Hot, and Scaled algorithms, and maps Lemmy communities/users/posts/comments to ActivityPub types. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/07-ranking-algo.html?utm_source=chatgpt.com))

**PeerTube documentation and Sepia Search materials.** Shows video discovery through federation, instance following, search, tags, subscriptions, and configurable trending rather than a single centralized YouTube-like recommender. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub?utm_source=chatgpt.com))

**Pixelfed documentation and project materials.** Useful for image-centered attention: ActivityPub federation, chronological/no-algorithm positioning, hashtags, discover pages, and public image discovery. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com))

**Misskey materials and Fediverse software directories.** Useful for comparing Mastodon with Misskey-family affordances such as reactions, antennas, channels, and quote-renote cultures, while noting fork/version variation. ([misskey-hub.net](https://misskey-hub.net/en/?utm_source=chatgpt.com))

**WriteFreely, WordPress ActivityPub, Ghost ActivityPub, BookWyrm, Owncast, GoToSocial documentation.** Shows that ActivityPub attention includes blogs, newsletters, books, livestreams, and lightweight safety-focused servers, not only microblog timelines. ([writefreely.org](https://writefreely.org/docs/main/writer/federation?utm_source=chatgpt.com))

**Fediverse moderation and blocklist research, 2024–2025.** Work on community blocklists, defederation, and trust-and-safety frames moderation as attention routing and shows how blocking shapes network structure and activity. ([arxiv.org](https://arxiv.org/html/2506.05522v1?utm_source=chatgpt.com))

**Liu et al., “Understanding Decentralized Social Feed Curation on Mastodon,” 2025.** Interview-based CSCW research showing that users often value chronological feeds but may accept transparent, controllable curation, complicating the “no algorithm” ideology. ([arxiv.org](https://arxiv.org/abs/2504.18817?utm_source=chatgpt.com))

**Bridgy Fed and Threads federation documentation/reporting.** Important for cross-protocol and corporate-scale attention routing: bridges and Threads federation extend reach while creating consent, moderation, and asymmetry questions. ([github.com](https://github.com/snarfed/bridgy-fed?utm_source=chatgpt.com))

---

## Bottom line

The Fediverse is not an escape from attention algorithms. It is an experiment in **making attention routing smaller, more plural, more socially governed, and more contestable**. Its promise is not that attention becomes pure. Its promise is that attention can be routed through communities, protocols, chosen follows, hashtags, boosts, relays, lists, and moderation boundaries rather than only through corporate prediction systems.

The danger is that this promise becomes mythology. Without deliberate discovery design, the Fediverse can become hard to enter, unequal for creators, exhausting for moderators, opaque under the banner of “no algorithm,” and vulnerable to recentering by large instances, bridges, search engines, and corporate federators.
