---
title: Strategic Fediverse Use for Accountable Agentic Media
description: Strategic memo arguing a public research or newsroom system should use ActivityPub as distribution, review intake, public notice, and social-memory infrastructure, not as the canonical archive, whole audience, or governance layer. Recommends keeping the canonical record on a controlled website with stable URLs, version history, correction logs, and provenance, while syndicating pointers, excerpts, article objects, correction notices, and review invitations into a plural network, warning that ActivityPub gives no durable deletion or uniform moderation.
keywords: ["fediverse", "agentic-media", "strategy", "syndication", "canonical-record", "corrections", "provenance", "distribution"]
---

# Strategic implementation memo: Fediverse use for accountable agentic media  
**Date:** June 11, 2026  
**Scope:** ActivityPub-conformant Fediverse, not merely Mastodon.

## Abstract

A public research, newsroom, or claim/provenance system should use ActivityPub as **distribution, review intake, public notice, and social-memory infrastructure**, not as the canonical archive, not as the whole audience, and not as the whole governance layer. The canonical record should remain on a controlled website with stable URLs, version history, correction logs, structured metadata, source/provenance records, editorial policy, and human accountability. ActivityPub should syndicate pointers, excerpts, article objects, media notifications, correction notices, and review invitations into a plural network of Mastodon, Pixelfed, PeerTube, Lemmy/Mbin/Kbin, Misskey-family software, Pleroma/Akkoma, WriteFreely, BookWyrm, Owncast, WordPress ActivityPub, Ghost ActivityPub, Threads federation, Bridgy Fed, Bonfire, GoToSocial, and smaller implementations.

Core warning: ActivityPub gives you federated delivery and interaction primitives, but it does **not** give you durable deletion, uniform rendering, uniform moderation, consentful archiving, reliable search, complete analytics, or universal governance. The W3C spec explicitly supports server-to-server delivery and client-to-server publishing, but once an object has been transmitted, the protocol cannot enforce deletion on remote servers. ([w3.org](https://www.w3.org/TR/activitypub/?utm_source=chatgpt.com))

## Core thesis

The accountable agentic newsroom should adopt a **canonical-web-first, ActivityPub-aware architecture**:

1. **Canonical website:** source of truth, archive, corrections, claim graph, provenance, editorial policy, agent policy, funding disclosure, and machine-readable metadata.
2. **ActivityPub layer:** federated distribution, discussion intake, correction notification, article-following, account identity, media announcements, and public review.
3. **Human governance layer:** editors, moderation policy, escalation paths, correction authority, source protection, funding transparency, and appeal process.
4. **Agent layer:** labeled service/application actors or bot accounts that publish only within bounded editorial rules, with human ownership and audit logs.
5. **Cross-network layer:** RSS, email, Bluesky/AT Protocol, Bridgy Fed, Threads federation, open web indexing, and platform-specific cross-posts as secondary distribution.

The project should **not initially run an open-registration instance**. It may run its own single-project or institutional ActivityPub endpoint once it can fund moderation, infrastructure, backups, federation policy, abuse handling, and security. For many projects, the best starting stack is: canonical website + RSS + newsletter + WordPress ActivityPub or Ghost ActivityPub + one or more clearly governed Mastodon/GoToSocial social accounts.

---

## 1. Baseline facts about the ActivityPub Fediverse

ActivityPub is a W3C Recommendation from January 23, 2018. It uses ActivityStreams 2.0/JSON-LD and defines both client-to-server and server-to-server APIs for creating, updating, deleting, delivering, and subscribing to content. ([w3.org](https://www.w3.org/TR/activitypub/?utm_source=chatgpt.com)) ActivityStreams defines actor categories such as `Person`, `Group`, `Organization`, `Application`, and `Service`, which matters for distinguishing humans, projects, institutions, bots, and agents. ([w3.org](https://www.w3.org/TR/activitystreams-core/))

The Fediverse is not one platform. FediDB’s June 2026 snapshot reported roughly **13.3 million total accounts**, **about 1.1 million active accounts**, and **about 42,800 active servers**, though such crawled statistics are approximate and vary by crawler coverage and counting method. ([fedidb.com](https://fedidb.com/?utm_source=chatgpt.com)) Mastodon remains the largest visible implementation, but Pixelfed, Misskey-family servers, PeerTube, Lemmy, Pleroma/Akkoma, WriteFreely, GoToSocial, WordPress, Ghost, BookWyrm, Bonfire, Owncast, and bridge services all matter because they encode different media forms, affordances, norms, and moderation surfaces. Pixelfed’s own directory, for example, reported about **1.1 million users** and **2.1K active servers** using FediDB data collected June 10, 2026. ([pixelfed.org](https://pixelfed.org/servers?utm_source=chatgpt.com))

The W3C reopened a Social Web Working Group in January 2026, chartered through January 2028, to maintain ActivityPub, ActivityStreams, Activity Vocabulary, WebSub, Micropub, Webmention, Linked Data Notifications, and related notes. ([w3.org](https://www.w3.org/2026/01/social-web-wg-charter.html?utm_source=chatgpt.com)) This means the protocol layer is no longer merely historical, but still evolving.

---

## 2. Treat the Fediverse as several things at once

| Layer | What it is | What it is not | Implementation implication |
|---|---|---|---|
| Protocol | ActivityPub + ActivityStreams objects, actors, inboxes, outboxes, follows, replies, updates, deletes | A universal app, archive, moderation constitution, or identity system | Build against minimum interoperable objects; test rendering across Mastodon, Misskey-family, Lemmy, Pixelfed, PeerTube, Threads, Ghost/WordPress |
| Software | Mastodon, Pixelfed, PeerTube, Lemmy, Misskey/Sharkey/Iceshrimp, Akkoma, WriteFreely, BookWyrm, Owncast, Ghost, WordPress, Bonfire, GoToSocial | Interchangeable skins | Choose software by media form and moderation affordance |
| Instance governance | Local rules, admins, blocklists, federation policy, reports, appeals | “The Fediverse’s policy” | Publish your own rules and respect remote rules |
| User culture | Norms around CWs, alt text, bots, consent, quote posting, scraping, local timelines, mutual aid, defederation | Generic social media etiquette | Enter slowly; don’t flood timelines; label automation |
| Political economy | Volunteer admin labor, donations, hosting costs, corporate entrants like Meta/Threads, nonprofit projects, co-ops | Inherently anti-capitalist infrastructure | Budget moderation and infrastructure as editorial costs |
| Public mythology | “Decentralized means free/liberatory/uncensorable” | Empirical truth | Test each claim against actual power, labor, and moderation |

---

## 3. Software affordance comparison

| Option | Best use | Strengths | Risks / limitations | Fit for accountable agentic media |
|---|---|---|---|---|
| **Mastodon** | Short posts, project updates, replies, community presence | Mature clients, moderation tools, public familiarity, bot flag | Microblog defaults; local timeline effects; limited search; not long-form archive | Use for social desk, notices, human editor accounts |
| **GoToSocial** | Lightweight single-user or small-team microblogging | Lower footprint; ActivityPub-focused; moderation/report federation docs | Smaller ecosystem; fewer mainstream clients/features | Good for a controlled project actor if you do not need full Mastodon scale |
| **WordPress ActivityPub** | Canonical articles from an existing WordPress site | Blog-wide and author federated profiles; remote replies can become comments | Comment/reply mapping can be complex; plugin stack matters | Strong default if the project already uses WordPress |
| **Ghost ActivityPub** | Newsletter/publication publishing | Ghost 6.0 added social web publishing, reader, and analytics; can use hosted ActivityPub service or self-hosted service depending setup ([docs.ghost.org](https://docs.ghost.org/install/docker?utm_source=chatgpt.com)) | Newer integration; some client/API expectations differ from Mastodon | Strong for a publication/newsletter with memberships |
| **WriteFreely** | Minimal long-form federated essays | Simple writing model; ActivityPub following and mentions ([writefreely.org](https://writefreely.org/docs/main/writer/federation?utm_source=chatgpt.com)) | Reply/comment workflows are weaker and historically debated | Good for essays, less ideal for moderated review workflows |
| **Bonfire** | Custom communities, governance, boundaries | Designed for configurable social spaces; documents interoperability with Mastodon, Pixelfed, Mobilizon, GoToSocial, PeerTube, and privacy boundaries ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html?utm_source=chatgpt.com)) | Emerging; operational maturity varies | Promising for review communities, not first production archive |
| **PeerTube** | Video explainers, hearings, livestream archives | Federated video; ActivityPub API; supports video comment moderation features such as `ApproveReply` in newer versions ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub?utm_source=chatgpt.com)) | Video hosting bandwidth/storage/moderation costs | Use for public video with canonical embed and transcripts |
| **Owncast** | Live events and streams | Self-hosted live streaming with Fediverse social features since 0.0.11 ([owncast.online](https://owncast.online/docs/social/?utm_source=chatgpt.com)) | Live-chat moderation, safety, ops load | Good for public events if staffed |
| **Pixelfed** | Visual evidence, photo essays, graphics | Image-native ActivityPub network; interoperates with Mastodon-like follow model ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com)) | Image provenance, consent, and alt-text burden | Use cautiously for non-sensitive visuals and explainers |
| **Lemmy / Mbin / Kbin** | Forum review, AMA-style discussion, community Q&A | Threaded link/community model; Lemmy maps communities to `Group`, posts to `Page`, comments to `Note` ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html?utm_source=chatgpt.com)) | Upvotes are not evidence; moderation load can be high | Use only with explicit moderation and review framing |
| **Misskey/Sharkey/Iceshrimp family** | Rich social culture, reactions, custom emoji, quote culture | Distinct affordances from Mastodon; important Japanese and art/social communities | Interoperability and rendering differ; reactions/quotes may not map cleanly | Test, don’t assume Mastodon semantics |
| **Pleroma/Akkoma** | Microblogging with flexible policies/relays | Flexible federation and MRF policy options; Akkoma/Pleroma relay patterns exist ([fedify.dev](https://fedify.dev/manual/relay?utm_source=chatgpt.com)) | Variable moderation norms; instance reputation matters | Important for interoperability testing |
| **Threads federation** | Reach into Meta users and cross-network visibility | Threads began Fediverse sharing in 2024; later added fediverse feed/search features in 2025 reporting ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com)) | Corporate governance, partial federation, opt-in limits, deletion uncertainty | Treat as secondary reach, not community consent |
| **Bridgy Fed** | Bridges between websites, ActivityPub, Bluesky | Connects websites, Fediverse, and Bluesky; supports follows, posts, replies, likes, reposts “as much as possible” ([fed.brid.gy](https://fed.brid.gy/?utm_source=chatgpt.com)) | Bridge loss, delay, consent/norm mismatch | Use only with clear labels and monitoring |

---

## 4. Recommended account model

### Project accounts

Create a small set of official project actors:

| Account | Actor type ideal | Role | Rules |
|---|---:|---|---|
| `@project@project.org` | `Organization` or Mastodon-compatible account | Primary distribution account | Posts canonical links, summaries, corrections, calls for review |
| `@claims@project.org` | `Service` / bot-labeled account | Claim/provenance notices | Only publishes structured claim cards and links to canonical claim pages |
| `@corrections@project.org` | `Service` / bot-labeled account | Corrections ledger | Every correction has stable URL, timestamp, affected item, severity |
| `@events@project.org` | `Service` | Livestreams, office hours, hearings | No investigative details before publication |

Because most clients render everything as a user-like profile, the public-facing label matters more than the formal actor type. Use display names like “Project Corrections Bot” and bios that name the responsible human editor.

### Human editor accounts

Human editors should have individual accounts, preferably on an aligned co-op, institutional, professional, or self-hosted domain. Their bios should disclose role, beat, conflicts policy, employer/project, and whether posts are personal or editorial. Do not force all staff onto the project’s own instance unless you are ready to moderate their local-timeline and federation consequences.

### Agent accounts

Agentic accounts should be separate from humans. Mastodon’s bot flag is only a visual indication; Mastodon documentation says other software may treat bot profiles differently, but Mastodon currently treats the flag visually. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/?utm_source=chatgpt.com)) Therefore agent labeling must be redundant:

- bot flag enabled where available;
- display name includes “bot,” “agent,” or “automated”;
- bio links to agent policy, model/system description, editorial owner, and contact;
- every post contains a compact label such as “Automated draft; human-reviewed” or “Automated extraction; not an editorial conclusion”;
- no autonomous replies to vulnerable people, sources, harassment, legal threats, or breaking-news claims;
- agent posts must never represent replies as truth.

Best practice: agents publish **notices and structured summaries**, not final editorial judgments, unless a named human editor has approved the item.

---

## 5. Should the project run its own instance?

### Recommendation

**Eventually, yes, for official publication actors; initially, probably not as an open social instance.**

Run your own ActivityPub endpoint when you need domain authority, canonical identity, portability, and direct correction propagation. Do **not** run a general-purpose Mastodon-style community instance unless moderation is funded as core editorial infrastructure.

### Decision table

| Instance model | Choose when | Avoid when |
|---|---|---|
| Existing aligned instance | Early-stage project, few staff, need community norms | You need domain-controlled official archive identity |
| Co-op/professional instance | You want shared moderation and governance | You need custom software or sensitive publishing controls |
| Institutional instance | University/newsroom has infra and policy staff | Institution may impose speech, FOIA, PR, or legal constraints incompatible with sources |
| Self-hosted single-project instance | You need official domain actor and controlled federation | You cannot staff abuse reports, upgrades, monitoring, backups |
| Open-registration project instance | Almost never for this use case | You lack 24/7 moderation, appeals, onboarding, anti-spam, legal process |
| Single-user GoToSocial/Mastodon | Project bot or editor account with low complexity | You need full publishing CMS, memberships, long-form archive |
| WordPress/Ghost ActivityPub | Canonical publication is already CMS-based | You need advanced community moderation inside the Fediverse itself |
| Custom ActivityPub software | Claim/provenance objects need exact semantics | You cannot maintain interoperability testing and abuse handling |

Moderation research strongly supports caution: Fediverse administration is labor-intensive, with larger instances struggling to find sufficient resources, and community blocklists vary widely in criteria, transparency, and false-positive risk. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

---

## 6. Canonical website versus ActivityPub distribution

### Canonical on the website

The website must contain:

| Canonical item | Why |
|---|---|
| Full article / report / claim page | Stable record and citation target |
| Version history | Shows what changed and when |
| Correction log | Public accountability |
| Claim metadata | Enables reuse without treating social posts as canonical |
| Source provenance | Separates evidence from narrative |
| Human editor and agent disclosure | Accountability |
| Funding and conflicts | Trust infrastructure |
| Moderation and reply policy | Sets expectations |
| Data/code appendices | Reproducibility |
| Accessibility artifacts | Alt text, transcript, captions |
| `robots.txt`, sitemap, RSS/Atom/JSON feed | Discovery and indexing |
| Structured data | Search and machine readability |

Use Schema.org `ClaimReview` when reviewing claims made by others; Schema.org defines it as a fact-checking review of claims made or reported in a creative work. ([schema.org](https://schema.org/ClaimReview?utm_source=chatgpt.com)) Be cautious about platform dependence: Google announced it was phasing out Search support for `ClaimReview` rich-result display while still supporting it in Fact Check Explorer, so ClaimReview should be treated as open metadata, not as guaranteed search placement. ([developers.google.com](https://developers.google.com/search/docs/appearance/structured-data/factcheck?utm_source=chatgpt.com))

For media provenance, C2PA/Content Credentials can help describe origin and edits, but recent 2026 security analysis argues C2PA should not yet be relied on alone for high-stakes journalism or legal evidence. ([c2pa.org](https://c2pa.org/?utm_source=chatgpt.com)) Use C2PA as one signal alongside hashes, source notes, custody logs, archive snapshots, editorial verification, and human-readable provenance.

### Syndicated to ActivityPub

Federate:

- article title, dek, canonical URL, thumbnail, alt text;
- short summary or abstract;
- correction notices;
- “request for review” posts;
- release notes for datasets/tools;
- non-sensitive media announcements;
- public events and office hours;
- transparent bot/agent outputs that are safe to syndicate;
- links to claim pages, not full sensitive evidence dumps.

Do not federate:

- source-identifying material;
- embargoed investigations;
- raw leaked documents;
- private correspondence;
- vulnerable-subject details;
- precise live location;
- unverified allegations likely to cause harm;
- internal editorial deliberation;
- full agent scratchpads;
- private replies;
- personal data that cannot be recalled.

The reason is technical as well as ethical: ActivityPub supports `Delete`, but the spec notes that after an activity has been transmitted, nothing in the protocol can enforce remote deletion. ([w3.org](https://www.w3.org/TR/activitypub/))

---

## 7. Corrections and propagation

ActivityPub supports `Update`, `Delete`, and `Undo`; server-to-server `Update` asks receiving servers to update their copy of the object, and `Delete` may create a tombstone, but remote compliance is not guaranteed. ([w3.org](https://www.w3.org/TR/activitypub/))

### Correction protocol

| Step | Website | ActivityPub | Other channels |
|---|---|---|---|
| Minor typo | Update article version history | Usually no federated notice unless meaning changed | None |
| Material clarification | Add correction note to article | Post correction reply/thread and/or `Update` article object | RSS/email note if important |
| Factual error | Correction page with severity, original claim, corrected claim, editor | New correction post from `@corrections`; reply to original post where possible | Email, RSS, Bluesky, Threads, archive |
| Harmful false claim | Preserve public correction; consider redaction | Send `Update` or `Delete`, but explain remote deletion limits | Direct notices to known republication channels |
| Legal/safety removal | Tombstone page if safe; internal audit retained | Send `Delete`; do not promise erasure | Legal/source-protection workflow |

Correction notices should be **new, durable objects**, not only edits to old posts. This makes them visible to followers who already saw the original and to archives that missed the update.

---

## 8. Replies as review, not truth

Replies, boosts, likes, favorites, votes, quote posts, and bridge interactions are **signals of reception**, not evidence of correctness. They are affected by instance blocks, client affordances, follower graph, language, timezone, moderation, search opt-in, bridge loss, and culture.

Mastodon full-text search is intentionally limited: official docs say logged-in users can search public statuses only from accounts that opted into search, plus their own statuses, mentions, favourites, bookmarks, and accounts; it deliberately does not allow arbitrary full-database search. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/elasticsearch/?utm_source=chatgpt.com)) This means social absence is not evidence of public absence.

### Review intake policy

- Treat replies as public comments.
- Queue replies into a moderation/review dashboard.
- Classify as: correction claim, source lead, contextual note, abuse/spam, opinion, duplicate, off-topic.
- Require evidence links for correction claims.
- Never auto-incorporate reply claims into the canonical record.
- Publish “review acknowledgments” only when a human editor has assessed them.
- Attribute contributors only with consent; Fediverse handles may be pseudonymous and context-specific.

---

## 9. Local timelines and federation risks

Posting from an existing community instance can inject project material into that instance’s local timeline. That can be good for belonging, but risky for a newsroom or research project that posts high-volume, controversial, or traumatic content.

Risks:

| Risk | Mechanism | Mitigation |
|---|---|---|
| Timeline flooding | Project account posts many updates visible locally | Use low-volume summaries; separate bot account; ask admins |
| Norm collision | Newsroom style conflicts with local culture | Read rules; use CWs/alt text; disclose automation |
| Guilt by association | Users judge instance by project content | Choose aligned instance or self-host official actor |
| Moderation spillover | Replies/reports burden host admins | Formal agreement with admins; provide project moderators |
| Defederation blast radius | Project conduct affects host reputation | Federation policy, rate limits, escalation |
| Sensitive exposure | Research teasers reveal source communities | Syndicate only public-safe summaries |

---

## 10. Moderation burden of hosting

If the project hosts an instance, it becomes an infrastructure operator, not just a publisher. Mastodon docs support domain-level moderation and blocklist import/export, reflecting the reality that instance-level moderation is a routine administrative task. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/?utm_source=chatgpt.com)) Hachyderm’s public moderation materials show how serious instances document blocklists, reports, moderator actions, and federation decisions. ([community.hachyderm.io](https://community.hachyderm.io/docs/moderation/blocklists/?utm_source=chatgpt.com))

Minimum staffing and policy requirements:

- named administrators;
- emergency contact;
- abuse report queue;
- moderation SLA;
- federation/block policy;
- appeals process;
- child safety and illegal content policy;
- harassment and brigading response;
- spam and bot policy;
- backups and restore tests;
- security updates;
- log retention policy;
- privacy policy;
- data export/departure plan;
- shutdown plan.

A project that cannot fund these should use a hosted/co-op/institutional instance or CMS-native ActivityPub publishing rather than running a public instance.

---

## 11. Agent-written posts: labeling standard

Every agent-generated post should carry three labels:

1. **Authorship label:** “Generated by [agent name/version].”
2. **Editorial status label:** “Human-reviewed,” “automated extraction,” “draft,” “unreviewed alert,” or “not a factual conclusion.”
3. **Accountability label:** “Responsible editor: [role/name/team], policy: [canonical URL].”

Example:

> **Automated claim notice — human-reviewed.**  
> Agent: ClaimBot v0.7. Responsible editor: Research Desk.  
> This post summarizes a claim page; the canonical record, evidence, and correction history are at: [URL].

Agent accounts should not chase engagement. They should publish bounded, auditable notices.

---

## 12. Recommended architecture

```text id="akmznk"
Canonical website
  ├─ Articles / reports / claims / datasets / corrections
  ├─ Structured metadata: Schema.org, JSON-LD, ClaimReview where appropriate
  ├─ Provenance: hashes, C2PA where useful, source notes, version history
  ├─ RSS / Atom / JSON Feed / sitemap
  ├─ Editorial policy / agent policy / moderation policy
  └─ Review dashboard

ActivityPub layer
  ├─ WordPress ActivityPub or Ghost ActivityPub for articles
  ├─ Mastodon/GoToSocial project account for short social updates
  ├─ Corrections actor
  ├─ Agent/bot actors
  ├─ PeerTube/Owncast for AV when needed
  └─ Reply ingestion + moderation queue

Cross-network layer
  ├─ Email newsletter
  ├─ RSS readers
  ├─ Bluesky via native posting or Bridgy Fed
  ├─ Threads federation as secondary reach
  ├─ Search engines / public index
  └─ Archival snapshots
```

Use RSS as a first-class distribution protocol, not a fallback. Tools such as EchoFeed can read RSS/Atom/JSON feeds and post to Mastodon, Bluesky, Micro.blog, GitHub, Discord, and webhooks. ([echofeed.app](https://echofeed.app/?utm_source=chatgpt.com)) RSS-to-ActivityPub bridges such as MastoFeeder exist, but bridge services should be treated as convenience infrastructure, not canonical identity. ([github.com](https://github.com/jehna/mastofeeder?utm_source=chatgpt.com))

---

## 13. Worked examples

### Example A: Publishing an investigation

1. Publish canonical report at `project.org/reports/2026/example`.
2. Include human editor, agent assistance disclosure, source methodology, funding/conflict note, correction policy.
3. Publish structured metadata: `NewsArticle`, `Dataset` if applicable, `ClaimReview` only for explicit fact-checks of external claims.
4. Federate summary through Ghost/WordPress ActivityPub or project actor.
5. Post a Mastodon/GoToSocial thread with content warnings if needed.
6. Open replies for review, but state: “Replies are public comments, not part of the verified record unless incorporated by editors.”
7. Mirror summary to RSS, email, Bluesky, and other channels.
8. Log all substantive corrections on canonical page and `@corrections`.

### Example B: Agent extracts claims from a public hearing

Good federated post:

> **Automated extraction — not a verdict.**  
> ClaimBot identified 7 checkable claims in today’s hearing transcript. Human review pending. Canonical list: [URL]. Submit evidence or corrections by replying or using the review form.

Bad federated post:

> “Senator X lied 7 times today.”

The second collapses extraction into judgment and invites harassment. The first invites review while preserving editorial accountability.

### Example C: Correction propagation

A published claim says a grant was awarded in 2024; documents show it was awarded in 2023.

- Website: update report, add correction note with timestamp.
- `@corrections`: post “Correction: grant award year changed from 2024 to 2023; conclusion unchanged/changed.”
- Original social thread: reply with correction link.
- ActivityPub article object: send `Update` if supported.
- RSS/email: include correction in next digest.

Do not rely on editing the original social post alone.

### Example D: Sensitive research

For research involving vulnerable communities, do not federate raw data, screenshots, handles, geolocation, or “interesting examples.” Publish a methodological note and delayed aggregate findings. Fediverse research ethics work in 2025 found a disconnect between instance policies—many prohibiting data collection—and actual academic use of Mastodon data; the ethical issue is not solved by saying posts are technically public. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

### Example E: Cross-posting

- Website publishes article.
- RSS/email receive full or partial version.
- ActivityPub receives summary + canonical link.
- Bluesky receives summary + canonical link, either natively or via bridge.
- Threads federation may receive ActivityPub content, but treat it as secondary because Threads federation has been opt-in and feature-limited over time. ([help.instagram.com](https://help.instagram.com/760878905943039/?utm_source=chatgpt.com))
- Hive or other closed/social apps receive only manually curated links if audience justifies it.

---

## 14. Risks

| Risk | Severity | Notes |
|---|---:|---|
| Mistaking federation for archive | High | Remote copies diverge; deletion cannot be enforced |
| Moderation underfunding | High | Admin labor is real care labor |
| Agent overclaiming | High | Extraction must not masquerade as verified judgment |
| Source exposure | High | Federated posts are hard to recall |
| Defederation | Medium/high | Can be principled boundary or reputational isolation |
| Corporate capture / Threads effects | Medium/high | Threads expands reach but imports Meta governance and scale |
| Search invisibility | Medium | Mastodon search is opt-in/limited |
| Reply manipulation | Medium | Brigades can appear as review |
| Bridge loss | Medium | Bridgy Fed and RSS bridges are best-effort |
| Blocklist false positives | Medium | Research shows wide variation in blocklist goals and criteria ([arxiv.org](https://arxiv.org/abs/2506.05522?utm_source=chatgpt.com)) |
| Analytics distortion | Medium | Federation gives partial visibility |
| Legal compliance | Medium/high | Hosting an instance creates operator duties |
| Software churn | Medium | Ghost ActivityPub, Bonfire, bridges, Misskey forks evolve quickly |
| Public mythology | Medium | “Decentralized” can hide unequal admin labor and infrastructure power |

---

## 15. Open questions

1. What standardized ActivityPub vocabulary should represent **corrections**, **editorial review status**, and **agent assistance**?
2. Should agent accounts use `Service` or `Application` actors when software clients mostly render user profiles?
3. How should consent signals for research/data collection travel across federated objects?
4. Can correction propagation be made more reliable than best-effort `Update` plus new notice posts?
5. What does a responsible public blocklist policy look like for a newsroom?
6. How should bridges preserve bot labels, content warnings, alt text, and correction links?
7. How should ActivityPub represent claim graphs without breaking ordinary clients?
8. Can public review be made useful without creating harassment surfaces for sources and subjects?
9. What is the right division between searchable archive, social feed, and protected source room?
10. How should projects audit whether they are burdening volunteer admins on host instances?

---

## 16. Implementation recommendation

### Phase 1 — low-risk presence

- Canonical website with RSS, sitemap, structured metadata, correction pages.
- One project account on a reputable aligned instance.
- Human editor accounts on appropriate instances.
- Bot/agent policy published before any automation.
- Manual posting only for sensitive work.
- No open-registration instance.

### Phase 2 — native publishing

- Add WordPress ActivityPub or Ghost ActivityPub if the CMS fits.
- Create separate corrections and claims actors.
- Build reply ingestion into editorial review tooling.
- Add cross-posting to Bluesky/RSS/email.
- Pilot PeerTube/Owncast only with moderation staffing.

### Phase 3 — controlled self-hosting

- Self-host single-project ActivityPub service or GoToSocial/Mastodon-compatible endpoint.
- Publish federation policy and blocklist rationale.
- Maintain abuse queue and security updates.
- Test rendering across Mastodon, Pixelfed, Misskey-family, Lemmy, PeerTube, Threads, Ghost/WordPress, Bridgy Fed.
- Consider custom ActivityPub only for claim/provenance objects that ordinary CMS software cannot express.

### Bottom line

Use ActivityPub to make accountable work **followable, discussable, correctable, and discoverable across communities**. Do not use it as the sole archive, sole audience, sole identity system, sole consent layer, or sole governance structure.

---

## Annotated bibliography

**W3C ActivityPub Recommendation, January 23, 2018.** Defines client-to-server and server-to-server federation, inbox/outbox delivery, create/update/delete/follow/like/block/undo semantics. Crucial for understanding what the protocol can and cannot guarantee. ([w3.org](https://www.w3.org/TR/activitypub/?utm_source=chatgpt.com))

**W3C ActivityStreams 2.0 Core, May 23, 2017.** Defines objects, actors, activities, extensibility, and actor types including `Person`, `Group`, `Organization`, `Application`, and `Service`. Useful for modeling humans, organizations, and agents. ([w3.org](https://www.w3.org/TR/activitystreams-core/))

**W3C Social Web Working Group Charter, January 2026.** Shows that ActivityPub and related standards are again under active W3C maintenance, with expected work on backwards-compatible iterations. ([w3.org](https://www.w3.org/2026/01/social-web-wg-charter.html?utm_source=chatgpt.com))

**Mastodon documentation, 2026.** Important for moderation, bot labels, federation management, and search limits. Mastodon is not the Fediverse, but its defaults shape much Fediverse culture. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/?utm_source=chatgpt.com))

**Pixelfed ActivityPub docs.** Establishes Pixelfed as image-native ActivityPub software interoperating with Pixelfed and other Fediverse software such as Mastodon. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html?utm_source=chatgpt.com))

**PeerTube ActivityPub docs.** Shows video-specific federation and comment moderation affordances such as `ApproveReply`; useful for newsroom video and public hearings. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub?utm_source=chatgpt.com))

**Lemmy federation docs.** Important for group/threaded discussion models; Lemmy maps community to `Group`, user to `Person`, post to `Page`, and comment to `Note`. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html?utm_source=chatgpt.com))

**WordPress ActivityPub plugin docs.** Shows WordPress blogs and authors can function as federated profiles and receive federated comments. Strong fit for canonical-web-first publishing. ([wordpress.org](https://wordpress.org/plugins/activitypub/?utm_source=chatgpt.com))

**Ghost 6.0 and Ghost ActivityPub docs, 2025.** Ghost added social web publishing and supports hosted/self-hosted ActivityPub service paths, making it important for publications and newsletters. ([docs.ghost.org](https://docs.ghost.org/install/docker?utm_source=chatgpt.com))

**Bridgy Fed docs.** Key bridge between websites, ActivityPub, and Bluesky. Useful but best-effort; should not be canonical. ([fed.brid.gy](https://fed.brid.gy/?utm_source=chatgpt.com))

**Threads federation docs and reporting, 2024–2025.** Threads entered ActivityPub federation with limitations and opt-in behavior; useful for reach, risky as governance dependency. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/?utm_source=chatgpt.com))

**Zhang et al., “Understanding Community-Level Blocklists in Decentralized Social Media,” 2025.** Empirical study of blocklists and moderator interviews; emphasizes variation, transparency problems, false positives, and moderation trade-offs. ([arxiv.org](https://arxiv.org/abs/2506.05522?utm_source=chatgpt.com))

**Anaobi et al., “Will Admins Cope? Decentralized Moderation in the Fediverse,” 2023.** Finds administrator burden and resource constraints, especially on larger instances. Essential for deciding whether to self-host. ([arxiv.org](https://arxiv.org/abs/2302.05915?utm_source=chatgpt.com))

**Colglazier, TeBlunthuis, and Shaw, “The Effects of Group Sanctions on Participation and Toxicity,” 2024.** Studies defederation effects; useful for treating defederation as governance, not merely technical failure. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

**Lisker and Mihaljević, “Data Ethics in the Fediverse,” 2025.** Shows many instance policies prohibit research data collection and that prior studies often failed to adhere to those policies. Essential for accountable research practice. ([arxiv.org](https://arxiv.org/abs/2505.07606?utm_source=chatgpt.com))

**Schema.org ClaimReview, current as of 2026.** Useful for structured fact-check metadata, but should be part of a broader provenance system rather than a platform-dependent visibility strategy. ([schema.org](https://schema.org/ClaimReview?utm_source=chatgpt.com))

**C2PA / Content Credentials and 2026 critique.** Useful for media provenance, but current research warns against relying on it alone for high-stakes verification. ([c2pa.org](https://c2pa.org/?utm_source=chatgpt.com))
