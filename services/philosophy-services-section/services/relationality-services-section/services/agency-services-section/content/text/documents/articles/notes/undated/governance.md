---
title: Fediverse Moderation and Defederation Governance
description: Governance memo arguing Fediverse governance is polycentric, software-mediated, locally sovereign, and globally entangled, with practical power held by instance administrators, moderators, software defaults, blocklist maintainers, hosting providers, and bridge operators rather than any global court. Frames defederation as simultaneously a safety mechanism and a power mechanism, and reframes the normative question as who can draw boundaries, with what evidence, notice, appeal, review, and labor cost.
keywords: ["fediverse", "governance", "moderation", "defederation", "blocklists", "polycentric", "due-process", "instance-administration"]
---

# Governance memo: Fediverse moderation and defederation  
**Date:** June 11, 2026  
**Scope:** ActivityPub-conformant and ActivityPub-adjacent social web systems, including Mastodon, Pixelfed, PeerTube, Lemmy/Mbin/Kbin, Misskey/Sharkey/Iceshrimp forks, Pleroma/Akkoma, WriteFreely, BookWyrm, Owncast, WordPress ActivityPub, Ghost ActivityPub, Threads federation, Bridgy Fed, Bonfire, GoToSocial, and smaller implementations.

## Abstract

Fediverse governance is not “no governance”; it is **polycentric, software-mediated, locally sovereign, and globally entangled**. ActivityPub gives servers a shared grammar for actors, inboxes, outboxes, objects, and delivery, but it does not create a global court, uniform due process, enforceable deletion, consistent appeals, or a shared moderation state. The practical governors are instance administrators, moderators, software defaults, public blocklist maintainers, hosting providers, bridge operators, legal regimes, volunteer labor capacity, and the social legitimacy of local norms. ActivityPub defines client/server and server/server federation layers, but implementation and policy decide what is stored, displayed, rejected, reported, or blocked. ([w3.org](https://www.w3.org/TR/activitypub/))

The core finding is ambivalent: **defederation is both a safety mechanism and a power mechanism**. It can protect communities from spam, harassment, CSAM, fascist organizing, hostile quote-dunking, ban evasion, and nonresponsive servers. It can also create opaque exclusion, factionalism, isolation, reputational cascades, and quasi-centralized authority through shared blocklists. The normative question is therefore not “federation good or bad?” but: **who can draw boundaries, with what evidence, what notice, what appeal, what review, and at whose labor cost?**

---

## Core thesis

The Fediverse works through a layered governance stack:

| Layer | What it governs | Main power holders | Failure mode |
|---|---|---|---|
| **Protocol** | Activity routing, actor/object model, inbox/outbox delivery | W3C specs, implementers | Too thin to settle moderation disputes |
| **Software** | Reports, blocks, quote affordances, visibility, search, federation modes | Mastodon, Lemmy, PeerTube, GoToSocial, Akkoma, Bonfire, etc. maintainers | Defaults become hidden law |
| **Instance policy** | Rules, registrations, local norms, sanctions | Admins, councils, co-ops, institutions | Benevolent dictatorship, inconsistency, burnout |
| **Moderation labor** | Reports, appeals, triage, abuse response | Volunteer mods/admins | Trauma exposure, unpaid care labor |
| **Federation controls** | Domain blocks, limits, allowlists, media rejection, relays, bridges | Admins and blocklist maintainers | Overblocking, underblocking, list capture |
| **Political economy** | Hosting, storage, legal risk, donations, grants, corporate federation | Admins, donors, foundations, companies | Unsustainable infrastructure or corporate capture |
| **Public mythology** | “Decentralized,” “community-owned,” “anti-platform,” “free speech,” “safe space” | Users, journalists, advocates, critics | Confusing federation with liberation |

ActivityPub’s protocol layer is deliberately limited: actors have inboxes and outboxes, servers deliver activities, and implementations decide many side effects. The W3C spec even notes that deletion side effects are not fully enforceable by protocol alone, which matters for moderation, archival persistence, and remote copies. ([w3.org](https://www.w3.org/TR/activitypub/))

---

## 1. What powers does an admin actually have?

An **instance admin** has power over the local server, not over the Fediverse as a whole. That sounds modest, but local power is extensive: admins can set rules, control registrations, appoint moderators, configure roles, update or fork software, inspect logs subject to policy and law, suspend users, delete local accounts, alter federation settings, import blocklists, block domains, limit remote servers, disable federation, and decide whether the server is a hobby project, collective, nonprofit, institution, or business.

Mastodon’s own moderation documentation states the key jurisdictional principle clearly: a moderator or administrator on one server cannot directly affect a user on another server, only the local server’s copy and interaction with that user. But that local copy is what local users experience, so “local” power still determines the reality of a community’s public sphere. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/))

In Mastodon, fine-grained role permissions include managing reports, federation, appeals, users, rules, and user data. These are software-defined powers that can be assigned differently across instances. ([docs.joinmastodon.org](https://docs.joinmastodon.org/entities/Role/)) In GoToSocial, admins can choose blocklist federation or allowlist federation; allowlist mode limits federation to explicitly approved servers and sharply changes discovery and reach. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/federation_modes/)) In BookWyrm, admins and moderators can block instances, create auto-moderation rules, bulk-upload FediBlock-style lists, and even disable federation entirely. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/moderation.html))

**Admin power is therefore infrastructural sovereignty over a local node.** It is not global sovereignty, but it is enough to decide who local users can see, follow, report, host, trust, and be exposed to.

---

## 2. What powers does a moderator actually have?

A **moderator** usually has less power than an admin, but the boundary varies by software and role configuration.

| Software family | Moderator/admin distinction | Important affordances |
|---|---|---|
| **Mastodon** | Role permissions can grant report handling, appeals, user moderation, federation management, rule management, and data deletion separately. ([docs.joinmastodon.org](https://docs.joinmastodon.org/entities/Role/)) | Reports, warnings, limits, suspensions, domain blocks, appeals |
| **Lemmy / Mbin / Kbin-style link aggregation** | Lemmy distinguishes community moderators from instance admins: community mods govern communities; admins govern the instance and federation. ([join-lemmy.org](https://join-lemmy.org/docs/users/04-moderation.html)) | Community removals, bans, instance bans, modlog, federation blocks |
| **PeerTube** | Moderators can handle abuse reports, block videos, remove videos/comments/channels, manage users, mute platforms, and see even private/unlisted videos depending on role. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation)) | Media moderation, abuse triage, video quarantine, platform muting |
| **BookWyrm** | Moderators/admins handle reports, delete statuses, deactivate accounts locally, block instances, and use auto-moderation rules. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/moderation.html)) | Reading-community reports, instance blocking, email/IP blocks |
| **Akkoma / Pleroma** | Much moderation is implemented through MRF policies, which rewrite, reject, mark, or filter incoming/outgoing messages. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/configuration/cheatsheet/)) | Keyword filters, anti-spam filters, media rejection, followers-only policies |
| **GoToSocial** | Admins can use domain blocks, domain limits, allowlist mode, and domain permission subscriptions. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/federation_modes/)) | Granular federation policy, list subscription, allowlist clusters |
| **Bonfire** | Moderation is tied to boundaries, circles, and interaction policies; Bonfire also supports Flag reports and domain-block enforcement. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html)) | Boundary-based visibility, interaction policy, canQuote/canReply-style controls |
| **Peer/community media systems: Owncast, WriteFreely, WordPress ActivityPub, Ghost ActivityPub** | Moderation often inherits from publishing, comment, chat, or CMS governance rather than microblog norms. Owncast emphasizes live chat moderation; WordPress and Ghost bring blog/newsletter comments and publication governance into federation. ([owncast.online](https://owncast.online/docs/chat/moderation/?utm_source=chatgpt.com)) | Chat bans, comment moderation, federated replies, publishing workflows |

A moderator’s practical power depends less on the abstract Fediverse and more on the local software’s workflow: Does it have report queues? Bulk actions? Notes? Appeals? Remote report forwarding? Evidence preservation? Shared queues? Audit logs? Trauma-aware tooling? Many smaller servers have thin tooling and rely on informal judgment.

---

## 3. Moderation and federation mechanisms

The Fediverse uses a vocabulary that often sounds similar across software but differs in implementation.

| Mechanism | What it usually means | Governance significance |
|---|---|---|
| **User mute/block** | A user hides or rejects another user locally | Individual boundary; does not solve community-scale abuse |
| **Report** | User asks moderators/admins to review content or conduct | Creates labor; may or may not be forwarded cross-instance |
| **Flag activity** | ActivityPub-compatible report-like activity used by some implementations | Supports cross-server reporting, but workflows differ ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/)) |
| **Warning** | Moderator communicates rule violation | Lowest formal sanction; depends on documentation |
| **Limit / silence** | Hide account from public discovery or non-followers on local instance | Reduces visibility without full suspension; Mastodon says limit does not affect federation itself. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/)) |
| **Suspension** | Remove or disable account locally; for remote users, remove local representation/follows | Strong sanction; remote original may still exist elsewhere |
| **Domain limit** | Reduce visibility or media from a remote server | Middle ground between open federation and full block |
| **Domain suspend / block / defederation** | Reject or remove federation with a server | Protective wall or political exclusion, depending on facts and process |
| **Media rejection** | Refuse media from a remote server while allowing some activity | Important for storage, legal, and abuse risk |
| **Allowlist federation** | Federate only with approved servers | Safety-by-default but discovery-limiting; GoToSocial documents this tradeoff. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/federation_modes/)) |
| **Shared blocklist** | Imported or subscribed list of domains/actors to block or limit | Labor-saving and power-concentrating |
| **FIRES-style advisories** | Structured moderation recommendations rather than prescriptive blocks | Attempts to make moderation data more granular and locally reviewable. ([fires.fedimod.org](https://fires.fedimod.org/)) |
| **MRF / message rewriting** | Akkoma/Pleroma-style filtering or transformation of messages in transit | Makes moderation infrastructural and programmable. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/configuration/cheatsheet/)) |
| **Interaction boundaries** | Bonfire-style circles/policies for who may reply, like, announce, or quote | Shifts moderation from after-the-fact cleanup to prior boundary design. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html)) |

---

## 4. Due process in a federated network

There is no single Fediverse due process. There are **local due processes**, plus inconsistent cross-instance diplomacy.

A minimal federated due-process model would include:

| Due-process element | Local user | Remote user | Domain-level case |
|---|---|---|---|
| Notice | Email, in-app notice, warning | Often absent or indirect | Often public block reason, if any |
| Evidence | Reported posts, logs, moderator notes | Local copies may be incomplete | Blocklist receipts, admin reports, public evidence |
| Appeal | Local form, email, admin contact | Rare; depends on instance policy | Rare and often social rather than procedural |
| Proportionality | Warning → limit → suspension | Limit/block local copy | Media reject, limit, suspend, allowlist |
| Review | Moderator/admin review | Inter-admin communication | Periodic blocklist/domain review |
| Restoration | Unsuspend, delete strike, migrate | Refederate or unblock locally | Remove from blocklist/domain block |

Mastodon has a relatively formalized appeal path: default moderation decisions notify users by email and provide an appeal page, with a one-appeal window within 20 days. But that is Mastodon-specific and mostly local; a remote user affected by another instance’s domain block may never receive comparable notice. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/))

Due process also changes by harm type. For spam, harassment, dogpiling, or ideological disputes, review and appeal matter. For CSAM, credible threats, doxxing, or potential raids, immediate protective action may be necessary, with documentation and review afterward. Stanford’s 2023 child-safety research found known CSAM matches and abuse-signaling hashtags in a Fediverse sample, and IFTAS later documented how federated systems can be misused for illegal content circulation, directing, and abuse coordination. ([fsi.stanford.edu](https://fsi.stanford.edu/news/addressing-child-exploitation-federated-social-media?utm_source=chatgpt.com))

---

## 5. When is defederation protection?

Defederation is protection when it reduces exposure to persistent, externally sourced harm that local tools cannot reasonably handle.

Typical protective conditions:

1. **Nonresponsive or malicious remote administration.** If a remote admin ignores reports, encourages abuse, or hosts explicitly harmful communities, local instance-level tools become the only effective boundary.
2. **High-volume spam or registration abuse.** Open registrations can produce waves of automated accounts; PeerTube documents spam countermeasures for open registration, and Kissane/Kazemi identify spam as a major governance risk after growth shocks. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation))
3. **Media/legal risk.** Video, image, and livestreaming servers face storage, copyright, CSAM, and moderation burdens different from text servers. PeerTube supports video blocking, platform muting, quarantine, and auto-mute/block plugins partly because media moderation has distinct infrastructure costs. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation))
4. **Coordinated harassment, brigading, dogpiling, and ban evasion.** Local user blocks do not scale against raids from hostile instances.
5. **Fascist or extremist organizing.** Defederation is often used as community defense when remote servers normalize racist, fascist, or eliminationist content and refuse enforcement.
6. **Security incidents.** Vulnerable or compromised servers may be temporarily defederated to protect local users and infrastructure.
7. **Bridge asymmetry.** Bridgy Fed and Threads federation show that bridges and corporate federation can import new publics, scale, moderation assumptions, and identity semantics into existing communities. ([fed.brid.gy](https://fed.brid.gy/docs?utm_source=chatgpt.com))

In these cases, defederation is not a moral failure of federation. It is one of the main ways federation expresses community boundary-setting.

---

## 6. When is defederation censorship, factionalism, or isolation?

Defederation becomes normatively risky when it is opaque, disproportionate, unreviewable, or captured by factional authority.

The strongest formulation is not “defederation equals censorship.” A server is not the whole public sphere; a local admin refusing federation is not identical to a state banning speech. But defederation can still suppress reach, reputation, and participation. A 2024 quasi-experimental study of Mastodon defederation found that defederation was associated with reduced activity on blocked servers, while not finding evidence of reduced toxicity. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

Risk conditions include:

| Risk condition | Why it matters |
|---|---|
| **No reason given** | Users and peer admins cannot distinguish safety from factional preference |
| **No appeal path** | False positives persist |
| **Shared list cascade** | One curator’s judgment can propagate through many servers |
| **Ideological overreach** | Boundary-setting can become purity enforcement |
| **Large-instance dominance** | Big servers can define de facto reachability for smaller ones |
| **Corporate blocklists** | Threads/Meta-scale decisions can affect visibility asymmetrically |
| **Allowlist isolation** | Safety improves, but discovery and pluralism narrow |
| **Bridge opacity** | Users may not know when content crosses protocols or publics |

Meta’s Threads federation makes this tension unusually visible. Threads began ActivityPub sharing as an opt-in beta for adult public profiles in selected regions in March 2024, later expanding the feature; Meta emphasizes that servers set their own standards, while critics worry that corporate scale alters the meaning of federation. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/)) By 2025, Threads added a dedicated fediverse feed and search surface, which increases the practical visibility of cross-server content while keeping Threads’ federation opt-in structure. ([theverge.com](https://www.theverge.com/news/688267/threads-fediverse-feed-search))

---

## 7. How blocklists create power

Blocklists are not merely technical files. They are **portable governance judgments**.

They solve a real problem: small admins cannot individually investigate every abusive server, spam domain, bridge, or bad actor. Public lists such as Oliphant, Garden Fence, Seirdy’s lists, FediSeer-style resources, and wiki-curated lists exist because distributed administrators need shared memory and early-warning systems. ([writer.oliphant.social](https://writer.oliphant.social/oliphant/the-oliphant-social-blocklist?utm_source=chatgpt.com))

But blocklists also create power:

| Benefit | Power risk |
|---|---|
| Reduce duplicated investigation | Curators become quasi-governors |
| Help small servers survive | Small admins may import judgments they cannot verify |
| Encode community memory | Old conflicts can persist without review |
| Enable fast response | False positives propagate quickly |
| Support shared safety norms | Dominant factions can set reachability norms |
| Make reasons public | Receipts can expose vulnerable reporters or targets |

FIRES is important because it explicitly tries to move beyond crude CSV denylists toward structured, advisory moderation data. Its documentation frames moderation entries as recommendations rather than commands, emphasizes local moderator discretion, and notes that domain-level denylists are blunt instruments that can punish whole servers for a subset of behavior. ([fires.fedimod.org](https://fires.fedimod.org/)) GoToSocial’s domain permission subscriptions similarly allow servers to subscribe to remote allow/block lists, with periodic fetching, but the docs warn that imported lists should be manually reviewed because they can remove follows and statuses. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/domain_permission_subscriptions/))

The research problem is therefore: **how can shared moderation intelligence exist without becoming unaccountable federation government?**

---

## 8. Governance typology

| Governance model | Typical examples | Strengths | Risks |
|---|---|---|---|
| **Single-user / personal instance** | GoToSocial, Mastodon, Akkoma, Sharkey/Iceshrimp personal servers | High autonomy, low internal conflict | Admin isolation, poor abuse response, fragile hosting |
| **Benevolent admin hobby server** | Many Mastodon, Pixelfed, Misskey, Akkoma servers | Quick decisions, strong culture | Autocracy, bus factor, burnout |
| **Small collective** | Co-admin Mastodon/Lemmy/BookWyrm communities | Shared labor, community accountability | Informality, conflict, unclear appeals |
| **Co-op / nonprofit** | Social.coop-like models, Nivenly-adjacent projects | Formal governance, fiscal structure | Slow decisions, governance overhead |
| **Institution-run** | University, city, media, library, NGO servers | Stable funding, legal capacity | Institutional speech controls, bureaucratic moderation |
| **Topic/community server** | Lemmy communities, BookWyrm groups, Pixelfed art/photo instances | Clear norms, shared purpose | Insularity, boundary disputes |
| **Creator/media server** | PeerTube, Owncast, WriteFreely | Strong editorial identity | Comment/chat abuse, media liability |
| **CMS/newsletter federation** | WordPress ActivityPub, Ghost ActivityPub | Brings publishing into social web | Comment/reply moderation may lag microblog expectations |
| **Corporate federated edge** | Threads, potentially other platform integrations | Scale, onboarding, resources | Capture, surveillance expectations, asymmetric rule-setting |
| **Bridge operator** | Bridgy Fed, cross-protocol bridges | Interoperability | Consent, identity, moderation translation problems |

Kissane and Kazemi’s 2024 governance report is central here: they found Fediverse governance to be emergent rather than innate, often top-down by default, with many servers run by individuals or small groups, and with significant gaps in cultural, financial, legal, and technical capacity. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

---

## 9. Worked examples

### Case 1: Small GoToSocial or Mastodon server under spam pressure

A hobby admin runs a small instance. Open registrations attract spam accounts. Local users report junk replies and malicious follows. The admin can close registrations, suspend local accounts, block abusive domains, import a shared blocklist, enable stricter authorized-fetch-style controls where supported, or move to allowlist federation. GoToSocial documents both open blocklist mode and allowlist mode, while Mastodon documents domain limits and suspensions. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/federation_modes/))

**Governance lesson:** federation shifts spam response from platform trust-and-safety departments to small operators. Shared lists and tooling help, but they also transfer trust to list maintainers.

### Case 2: Lemmy community conflict across instances

A Lemmy community moderator removes posts and bans a user from a community. The instance admin can take broader action, including instance bans or federation blocks. Lemmy’s docs explicitly distinguish community moderators from admins and note that there is no single platform-wide moderation team or universal rule set. ([join-lemmy.org](https://join-lemmy.org/docs/users/04-moderation.html))

**Governance lesson:** community self-governance is nested. A community may govern discussion, but instance admins govern infrastructure and federation. Remote users are affected by a community’s rules without being citizens of that instance.

### Case 3: PeerTube media abuse

A PeerTube server receives reports about a harmful or illegal video. Moderators can remove or block videos, handle abuse reports, mute platforms, and use plugins or public mute lists; local removal can also affect federation of that video. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation))

**Governance lesson:** media federation is not just speech governance. It is storage, bandwidth, legal exposure, thumbnails, mirrors, caches, and trauma exposure for moderators.

### Case 4: Threads federation

Threads federation introduces a corporate actor with vastly greater scale than most Fediverse instances. Meta describes Threads federation as opt-in for public adult profiles and notes that different ActivityPub servers set their own standards. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/)) Critics and many Fediverse admins worry that Meta’s size, moderation model, data practices, and product incentives could reshape the social web even without owning the protocol. Wired reported early calls by some Fediverse participants to preemptively block Threads. ([wired.com](https://www.wired.com/story/metas-threads-could-make-or-break-the-fediverse?utm_source=chatgpt.com))

**Governance lesson:** decentralization does not erase political economy. A federated corporation may not own the network, but it can alter discovery, attention, moderation load, and legitimacy.

### Case 5: FIRES or shared blocklist synchronization

A small admin subscribes to a shared blocklist or FIRES-style advisory feed. This reduces investigation burden and speeds response. But if the list includes a domain based on stale, vague, or factional evidence, the subscribing server may silently exclude people who never had a chance to contest the listing. FIRES tries to address this by treating entries as structured advisories, not mandates. ([fires.fedimod.org](https://fires.fedimod.org/))

**Governance lesson:** the future of federated moderation may depend less on whether blocklists exist and more on whether they support evidence, granularity, review, appeal, and local discretion.

### Case 6: Long-form federation through Ghost, WordPress, WriteFreely, and BookWyrm

Ghost 6.0 made social web syndication a major publishing feature, while WordPress ActivityPub and WriteFreely bring blogs, authors, and newsletter-like publishing into federated interaction. ([theverge.com](https://www.theverge.com/news/718286/ghost-6-update-social-web-mastodon-bluesky?utm_source=chatgpt.com)) BookWyrm shows how a non-microblog domain—social reading—requires its own moderation model: reports, auto-moderation rules, instance blocking, email/IP blocks, and optional federation disablement. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/moderation.html))

**Governance lesson:** “Fediverse moderation” cannot be studied only through Mastodon posts. A federated book review, livestream chat, blog reply, video comment, photo post, or link-aggregation thread has different publics and risks.

---

## 10. Main abuse cases and burdens

| Abuse case | Why federation complicates it | Likely burden |
|---|---|---|
| **Spam and bot registrations** | Attackers can exploit open servers and federate outward | Admin time, blocklists, registration controls |
| **Harassment and dogpiling** | Abuse can originate remotely and arrive through replies, mentions, quotes, boosts, or bridges | Moderator triage, user safety planning |
| **Ban evasion** | Users can create accounts on other instances | Domain-level patterns, shared intelligence |
| **Brigading / raids** | Coordinated users can overwhelm small servers | Rapid defederation, temporary locks |
| **Fascist or extremist instances** | Whole servers may normalize abuse and refuse reports | Domain suspension, public accountability |
| **CSAM and illegal media** | Federated media may be cached, mirrored, or discovered across servers | Legal escalation, trauma, reporting systems |
| **Doxxing / NCII** | Copies may persist on remote servers even after local deletion | Fast takedown requests, remote admin coordination |
| **Bridge consent failures** | Content crosses protocols with different norms | Opt-out, bridge blocks, user education |
| **Quote-dunking and context collapse** | Software affordances change audience scale and pile-on dynamics | Interaction controls, cultural norms |
| **Admin abuse** | Local sovereigns can act arbitrarily | Migration, forks, public pressure, formal governance |
| **Burnout** | Volunteer moderators absorb platform-scale care work | Funding, staffing, rotation, training |

The 2025 Internet Policy Review study on Fediverse moderation labor emphasizes that post-2022 growth produced distinct moderation challenges, with variations by size, focus, and geography, and with tensions between decentralization and centralization. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges)) Kissane and Kazemi similarly identify bus factor, financial instability, legal liability, lack of training, brittle leadership, burnout, spam, clunky appeals, and inadequate collaborative moderation tooling as major risks. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

---

## 11. Risk analysis

| Risk | Mechanism | Affected parties | Mitigations |
|---|---|---|---|
| **Under-moderation** | Small admins lack time/tools | Marginalized users, abuse targets | Shared reporting, training, emergency blocks |
| **Over-moderation** | Broad domain blocks or vague rules | Remote users, minority communities | Receipts, proportionality, review windows |
| **Blocklist capture** | Trusted curators become de facto authorities | Whole network regions | Multiple lists, transparent criteria, appeals |
| **Corporate capture** | Large platforms federate at scale | Small servers, users, norms | Local opt-in/out, bridge controls, antitrust lens |
| **Burnout** | Volunteer care labor becomes continuous | Admins/mods | Funding, rotations, peer support, legal help |
| **Legal exposure** | CSAM, threats, copyright, privacy law | Admins, hosts, users | Clear escalation protocols, minimal retention |
| **Data ethics failure** | Researchers scrape vulnerable communities | Users, mods, small servers | Consent, minimization, opt-outs, aggregation |
| **Instance collapse** | Admin disappears or cannot pay | Users, archives, communities | Backups, migration, fiscal sponsorship |
| **Governance opacity** | Rules and appeals are informal | Users, remote admins | Published policies, mod logs where safe |
| **Software monoculture** | Mastodon defaults treated as Fediverse law | Non-Mastodon projects | Comparative implementation research |

Fediverse Observer-style statistics are useful but partial: Fediverse Observer itself notes that its graphs are based on averaged monthly data from servers that choose to share public data, and its directory shows the breadth of software beyond Mastodon, including Misskey, Pixelfed, PeerTube, Lemmy, WriteFreely, Pleroma, BookWyrm, WordPress, Sharkey, Friendica, and others. ([fediverse.observer](https://fediverse.observer/fediversestats))

---

## 12. Recommended research methods

### A. Multi-sited governance ethnography  
Study admins, moderators, users, and software maintainers across Mastodon, Lemmy/Mbin/Kbin, PeerTube, Pixelfed, Misskey/Sharkey/Iceshrimp, Akkoma/Pleroma, BookWyrm, GoToSocial, Bonfire, WordPress ActivityPub, Ghost, WriteFreely, Owncast, and bridges. Do not treat Mastodon as the default case. Use trauma-informed interviews and avoid asking moderators to reproduce harmful content.

### B. Instance policy corpus with rule-readability analysis  
Collect public rules, terms, codes of conduct, appeal policies, federation policies, and blocklist explanations. Code for length, readability, specificity, sanction ladder, appeal path, remote-user treatment, and domain-block criteria. A 2026 preprint on community rules finds that community growth and volunteer moderation correlate with more complex rule systems, with harassment, hate, and illegal content among major rule categories. ([arxiv.org](https://arxiv.org/html/2606.05069v1))

### C. Comparative implementation audit  
Build a matrix of moderation affordances: report forwarding, local/remote account handling, domain limits, media rejection, quote controls, appeals, audit logs, moderator notes, bulk actions, allowlists, blocklist import/export, bridge controls, and deletion semantics. Include software docs and live admin interviews.

### D. Defederation event-history analysis  
Use public domain-block records, blocklist archives, and instance announcements to reconstruct defederation events. Measure timing, stated reasons, later refederation, activity effects, and user migration. Avoid ranking vulnerable communities or producing target lists.

### E. Blocklist ecology study  
Interview blocklist maintainers and subscribing admins. Compare criteria, evidence standards, update cadence, appeal mechanisms, list formats, and downstream adoption. The 2025 blocklist study found that moderators use blocklists for proactive safety and reactive response but worry about false positives and want better receipts, categories, and collaborative review. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

### F. Labor and cost diaries  
Ask admins and moderators to keep private time/cost diaries: reports per week, hosting bills, legal contacts, emotional load, moderation shifts, incidents, and donations. Publish only aggregate results.

### G. Abuse-case tabletop exercises  
Use synthetic incidents: spam wave, fascist raid, CSAM report, malicious bridge, compromised instance, Meta/Threads controversy, blocklist false positive. Observe how different governance models respond.

### H. Data ethics protocol  
Do not assume public federation equals research consent. A 2025 data-ethics paper on Fediverse research argues that many instance policies restrict data collection and that prior studies often under-addressed those obligations. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com)) Use consent where feasible, honor robots and instance research policies, aggregate results, redact small-server identifiers, avoid quoting vulnerable posts, and delay publication of active-threat details.

### I. Participatory design  
Co-design tools with moderators: federated report receipts, appeal templates, moderator notes, shared queues, FIRES-style advisory review, privacy-preserving abuse classifiers, legal escalation checklists, and admin peer-support channels. Treat tooling as governance, not neutral infrastructure.

---

## 13. Open questions

1. Can the Fediverse develop interoperable report, appeal, and moderation-note standards without creating centralized authority?
2. How should blocklist entries encode evidence, severity, duration, appeal path, and review date?
3. Can domain-level sanctions become more granular without overwhelming small admins?
4. What does meaningful consent look like for bridges such as Bridgy Fed or corporate federation such as Threads?
5. How can CSAM and severe abuse be handled without building centralized surveillance infrastructure?
6. What governance models actually reduce burnout: co-ops, nonprofits, paid moderation, fiscal hosts, institutional servers, or managed hosting?
7. How do multilingual, Indigenous, queer, disabled, Global South, and politically targeted communities experience defederation differently?
8. What happens when WordPress, Ghost, Threads, and other large publishing systems federate at scale?
9. Can users understand federation boundaries well enough to give informed social consent?
10. How should researchers study moderation without exposing vulnerable reports, targets, or admin infrastructure?

---

# Annotated bibliography

**W3C ActivityPub Recommendation, 2018.**  
Defines ActivityPub’s actor, inbox, outbox, client/server, and server/server federation model. Essential for distinguishing protocol facts from implementation and governance choices. ([w3.org](https://www.w3.org/TR/activitypub/))

**Mastodon moderation and role documentation, updated 2026.**  
Documents local moderation actions, limits, suspensions, domain blocks, appeals, and fine-grained role permissions. Useful because Mastodon is influential, but should not be generalized to the whole Fediverse. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/))

**Kissane and Kazemi, “Fediverse Governance,” August 20, 2024.**  
Major qualitative governance report. Finds Fediverse governance emergent, often top-down by default, and constrained by funding, legal, training, tooling, burnout, and federation-diplomacy gaps. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

**Spencer-Smith and Tomaz, “Labour pains: The challenges of content moderation on the Fediverse,” Internet Policy Review, March 31, 2025.**  
Interview-based study of admins, moderators, and IFTAS. Emphasizes labor, growth shocks, geography, and centralization/decentralization tensions. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges))

**Zhang et al., “Understanding Community-Level Blocklists in the Fediverse,” 2025.**  
Studies public blocklists and moderator interviews. Important for understanding blocklists as safety infrastructure and as power-concentrating governance objects. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Colglazier, TeBlunthuis, and Shaw, defederation quasi-experimental study, 2024.**  
Finds defederation associated with reduced activity on blocked servers, without clear evidence of toxicity reduction. Useful corrective against assuming defederation always achieves stated goals. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

**Muralidharan et al., “How Community Rules Scale,” 2026 preprint.**  
Analyzes how rules grow and formalize in federated communities. Useful for studying rule readability, complexity, and volunteer moderation scaling. ([arxiv.org](https://arxiv.org/html/2606.05069v1))

**GoToSocial federation and domain-permission documentation, current docs.**  
Strong source for allowlist federation, blocklist federation, domain limits, and domain permission subscriptions. Shows that federation governance can be configured far beyond simple “open or blocked.” ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/admin/federation_modes/))

**PeerTube moderation documentation.**  
Important non-Mastodon case. Shows how video moderation involves abuse reports, video blocking, quarantine, platform muting, plugins, and spam countermeasures. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation))

**Lemmy moderation documentation.**  
Useful for link-aggregation/forum governance. Distinguishes community moderators from instance admins and clarifies that there is no single platform-wide moderation team. ([join-lemmy.org](https://join-lemmy.org/docs/users/04-moderation.html))

**BookWyrm moderation and federation documentation.**  
Shows social-reading governance: reports, auto-moderation, instance blocking, email/IP blocklists, signed-fetch-like controls, and optional federation disablement. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/moderation.html))

**Akkoma moderation / MRF documentation.**  
Documents Message Rewrite Facility policies for anti-spam, keyword filtering, media handling, rejection, followers-only delivery, and report removal. Important for implementation-level moderation as programmable message transformation. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/configuration/cheatsheet/))

**Bonfire federation and moderation documentation, 2025.**  
Important emerging model: boundaries, circles, interaction policies, Flag reports, domain blocking, and modular federation. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html))

**FIRES documentation and repository, active through 2025.**  
Defines a protocol/reference server for structured moderation advisories. Important because it tries to improve on blunt blocklists while preserving local discretion. ([fires.fedimod.org](https://fires.fedimod.org/))

**Meta Engineering and Meta Newsroom on Threads federation, 2024–2025.**  
Primary sources for Threads’ opt-in ActivityPub federation, public-profile limits, server-to-server framing, and expansion. Must be read alongside critical Fediverse responses. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

**Wired on Threads and Fediverse reaction, 2023.**  
Useful journalism on early opposition to Meta federation and fears of corporate capture. ([wired.com](https://www.wired.com/story/metas-threads-could-make-or-break-the-fediverse?utm_source=chatgpt.com))

**Stanford Internet Observatory child-safety research, 2023; IFTAS CSAM guidance, 2025.**  
Important for illegal-content risk and the limits of volunteer moderation in federated infrastructure. Use carefully; do not reproduce operational abuse details. ([fsi.stanford.edu](https://fsi.stanford.edu/news/addressing-child-exploitation-federated-social-media?utm_source=chatgpt.com))

**Fediverse Observer.**  
Useful for showing software diversity and partial public measurement. Its own caveats about public data and servers choosing to share data should be treated as methodological warnings. ([fediverse.observer](https://fediverse.observer/fediversestats))
