---
title: "Research memo: Fediverse identity, migration, social trust, and reputation capital"
description: Fediverse identity is not one thing.
---
# Research memo: Fediverse identity, migration, social trust, and reputation capital  
**Source-grounded as of June 11, 2026**

## Abstract

Fediverse identity is not one thing. At the protocol layer, it is an ActivityPub **Actor** with a globally unique URI, discovered in practice through account-style identifiers such as `acct:user@domain` via WebFinger. At the social layer, it is a bundle of domain trust, instance membership, profile presentation, moderation history, interaction style, social graph, and memory across publics. The core finding is that identity in the Fediverse is **addressable and partially redirectable**, but not fully portable. Follower migration can move part of the audience in software that supports `Move`, `alsoKnownAs`, and related conventions, but posts, local reputation, search visibility, community membership, block history, moderation relations, and “being known as someone from that instance” usually do not move cleanly. ActivityPub itself leaves human identity modeling largely to implementations and communities, which is why identity is simultaneously technical, affective, administrative, and political. ([w3.org](https://www.w3.org/TR/activitypub/))

## Core thesis

A Fediverse identity is **protocol-addressed but socially anchored**. The durable technical unit is the Actor URI, but the socially meaningful unit is closer to:

> person or organization + account handle + domain + instance policy + profile evidence + interaction history + moderation context + network memory.

That means trust is not supplied by a central blue checkmark. It is assembled from evidence: stable domain control, reciprocal links, `rel=me` verification, known instance norms, transparent automation labels, moderation responsiveness, old-account announcements during migration, institutional web pages, and the testimony of other trusted actors. This distributes verification power, but it does not eliminate hierarchy. Domain ownership, admin capacity, search defaults, blocklists, bridges, instance size, and software affordances all become forms of reputation capital. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/))

---

## 1. Identity stack: from Actor URI to public reputation

ActivityPub’s protocol model is deliberately sparse about human identity. A user may be represented by an Actor; an Actor has an `id`, `inbox`, `outbox`, followers/following collections, and often fields such as `preferredUsername`, `name`, and `summary`. The spec also explicitly allows Actors to represent people, organizations, groups, software, or services, and it does not require a one-to-one relation between human beings and Actors. WebFinger supplies the common user-facing discovery mechanism: account-like resources such as `acct:carol@example.com` can resolve to profile and ActivityPub endpoints. ([w3.org](https://www.w3.org/TR/activitypub/))

| Layer | What it does | Trust value | Failure mode |
|---|---|---|---|
| **Actor ID** | Globally identifies the ActivityPub actor, often as an HTTPS URI. | Stable protocol address controlled by the originating server. | Breaks or becomes inaccessible if server disappears, domain changes, or implementation changes poorly. |
| **`acct:user@domain` handle** | Human-readable, WebFinger-discovered address. | Makes identity communicable across software. | Same username on another domain is a different actor; domain confusion enables impersonation. |
| **Domain** | Names the authority boundary: instance, personal domain, institutional domain, bridge domain. | Converts DNS/domain control into identity evidence. | Domain ownership is unequal; domain loss can erase continuity. |
| **Instance membership** | Places account under local rules, admins, moderation, federation policy, and culture. | Signals social context: queer instance, academic instance, art instance, national instance, large generic instance, single-user server. | Instance reputation can stigmatize or protect users regardless of individual conduct. |
| **Display name/avatar/bio/metadata** | Performs self-presentation; may include pronouns, links, labels, roles, bot disclosure. | Lets communities interpret identity in situated ways. | Display names are not unique; screenshots and copied bios can impersonate. |
| **Verification links / `rel=me`** | Cross-link between profile and controlled website. | Decentralized proof of domain or site control. | Verifies control of a web page, not legal identity, competence, or good faith. |
| **Social graph and interaction history** | Followers, mutuals, replies, boosts, mentions, moderation encounters. | Practical reputation: “known by known people.” | Partly lost during migration; not always visible across federation. |
| **Moderation record and block context** | Instance-level blocks, reports, defederation, public blocklists. | Community defense and domain-level reputation signal. | Can become opaque, politicized, stale, or overbroad. |

The crucial distinction is that **protocol uniqueness is not social trustworthiness**. ActivityPub can tell software which Actor sent an activity; it cannot tell a community whether the actor is the same person they knew on another server, whether a claimed credential is meaningful, or whether the account is safe to interact with.

---

## 2. The Fediverse is multi-software identity infrastructure

Mastodon is the most visible microblogging implementation, but Fediverse identity is shaped by many software genres. Pixelfed emphasizes image-centered accounts; PeerTube uses video channels and instance-hosted creators; Lemmy, Mbin, and Kbin organize identity around communities and threaded discussion; Misskey-family forks such as Sharkey and Iceshrimp bring different cultures of reactions, notes, and local customization; Pleroma and Akkoma have long-standing small-instance cultures; WriteFreely makes blogs followable; BookWyrm organizes reading identities; Owncast presents a livestream as a federated actor; WordPress and Ghost turn publications and authors into federated accounts; Threads adds a large corporate opt-in federation surface; Bridgy Fed links ActivityPub to websites and Bluesky-like networks; Bonfire experiments with boundaries and privacy. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

| Software / family | Identity form | Reputation emphasis |
|---|---|---|
| **Mastodon** | Person-like microblogging account, often `@user@instance`. | Instance norms, follower graph, profile links, posting history, moderation. |
| **Pixelfed** | Photographer/image account; migration can include Pixelfed-specific post migration where enabled. | Visual portfolio, creator identity, instance moderation, cross-platform follows. ([pixelfed.social](https://pixelfed.social/site/kb/your-profile)) |
| **PeerTube** | Video creator/channel on a host platform. | Channel trust, instance hosting policy, content moderation, creator continuity. ([joinpeertube.org](https://joinpeertube.org/)) |
| **Lemmy/Mbin/Kbin** | Users plus community/group actors; discussion identity is community-situated. | Community membership, moderation, karma-like memory where implemented, group norms. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html)) |
| **WriteFreely** | Blog actor `@blog@instance`; username changes create new handles. | Authorship, domain/blog continuity, long-form archive. ([writefreely.org](https://writefreely.org/docs/main/writer/federation)) |
| **Owncast** | Single Service actor representing a livestream. | Stream identity, disclosure, chat community, instance/channel owner. ([github.com](https://github.com/owncast/owncast/blob/develop/FEDERATION.md)) |
| **WordPress ActivityPub** | Blog-level actor plus author actors. | Publication domain, author byline, institutional/editorial reputation. ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com)) |
| **Ghost ActivityPub** | Publication/newsletter identity with social web reader and publishing. | Publication brand, paid/free audience, domain-based media identity. ([activitypub.ghost.org](https://activitypub.ghost.org/social-web-beta/?utm_source=chatgpt.com)) |
| **Threads federation** | Meta-hosted public Threads profiles opting into ActivityPub federation. | Corporate platform identity, opt-in federation, asymmetric trust concerns. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com)) |
| **Bridgy Fed** | Bridged website / social account visible across protocols. | Cross-network continuity, but also bridge consent and context-collapse concerns. ([fed.brid.gy](https://fed.brid.gy/?utm_source=chatgpt.com)) |
| **GoToSocial / Akkoma / Pleroma / Misskey forks** | Small-server, forked, or highly customized account cultures. | Admin trust, fork affordances, custom policies, migration compatibility. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/federation/actors/)) |

The same handle syntax can therefore conceal radically different identity situations: a person, a publication, a livestream, a bot, a group, a bridge, a community, or a corporate-platform account.

---

## 3. Handles, domains, display names, pronouns, bots, and labels

A Fediverse handle such as `@alice@example.org` is best understood as a **domain-scoped social address**, not a universal username. The `alice` part may appear many times across domains, and the ActivityPub `preferredUsername` field has no global uniqueness guarantee. The domain is therefore not decoration; it is part of the name. ([w3.org](https://www.w3.org/TR/activitypub/))

Mastodon’s current profile model illustrates the higher-level identity layer: display name, bio, avatar, header image, profile metadata rows, bot flag, locked-account setting, profile-directory discoverability, and verified profile links. Metadata fields commonly hold pronouns, websites, country, age, institutional roles, alt-account notes, “no bots” preferences, or moderation/context labels. Mastodon’s bot flag is primarily visual in Mastodon itself, but other software may interpret bot-marked accounts differently. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/))

This means trust is partly semiotic. A profile that says “bot,” “institutional account,” “unofficial mirror,” “research account,” “posts are public,” “no indexing,” “DMs closed,” or “alt for politics” is doing governance work. But these labels are voluntary and unevenly enforced. Software can support disclosure, but communities decide whether the disclosure is adequate.

---

## 4. Verification after Twitter/X: from central badges to evidentiary linking

Fediverse verification is mostly **attestation by controlled links**, not central certification. Mastodon’s verified profile links use HTTPS links in profile metadata and check whether the linked page links back to the profile with `rel=me`. Mastodon’s own docs explicitly frame this as a substitute for document-based central verification: without a central authority, the strongest identity evidence is often control of an official website or domain. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/))

This has several consequences:

| Verification model | What it proves | What it does not prove |
|---|---|---|
| `rel=me` from personal site | The profile and website are mutually controlled or coordinated. | Legal name, institutional status, expertise, non-impersonation beyond that site. |
| Institutional website link | The account is endorsed by a domain-holder such as a university, agency, publisher, or project. | That the account is well moderated, personally operated, or safe. |
| Old account migration announcement | Continuity between old and new account while old server is reachable. | That all followers saw it, or that all software processed the move. |
| Social graph endorsement | Trusted people interact with or vouch for account. | Resistance to capture, coercion, or account sale. |
| Instance reputation | Admins and community provide a trust envelope. | Individual virtue; instances can change ownership, policy, or capacity. |

The post-Twitter/X shift matters because centralized verification used to compress identity, status, and visibility into a platform badge. Fediverse verification decomposes those functions. A journalist, scholar, bot, Indigenous organization, or government agency can verify through an official site, but social trust still depends on whether the surrounding community recognizes that evidence as relevant.

---

## 5. Migration: identity is redirectable, but reputation is sticky

The strongest available account-migration pattern is not full portability; it is **follower redirection**. Mastodon supports account aliasing and profile moves: users create a new account, alias the old and new identities, and then redirect the old account so supporting software can move followers. Mastodon exports follows, lists, blocks, mutes, and domain blocks as CSVs, and allows archive export of posts and media, but it does not import posts and media because of technical limitations. A moved Mastodon profile becomes a redirecting profile; old posts do not become native posts on the new account. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/moving/))

GoToSocial describes the same broad model through ActivityPub `Move`, `alsoKnownAs`, and `movedTo` conventions, and states plainly that only followers are carried over by the standard migration flow; following lists, media, bookmarks, favourites, and blocks are not automatically carried. Pixelfed supports migration from Pixelfed, Mastodon, or compatible software, and supports post migration on Pixelfed v0.11.9+ when administrators enable it. WriteFreely is more brittle: changing a blog username creates a new federated handle and existing followers need to follow the new handle. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/federation/actors/))

| What may move | What usually does not move cleanly |
|---|---|
| Followers, if old and new software support migration and the old account can announce the move. | Posts, media, replies, quote/context history, likes/favourites, bookmarks, private messages, old URLs, search indexes, local timeline memory, moderation history, block/mute relations, informal reputation. |
| Follow lists, blocks, mutes, and domain blocks via export/import in some software. | The affective meaning of “this person is from this instance/community.” |
| Profile metadata manually recreated by user. | Trust inherited from old admins, old domain, old local community, old instance policies. |
| Some Pixelfed posts, where supported and enabled. | Cross-software guarantees; archive semantics; original interaction context. |

**Answer to the portability question:** identity is technically portable only in limited ways. It is socially anchored to the instance, domain, and accumulated relationships. A migrated account may regain much of its audience, but not the full reputation object.

---

## 6. What reputation is lost during migration?

The most important losses are not merely technical. They are social and archival.

A user who moves from `@name@community.instance` to `@name@personal.domain` may lose:

1. **Local recognition**: being part of a known local timeline or community instance.
2. **Instance-borrowed trust**: the assumption that the old admins vetted, protected, or contextualized the user.
3. **Historical legibility**: old replies, boosts, and links point to the old Actor or old URLs.
4. **Search and discovery continuity**: discoverability is partial and software-specific; Mastodon has opt-in controls for profile directory and post search, and there is no global shared state where every public post is necessarily visible. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/))
5. **Moderation continuity**: reports, warnings, domain blocks, allowlists, and admin knowledge do not become portable credentials.
6. **Social proof density**: a moved account may have fewer visible mutuals at first, fewer old interactions attached, and weaker cross-instance cache presence.
7. **Affective placement**: `@name@big.instance` feels like a platform account; `@name@personal.domain` feels like a self-owned publication or server, even when the same person operates it.

This is why migration is better described as **audience salvage** than identity portability.

---

## 7. Instance identity versus personal identity

The domain in a Fediverse handle does reputational work. A large general-purpose instance such as `mastodon.social` can make an account easy to recognize and easy to onboard, but it may also signal weaker community embeddedness. A small instance can signal shared politics, language, profession, fandom, locality, moderation norms, or mutual aid commitments. A single-user or personal-domain server can signal independence, technical competence, authorship, or long-term commitment, but it can also signal social distance from community governance.

GoToSocial’s split-domain documentation makes the technical side clear: deployments can present account handles at one domain while hosting the server at another, but this must be configured before federation because other servers cache WebFinger and identity information. Once federated, domain layout becomes part of the account’s public identity. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/advanced/host-account-domain/))

### The affective difference

`@name@big.instance` often reads as:  
> “I am a user on a recognizable public service.”

`@name@community.instance` often reads as:  
> “I belong to, or am vouched for by, this community context.”

`@name@personal.domain` often reads as:  
> “I control my own identity infrastructure.”

The last form can create reputation capital. It resembles owning a website, publication, or email domain. But it also shifts burden onto the user: DNS, hosting, moderation, abuse handling, legal exposure, backups, TLS, upgrades, spam, and continuity planning.

---

## 8. Pseudonymity, anonymity, and doxxing risk

ActivityPub does not require legal names. This is vital for artists, sex workers, political dissidents, queer and trans users, Indigenous users, researchers, whistleblowers, abuse survivors, minors, and people whose safety depends on contextual identity. Research on Mastodon communities has found that marginalized and stigmatized groups have used instances to create spaces they experienced as safer or less comfortable to hold on mainstream platforms, while governance research emphasizes the centrality of admins and moderators in sustaining those spaces. ([phys.org](https://phys.org/news/2024-11-decentralized-social-media-citizen-empowerment.html?utm_source=chatgpt.com))

But pseudonymity is fragile under federation. Risks include:

| Risk | Mechanism |
|---|---|
| **Context collapse** | A post intended for one community travels through boosts, replies, bridges, screenshots, archives, or search. |
| **Graph correlation** | Mutuals, posting times, language, alt-account references, metadata, and cross-links connect identities. |
| **Domain leakage** | Personal domains can reveal ownership, payment, hosting, geography, or institutional affiliation unless carefully managed. |
| **Admin exposure** | Instance admins can have access to server-side data; infrastructure seizure or compromise can expose users. |
| **Bridge ambiguity** | Bridged content may appear in publics with different norms and expectations. |
| **Research extraction** | Public posts can be scraped despite local norms or instance policies; recent work criticizes Fediverse research for insufficient adherence to instance-level policies. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com)) |

For marginalized users, trustworthiness does not necessarily mean “verified legal identity.” Often it means the opposite: stable pseudonymity, boundary-respecting interaction, clear consent norms, protective moderation, limited search visibility, and an instance whose admins understand the relevant threats.

---

## 9. Reputation across local, home, and federated contexts

Fediverse reputation is plural. The same account can have different reputations in different publics:

| Context | What reputation depends on |
|---|---|
| **Local** | Instance norms, local timeline conduct, admin relationships, shared rules, known conflicts. |
| **Home timeline** | Who follows whom; what reaches one’s account through social graph. |
| **Federated / known network** | What the home server has learned from follows, boosts, relays, searches, and remote interactions. |
| **Blocked / defederated space** | Domain-level sanctions; whether an account’s instance is considered unsafe, spammy, abandoned, corporate, extremist, or poorly moderated. |
| **External web** | Search engines, archives, websites, institutional pages, journalistic citations, screenshots. |

There is no single global Fediverse timeline. Mastodon’s own networking documentation notes that servers do not share global state; a server’s view of “other servers” is composed of what it has learned, often through accounts followed by local users. This makes reputation unevenly propagated. One community may know an account as helpful; another may know only its instance domain, a blocklist entry, or a viral screenshot. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/network/?utm_source=chatgpt.com))

Defederation is therefore both a safety tool and a reputation mechanism. Trust-and-safety researchers describe defederation as cutting communication between servers, often used against spam, abuse, or coordinated manipulation. Public and semi-public blocklists, including projects such as Oliphant, The Bad Space, Seirdy’s lists, and others, formalize domain-level reputation, but they also raise governance questions about opacity, due process, maintenance, and who gets to define danger. ([carnegieendowment.org](https://carnegieendowment.org/research/2025/03/fediverse-social-media-internet-defederation?utm_source=chatgpt.com))

---

## 10. Bots, institutions, alts, sockpuppets, and accountable disclosure

ActivityPub’s Actor model can represent a person, group, organization, application, or service. Owncast explicitly presents a livestream as a single `Service` actor; GoToSocial serves bot-marked accounts as `Service` and instance accounts as `Application`; Lemmy maps communities to `Group` actors and users to `Person` actors. ([github.com](https://github.com/owncast/owncast/blob/develop/FEDERATION.md))

This allows useful non-human and collective accounts, but the identity problem becomes disclosure:

| Account type | Good disclosure practice | Trust problem |
|---|---|---|
| **Bot** | Bot flag, purpose, operator, source code if possible, rate limits, contact, opt-out behavior. | Undisclosed automation; spam; scraping; political manipulation. |
| **Institutional account** | Official domain verification, named maintainers, moderation/contact policy. | Institution speaks with one voice while many humans operate account. |
| **Research account** | IRB/ethics note where relevant, data policy, no-surprise interaction rules, contact, archiving policy. | Public data does not equal ethical consent. |
| **Alt account** | Context label when safe: “private alt,” “art alt,” “work account,” “bot account.” | Harassment via sockpuppets; forced outing of safety-preserving alts. |
| **Bridge account** | Clear bridge origin, opt-in/opt-out mechanics, source network. | Users may not understand where replies or follows travel. |
| **Community/group actor** | Moderation policy, scope, topic, moderator list where safe. | Group reputation can dominate individual reputation. |

The distinction between an alt and a sockpuppet is social, not merely technical. An alt can be a legitimate boundary-management tool. A sockpuppet is typically an undisclosed account used to deceive, evade moderation, manipulate consensus, or harass.

---

## 11. Domain-level trust and blocklist politics

Domain-level trust is one of the Fediverse’s strongest and most controversial identity mechanisms. A domain can mean:

- a community and its moderation tradition;
- a software stack and admin capacity;
- a personal server;
- a corporate platform;
- a bridge;
- an abandoned or compromised host;
- a known spam source;
- a politically unsafe space;
- a trusted institutional home.

Because accounts are domain-scoped, domain reputation attaches to individuals. This can be protective: marginalized communities can block hostile domains. It can also be overbroad: a user on a badly moderated or controversial server may be treated as suspect before they speak. Governance work on the Fediverse repeatedly shows that moderation is not peripheral infrastructure; it is constitutive of identity and belonging. ([fediverse-governance.github.io](https://fediverse-governance.github.io/?utm_source=chatgpt.com))

The common myth is that federation replaces platform power with individual freedom. A more accurate account is that federation redistributes power among admins, domains, software defaults, blocklist maintainers, hosting providers, bridge operators, and users with enough resources to self-host.

---

## 12. Worked examples

### Example A: Migrating a scholar from a university instance to a personal domain

A scholar moves from `@river@university.social` to `@river@river.example`. Technically, they can alias the accounts, announce the move, and trigger follower migration if both sides support the migration flow. They can add `rel=me` links from a personal site and university page. They can export/import follows, blocks, and mutes where software permits. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/moving/))

What they lose: old post URLs as native identity, local academic-instance context, replies attached to old Actor, cached search visibility, social proof from being visibly on the university instance, and the tacit moderation envelope of the old admins. What they gain: domain control, continuity independent of an instance shutdown, stronger authorship signal, and the ability to later move hosting while keeping the public handle if configured carefully.

### Example B: A marginalized pseudonymous user

A user chooses `@name@smallqueer.instance`, locks follows, avoids full-text search opt-in, uses minimal metadata, does not link a personal domain, and keeps separate accounts for art, politics, and mutual aid. This identity may be less “verifiable” in the institutional sense but more trustworthy within the relevant community because it respects boundaries, uses stable pseudonymity, and is backed by known admins.

The main risk is involuntary context collapse: a reply chain crosses into a hostile instance, a bridge makes content visible in another network, a screenshot circulates, or a researcher scrapes posts without reading local policies. The protective unit is not only the user’s privacy setting; it is the instance’s moderation labor and federation posture. ([phys.org](https://phys.org/news/2024-11-decentralized-social-media-citizen-empowerment.html?utm_source=chatgpt.com))

### Example C: A bot or alert account

An earthquake alert bot, library-hours bot, or weather bot can be trustworthy without being human. The trust model is disclosure: bot flag, operator, official website, rate limits, source data, contact, and clear behavior. GoToSocial and Owncast show that ActivityPub already supports non-person actors in practice; the remaining issue is whether receiving software and communities surface those distinctions clearly. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/federation/actors/))

### Example D: Accountable research or agentic publishing account

A strong model for an accountable research account would combine:

- a stable domain, ideally controlled by the lab, project, or researcher;
- ActivityPub publishing through WordPress, Ghost, WriteFreely, Mastodon-compatible software, or custom infrastructure;
- `rel=me` links from an institutional page and project site;
- explicit labels: human-operated, bot-assisted, automated archive, or research account;
- a public data-use and consent policy;
- clear contact and correction channels;
- separation between personal identity, project identity, and automated agent identity;
- migration and archival plan in case the instance shuts down.

WordPress and Ghost matter here because they turn publications and authors into federated actors, shifting the center of gravity from “social media profile” to “accountable web publication.” ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com))

---

## 13. Direct answers to the research questions

**What makes a Fediverse identity trustworthy?**  
Not one credential. Trust comes from stable domain control, reciprocal verification links, known social graph, consistent conduct, transparent labels, instance reputation, moderation responsiveness, and context-appropriate disclosure. For some users, refusal to expose legal identity is part of trustworthiness.

**Is identity portable, or socially anchored to the instance?**  
It is partially portable at the follower layer and strongly anchored at the social layer. Migration can redirect attention; it cannot fully move reputation.

**What reputation is lost during migration?**  
Local recognition, old URLs, reply history, visible mutuals, search/discovery continuity, instance-borrowed trust, admin memory, and the affective signal of belonging to a particular community.

**How does domain ownership become social capital?**  
A personal or institutional domain signals control, durability, technical capacity, authorship, and independence. But it also reflects unequal resources and can shift care labor from community admins to individuals.

**How do marginalized users manage identity risk?**  
Through pseudonyms, locked accounts, alt separation, careful instance choice, minimized metadata, avoidance of personal domains, opt-out from discovery/search where available, and reliance on trusted moderators. These practices protect contextual integrity more than anonymity in the absolute sense.

**How do bot and institution accounts disclose themselves?**  
Through bot flags, actor types where software exposes them, profile metadata, official-domain verification, source/operator links, contact policies, and posting-behavior norms. Disclosure is uneven across software and remains socially interpreted.

**How does verification work without central authority?**  
By evidentiary linking: `rel=me`, official websites, domain control, migration announcements, social graph testimony, and instance reputation. This is robust against some centralized failures but weak against domain inequality, social engineering, and context collapse.

**What identity models support agentic publishing or accountable research accounts?**  
The best model is domain-based, role-labeled, and policy-rich: a stable Actor under a controlled domain; explicit human/bot/agent disclosure; institutional or project `rel=me`; public data-use commitments; contact and correction paths; and migration/archival planning.

---

## 14. Risks

| Risk | Why it matters |
|---|---|
| **Instance shutdown** | Actor IDs, old posts, and migration announcements may disappear before users can move. |
| **Centralization by convenience** | Large instances and corporate actors can become de facto identity authorities. |
| **Corporate federation asymmetry** | Threads-scale federation may import platform power into a network built around smaller communities. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com)) |
| **Bridge consent failures** | Bridged identities may travel into publics whose norms users did not anticipate. |
| **Doxxing through verification** | Personal-domain verification can expose infrastructure, ownership, or offline ties. |
| **Opaque blocklist governance** | Blocklists can protect communities but also produce reputational penalties without clear appeal. |
| **Research extraction** | Public availability is not equivalent to ethical permission; instance-level policies are often ignored in studies. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com)) |
| **False continuity** | A moved account may look continuous while having lost archives, context, and moderation history. |
| **Impersonation by domain similarity** | `@name@trusted.org` and `@name@trvsted.org` are socially confusable even if technically distinct. |

---

## 15. Open questions

1. Can ActivityPub support stronger portability without collapsing local governance?
2. Should posts, replies, and media be migratable, or would that break consent and context?
3. What would a privacy-preserving portable reputation system look like?
4. Can domain-based verification avoid reproducing class, institutional, and Global North advantages?
5. How should software distinguish bots, agents, services, institutions, groups, and humans in UI?
6. What are ethical norms for bridges that carry identity across protocols?
7. Can marginalized users retain contextual pseudonymity while still being discoverable to trusted publics?
8. Should blocklists become standardized, or would standardization over-consolidate moderation power?
9. What happens when publications, newsletters, livestreams, and discussion forums all become “accounts”?
10. How can research accounts be accountable without making every interaction feel surveilled?

---

## Annotated bibliography

**W3C ActivityPub Recommendation, 2018.**  
The foundational protocol specification. Defines Actors, inboxes, outboxes, activities, object identifiers, and the deliberately flexible relation between Actors and real-world users. Essential for separating protocol identity from social identity. ([w3.org](https://www.w3.org/TR/activitypub/))

**RFC 7033 WebFinger, 2013.**  
Explains discovery of account-like resources such as `acct:user@example.com`. Crucial for understanding why Fediverse handles are address-like and domain-scoped. ([rfc-editor.org](https://www.rfc-editor.org/info/rfc7033))

**Mastodon profile and verification documentation, updated 2026.**  
Primary implementation source for display names, bios, profile metadata, bot flags, locked accounts, profile-directory controls, and `rel=me` verification. Especially useful for post-blue-check verification analysis. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/))

**Mastodon migration documentation, updated 2025.**  
Shows the practical limits of migration: follower moves, account aliases, exports, profile redirects, and the non-portability of posts/media. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/moving/))

**GoToSocial federation and migration documentation.**  
Useful because it documents `Move`, `alsoKnownAs`, `movedTo`, actor typing, and split-domain deployments more explicitly than many user-facing docs. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/advanced/host-account-domain/))

**Pixelfed, PeerTube, Lemmy, WriteFreely, Owncast documentation.**  
Demonstrates that Fediverse identity is not reducible to microblogging: photos, videos, communities, blogs, and livestreams all produce different actor/reputation forms. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

**WordPress ActivityPub plugin and Ghost ActivityPub beta.**  
Important for publication-centered identity. These sources show how blogs, authors, newsletters, and publications become federated actors, making ActivityPub part of the open web and not merely “social media.” ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com))

**Threads federation announcements and reporting, 2024–2025.**  
Important for corporate federation and asymmetric platform power. Threads demonstrates how ActivityPub can connect a massive centralized platform to smaller federated communities through opt-in federation. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com))

**Bridgy Fed documentation.**  
Key source for cross-protocol identity and bridge-mediated publics. Bridging expands reach but complicates consent, context, and identity interpretation. ([fed.brid.gy](https://fed.brid.gy/?utm_source=chatgpt.com))

**Kissane and Kazemi, Fediverse governance report, 2024.**  
A major governance source on moderation, server leadership, federated diplomacy, and administrative responsibility in microblogging communities. Useful for understanding identity as socially governed infrastructure. ([fediverse-governance.github.io](https://fediverse-governance.github.io/?utm_source=chatgpt.com))

**Spencer-Smith, “Labour pains,” Internet Policy Review, 2025.**  
Analyzes Mastodon community challenges after the Twitter/X influx and highlights admin/moderator labor. Useful for the political economy of care work and instance identity. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges?utm_source=chatgpt.com))

**Carnegie Endowment, “New Paradigms in Trust and Safety,” 2025.**  
Provides a policy-facing account of defederation, server-level moderation, and domain blocking as trust-and-safety mechanisms. ([carnegieendowment.org](https://carnegieendowment.org/research/2025/03/fediverse-social-media-internet-defederation?utm_source=chatgpt.com))

**Gehl and related work on Fediverse blocklists, 2025.**  
Frames blocklists as moderation infrastructure in noncapitalist social media, useful for domain-level trust and reputational sanctions. ([arxiv.org](https://arxiv.org/html/2506.05522v1?utm_source=chatgpt.com))

**Oxford / CSCW work on marginalized communities and Mastodon.**  
Shows how marginalized and stigmatized users use instances for safer discussion and community autonomy, while also depending on admin labor and local norms. ([phys.org](https://phys.org/news/2024-11-decentralized-social-media-citizen-empowerment.html?utm_source=chatgpt.com))

**Lisker and Mihaljević, 2025, on Fediverse research ethics.**  
Finds limited adherence to instance-level policies in Mastodon research, making it important for accountable research accounts and anti-extractive methodology. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

**Migration studies after Twitter/X disruption.**  
Research on users moving from Twitter/X to Mastodon shows that social network effects shape migration and that decentralization can face pressure toward centralization or disengagement. Useful for understanding why reputation continuity matters. ([arxiv.org](https://arxiv.org/abs/2302.14294?utm_source=chatgpt.com))
