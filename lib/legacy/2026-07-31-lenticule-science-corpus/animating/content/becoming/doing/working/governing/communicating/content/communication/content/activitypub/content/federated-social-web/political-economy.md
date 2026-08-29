---
title: The Fediverse as Cooperative, Volunteer, and Platform-Adjacent Infrastructure
description: Political-economy memo arguing the Fediverse does not abolish platform capitalism but decomposes it, weakening any single platform's ownership of the social graph while shifting costs and governance burdens onto instance operators, moderators, maintainers, and donors. Surveys its mixed durable economic forms (volunteer administration, mutual-aid donation, grants, member support, managed hosting) and warns of quieter capture through convenience, discovery, search, moderation tooling, hosting, and identity portability.
keywords: ["fediverse", "political-economy", "platform-capitalism", "cooperative", "volunteer-labor", "funding", "infrastructure", "capture"]
---

# The Fediverse as Cooperative, Volunteer, and Platform-Adjacent Infrastructure

## Abstract

The Fediverse is not a single platform but an ActivityPub-centered social web: a protocol-governed, multi-software, multi-instance environment where Mastodon, Pixelfed, PeerTube, Lemmy/Mbin/Kbin, Misskey-family servers, Pleroma/Akkoma, GoToSocial, WriteFreely, BookWyrm, Owncast, WordPress, Ghost, Threads, Bridgy Fed, Bonfire, and other implementations interoperate unevenly. ActivityPub, standardized by W3C in 2018, defines both client-to-server and server-to-server federation; in practice, the “Fediverse” is an assemblage of software affordances, server policies, moderation practices, hosting bills, admin reputations, blocked domains, bridges, search tools, and publics rather than a homogeneous network. Current aggregator data are unstable and incomplete, but FediDB’s June 2026 readout reports roughly 42,200 servers, 12.8 million accounts, and under 1 million active accounts, with substantial activity outside Mastodon in Pixelfed, PeerTube, Lemmy, Misskey, and other software. ([w3.org](https://www.w3.org/TR/activitypub/?utm_source=chatgpt.com))

**Core thesis:** the Fediverse does not abolish platform capitalism; it decomposes it. Federation weakens a single platform’s ability to own the whole social graph, but it shifts costs and governance burdens onto instance operators, moderators, maintainers, and donors. Its most durable economic forms are mixed: volunteer administration, mutual-aid donation, nonprofit grant funding, member-supported instances, public-interest infrastructure funding, managed hosting, professional services, and publisher/creator subscriptions. Its main danger is not only “corporate capture” in the obvious sense of Meta or Automattic entering the network; it is also the quieter capture of convenience, discovery, search, moderation tooling, hosting, app distribution, analytics, and identity portability.

---

## 1. What is the economic object?

The Fediverse has no single economic unit. Different actors monetize or sustain different layers.

| Layer | What it is | What it can accumulate | Who pays | Who captures value |
|---|---|---:|---|---|
| **Protocol** | ActivityPub, WebFinger, HTTP Signatures, NodeInfo, FEPs, implementation conventions | Legitimacy, interoperability, standards influence | Standards bodies, volunteers, grant-funded developers | Public-good beneficiaries; sometimes corporate entrants |
| **Software project** | Mastodon, Pixelfed, PeerTube, Lemmy, Misskey, Akkoma, GoToSocial, Bonfire, etc. | Code, brand, contributor base, issue triage, app ecosystem | Donations, grants, maintainers, sponsors | Maintainers, hosted-service firms, downstream operators |
| **Instance/server** | A domain, database, media store, moderation regime, admin identity, local culture | Trust, reputation, local graph, blocklist position, user loyalty | Admins, users, donors, institutions, hosting customers | Instance operators, community, sometimes SaaS provider |
| **Actor/account** | User, bot, publisher, service actor, group, livestream, blog, community | Followers, identity continuity, posts, credibility | User or host | User, host, bridge, publisher, analytics layer |
| **Audience/public** | Distributed attention across local, federated, hashtag, list, and app feeds | Reach, legitimacy, affective attachment | Users’ time and unpaid participation | Creators, publishers, apps, corporate platforms, moderators |
| **Discovery layer** | Search, trending, directories, relays, bridges, recommendations, curated feeds | Attention routing power | Grants, SaaS, volunteer services, clients | Whoever controls discoverability |

The “capital” of a Fediverse instance is not primarily ad inventory. It is a bundle of infrastructural and relational assets: a domain name; the user handles attached to that domain; a database and media archive; moderation norms; admin credibility; blocklist relationships; allowlist or federation reach; backups; uptime; legal responsibility; onboarding capacity; and a trusted place in the social graph. In a small instance, this capital may be collectively held as community trust. In a large or professionally hosted instance, it begins to look more like platform capital.

---

## 2. Who pays?

### Hosting and infrastructure

Instance hosting costs vary wildly by software, media load, number of active users, retention policy, geographic hosting, anti-spam load, and whether the operator outsources administration. At the low end, managed Mastodon providers advertise small-instance plans in the single-digit dollars per month; Masto.host lists plans beginning around $6/month, and FediHost lists managed Mastodon from around $4/month, with larger plans scaling by active users, storage, backups, CDN, and support. One 2024 small-instance cost writeup reported about $56/month for roughly 40 active users, or about $1.60 per active user per month, explicitly excluding labor. ([masto.host](https://masto.host/pricing/?utm_source=chatgpt.com))

The cost profile differs by medium. A small GoToSocial or single-user Mastodon server can be cheap. Pixelfed adds photo storage. PeerTube and Owncast add video storage, transcoding, bandwidth, and livestreaming load. PeerTube’s own documentation frames video centralization as expensive and encourages many smaller hosts rather than a single YouTube-scale server farm; its 2025 creator materials also emphasize that video hosting requires storage and compute power for transcoding. ([joinpeertube.org](https://joinpeertube.org/faq?utm_source=chatgpt.com))

**Implication:** the Fediverse’s “free” experience is subsidized by someone else’s server bill, sysadmin time, storage pruning decisions, CDN configuration, backup discipline, and tolerance for abuse traffic.

### Mastodon as a visible but non-representative case

Mastodon’s 2024 annual report is useful because it is unusually explicit. It reported about €2.2 million in 2024 revenue, including recurring small donors, major gifts, grants, and commercial contracts; personnel costs were the dominant expense, while technical hosting was a much smaller but still material line item. The report also notes that fewer than 1% of users donated regularly, which is an important corrective to any simple “users will pay for the commons” story. ([joinmastodon.org](https://joinmastodon.org/reports/Mastodon%20Annual%20Report%202024.pdf))

Mastodon’s structure is shifting. In January 2025 it announced plans to transfer key ecosystem assets, including the name and copyrights, to a new nonprofit entity so that Mastodon would not be owned or controlled by one individual. In 2025 it also began expanding paid services—hosting, moderation, and support contracts for institutions—while insisting that central hosting must not become the network’s main architecture. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2025/01/the-people-should-own-the-town-square/?utm_source=chatgpt.com))

In April 2026, Mastodon announced a €614,000 agreement from the Sovereign Tech Fund/Agency for work on Mastodon and the broader ecosystem, with €90,000 set aside for other Fediverse projects implementing relevant protocols. That is a significant example of state-backed public-interest funding entering a nominally grassroots network. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2026/04/sovereign-tech-agency-funding/?utm_source=chatgpt.com))

---

## 3. Who labors?

| Labor type | Typical workers | Paid? | Political-economic significance |
|---|---|---:|---|
| **Sysadmin labor** | Instance admins, SREs, managed-hosting firms | Often unpaid; sometimes paid | Keeps the network alive: upgrades, backups, queues, storage, deliverability, security |
| **Moderation labor** | Admins, moderators, trust-and-safety volunteers, IFTAS-style support networks | Often unpaid or underpaid | Converts abuse, spam, harassment, CSAM risk, and inter-instance conflict into human stress |
| **Care labor** | Mods, admins, community elders, marginalized users doing norm work | Usually unpaid | Handles onboarding, conflict mediation, content warnings, trauma spillover, accessibility norms |
| **Maintainer labor** | Core developers, volunteer contributors, issue triagers, packagers | Mixed: grants, donations, salary, unpaid | Determines affordances, defaults, federation compatibility, anti-abuse capacity |
| **Governance labor** | Instance councils, co-op boards, nonprofit directors, policy writers | Usually unpaid | Produces legitimacy and resolves the “who decides?” problem |
| **Discovery labor** | Curators, directory maintainers, relay operators, app/client developers | Mixed | Routes attention without necessarily calling itself an algorithm |
| **Bridge labor** | Bridgy Fed, RSS bridges, cross-protocol maintainers | Mixed | Turns interoperability into ongoing translation, consent, abuse, and protocol-maintenance work |

Moderation research repeatedly finds that decentralization does not remove moderation; it redistributes it. A 2023 “Will Admins Cope?” study found that larger instances struggle to find sufficient moderation resources. A 2025 Internet Policy Review article on Mastodon moderation after post-Twitter growth describes moderation as structurally different from centralized corporate trust-and-safety but still burdened by growth, asymmetry, and uneven capacity. Recent work on community-level blocklists shows that shared blocklists are core moderation infrastructure, maintained by individuals, teams, and trusted groups rather than by a centralized platform bureaucracy. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

This is the Fediverse’s central labor contradiction: it rejects surveillance-ad platform economics, but the abuse problems that platforms normally address through paid trust-and-safety departments become distributed across volunteers, small nonprofits, and under-resourced admins. Defederation and blocklists are governance tools, but they are also labor-saving devices: they reduce exposure by refusing relations. ([github.com](https://github.com/gardenfence/blocklist?utm_source=chatgpt.com))

---

## 4. Software ecologies and economic forms

| Software / actor | Primary medium | Economic form | Political-economic note |
|---|---|---|---|
| **Mastodon** | Microblogging | Donations, grants, nonprofit restructuring, managed services | Most visible project; risks becoming a de facto center even while formally decentralized |
| **Pixelfed** | Photos, stories, short video experiments | Donations, OpenCollective, NLnet-style grants | Explicit anti-ad, anti-tracking culture; storage-heavy relative to text |
| **PeerTube** | Video | Framasoft nonprofit support, donations, grants, instance hosting | Video makes infrastructure cost visible; anti-centralization is partly economic necessity |
| **Lemmy / Mbin / Kbin** | Link aggregation, forums | Donations, OpenCollective, volunteer hosting | Communities resemble Reddit alternatives; moderation load can spike around news/politics |
| **Misskey / Sharkey / Iceshrimp forks** | Microblogging with richer social affordances | Donations, small collectives, fork labor | Fork proliferation increases experimentation but fragments maintainer capacity |
| **Pleroma / Akkoma** | Lightweight microblogging | Volunteer development, instance operators | Lower resource profile; culture/policy varies strongly by instance |
| **GoToSocial** | Lightweight ActivityPub server | Donations, grants, volunteer/open-source labor | Designed for smaller, safety-focused deployments rather than growth-maximal platforms |
| **WriteFreely / Write.as** | Federated blogging | Open source plus hosted SaaS | Long-form publishing: monetizes hosting/convenience more than social graph capture |
| **BookWyrm** | Social reading | Volunteer/community instances | Anti-corporate Goodreads alternative; database/catalog labor matters |
| **Owncast** | Livestreaming | Donations, sponsors, self-hosting | Each stream can federate as a service actor; bandwidth and uptime are central costs |
| **Bonfire** | Modular communities | Crowdfunding, OpenCollective, NLnet-style support | Emphasizes governance, community autonomy, and configurable social spaces |
| **WordPress ActivityPub** | Blogs and authors | Automattic plugin ecosystem, WordPress.com/WordPress.org distribution | Brings federated publishing to huge web infrastructure; capture point is CMS/platform convenience |
| **Ghost ActivityPub** | Publishing/newsletters | Ghost(Pro), memberships, publisher revenue | Strong fit with paid publishing; federation becomes distribution for creator businesses |
| **Threads** | Corporate social networking | Meta’s platform business; opt-in federation | Federation expands reach while Meta retains app, ad stack, identity, and policy power |
| **Bridgy Fed** | Cross-protocol bridge | Donations/nonprofit-style bridge work | Turns interoperability into a maintained service; bridge consent and abuse become political issues |
| **Flipboard / Surf-type apps** | Aggregation and curation | App/discovery business | Monetizes reading, following, and curation around open content |

These categories draw from official project documentation and current project pages: Pixelfed presents itself as free/open-source decentralized photo sharing; PeerTube is developed in the Framasoft nonprofit ecosystem; Lemmy emphasizes no tracking, advertising, or secret algorithms; GoToSocial describes itself as a lightweight, safety-focused ActivityPub server; WordPress’s ActivityPub plugin is maintained by Automattic; Ghost has been building ActivityPub into its publishing system; and Bridgy Fed connects the fediverse, the web, and Bluesky. ([pixelfed.org](https://pixelfed.org/?utm_source=chatgpt.com))

---

## 5. How money enters without ads

The Fediverse often narrates itself through “no ads, no algorithm.” That claim is partly true as a cultural refusal, but not adequate as political economy. Many projects explicitly reject tracking, advertising, and engagement-maximizing feeds: Mastodon markets itself as ad-free and non-algorithmic, Pixelfed emphasizes no ads or hidden algorithms, Lemmy rejects tracking and secret algorithms, and GoToSocial foregrounds no tracking or advertising. ([joinmastodon.org](https://joinmastodon.org/?utm_source=chatgpt.com))

But money still enters through at least eight channels:

1. **Donations and memberships:** Patreon, OpenCollective, Liberapay, GitHub Sponsors, direct bank transfers, nonprofit fundraising.
2. **Public-interest grants:** NLnet, European Commission NGI programs, Sovereign Tech Fund/Agency, and related digital-commons funding.
3. **Managed hosting:** Masto.host, FediHost, Elestio, Mastodon’s own institutional hosting/support services.
4. **Professional services:** moderation support, migration help, custom development, compliance, backups, security, SSO, analytics.
5. **Institutional instances:** universities, governments, NGOs, media organizations, public broadcasters.
6. **Publishing subscriptions:** Ghost, newsletter models, paid memberships, creator sites.
7. **Bridge and discovery services:** cross-protocol identity, search, curation, migration, feed construction.
8. **Corporate adjacency:** Threads, Automattic/WordPress, Flipboard, Mozilla experiments, media publishers, and future app ecosystems.

The absence of advertising does not mean the absence of commodification. It often means commodification moves from attention extraction to convenience, hosting reliability, identity continuity, moderation capacity, publishing tools, and discovery.

---

## 6. Worked examples

### Example A: Mastodon’s hybrid public-good model

Mastodon’s 2024 finances show a hybrid model: small donors, major donors, grants, and paid institutional contracts. The same report says mastodon.social and mastodon.online processed 49,419 reports in 2024, with 25,621 leading to suspension, which shows that moderation is not marginal overhead but core infrastructure. ([joinmastodon.org](https://joinmastodon.org/reports/Mastodon%20Annual%20Report%202024.pdf))

**Interpretation:** Mastodon’s political economy is not simply “volunteers run servers.” It is becoming a nonprofit/open-source service organization with public-good grants, donor patronage, and selective professional services. This may stabilize core development, but it also creates a center of gravity around one project.

### Example B: PeerTube and the economics of media weight

PeerTube makes visible what text microblogging can hide: video is expensive. Storage, transcoding, bandwidth, and moderation of audiovisual material raise the cost per potential participant. That is why PeerTube’s design favors many interconnected hosts rather than one giant platform. ([joinpeertube.org](https://joinpeertube.org/faq?utm_source=chatgpt.com))

**Interpretation:** federation is not just a governance model; it is also a cost-distribution model. But cost distribution can become exclusion if only well-resourced communities can host video.

### Example C: WordPress and Ghost as publishing federation

Automattic acquired the ActivityPub plugin for WordPress in 2023 and hired its developer, making it possible for WordPress blogs and authors to publish into ActivityPub networks. Ghost began public ActivityPub beta work in 2025, integrating the social web into a publishing platform whose business already includes hosted services and paid membership publishing. ([techcrunch.com](https://techcrunch.com/2023/03/13/wordpress-com-owner-automattic-acquires-an-activitypub-plugin-so-blogs-can-join-the-fediverse/))

**Interpretation:** this is one of the most compatible commercial forms: sell publishing infrastructure, memberships, and hosting while allowing audience relationships to federate outward. The risk is that publishers may gain distribution while users and replies become unpaid engagement labor for monetized newsletters.

### Example D: Threads and platform-adjacent federation

Meta began testing Threads federation in March 2024 and expanded fediverse sharing in June 2024. Threads users can opt into sharing with ActivityPub servers, and researchers have already produced datasets of cross-platform interaction between Threads and Mastodon users. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com))

**Interpretation:** Threads does not need to “own ActivityPub” to affect the Fediverse. Scale alone can reshape norms, moderation pressure, discovery expectations, and development priorities. Meta can participate in the public protocol while retaining proprietary app design, ranking, data infrastructure, and monetization outside the federated interface.

### Example E: Sub.club and paid subscriptions

Sub.club launched in 2024 as an attempt to bring paid subscriptions to ActivityPub, taking a percentage plus processing fees, but announced shutdown by early 2025 after failing to find product-market fit or attract enough investment. ([theverge.com](https://www.theverge.com/2024/9/1/24232298/sub-club-fediverse-make-money?utm_source=chatgpt.com))

**Interpretation:** “money without ads” is possible but not automatically sustainable. Fediverse norms may support creator payment in principle, yet resist paywalls, investor growth expectations, and centralized monetization layers.

### Example F: Bridgy Fed and the bridge as infrastructure

Bridgy Fed connects websites, the fediverse, and Bluesky, allowing follows and interactions across protocols as much as possible. The bridge is socially important because it converts separate protocol publics into reachable audiences, but it also concentrates technical and governance responsibility in a translation layer. ([fed.brid.gy](https://fed.brid.gy/?utm_source=chatgpt.com))

**Interpretation:** bridges are not neutral pipes. They decide what identity, consent, deletion, blocking, replies, quote-posts, and harassment mean across incompatible systems.

---

## 7. What does the Fediverse commodify?

The Fediverse does not primarily commodify user attention through ads, although corporate entrants may. Its native commodities are more indirect:

| Commodity-like object | How it becomes valuable | Risk |
|---|---|---|
| **Reliable hosting** | People pay to avoid sysadmin work | Managed-hosting concentration |
| **Moderation capacity** | Safe communities require labor and tools | Care labor becomes unpaid or outsourced |
| **Discovery** | Search, trending, directories, and feeds route attention | New algorithmic gatekeepers |
| **Identity continuity** | Handles, followers, and domain reputation matter | Domain owners become identity landlords |
| **Trust and blocklist position** | Being allowed, blocked, or recommended affects reach | Informal governance becomes opaque power |
| **Publishing audience** | Ghost, WordPress, newsletters, media accounts federate content | Audience becomes monetized off-network |
| **Bridge access** | Cross-protocol reach increases visibility | Consent and context collapse |
| **Software defaults** | Defaults shape feeds, privacy, federation, moderation | Maintainers exercise infrastructural power |

So the Fediverse commodifies less by selling ads against attention and more by selling relief from difficulty: relief from hosting, moderation, migration, discovery, audience-building, and institutional risk.

---

## 8. Comparison: Fediverse, Discord, Hive

| System | Economic unit | Capital form | Labor relation | Main capture risk |
|---|---|---|---|---|
| **Fediverse** | Instance, actor, project, protocol, audience | Domain reputation, local graph, moderation capacity, software affordance, discovery | Volunteer-heavy; some grants, donations, managed hosting | Convenience capture, discovery capture, corporate scale asymmetry |
| **Discord** | Proprietary server/community inside one platform | Server roles, chat history, bot integrations, Nitro boosts, paid memberships | Community mods often unpaid; platform controls infrastructure | Dependency capital: communities build value inside a proprietary container |
| **Hive / blockchain social** | Token account, stake, post, reward pool | Token stake, voting power, reputation, curation rewards | Users create/curate for token rewards; bots can game rewards | Attention-stake capital: visibility and payout tied to token power |

Discord makes community operators dependent on proprietary infrastructure while monetizing through Nitro, boosts, server shops, and server subscriptions; Discord’s own creator support materials describe paid server access and a 90/10 creator revenue split for server subscriptions. ([creator-support.discord.com](https://creator-support.discord.com/hc/en-us/articles/10423011974551-Server-Shop-For-Server-Owners-and-Admins?utm_source=chatgpt.com))

Hive’s model is different: its own FAQ says newly minted tokens enter a rewards pool and are distributed according to votes, while users with more Hive Power influence more of that distribution. That is an attention-stake model, not a federation model. Prior research on Steemit-like incentivized social media found that tokenized rewards and delegated proof-of-stake can reproduce concentration and bot incentives. ([hive.blog](https://hive.blog/faq.html?utm_source=chatgpt.com))

**Conclusion of comparison:** the Fediverse’s distinctive feature is not that it has no capital; it is that capital is fragmented across domains, maintainers, hosting providers, moderation networks, and discovery tools rather than consolidated in one proprietary platform or one token economy.

---

## 9. Compatible and hostile businesses

### More compatible with Fediverse norms

| Business form | Why it can fit |
|---|---|
| Transparent managed hosting | Sells maintenance, not enclosure; best when migration/export are easy |
| Professional support contracts | Lets institutions pay for reliability without owning the protocol |
| Cooperative/member-funded instances | Aligns governance and funding with users |
| Public-interest grant work | Funds protocol, security, accessibility, moderation tools, and interoperability |
| Publisher subscriptions | Compatible when audiences remain portable and replies are not exploited |
| Privacy-preserving search/discovery | Useful if transparent, plural, opt-out-aware, and not surveillance-based |
| Moderation tooling as commons | Supports care labor without centralizing speech governance |

### Hostile or high-risk forms

| Business form | Why it threatens the network |
|---|---|
| Surveillance advertising | Reimports the dominant platform business model |
| Engagement-maximizing ranking | Converts sociality into behavioral extraction |
| Proprietary federation extensions | Produces “compatible” networks that work best only with one vendor |
| Free hosting funded by data extraction | Makes users pay with behavioral data |
| Bridge-by-default without consent | Collapses contexts across publics |
| VC growth models | Push toward scale, retention, lock-in, and monetizable attention |
| Moderation monopolies | Centralize de facto speech governance |
| Analytics/data resale/AI scraping | Treats the public social web as extractive raw material |

---

## 10. Risks

1. **Volunteer burnout becomes infrastructural failure.** Small instances can disappear when an admin loses income, health, housing, interest, or legal tolerance.

2. **Moderation becomes a hidden subsidy.** The network’s safety depends on unpaid or underpaid people absorbing harassment, spam, interpersonal conflict, and legal risk.

3. **Search and discovery are underfunded.** Weak discovery protects against some virality, but also makes the network hard to join, hard to search, and hard for creators to sustain.

4. **Large actors can federate asymmetrically.** Threads, WordPress, Ghost, Flipboard, and future corporate actors can gain distribution while retaining capital-intensive advantages in apps, analytics, onboarding, and moderation.

5. **Public-good grants may create project inequality.** Grant-funded projects become more sustainable, while unfunded but socially important tools remain fragile.

6. **Defederation is both governance and fragmentation.** It protects communities, but also produces uneven publics, partial archives, missing replies, and political disputes over legitimacy.

7. **The “no algorithm” myth obscures power.** Local timelines, federated timelines, hashtags, trending posts, search indexes, app defaults, relays, and curated feeds are all forms of attention ordering.

8. **Data ethics remain unsettled.** Public ActivityPub data is technically accessible, but research on Fediverse data ethics shows tension between instance policies, user expectations, and academic or commercial data collection. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

---

## 11. Open research questions

1. What is the real per-potential-user cost across text, image, video, forum, and livestreaming instances when labor is included?

2. Which instance governance models reduce admin burnout: benevolent dictator, co-op, nonprofit board, municipal host, university host, rotating collective?

3. How do blocklists redistribute power among large and small instances?

4. Which users are most likely to be harmed by underfunded moderation: marginalized users, journalists, sex workers, trans users, racialized users, political dissidents, minors, or non-English-speaking communities?

5. Can ActivityPub support paid publishing without recreating platform enclosure?

6. How should grants fund maintenance, not only new features?

7. What does consentful bridging require across ActivityPub, AT Protocol, Nostr, RSS, and the open web?

8. Does federation meaningfully resist platform capitalism, or does it become a low-cost syndication layer for better-capitalized platforms?

9. Can discovery be funded as a public good rather than captured as a ranking monopoly?

10. What legal and insurance structures do instance operators need as moderation, copyright, privacy, and child-safety obligations grow?

---

## 12. Bottom line

The Fediverse is best understood as **cooperative, volunteer, and platform-adjacent infrastructure**. It is cooperative because communities can own and govern servers. It is volunteer because unpaid labor still carries much of the system. It is platform-adjacent because corporate, nonprofit, and SaaS actors can plug into ActivityPub without sharing the same economic commitments.

Federation resists one form of platform capitalism: the single company that owns identity, graph, feed, moderation, data, and monetization. But it creates a new terrain of struggle over hosting, care labor, standards, discovery, bridges, grants, and institutional convenience. The political question is therefore not “is the Fediverse liberated?” but: **which layers remain commons, which become services, which become rents, and who is paid to care for the people using them?**

---

## Annotated bibliography

**W3C ActivityPub Recommendation, 2018.** Defines the protocol basis for server-to-server federation and client-to-server social APIs. Essential for distinguishing protocol facts from Fediverse mythology. ([w3.org](https://www.w3.org/TR/activitypub/?utm_source=chatgpt.com))

**FediDB and Fediverse Observer statistics, 2026.** Useful but incomplete indicators of scale, software diversity, active accounts, and instance counts. Treat as aggregator data, not a census. ([fedidb.com](https://fedidb.com/stats?utm_source=chatgpt.com))

**Mastodon 2024 Annual Report.** Rare detailed financial disclosure: revenue, costs, donor share, grants, contracts, moderation reports, and project metrics. Core source for nonprofit/open-source sustainability analysis. ([joinmastodon.org](https://joinmastodon.org/reports/Mastodon%20Annual%20Report%202024.pdf))

**Mastodon 2025 nonprofit restructuring and service offerings.** Shows Mastodon moving toward asset stewardship by a nonprofit plus paid hosting/moderation/support services for institutions. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2025/01/the-people-should-own-the-town-square/?utm_source=chatgpt.com))

**Sovereign Tech Fund/Agency ActivityPub and Mastodon funding, 2025–2026.** Important example of European public-interest funding entering Fediverse maintenance, security, and protocol work. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2026/04/sovereign-tech-agency-funding/?utm_source=chatgpt.com))

**Masto.host, FediHost, and small-instance cost reports.** Practical evidence that hosting can be cheap at small scale but rises with storage, active users, media, search, backups, and labor. ([masto.host](https://masto.host/pricing/?utm_source=chatgpt.com))

**PeerTube / Framasoft documentation.** Shows how video changes the economics of federation: storage and transcoding make decentralization partly a cost-distribution strategy. ([joinpeertube.org](https://joinpeertube.org/?utm_source=chatgpt.com))

**Pixelfed, Lemmy, GoToSocial, Misskey, Akkoma, Bonfire, WriteFreely, BookWyrm, Owncast documentation.** Demonstrates that the Fediverse is not Mastodon: each software family has different media costs, governance assumptions, social norms, and funding fragility. ([pixelfed.org](https://pixelfed.org/?utm_source=chatgpt.com))

**Moderation studies: “Will Admins Cope?” and 2025 Internet Policy Review moderation work.** Key evidence that decentralized moderation creates real admin burden and that large instances struggle with resources. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

**Blocklist research and public blocklist repositories.** Shows defederation and shared blocklists as socio-technical governance infrastructure, not merely technical filters. ([arxiv.org](https://arxiv.org/html/2506.05522v1?utm_source=chatgpt.com))

**WordPress ActivityPub and Ghost ActivityPub materials.** Important for publisher federation: ActivityPub becomes a distribution layer for blogs, newsletters, and membership publishing. ([wordpress.org](https://wordpress.org/plugins/activitypub/))

**Threads federation documentation and FediverseSharing research.** Central to corporate-entry analysis: federation can be opt-in and standards-based while still asymmetrical in scale and business model. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com))

**Sub.club reporting, 2024–2025.** A failed but revealing attempt to build paid subscriptions over ActivityPub; shows both the promise and difficulty of monetization without ads. ([theverge.com](https://www.theverge.com/2024/9/1/24232298/sub-club-fediverse-make-money?utm_source=chatgpt.com))

**Discord monetization documentation and Hive reward documentation.** Useful comparators: Discord exemplifies dependency capital inside proprietary community infrastructure; Hive exemplifies tokenized attention-stake capital. ([creator-support.discord.com](https://creator-support.discord.com/hc/en-us/articles/10423011974551-Server-Shop-For-Server-Owners-and-Admins?utm_source=chatgpt.com))
