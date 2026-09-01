---
title: Fediverse Safety, Privacy, and Research Ethics
description: Research-ethics memo arguing the Fediverse should not be treated as a single public dataset but as a federation of partially public, context-sensitive communities whose posts, profiles, moderation decisions, blocklists, and social graphs travel under uneven affordances and local rules. Argues ethical Fediverse research and tooling must be visibility-aware, instance-aware, consent-seeking, deletion-aware, minimization-first, harassment-resistant, and admin-supportive without becoming centralized surveillance infrastructure.
keywords: ["fediverse", "research-ethics", "privacy", "consent", "data-minimization", "scraping", "harassment", "surveillance"]
---

# Research-ethics memo: Fediverse safety, privacy, and future agents

**Date:** June 11, 2026  
**Scope:** The ActivityPub-conformant Fediverse as a multi-software, multi-instance social web: Mastodon, Pixelfed, PeerTube, Lemmy/Mbin/Kbin, Misskey-family forks, Pleroma/Akkoma, WriteFreely, BookWyrm, Owncast, WordPress ActivityPub, Ghost ActivityPub, Threads federation, Bridgy Fed, Bonfire, GoToSocial, and related implementations.

## Abstract

The Fediverse should not be treated as a single public dataset. It is a federation of partially public, context-sensitive communities whose posts, profiles, moderation decisions, blocklists, and social graphs travel across servers under uneven software affordances, local governance rules, and user expectations. ActivityPub makes remote delivery technically possible; it does not create blanket consent for scraping, indexing, quoting, ranking, or graph analysis. Ethical Fediverse research and tooling must therefore be **visibility-aware, instance-aware, consent-seeking, deletion-aware, minimization-first, harassment-resistant, and admin-supportive without becoming centralized surveillance infrastructure**.

The core rule is: **technical accessibility is only the first constraint, and often the weakest one.** Public ActivityPub objects may still be ethically sensitive when they concern vulnerable communities, moderation, sexuality, migration, disability, race, trans life, labor organizing, Indigenous publics, minors, local communities, or people escaping harassment.

---

## Core thesis

The Fediverse is not inherently liberatory. Federation redistributes power, but it does not abolish power. It shifts power into protocol design, software defaults, instance administration, server costs, moderation labor, search affordances, defederation, hosting jurisdiction, bridge operators, and the ability of well-resourced actors to scrape or aggregate what small communities expose for social purposes.

ActivityPub defines server-to-server and client-to-server mechanisms for actors, inboxes, outboxes, and delivery; public addressing uses the special `Public` collection, and public activities may be accessible without authentication. But the same protocol also allows followers collections, addressing fields, and deletions whose effects depend on receiving servers. ActivityPub deletion asks receivers to remove or tombstone objects under certain conditions, but it cannot guarantee that every remote server, crawler, archive, or bridge purges a copy. ([w3.org](https://www.w3.org/TR/activitypub/))

So ethical analysis must layer:

1. **Protocol facts:** What can be fetched, delivered, cached, or federated?
2. **Software affordances:** What does Mastodon, Pixelfed, PeerTube, Lemmy, Misskey, GoToSocial, BookWyrm, etc. expose?
3. **Instance governance:** What do local rules, ToS, robots.txt, blocklists, and admin norms say?
4. **User expectations:** Who thought they were speaking to whom, under what visibility setting?
5. **Harm model:** Could indexing, quotation, ranking, graphing, or scoring enable harassment, doxxing, outing, CSAM circulation, block evasion, or moderation retaliation?
6. **Consent model:** Is user consent, admin consent, community consultation, or IRB/ethics review required?

---

## 1. Technical baseline: public, federated, and searchable are not the same

ActivityPub supports multiple addressing and delivery patterns. A post can be sent to followers, mentioned actors, a public collection, or shared inboxes. The fact that an object is delivered to a remote server does not mean every person on the internet was the intended audience. Nor does it mean search engines, academic corpora, AI agents, or hostile aggregators are welcome.

Mastodon’s current documentation illustrates the distinction clearly. It distinguishes **Public**, **Quiet Public**, **Followers**, and **Specific People** posts. It also states that “Specific People” messages are not end-to-end encrypted and may be accessible to administrators of sending and receiving servers. Quiet Public posts may be publicly viewable but excluded from live feeds, Explore, and search depending on configuration. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/))

Mastodon also now exposes profile-level signals such as `discoverable` and `indexable`; its ActivityPub documentation recommends that implementations respect those properties. Its full-text search deliberately limits arbitrary global searching: public statuses are searchable only where the account has opted into search, alongside a user’s own statuses, mentions, favourites, and bookmarks. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

This is not universal across the Fediverse. GoToSocial, for example, defaults new accounts to **unlisted** posts rather than fully public posts, explicitly treating public posting as a conscious decision. It also distinguishes direct, followers-only, unlisted, and public posts differently from Mastodon, and warns about metadata such as EXIF location data. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/))

**Ethical implication:** a Fediverse agent must not infer “public web URL” from “federated object,” must not infer “consent to search” from “public post,” and must not infer “safe to quote” from “technically retrievable.”

---

## 2. Do not reduce the Fediverse to Mastodon

Different ActivityPub implementations produce different ethical surfaces.

| Software / family | Relevant affordances | Research-ethics implication |
|---|---|---|
| **Mastodon** | Visibility levels; locked accounts; bot flag; opt-in profile directory; opt-in full-text search via `indexable`. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/)) | Respect search opt-in, visibility, locks, CWs, and deletion. Do not treat Mastodon norms as universal Fediverse norms. |
| **GoToSocial** | Unlisted default; direct/followers/public distinctions; no E2EE for direct; local design choices differ from Mastodon. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/)) | Agents must read implementation semantics, not just ActivityPub fields. |
| **Pixelfed** | ActivityPub image-sharing with cross-software federation. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com)) | Images, captions, alt text, faces, location clues, and EXIF-like metadata raise higher privacy risk than text. |
| **PeerTube** | Federated video; internal/private visibility modes; moderators can access reports, comments, and private/unlisted videos depending on role. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub?utm_source=chatgpt.com)) | Video research risks biometric, location, protest, workplace, and minor exposure. Moderator-accessible data is not research-public data. |
| **Lemmy / Mbin / Kbin** | Forum/threaded discussion federation; community-level moderation and cross-instance replication. | Subreddit-like expectations may exist, but federation and remote moderation complicate consent and deletion. |
| **Misskey / Sharkey / Iceshrimp forks** | Notes can be public, home, followers-only, or direct; UI culture differs from Mastodon. ([misskey-hub.net](https://misskey-hub.net/en/docs/for-users/features/note//?utm_source=chatgpt.com)) | “Home” or semi-public affordances may be socially smaller than fully public indexing. |
| **Pleroma / Akkoma** | Mastodon-compatible visibility labels, ActivityPub federation, often different moderation and instance cultures. ([docs.akkoma.dev](https://docs.akkoma.dev/stable-docs/development/API/differences_in_mastoapi_responses/?utm_source=chatgpt.com)) | API compatibility does not imply identical norms. |
| **WriteFreely** | Federated long-form writing; other ActivityPub users can follow, bookmark, and share blog posts. ([writefreely.org](https://writefreely.org/docs/main/writer/federation?utm_source=chatgpt.com)) | Blog-like publication may be more public, but comments, boosts, followers, and niche communities remain context-sensitive. |
| **BookWyrm** | Federated reading, reviews, book metadata, and ActivityPub extensions. ([github.com](https://github.com/bookwyrm-social/bookwyrm?utm_source=chatgpt.com)) | Reading data can reveal religion, politics, sexuality, health, disability, and organizing interests. |
| **Owncast** | Livestreaming with optional Fediverse features. ([owncast.online](https://owncast.online/docs/social/?utm_source=chatgpt.com)) | Live chat and video increase risks of real-time harassment, clipping, and surveillance. |
| **WordPress ActivityPub** | Turns WordPress sites into Fediverse participants. ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com)) | “Website publication” and “social federation” audiences may diverge. |
| **Ghost ActivityPub** | Ghost has been rolling out ActivityPub/Fediverse connectivity for Ghost(Pro) publishers. ([theverge.com](https://www.theverge.com/news/632880/ghost-newsletter-blog-fediverse-activitypub-beta-live?utm_source=chatgpt.com)) | Newsletter/publication norms may collide with reply, follow, and comment federation. |
| **Threads federation** | Public Threads profiles can opt into Fediverse sharing; Meta states public posts can be followed, liked, replied to, and reposted from other ActivityPub servers. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com)) | Corporate scale changes scraping, moderation, and consent politics; small instances may block or limit Threads. |
| **Bridgy Fed** | Bridges ActivityPub, Bluesky/AT Protocol, IndieWeb/Webmention, and related protocols. ([github.com](https://github.com/snarfed/bridgy-fed?utm_source=chatgpt.com)) | Bridge consent is central: users may not understand their posts crossing protocol publics. |

---

## 3. Prior controversies and research lessons

Fediverse communities have repeatedly objected to being treated as scrapeable “public data.” One early controversy concerned a 2022 Mastodon dataset assembled from the federated timeline of mastodon.social, reportedly including millions of posts, images, users, and instances; critics argued that technically accessible posts and media had been taken out of context without meaningful consent. ([fossacademic.tech](https://fossacademic.tech/2022/10/18/notesOnNobreEtAl.html?utm_source=chatgpt.com))

Recent research-ethics work makes the same point more formally. Abbing and Gehl argue that scholars moving from X/Twitter to Mastodon should not simply port platform-research methods; research should be conducted **with** Fediverse communities, not merely **on** them. ([pmc.ncbi.nlm.nih.gov](https://pmc.ncbi.nlm.nih.gov/articles/PMC10801199/?utm_source=chatgpt.com))

Lisker and Mihaljević’s 2025 review of Mastodon research found a gap between awareness of community norms and actual adherence. They emphasize that API availability does not equal consent, that instance rules may prohibit indexing or research collection, and that localized expectations of privacy, consent, and trust are central to the Fediverse. They also discuss a retraction involving a traceable verbatim quote and instance ToS violation. ([arxiv.org](https://arxiv.org/html/2505.07606v1))

Tosch and colleagues’ 2024 study of Fediverse privacy policies found heterogeneity across instances and noted that administrators inherit serious data, security, legal, and privacy responsibilities. Their own methods treated even public instance data carefully and emphasized that ethical investigation of Fediverse practices can require consent from individual instance administrators, not merely institutional review approval. ([petsymposium.org](https://petsymposium.org/popets/2024/popets-2024-0138.pdf))

**Research lesson:** the ethical unit is not “the platform.” It may be a post, account, thread, hashtag, instance, software community, blocklist collective, bridge, vulnerable public, or moderation team.

---

## 4. Ethical disposition of Fediverse data

| Data type | Technically public? | Ethical status | Guidance |
|---|---:|---|---|
| Public posts addressed to `Public` | Often | Context-sensitive | Study in aggregate by default. Quote only with care; get consent for identifiable or sensitive examples. |
| Quiet public / unlisted / home posts | Sometimes | Semi-public | Do not index globally unless implementation and user signals clearly permit it. Treat as conversation-visible, not search-consented. |
| Followers-only posts | Federated to followers’ servers | Private / limited audience | Do not scrape, index, quote, train on, or redistribute. User consent required; often still inappropriate. |
| Direct / specific-people posts | Delivered to addressed actors’ servers | Highly sensitive | Never index or use for research unless all parties consent and legal/ethics review permits. Not E2EE does not make it public. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/)) |
| Deleted posts / tombstones | May persist remotely | Deletion-sensitive | Purge caches and derived features. Do not quote or train on deleted content. Re-check before publication. |
| Profiles, bios, pronouns, avatars | Often public | Identity-sensitive | Aggregate only unless user is public-facing and consent/necessity is clear. Avoid outing and decontextualization. |
| Media, images, video, livestreams | Often public | High risk | Treat faces, homes, protest footage, children, workplaces, disability aids, and location clues as sensitive. |
| Alt text and captions | Often public | Accessibility + identity-sensitive | Do not mine as “free labels”; alt text may reveal disability, location, or community norms. |
| Likes, boosts, replies | Varies | Relationally sensitive | Use only in aggregate. Avoid account-level inference, ranking, or “influence” scores. |
| Follower/following graphs | Sometimes exposed | Harassment infrastructure risk | Never publish raw edge lists. Aggregate, threshold, or synthesize. |
| Hashtag publics | Public but contextual | Often vulnerable | Especially sensitive for health, sex work, trans life, migration, Indigenous politics, labor, minors, crisis, and abuse recovery. |
| Instance rules and public policies | Public | Researchable with care | Cite and archive minimally; ask admin consent when analyzing small instances or controversial policies. |
| Public blocklists | Public but dangerous | Moderation-sensitive | Study categories and governance in aggregate. Avoid tools that enable block evasion or target admins. |
| Reports, mod notes, admin dashboards | Not public | Highly sensitive | Require explicit admin authorization, data minimization, and role-based access. Often should not leave the instance. |
| CSAM / suspected CSAM | Illegal / harmful | Emergency legal category | Do not collect, store, redistribute, or inspect beyond required reporting workflows. Follow jurisdiction-specific legal obligations. |
| Bridges and cross-protocol copies | Public elsewhere maybe | Consent-ambiguous | Respect bridge opt-in/opt-out. Do not assume consent survives protocol translation. |

---

## 5. Direct answers to the core questions

### What Fediverse data is technically public but ethically sensitive?

Public posts can be ethically sensitive when they are searchable only by effort, intended for a small instance audience, hidden behind content warnings, embedded in support communities, or attached to media. Profiles, avatars, pronouns, alt text, hashtags, follower graphs, reply networks, moderation actions, and blocklist entries may all be technically observable while still exposing identity, vulnerability, community membership, or conflict.

This is especially true where the subject matter concerns marginalized communities, minors, health, sexuality, abuse recovery, migration, labor organizing, anti-fascist work, Indigenous politics, disability, or local mutual aid.

### What should never be indexed?

Never index:

- direct / specific-people messages;
- followers-only posts;
- private, internal, or limited-visibility PeerTube videos;
- moderation reports, mod notes, admin-only views, appeals, or private block rationales;
- deleted posts, tombstoned objects, or content removed by moderators;
- CSAM, suspected CSAM, non-consensual intimate imagery, doxxing, or hacked/leaked material;
- account-level vulnerability indicators;
- block-evasion maps;
- raw follower graphs of small or vulnerable communities;
- public posts from instances that prohibit scraping or indexing.

Mastodon’s opt-in full-text search and `indexable` signal should be treated as a minimum constraint, not a complete ethics framework. ([docs.joinmastodon.org](https://docs.joinmastodon.org/spec/activitypub/))

### What can be studied only in aggregate?

Aggregate-only topics include network growth, software diversity, federation topology, broad hashtag trends, moderation workload, defederation frequency, public blocklist category patterns, spam campaigns, cross-instance reply latency, general toxicity prevalence, and the distribution of visibility settings.

Graph research should publish statistics, sampled synthetic graphs, or thresholded community-level measures—not account-level maps.

### What requires instance/admin consent?

Admin or instance consent is required for:

- crawling at instance scale;
- collecting data that imposes load;
- analyzing local moderation practices;
- using reports, appeals, mod notes, or admin dashboards;
- evaluating blocklists or defederation rationales;
- studying small instances where re-identification is likely;
- deploying search, safety, recommendation, or anti-abuse tools that process local users’ data;
- overriding robots.txt, noindex, or stated anti-scraping rules.

Research on Fediverse privacy policies has shown that instance-level rules vary, and some instances explicitly prohibit scraping or require consent for data collection. ([petsymposium.org](https://petsymposium.org/popets/2024/popets-2024-0138.pdf))

### What requires user consent?

User consent is required for identifiable quotation, account-level profiling, longitudinal histories, sensitive-topic posts, media analysis, interviews, followers-only or direct content, vulnerable-community data, and any tool that produces account-level labels, scores, or risk predictions.

Consent is also needed when a user’s post is technically public but the research would make it more searchable, durable, or exposed than it was in context.

### How should research quote posts?

Default to **paraphrase, synthesis, or fictionalized composite examples**. Avoid usernames, instance domains, permalinks, exact timestamps, and verbatim text that can be searched. For sensitive topics, get explicit consent even for public posts.

Use direct quotes only when all of the following are true:

1. the quote is necessary;
2. the post remains online;
3. the user has not opted out of indexing or research;
4. the instance rules permit it;
5. the quote will not increase risk of harassment, outing, or dogpiling;
6. consent has been obtained for ordinary users, especially vulnerable users.

Traceable verbatim quotation has already caused Fediverse research controversy, including a discussed retraction case. ([arxiv.org](https://arxiv.org/html/2505.07606v1))

### How should agents handle deleted content?

Agents should treat deletion as a command to remove:

- raw content;
- search snippets;
- embeddings;
- cached media;
- derived labels;
- account-level features;
- training examples;
- analytics rows where feasible;
- backups after a short retention window.

ActivityPub supports deletion/tombstoning behavior, but remote deletion is not technically guaranteed across all servers, crawlers, bridges, or archives. Ethical agents should exceed the protocol minimum and maintain deletion propagation, TTLs, revalidation, and purge logs. ([w3.org](https://www.w3.org/TR/activitypub/))

### How can graph research avoid becoming harassment infrastructure?

Do not publish raw graphs, account IDs, small-cluster membership, “bridges between communities,” “most blocked users,” “central activists,” or “who follows whom” data. Use k-anonymity thresholds, community-level aggregation, edge perturbation, synthetic graphs, and delayed publication. Red-team outputs by asking how a harasser, fascist researcher, stalker, journalist seeking targets, or block-evader would use them.

Fediverse graph datasets and defederation studies can be valuable, but they need stronger safeguards than typical social-network graph papers because blocklists, federation edges, and follower ties can expose community defense structures. ([arxiv.org](https://arxiv.org/abs/2505.20882?utm_source=chatgpt.com))

### How can tools help admins without centralizing surveillance?

Build **local-first admin tools**:

- process reports on the instance, not in a global cloud corpus;
- share signatures, model weights, or aggregate indicators rather than raw posts;
- let admins choose policy thresholds;
- avoid global reputation scores;
- provide audit logs and appeal paths;
- support blocklist review without forcing adoption;
- preserve local context and moderator discretion;
- minimize retention;
- allow instances to opt in and revoke access.

Research on Fediverse moderation emphasizes that administrators face substantial moderation burdens, especially as instances grow, while defederation and blocklists function as community-level safety mechanisms. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

---

## 6. Worked examples

### Example A: Building a Fediverse search engine

**Bad design:** crawl every public ActivityPub object, index all text and media, expose global search, preserve deleted posts, ignore instance rules, and let users search for names, slurs, health terms, or location clues.

**Safer design:** index only opted-in accounts and opted-in instances; respect `indexable`, robots.txt, noindex, instance rules, and per-account opt-out; exclude followers-only, direct, deleted, CW-hidden bodies by default, media OCR, biometric search, and vulnerable hashtags; provide removal tools; rate-limit hostile queries; publish transparency reports.

Robots.txt alone is not sufficient. A 2025 study of self-declared bots found that compliance varies and that some bot categories rarely check robots.txt, so ethical systems must treat robots.txt as a floor, not as the whole consent mechanism. ([arxiv.org](https://arxiv.org/abs/2505.21733?utm_source=chatgpt.com))

### Example B: Studying anti-trans harassment across instances

**Permissible:** community consultation; aggregate counts of public harassment patterns; collaboration with affected admins; deletion-aware, non-searchable paraphrases; no account-level victim lists; no raw corpus release.

**Impermissible:** publishing “top targeted accounts,” exposing follower networks of trans users, quoting slurs at length, archiving deleted attacks, or releasing a classifier that lets harassers identify trans clusters.

### Example C: Analyzing public blocklists

Public blocklists are safety artifacts, not just datasets. They may reveal which communities are defending themselves, which instances are sources of abuse, and which admins are willing to take public conflict. A tool that republishes blocklists as a searchable “bad instance encyclopedia” may help admins, but it may also enable brigading, retaliation, or block evasion.

A safer approach studies blocklist governance, transparency practices, category vocabularies, update frequency, and appeal mechanisms in aggregate. Public examples such as Garden Fence or Oliphant-style lists show the practical role of shared blocklists, but publication of block rationales and categories can itself create risks. ([github.com](https://github.com/gardenfence/blocklist?utm_source=chatgpt.com))

### Example D: Academic dataset of public posts

A dataset of public posts should not include raw text by default. Better options include:

- post IDs only, with deletion revalidation;
- aggregate features;
- synthetic examples;
- consented quotations;
- opt-in instance samples;
- short TTL;
- documented exclusion of vulnerable topics;
- no media redistribution;
- no follower graph release;
- no deleted posts;
- no posts from instances prohibiting research.

Even “public domain” digital material can carry a reasonable expectation of privacy; Canadian TCPS 2 guidance, for example, says research ethics review may be required where public digital sites still involve privacy expectations. ([ethics.gc.ca](https://ethics.gc.ca/eng/reb-cer_social-sociaux.html?utm_source=chatgpt.com))

### Example E: CSAM or suspected CSAM encountered during research

Do not download, store, inspect, hash, redistribute, or include suspected CSAM in a research corpus unless operating under a legally authorized, specialized child-safety process. Stop collection, preserve only legally required metadata if advised by counsel or policy, report through the required channel, and protect staff from exposure.

The Stanford Internet Observatory reported finding known CSAM matches and CSAM-related hashtag activity in a 2023 Fediverse study and reported matches to NCMEC. U.S.-based electronic service providers have reporting obligations under 18 U.S.C. § 2258A when they obtain actual knowledge of apparent child sexual exploitation material; obligations vary by role and jurisdiction, so projects need legal review before any collection that could encounter such material. ([fsi.stanford.edu](https://fsi.stanford.edu/news/addressing-child-exploitation-federated-social-media?utm_source=chatgpt.com))

---

## 7. Concrete do / don’t guidance for future Fediverse agents

| Domain | Do | Don’t |
|---|---|---|
| Collection | Use allowlists, opt-in instances, documented purpose, rate limits, and minimal fields. | Crawl the whole Fediverse because it is technically reachable. |
| Consent | Seek admin consent for instance-scale work and user consent for identifiable or sensitive content. | Treat API availability as consent. |
| Visibility | Respect direct, followers-only, unlisted, home, quiet public, local-only, and implementation-specific semantics. | Collapse all non-private content into “public.” |
| Search | Default to opt-in indexing; respect `indexable`, robots, noindex, deletion, and instance rules. | Build global full-text search over all public posts. |
| Quotation | Paraphrase or use synthetic examples; get consent for identifiable quotes. | Publish searchable verbatim posts from ordinary users. |
| Media | Avoid storing or analyzing faces, homes, locations, children, protest footage, or EXIF-like metadata. | Treat images and video as ordinary text posts. |
| Graphs | Aggregate, threshold, perturb, or synthesize. | Publish raw follower, reply, block, or bridge graphs. |
| Moderation | Keep report data local; share only aggregate signals or consented indicators. | Centralize reports, mod notes, or global user scores. |
| Blocklists | Study governance and categories; protect admins from retaliation. | Build block-evasion maps or searchable enemy lists. |
| Deletion | Purge raw and derived data; re-check before publication. | Preserve deleted posts for convenience or model training. |
| Vulnerable communities | Consult, minimize, and avoid exposure. | Mine hashtags or clusters that reveal protected or targeted identities. |
| Bridges | Respect opt-in/opt-out and cross-protocol expectations. | Assume consent transfers across ActivityPub, Bluesky, IndieWeb, Threads, or other bridges. |
| CSAM / NCII / doxxing | Stop, quarantine via legal process, report appropriately, and minimize exposure. | Store, redistribute, classify casually, or include in datasets. |

---

## 8. Safety differences from X/Twitter, Bluesky, Discord, Reddit, and Hive

| Platform | Key difference | Ethical implication |
|---|---|---|
| **Fediverse / ActivityPub** | Many servers, many policies, partial federation, local moderation, defederation, weak deletion guarantees across remote copies. | Must respect instance governance and community context; cannot rely on one platform ToS. |
| **X / Twitter** | Historically centralized, public-by-default, search and quote-dunking culturally normalized, API/platform governance centralized. | Methods imported from Twitter can be harmful on the Fediverse because Fediverse publics are smaller, more local, and more governance-sensitive. ([pmc.ncbi.nlm.nih.gov](https://pmc.ncbi.nlm.nih.gov/articles/PMC10801199/?utm_source=chatgpt.com)) |
| **Bluesky / AT Protocol** | Public-data architecture with a firehose for posts, likes, follows, handle changes, feed generators, labelers, bots, and search; blocks are public/enumerable for protocol reasons. ([docs.bsky.app](https://docs.bsky.app/docs/advanced-guides/firehose?utm_source=chatgpt.com)) | Technical openness is higher and more centralized through the firehose; ethical agents still need anti-harassment and minimization constraints. |
| **Discord** | Server/chat context; public or discoverable servers do not mean users expect mass archival. Public scraping and leaked-message markets have raised serious privacy concerns. ([arxiv.org](https://arxiv.org/abs/2502.00627?utm_source=chatgpt.com)) | Treat “public chat” as contextual, not blanket consent. |
| **Reddit** | Subreddit governance plus centralized API/content licensing policy. Reddit’s public content policies increasingly distinguish ordinary access from commercial or large-scale data use. ([redditinc.com](https://redditinc.com/policies/data-api-terms?utm_source=chatgpt.com)) | Subreddit context matters, but there is a clearer central platform contract than in the Fediverse. |
| **Hive** | Centralized app whose security failures reportedly exposed private posts, private messages, deleted DMs, emails, and phone numbers. ([zerforschung.org](https://zerforschung.org/posts/hive-en/?utm_source=chatgpt.com)) | Centralization is not inherently safer; security architecture and data minimization matter. |

---

## 9. Safe data architecture for Fediverse research agents

A safer architecture should be designed as if every raw post could become a harassment vector.

### Ingestion layer

- Use an **allowlist**, not a denylist.
- Require documented purpose, scope, retention, and legal basis.
- Check instance rules, robots.txt, noindex, `indexable`, visibility, and software-specific semantics.
- Reject direct, followers-only, private, local-only, deleted, and sensitive-media content by default.
- Maintain per-instance contact and takedown channels.

### Consent and policy layer

- Encode instance policy as machine-readable constraints where possible.
- Support user-level opt-out and opt-in.
- Support admin revocation.
- Treat bridge participation as a separate consent domain.
- Log policy decisions for audit.

### Storage layer

- Store the minimum necessary fields.
- Prefer counts, hashes, or derived aggregate features over raw text.
- Avoid media storage.
- Encrypt raw data if any must be retained.
- Separate identifiers from content.
- Use short TTLs.
- Maintain deletion propagation into caches, embeddings, indexes, backups, and analytics.

### Analysis layer

- Use aggregate thresholds.
- Suppress small cells.
- Avoid account-level scoring.
- Avoid public leaderboards.
- Use differential privacy or synthetic data where feasible.
- Run abuse-case review before publication.

### Tooling layer

- Local-first admin tools.
- Instance-controlled deployment.
- No global user reputation database.
- No raw report centralization.
- Human review for moderation recommendations.
- Audit logs, appeal mechanisms, and false-positive controls.

### Incident layer

- CSAM / NCII / doxxing handling plan before collection.
- Jurisdiction-specific legal review.
- Staff exposure minimization.
- Secure escalation channels.
- Rapid purge workflows.
- Public transparency without revealing harmful content.

---

## 10. Open questions

1. **Machine-readable consent:** Can ActivityPub implementations converge on interoperable `indexable`, no-archive, no-AI-training, no-quote, or research-consent signals without creating a false sense of enforceability?
2. **Deletion propagation:** What practical standards can make deletion meaningful across remote servers, bridges, archives, search engines, and AI indexes?
3. **Admin burden:** How can small volunteer-run instances meet privacy, security, CSAM, legal, and moderation obligations without being forced into centralized vendors?
4. **Bridges:** What consent model should govern Bridgy Fed, Threads federation, Bluesky bridges, and future protocol translation?
5. **Public blocklists:** How can blocklists remain useful for community defense without enabling retaliation, false positives, or surveillance?
6. **Research replication:** How can researchers make reproducible claims without releasing raw posts, raw graphs, or searchable quotes?
7. **Vulnerable publics:** How should research distinguish “public political speech” from survival-oriented semi-public community speech?
8. **AI agents:** How should Fediverse software expose machine-readable constraints to agents, crawlers, search bots, summarizers, and recommendation systems?
9. **Moderation privacy:** Can federated or privacy-preserving moderation models help admins without centralizing reports or exposing local conflicts?
10. **Corporate federation:** How will Threads, Ghost, WordPress, and other large publishers change the balance between small-instance norms and large-scale data extraction?

---

## Annotated bibliography

**W3C ActivityPub Recommendation.** Defines ActivityPub’s client-to-server and server-to-server layers, actors, inboxes, outboxes, addressing, public collections, and deletion behavior. Essential for distinguishing protocol capability from ethical permission. ([w3.org](https://www.w3.org/TR/activitypub/))

**Mastodon documentation on visibility, search, and ActivityPub properties.** Useful because Mastodon is influential and has explicit opt-in search and profile discoverability signals, but it should not be generalized to the entire Fediverse. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/))

**GoToSocial documentation.** Shows how ActivityPub implementations can intentionally diverge from Mastodon defaults, including unlisted-by-default posting and different public URL behavior. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/))

**Pixelfed, PeerTube, BookWyrm, WriteFreely, Owncast, WordPress ActivityPub, Ghost, Threads, Bridgy Fed documentation.** Establishes that the Fediverse includes image-sharing, video, forums, books, blogs, livestreams, publishers, corporate federation, and bridges—not only microblogging. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com))

**Abbing and Gehl, “Shifting your research from X to Mastodon? Here’s what you need to know” (2024).** Argues that researchers should work with Fediverse communities rather than merely extract data from them. ([pmc.ncbi.nlm.nih.gov](https://pmc.ncbi.nlm.nih.gov/articles/PMC10801199/?utm_source=chatgpt.com))

**Lisker and Mihaljević, 2025 review of Mastodon data research.** Key source on the mismatch between available APIs, instance rules, user expectations, and research practice; highlights ToS violations and traceable quotation harms. ([arxiv.org](https://arxiv.org/html/2505.07606v1))

**Tosch et al., “Privacy Policies on the Fediverse” (2024).** Analyzes privacy policies and administrator perspectives; important for understanding admins as data stewards and legal actors. ([petsymposium.org](https://petsymposium.org/popets/2024/popets-2024-0138.pdf))

**Fossacademic, “Mastodon Scraping Without Consent” (2022).** Documents community criticism of large-scale Mastodon scraping and dataset publication; useful as a controversy case study. ([fossacademic.tech](https://fossacademic.tech/2022/10/18/notesOnNobreEtAl.html?utm_source=chatgpt.com))

**Norval and Henderson, “Contextual Consent” (2017), and social-media research ethics guidance.** Supports the claim that public social media data may still require consent when context, sensitivity, or privacy expectations warrant it. ([arxiv.org](https://arxiv.org/abs/1701.07765?utm_source=chatgpt.com))

**Anaobi et al., “Will Admins Cope?” (2023).** Studies decentralized moderation burden and the role of independent administrators. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

**Colglazier et al., 2024 defederation study.** Treats defederation as a group-level moderation sanction and studies its effects. Important for understanding defederation empirically rather than mythologically. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

**Zhang et al., 2025 blocklist study.** Examines community-level blocklists as decentralized moderation infrastructure, including transparency, goals, false positives, and admin tradeoffs. ([arxiv.org](https://arxiv.org/abs/2506.05522?utm_source=chatgpt.com))

**Stanford Internet Observatory child-safety report and NCMEC / 18 U.S.C. § 2258A materials.** Establishes that Fediverse research can encounter CSAM and therefore requires legal, ethical, and staff-safety planning before collection. ([fsi.stanford.edu](https://fsi.stanford.edu/news/addressing-child-exploitation-federated-social-media?utm_source=chatgpt.com))

**Robots.txt compliance research (2025).** Shows why robots.txt is useful but insufficient as an anti-scraping safeguard. ([arxiv.org](https://arxiv.org/abs/2505.21733?utm_source=chatgpt.com))

**Bluesky, Reddit, Discord, and Hive sources.** Useful comparison cases: Bluesky’s firehose and public blocks, Reddit’s centralized API/content policies, Discord’s public-chat scraping risks, and Hive’s private-data exposure incident. ([docs.bsky.app](https://docs.bsky.app/docs/advanced-guides/firehose?utm_source=chatgpt.com))

---

## Bottom-line rule for future Fediverse agents

A Fediverse agent should behave less like a crawler and more like a guest in many governed publics. It should collect less than it can, index only what is consented to, quote only what is safe, delete more aggressively than the protocol requires, aggregate rather than expose, help admins locally, and assume that anything making people easier to find, rank, target, or graph can become harassment infrastructure.
