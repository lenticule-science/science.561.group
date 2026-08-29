---
title: Fediverse Automation and Agentic Media Policy
description: Research memo arguing automation on the Fediverse is neither automatically welcome nor abusive, with legitimacy negotiated across protocol conformance, instance governance, and situated user culture. Proposes a minimum standard that an automated ActivityPub actor is legitimate when it is disclosed, bounded, locally accountable, source-linked, rate-conscious, consent-aware, correctable, and designed not to capture attention or shift labor and costs onto volunteer admins.
keywords: ["fediverse", "automation", "bots", "agentic-media", "policy", "consent", "accountability", "rate-limiting"]
---

# Research memo: Fediverse automation and agentic media policy  
*Current to June 11, 2026.*

## Abstract

Automation on the Fediverse is neither automatically welcome nor automatically abusive. ActivityPub explicitly allows actors to represent software, bots, services, and automated processes, but the protocol does not decide whether a given bot is socially legitimate. That legitimacy is negotiated at three levels: protocol conformance, instance governance, and situated user culture. A bot that is technically valid can still be blocked for flooding local timelines, ignoring consent tags, scraping against local rules, impersonating people, or exporting moderation costs to volunteer admins. Conversely, automation can be useful when it is disclosed, low-volume, source-linked, opt-in or quiet by default, accountable to a human operator, and easy for instances to rate-limit, silence, or block. ([w3.org](https://www.w3.org/TR/activitypub/))

## Core thesis

The Fediverse can support agentic publishing, but only if it treats automation as **accountable public infrastructure**, not as frictionless distribution. The minimum viable standard is:

> **An automated ActivityPub actor is legitimate when it is disclosed, bounded, locally accountable, source-linked, rate-conscious, consent-aware, correctable, and designed not to capture attention or shift labor and costs onto others.**

Protocol-conformant is the weakest test. Instance-permitted is stronger. Culturally accepted is strongest and varies by server, language community, software family, and political history.

---

## 1. Scope: the Fediverse is not Mastodon

The ActivityPub-conformant Web includes microblogging, image sharing, video, forums, blogs, books, live streams, bridges, and publishing systems. Mastodon is central because of its size, API ecosystem, and moderation vocabulary, but automation policy must also account for Pixelfed, PeerTube, Lemmy/Mbin/Kbin-style communities, Misskey/Sharkey/Iceshrimp-family servers, Pleroma/Akkoma, WordPress ActivityPub, Ghost ActivityPub, WriteFreely, BookWyrm, Owncast, Bridgy Fed, Bonfire, GoToSocial, Threads federation, Discourse/NodeBB integrations, and smaller implementations. Fediverse Observer’s software listings illustrate this multi-software reality, including Mastodon, Misskey, Pixelfed, PeerTube, Lemmy, WriteFreely, BookWyrm, WordPress, Sharkey, Friendica, Pleroma, Mobilizon, NodeBB, and others. ([fediverse.observer](https://fediverse.observer/))

That diversity matters because “a bot” means different things in different contexts: a Mastodon posting bot, a PeerTube channel importer, a Lemmy vote bot, a Pixelfed image generator, a WordPress syndication actor, a Ghost newsletter actor, a Bridgy Fed bridge account, and a GoToSocial moderation helper do not stress the network in the same way.

---

## 2. Protocol floor: what ActivityPub permits, and what it does not decide

ActivityPub is a W3C Recommendation from January 23, 2018. It defines client-to-server and server-to-server federation over ActivityStreams 2.0. It explicitly includes clients such as “users, bots, or other automated processes,” and ActivityPub actors may represent software, a bot, or an automated process rather than a human person. ([w3.org](https://www.w3.org/TR/activitypub/))

That means an agentic publisher can be ActivityPub-conformant. It can have an actor, inbox, outbox, followers, public posts, replies, updates, deletes, and attachments. ActivityPub also requires globally unique object identifiers for distributed objects, which supports canonical publication and correction workflows. ([w3.org](https://www.w3.org/TR/activitypub/))

But ActivityPub does **not** provide a complete social contract. It does not impose a global bot registry, a universal “AI-generated” flag, a shared rate limit, universal deletion enforcement, global moderation rules, or a guarantee that remote servers will honor correction or deletion requests. The spec notes that once an activity has been transmitted to remote servers, deletion cannot be guaranteed. ([w3.org](https://www.w3.org/TR/activitypub/))

So the policy question is not “can bots exist?” They can. The question is: **which bots should be federated, surfaced, boosted, replied to, indexed, archived, or blocked?**

---

## 3. Software affordances and automation risk surfaces

| Software / family | Automation affordances | Main automation risks | Policy implication |
|---|---|---|---|
| **Mastodon, Pleroma/Akkoma, GoToSocial** | REST APIs, posting clients, bot flags, timelines, moderation controls, domain limits/blocks | Timeline flooding, unsolicited replies, fake social presence, scraping, API abuse | Bot flag and rate limits are necessary but insufficient; instance rules decide acceptability. Mastodon’s default API limit is 300 requests per 5 minutes per account for most endpoints, with stricter media and delete/reblog limits. ([docs.joinmastodon.org](https://docs.joinmastodon.org/api/rate-limits/)) |
| **Pixelfed** | ActivityPub image/photo federation, comments, likes, image metadata, federation with Mastodon and other software | AI image spam, media storage costs, missing or bad alt text, reposted copyrighted images | Image bots should be opt-in, disclose generation/source, and avoid flooding public hashtags. Pixelfed uses ActivityPub to federate with Pixelfed and other Fediverse software. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html)) |
| **PeerTube / Owncast** | Video and live-stream actors, comments, channel federation, imports, media metadata | High bandwidth/storage costs, mirrored copyrighted video, comment spam, automated uploads | High-volume media automation needs stricter quotas and human review. PeerTube uses ActivityPub for video metadata, comments, likes/dislikes, flags, views, and channel actors. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub)) |
| **Lemmy, Mbin, Kbin, NodeBB, Discourse ActivityPub** | Community/group federation, posts, comments, votes, announces | Vote bots, brigading, reply storms, community moderation overload | Forum automation affects groups, not only followers. Lemmy maps communities to `Group` actors and posts/comments to ActivityPub objects; scaling discussions note that votes and actions can fan out to many instances. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html)) |
| **Misskey, Sharkey, Iceshrimp-family forks** | API and streaming API for apps and bots; rich notes, reactions, custom emoji | Reaction spam, rich-media spam, bot-driven timeline aesthetics | Bot policy must account for reactions and richer social gestures, not just posts. Misskey’s docs explicitly describe API use for bots and recommend turning on the bot flag. ([misskey-hub.net](https://misskey-hub.net/en/docs/for-developers/api//)) |
| **WordPress ActivityPub, Ghost ActivityPub, WriteFreely** | Blog/newsletter/article federation, author actors, canonical web pages | SEO-like content farms, AI article spam, reposting without context, bad canonicalization | Publishing automation is often legitimate when it syndicates original work with canonical links. WordPress ActivityPub can expose the blog and authors as federated profiles; Ghost’s ActivityPub beta brings Ghost publications into Mastodon, Pixelfed, Threads, and other Fediverse contexts. ([wordpress.org](https://wordpress.org/plugins/activitypub/)) |
| **BookWyrm** | Book/review/social reading federation | Review spam, affiliate spam, synthetic reviews | Automation should avoid fake reviews and undisclosed promotional content. |
| **Threads federation** | Large corporate bridge into ActivityPub; opt-in federation; separate fediverse feed/search features | Scale asymmetry, corporate moderation mismatch, attention capture | Threads can bring large-platform dynamics into smaller federated spaces; its fediverse feed remains separate and opt-in. ([theverge.com](https://www.theverge.com/news/688267/threads-fediverse-feed-search)) |
| **Bridgy Fed** | Bridges between Fediverse, Bluesky, websites, and other networks | Consent mismatch, block propagation, context collapse, bridge spam | Bridge legitimacy depends on opt-in/out clarity, block/report handling, and respecting tags such as `#nobridge` where applicable. ([fed.brid.gy](https://fed.brid.gy/docs)) |
| **Bonfire** | Experimental ActivityPub social networking with privacy and boundary work | Still-emerging interop expectations | Useful testbed for richer consent and boundary models, but deployment scale is smaller. Bonfire emphasizes ActivityPub interop with Mastodon, Pixelfed, Mobilizon, GoToSocial, and PeerTube while experimenting with privacy and boundaries. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html)) |

---

## 4. What makes a Fediverse bot acceptable?

Across implementations and policies, acceptable automation tends to satisfy eight tests.

| Test | Practical standard |
|---|---|
| **Disclosure** | The profile says it is automated, identifies the operator, and uses the platform’s bot flag where available. Mastodon’s bot flag visually indicates that an account may perform automated actions, though Mastodon currently treats it mainly as a visual indication. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/profile/)) |
| **Accountability** | A reachable human, organization, or instance team is responsible. No anonymous autonomous “agent” should make consequential public claims. |
| **Bounded scope** | The account says what it does and does not do: weather alerts, release notes, RSS syndication, alt-text suggestions, archive notices, etc. |
| **Low volume / quiet default** | Frequent automation should be unlisted, followers-only, grouped, or digest-based rather than flooding public and local timelines. |
| **Consent awareness** | It respects `#nobot`, `#nobridge`, blocks, follows-only contexts, and instance rules. `#NoBot`/`#NoBridge` are etiquette and opt-out conventions rather than protocol-enforced guarantees, but ignoring them is socially meaningful. ([github.com](https://github.com/friendica/friendica/issues/14086)) |
| **Source linkage** | Posts link to canonical sources, datasets, upstream posts, commits, articles, or media originals. |
| **Correction ability** | The bot can update, retract, or publish corrections, and the operator understands that remote deletion is not guaranteed. ([w3.org](https://www.w3.org/TR/activitypub/)) |
| **Local governability** | Admins can rate-limit, silence, suspend, defederate, or contact the operator. Mastodon distinguishes local moderation actions such as limiting and suspending accounts; similar ideas exist across Fediverse software with implementation differences. ([docs.joinmastodon.org](https://docs.joinmastodon.org/admin/moderation/)) |

A useful rule: **a bot should be more predictable than a person, not less accountable than one.**

---

## 5. Legitimacy matrix for common automation types

| Automation type | Usually legitimate when… | Culturally contested when… | Often block-worthy when… |
|---|---|---|---|
| **Weather, transit, earthquake, public-data bots** | Low-volume, geographically scoped, source-linked, no unsolicited mentions | Severe-alert amplification becomes noisy or inaccurate | They spam hashtags, misreport emergencies, or lack correction policy |
| **Alt-text bots** | Opt-in, invoked by mention or follow, returns suggestions, does not shame users | It replies publicly to strangers without request | It stores images, analyzes sensitive identity traits, or harasses posters |
| **RSS/blog/newsletter cross-posting** | It syndicates original work with canonical links and reasonable frequency | It reposts every minor update into public timelines | It becomes an AI content farm or scraper |
| **GitHub/release bots** | Project-specific, follower-oriented, digest-based | It posts every commit or CI event publicly | It floods local timelines or mentions maintainers repeatedly |
| **Archive bots** | Archive rights are clear; posts are canonical, attributed, and consent-aware | They mirror personal posts without consent | They scrape against instance rules or make deletion impossible in practice |
| **News bots / agentic newswire accounts** | Human-reviewed, source-linked, correction-capable, limited frequency | LLM summaries are posted without clear review status | They publish hallucinated, defamatory, emergency, election, war, health, or legal claims |
| **Moderation bots** | Assistive, auditable, human-in-the-loop, instance-authorized | They silently classify people or recommend blocks without transparency | They auto-punish, mass-report, or coordinate harassment |
| **Relay and bridge bots** | Opt-in, transparent, block-aware, admin-approved | They move posts across context boundaries | They ignore blocks, `#nobridge`, private expectations, or instance bans |
| **Reply bots / chat agents** | Explicitly invoked, one-shot, rate-limited, labeled | They join ambient conversations uninvited | They simulate humans, argue, persuade, or escalate conflict |
| **LLM-generated posting bots** | Clearly labeled, human-curated, low-stakes, source-bounded | They produce “slop,” filler, or synthetic consensus | They impersonate expertise, launder copyrighted text, hallucinate, or flood feeds |
| **Spam/follow/boost/fave bots** | Almost never legitimate except controlled test instances | — | They manipulate visibility, harvest follows, evade moderation, or monetize attention |

---

## 6. Safe automation ladder

This ladder separates low-risk tooling from network-impacting autonomous agents.

| Level | Automation pattern | Fediverse posture | Review requirement |
|---:|---|---|---|
| **0** | Offline research assistant; no ActivityPub credentials | Safe by default | Human controls all publication |
| **1** | Drafting assistant for a human account | Not an autonomous actor | Human posts manually |
| **2** | Scheduled posts for own authored material | Acceptable if disclosed when account is mostly automated | Human approves queue |
| **3** | Source-linked syndication from RSS, WordPress, Ghost, blogs, GitHub releases, podcasts, PeerTube uploads | Acceptable when low-volume and canonical | Human sets sources; review exceptions |
| **4** | Opt-in helper bot: alt text, citation lookup, thread unroll, link check, moderation triage | Legitimate when explicitly invoked | Automated response allowed only for low-risk tasks |
| **5** | Curated newswire: agent gathers, clusters, drafts, cites | Potentially legitimate | Human reviews public claims before posting |
| **6** | Constrained agentic publisher: monitors sources, drafts analyses, proposes corrections, queues replies | High scrutiny | Human review for posts, replies, corrections, and sensitive topics |
| **7** | Federation-impacting infrastructure: bridges, relays, crawlers, moderation classifiers, blocklist tools | Admin- or community-governed only | Audit logs, quotas, opt-in, appeals |
| **8** | Autonomous persuasion, impersonation, mass replies, AI news without review, scraping against rules, block evasion | Illegitimate | Should be blocked |

The key threshold is between levels 4 and 5. A helper bot that answers explicit requests is socially different from an agent that autonomously publishes claims into public timelines.

---

## 7. What can be automated safely?

Relatively safe automation:

| Action | Conditions |
|---|---|
| Publishing scheduled original posts | Low volume; profile disclosure if account is substantially automated |
| Syndicating canonical articles | Preserve title, author, source, canonical URL, publication date |
| Posting release notes or project updates | Digest mode preferred; no commit-by-commit public firehose |
| Generating draft alt text | Opt-in; presented as suggestion, not authoritative description |
| Checking links, citations, duplicates | No public reply unless requested |
| Metadata enrichment | Do not infer sensitive traits; keep provenance |
| Moderation triage | Assistive only; human final decision |
| Weather/public-data alerts | Source-linked; rate-limited; correction path visible |
| Archiving own posts | Respect delete/update semantics; do not promise universal deletion |

Automation that should require human review:

| Action | Why |
|---|---|
| News summaries | Risk of hallucination, missing context, defamation, and emergency misinformation |
| Posts about elections, war, public health, disasters, law, finance, medicine, accusations, deaths, or identity-based harm | High-stakes claims create real-world risk |
| Replies to strangers | Replies are socially intrusive; automation can capture or derail conversations |
| Moderation enforcement | False positives cause exclusion; blocklists and defederation have community-wide effects |
| Bridging between networks | Context, consent, and block semantics differ across networks |
| Summarizing or archiving other users’ posts | Public does not always mean socially free to process, republish, or train on |
| Copyright-sensitive media handling | Reposting, transcription, and summarization can create rights issues |

Automation that should never be deployed across the public Fediverse:

| Action | Reason |
|---|---|
| Undisclosed human-like accounts | Deception |
| Autonomous argument or persuasion bots | Manipulation and conflict escalation |
| Mass unsolicited replies or mentions | Harassment/flooding |
| Follower, boost, favorite, reaction, or vote farms | Visibility manipulation |
| Impersonation of people, institutions, journalists, or emergency services | Direct trust harm |
| Scraping against instance rules or opt-outs | Governance violation |
| Reposting deleted, followers-only, or blocked-context material | Consent and safety violation |
| Publishing unreviewed LLM allegations or breaking news | Hallucination and defamation risk |
| Circumventing rate limits, blocks, or defederation | Hostile behavior |

---

## 8. Local timelines, federation load, and the externalization problem

Automation affects the Fediverse by consuming three scarce resources: **attention, infrastructure, and moderation labor**.

ActivityPub delivery requires servers to compute recipients from addressing fields such as `to`, `cc`, `audience`, followers collections, and inboxes, then deliver activities to remote inboxes. This makes volume and fan-out material, especially for accounts with many followers or software that forwards group activity across many instances. ([w3.org](https://www.w3.org/TR/activitypub/))

Lemmy’s scaling discussions are a useful example: community actions, especially votes, can be forwarded to many instances, multiplying a single user action into a large number of HTTP requests. ([github.com](https://github.com/LemmyNet/lemmy/issues/3062))

The retirement of botsin.space is a second warning. Its administrator described years of bot-friendly culture but also major sustainability burdens: database growth, file storage, bandwidth, server costs, AI-scraper fears, and the mismatch between Mastodon code optimized for very large mainstream instances and a “weird freaky” bot-heavy server. ([muffinlabs.com](https://muffinlabs.com/posts/2024/10/29/10-29-rip-botsin-space/))

The policy implication is blunt: **a bot’s cost is not paid only by its operator.** It is also paid by remote instances, moderators, followers, blocked users, search/indexing systems, and admins who must investigate abuse.

---

## 9. AI slop, scraping, and the current cultural conflict

By 2025–2026, Fediverse automation debates increasingly overlap with AI scraping, LLM-generated posting, and “slop” concerns. Mastodon.social’s 2025 terms update reportedly prohibited scraping for unauthorized uses including archival and LLM training, but this applies to mastodon.social rather than the whole Fediverse. That distinction matters: there is no central Fediverse terms of service. ([techcrunch.com](https://techcrunch.com/2025/06/17/mastodon-updates-its-terms-to-prohibit-ai-model-training/))

A 2026 Mastodon issue proposing an “It’s slop!” report reason is not binding policy, but it is evidence of current user frustration with AI-generated low-value content appearing in hashtags and public feeds. ([github.com](https://github.com/mastodon/mastodon/issues/39172))

Research ethics work has also emphasized a gap between what instance policies often prohibit and what researchers or data collectors do in practice. A 2025 study of Fediverse data ethics argues that APIs can hide the complexity of distinct local rules, privacy expectations, and community guidelines. ([workshop-proceedings.icwsm.org](https://workshop-proceedings.icwsm.org/pdf/2025_43.pdf))

The practical lesson: **machine-readable availability is not social permission.**

---

## 10. Can an agentic newswire be ActivityPub-conformant and socially legitimate?

**ActivityPub-conformant? Yes.** It can be a `Service` or `Application` actor with an inbox, outbox, followers, posts, articles, updates, and replies. ActivityPub’s actor model is broad enough for that. ([w3.org](https://www.w3.org/TR/activitypub/))

**Socially legitimate? Only under strict constraints.** A legitimate agentic newswire should look less like an autonomous chatbot and more like a public-interest wire service with visible editorial controls.

Minimum policy:

1. **Dedicated account**, not a fake person.
2. **Bot/automation disclosure** in profile, display name, and machine-readable metadata where possible.
3. **Named operator**: person, newsroom, cooperative, lab, institution, or instance team.
4. **Human review before publication** for news claims, allegations, emergencies, politics, public health, conflict, finance, law, and identity-based harm.
5. **Source-first posts**: every claim links to primary or credible secondary sources.
6. **Canonical article URL** for full context.
7. **Visible correction policy** and correction log.
8. **No autonomous replies to strangers** except narrow acknowledgments or explicit command responses.
9. **No engagement farming**: no mass mentions, quote-bait, auto-boost campaigns, or controversy chasing.
10. **Quiet defaults**: unlisted/digest mode for high frequency; public posts only for editorially significant items.
11. **Instance-specific compliance**: obey the hosting instance’s bot, AI, scraping, bridge, and rate-limit policies.
12. **Exit and failure mode**: if the operator disappears, the account stops posting.

A newswire that autonomously scrapes, summarizes, and posts breaking claims without human review may be technically federated but should be treated as socially unsafe.

---

## 11. Metadata schema for an agentic research publisher

The safest approach is to use ordinary ActivityStreams fields for interoperability, then add JSON-LD extensions for richer provenance. ActivityStreams already includes properties such as `attributedTo`, `audience`, `content`, `context`, `generator`, `inReplyTo`, `published`, `replies`, `summary`, `tag`, `updated`, `url`, `mediaType`, `to`, and `cc`. ([w3.org](https://www.w3.org/TR/activitystreams-vocabulary/))

Recommended actor profile fields:

| Field | Purpose |
|---|---|
| Actor type | Prefer `Service` or `Application` for automated publishers; avoid pretending to be a natural person |
| Display name | Include “bot,” “automated,” “agentic,” or “wire” plainly |
| Summary / bio | Explain method, sources, human review, correction policy, model use |
| Operator | Human or organization responsible |
| Contact | Abuse/moderation contact |
| Posting policy | Frequency, topics, review standard |
| Source policy | What feeds, sites, APIs, documents, or accounts are monitored |
| AI/model policy | Models used, whether outputs are human reviewed |
| License | Terms for reuse |
| Correction log | Stable page listing corrections and retractions |
| Bot flag | Enabled where software supports it |

Recommended object fields:

| Field | Use |
|---|---|
| `id` | Stable ActivityPub object URI |
| `type` | `Article` for long-form; `Note` for short posts; `Document`, `Image`, or `Video` for attachments |
| `attributedTo` | Agent actor and/or editorial organization |
| `name` | Headline |
| `summary` | Abstract or content warning |
| `content` | Body or excerpt |
| `url` | Canonical human-readable page |
| `published` / `updated` | Publication and correction timestamps |
| `tag` | Hashtags, topics, disclosure tags such as `#bot` or `#AI` where culturally appropriate |
| `attachment` | Source links, datasets, method notes, archived evidence, media |
| `generator` | Software or pipeline that produced the draft |
| Extension fields | Review status, model, source confidence, license, provenance, correction policy |

FEPs are relevant but unevenly implemented. The Fediverse Enhancement Proposal process includes work on actor metadata, object integrity proofs, identity proofs, content licensing, links between ActivityPub objects and HTML pages, and long-form text. These are promising directions, not universal guarantees. ([github.com](https://github.com/Letterbook/FEP))

Example object sketch:

```json id="sxme2v"
{
  "@context": [
    "https://www.w3.org/ns/activitystreams",
    {
      "schema": "https://schema.org/",
      "prov": "http://www.w3.org/ns/prov#",
      "ai": "https://example.org/ns/agentic-media#"
    }
  ],
  "id": "https://news.example/ap/articles/2026-06-11-fediverse-automation",
  "type": "Article",
  "attributedTo": "https://news.example/ap/actors/research-wire",
  "name": "Fediverse automation policy: current risks and safe deployment",
  "summary": "Human-reviewed research memo on ActivityPub automation.",
  "content": "<p>This article was drafted with automated source clustering and human editorial review.</p>",
  "url": "https://news.example/articles/2026-06-11-fediverse-automation",
  "published": "2026-06-11T15:00:00Z",
  "updated": "2026-06-11T16:10:00Z",
  "tag": [
    { "type": "Hashtag", "name": "#ActivityPub" },
    { "type": "Hashtag", "name": "#Fediverse" },
    { "type": "Hashtag", "name": "#bot" }
  ],
  "attachment": [
    {
      "type": "Link",
      "name": "Method note",
      "href": "https://news.example/method",
      "mediaType": "text/html"
    },
    {
      "type": "Link",
      "name": "Correction policy",
      "href": "https://news.example/corrections",
      "mediaType": "text/html"
    }
  ],
  "generator": {
    "type": "Application",
    "name": "Example Research Pipeline",
    "url": "https://news.example/pipeline"
  },
  "ai:reviewStatus": "human-reviewed",
  "ai:modelDisclosure": "LLM used for clustering and drafting; claims verified by editor",
  "schema:license": "https://creativecommons.org/licenses/by/4.0/"
}
```

Important interoperability warning: Mastodon and many other clients may not display extension metadata. Essential disclosures must appear in the human-visible profile and post text, not only in JSON-LD.

---

## 12. Replies and corrections policy

### Replies

Agentic accounts should use a conservative reply policy:

| Reply type | Policy |
|---|---|
| Explicit command, e.g. “@bot alt text please” | Automated response acceptable if low-risk |
| Factual correction request | Acknowledge automatically; human reviews before substantive reply |
| Political argument, conflict, harassment, identity dispute | No autonomous reply |
| Request about private individuals | Human review required |
| Legal, medical, financial, emergency advice | Do not automate |
| Moderation dispute | Route to human operator or instance moderation process |

A good rule: **an agent may listen broadly, draft privately, and publish narrowly.**

### Corrections

Correction workflow:

1. Keep canonical article pages stable.
2. Add visible correction notes with timestamps.
3. Use ActivityPub `Update` where supported.
4. Publish a separate correction post when the original federated widely.
5. Link correction posts to the original with `inReplyTo` or a canonical URL.
6. Do not rely on `Delete` as the only remedy, because remote deletion cannot be guaranteed. ([w3.org](https://www.w3.org/TR/activitypub/))
7. Preserve an errata log unless removal is needed for safety or legal reasons.
8. Human-review every correction involving a person, organization, public emergency, legal allegation, election, conflict, or medical claim.

---

## 13. Worked examples

### Example A: acceptable weather bot

A municipal weather bot posts twice daily, plus severe alerts. It names the data source, marks itself automated, avoids unsolicited replies, posts severe alerts publicly, and posts routine forecasts unlisted or followers-only. It has an operator contact and correction note.

**Assessment:** legitimate. It is bounded, source-linked, predictable, and useful.

### Example B: risky AI alt-text bot

An image bot automatically replies to every public Pixelfed or Mastodon image without being invoked, guesses race/gender/age, and posts public descriptions.

**Assessment:** unsafe. Even if technically possible, it violates consent expectations, may infer sensitive traits, and creates unsolicited replies. A safer version replies only when mentioned, returns “suggested alt text,” avoids identity inference, and deletes source images immediately.

### Example C: WordPress or Ghost ActivityPub publication

A magazine uses WordPress ActivityPub or Ghost ActivityPub to federate articles. Each ActivityPub post includes a canonical link, author identity, excerpt, tags, and correction policy. AI may help draft summaries, but editors approve them.

**Assessment:** legitimate if frequency is controlled. This is closer to syndication than bot spam. WordPress ActivityPub and Ghost ActivityPub are explicitly designed for publication federation. ([wordpress.org](https://wordpress.org/plugins/activitypub/))

### Example D: Lemmy vote bot

A bot upvotes posts matching a political keyword across federated communities.

**Assessment:** block-worthy. It manipulates ranking and imposes federation load. Vote automation is especially risky in group/community systems where actions can fan out across many instances. ([github.com](https://github.com/LemmyNet/lemmy/issues/3062))

### Example E: Bridgy-style bridge account

A bridge moves posts between the Fediverse and another network. It documents opt-in/out, honors blocks, limits spam, and supports admin-level blocking.

**Assessment:** conditionally legitimate. Bridging is inherently sensitive because it changes audience boundaries. Bridgy Fed’s docs describe blocking, `#nobridge`, spam filters, public-only bridging, and admin/user controls, which are the right kinds of design concerns even though communities may still reject bridging. ([fed.brid.gy](https://fed.brid.gy/docs))

### Example F: autonomous breaking-news bot

An LLM monitors RSS, social posts, and police scanners, then posts breaking-news summaries every few minutes with no human review.

**Assessment:** technically possible but socially illegitimate. It is high-volume, high-stakes, hallucination-prone, and likely to create correction, defamation, and emergency misinformation risks.

---

## 14. Governance and political economy risks

The Fediverse often relies on small volunteer or semi-volunteer admin teams. Governance research emphasizes bus factor, financial stability, legal liability, moderation burnout, spam campaigns, insufficient appeals, cross-cultural moderation, and the immaturity of many governance processes. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

Automation policy must therefore ask: **who pays when the bot is wrong?**

| Risk | Description | Mitigation |
|---|---|---|
| Attention capture | Bots dominate local timelines, hashtags, or replies | Quiet defaults, rate limits, unlisted mode, digesting |
| Infrastructure cost | Media, fan-out, crawling, and remote delivery burden other servers | Quotas, backoff, media limits, admin approval |
| Moderation labor | Admins must investigate spam, AI slop, impersonation, abuse | Clear bot labels, abuse contacts, audit logs |
| Context collapse | Bridges and archives move posts into unintended publics | Opt-in bridging, `#nobridge`, block propagation |
| Hallucination | LLMs invent facts, sources, quotes, or claims | Human review, source-first publication |
| Copyright laundering | Summaries or reposts hide copied material | Canonical links, excerpt limits, licensing metadata |
| Defamation and safety | Automated claims about people cause harm | Human review and strict topic exclusions |
| Governance asymmetry | Large corporate actors can overwhelm small instances | Instance-level blocks, allowlists, negotiated federation |
| False moderation positives | Automated classifiers wrongly label users or servers | Human appeal, transparent criteria, no auto-punishment |
| Data colonialism / extraction | Researchers or companies treat public posts as free datasets | Instance policy review, consent, minimization, opt-outs |

Threads federation illustrates one version of scale asymmetry: a large corporate platform can join ActivityPub while maintaining distinct product incentives, opt-in settings, and separate feeds. ([theverge.com](https://www.theverge.com/news/688267/threads-fediverse-feed-search))

---

## 15. Instance policy recommendations

A strong instance bot policy should include:

1. Automated accounts must disclose automation in profile text.
2. Bot flag must be enabled where available.
3. Operator contact required.
4. Public automated posts above a frequency threshold must be unlisted or followers-only unless approved.
5. No unsolicited reply bots.
6. No automated posting of AI-generated news, allegations, emergency information, medical/legal/financial advice, or political persuasion without human review.
7. Bridges, relays, crawlers, and archive bots require admin approval.
8. Bots must honor blocks, rate limits, `Retry-After`, robots-style restrictions where applicable, `#nobot`, and `#nobridge`.
9. Bots may be limited or suspended for local timeline flooding even if posts are not malicious.
10. Instance reserves the right to block domains or software patterns that externalize costs or evade governance.

Unofficial snapshots of Mastodon server policies show considerable variation: some servers require bot flags, unlisted posting above frequency thresholds, explicit labeling for mostly automated accounts, or bans on solely AI-generated accounts. Because these are instance-specific and can change, bot operators should verify the current `/about` and rules pages before deploying. ([gist.github.com](https://gist.github.com/matthewdeanmartin/606465df63a30d8d542416aa7a08cd43))

---

## 16. Open research questions

1. **Bot metadata standardization:** Should ActivityPub or FEPs define a common `automated`, `humanReviewed`, `modelUsed`, or `operator` property?
2. **Consent semantics:** Can `#nobot` and `#nobridge` become machine-readable without creating a surveillance burden?
3. **Federated rate limits:** Could instances advertise bot quotas or crawl policies in NodeInfo or another discovery document?
4. **Correction propagation:** How can corrections be made more visible when remote deletion and update handling are inconsistent?
5. **Bridge governance:** What is the right balance between open federation and contextual consent across Bluesky, Threads, websites, and ActivityPub servers?
6. **Moderation automation:** Which moderation tasks can be automated without turning false positives into exclusion?
7. **AI disclosure:** Is model disclosure enough, or should there be mandatory human-review status for certain topics?
8. **Local timeline design:** Should software provide first-class controls for hiding bots, grouping bot posts, or excluding automation from public discovery?
9. **Economic sustainability:** How should high-volume bots contribute to the infrastructure costs they impose?
10. **Research ethics:** What norms should govern scraping, archiving, and dataset publication when instance policies conflict or are ambiguous?

---

## Annotated bibliography

**W3C ActivityPub Recommendation, 2018.** The protocol baseline: actors, inboxes, outboxes, client-to-server and server-to-server delivery. Crucial for distinguishing what is technically conformant from what is socially legitimate. ([w3.org](https://www.w3.org/TR/activitypub/))

**W3C ActivityStreams 2.0 Vocabulary.** Defines interoperable object and link properties such as `attributedTo`, `content`, `summary`, `tag`, `generator`, `published`, `updated`, `url`, and `mediaType`, which are useful for provenance and agentic publishing metadata. ([w3.org](https://www.w3.org/TR/activitystreams-vocabulary/))

**Mastodon API and user/admin documentation.** Important for bot flags, rate limits, profile behavior, and moderation actions such as limiting and suspending accounts. Mastodon is not the whole Fediverse, but its affordances heavily shape bot norms. ([docs.joinmastodon.org](https://docs.joinmastodon.org/api/rate-limits/))

**Pixelfed ActivityPub documentation.** Shows how image-centered federation differs from microblogging and why media provenance, alt text, and AI image spam require separate treatment. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

**PeerTube ActivityPub documentation.** Demonstrates video/channel federation, comments, likes/dislikes, flags, views, and media-heavy automation risks. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub))

**Lemmy federation documentation and scaling discussion.** Useful for understanding group actors, community forwarding, posts/comments/votes, and why forum automation can create large fan-out costs. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html))

**Misskey API and bot documentation.** Shows that bot development is an explicit affordance in Misskey-like software, while also recommending visible bot marking. ([misskey-hub.net](https://misskey-hub.net/en/docs/for-developers/api//))

**WordPress ActivityPub and Ghost ActivityPub documentation/news.** Important for distinguishing original publication syndication from spammy cross-posting. ([wordpress.org](https://wordpress.org/plugins/activitypub/))

**Bridgy Fed documentation.** A concrete case of bridge governance, including opt-out mechanisms, blocking, report bridging, spam controls, and context-boundary problems. ([fed.brid.gy](https://fed.brid.gy/docs))

**Kissane and Kazemi, Fediverse governance report, 2024.** Essential for understanding moderation burnout, financial fragility, legal exposure, bus factor, and why federation is not automatically liberatory. ([fediverse-governance.github.io](https://fediverse-governance.github.io/))

**Spencer-Smith and Tomaz, 2025, moderation challenges.** Interview-based work on moderation after migration waves, emphasizing differences by size, focus, geography, and Global North/South dynamics. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges))

**Lisker and Mihaljević, 2025, data ethics in the Fediverse.** Important for scraping, research datasets, and the gap between API access and community permission. ([workshop-proceedings.icwsm.org](https://workshop-proceedings.icwsm.org/pdf/2025_43.pdf))

**botsin.space retirement post, 2024.** A concrete infrastructure case study: a beloved bot-friendly instance still became difficult to sustain under storage, bandwidth, database, moderation, and AI-scraping pressures. ([muffinlabs.com](https://muffinlabs.com/posts/2024/10/29/10-29-rip-botsin-space/))

**Threads federation reporting, 2025.** Useful for understanding corporate-scale federation, opt-in settings, separate fediverse feeds, and the risks of platform asymmetry. ([theverge.com](https://www.theverge.com/news/688267/threads-fediverse-feed-search))
