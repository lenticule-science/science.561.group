---
title: "Study of Syndication and Propagation Protocol Engineering for the Claim Infrastructure"
description: "This study verifies the syndication and propagation substrate available to the claim infrastructure's correction-propagation bet — WebSub (W3C Recommendation, 23 January 2018) for push, ActivityStreams 2.0 (W3C Recommendation, 23 May 2017) and ActivityPub (W3C Recommendation, 23 January 2018) for typed Update/Delete/Undo activities against a documented (and since-fixed) fediverse delivery-ordering bug, Atom (RFC 4287, 2005) with Feed Paging and Archiving (RFC 5005, 2007) for the replayable-archive pattern, the SEMIC Linked Data Event Streams specification (honestly reported as a government-consortium spec, not a W3C or IETF standard, with Flanders contributing open-source client/server implementations rather than the specification itself) for an append-only event-log alternative, and RFC 7089 Memento (2013) for time-negotiated access to prior resource states, cross-checked against the link-rot and reference-rot literature (Klein et al. 2014 PLOS ONE; Zittrain, Albert & Lessig 2014; Jones, Klein & Van de Sompel's robust-links program) and practitioner-tier CDN purge engineering, and it carries forward as its central finding that no existing system combines push delivery, typed correction semantics, replayable archives, and version-negotiated access into one substrate for news corrections — that unassembled combination is the program's opening for bet two."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["websub", "activitypub", "activitystreams", "linked-data-event-streams", "atom", "feed-archiving", "memento", "link-rot", "reference-rot", "correction-propagation", "syndication"]
tags: ["draft", "study"]
---


This study is read for one purpose: to establish, for this engineering sub-literature, which claims trace to peer-reviewed research, IETF/W3C specifications, or documented production systems versus blog folklore and vendor marketing, so the claim-infrastructure implementation builds on the right kind of source.
Method: every load-bearing claim below carries a markdown-linked source — a DOI, an RFC number, a W3C TR page, or a stable URL to a specification or a documented production issue — obtained by web search and, where practical, fetched directly.
Anything not verifiable to a primary source is marked **[UNVERIFIED]** inline.
The scope is the substrate this section's README assigns to "syndication and propagation protocols": WebSub, ActivityPub, Linked Data Event Streams, feed archiving, and Memento, read specifically against the research program's second bet — correction propagation.

## 1. WebSub: push delivery for feed updates

WebSub reached W3C Recommendation status on 23 January 2018, under the Social Web Working Group, published at [w3.org/TR/2018/REC-websub-20180123](https://www.w3.org/TR/2018/REC-websub-20180123/) and announced at [W3C News](https://www.w3.org/news/2018/websub-is-now-a-w3c-recommendation/).
WebSub descends from PubSubHubbub, a protocol created by Brett Slatkin and Brad Fitzpatrick and adopted early inside Google (FeedBurner, Google Reader Shared Items, Blogger) from roughly 2009–2010; it was renamed WebSub in October 2017 as part of the standardization track, per [Ably's protocol overview](https://ably.com/topic/websub) and the [WebSub Wikipedia entry](https://en.wikipedia.org/wiki/WebSub), which give the rename date consistently with the W3C news item.
The protocol's mechanism is a hub-and-spoke web-hook model: a publisher notifies a hub of new content, and the hub fans the notification out to subscribers that registered a callback URL — the mechanism is push, not poll, and it carries no payload semantics of its own beyond "this feed changed."
That is exactly its limit as correction infrastructure: WebSub can tell a subscriber that a claim's page changed, but the notification carries no typed statement of *what* changed — no distinction between a new claim and a correction to an existing one.

## 2. ActivityStreams 2.0 and ActivityPub: typed activities, verified dates, and a documented delivery problem

ActivityStreams 2.0 reached W3C Recommendation status on 23 May 2017, edited by James Snell and Evan Prodromou, per the [W3C News announcement](https://www.w3.org/news/2017/activitystreams-2-0-is-now-a-w3c-recommendation/); the current TR is at [w3.org/TR/activitystreams-core](https://www.w3.org/TR/activitystreams-core/).
ActivityPub reached W3C Recommendation status on 23 January 2018 — the same day as WebSub — per the [W3C News announcement](https://www.w3.org/news/2018/activitypub-is-now-a-w3c-recommendation/); the specification text is at [w3.org/TR/activitypub](https://www.w3.org/TR/activitypub/).
The specification defines `Update`, `Delete`, and `Undo` as first-class activity types with side-effect semantics: an `Undo` activity "undoes" a prior `Follow`, `Like`, or `Block` and is required to share the same actor as the activity it undoes, with side effects (such as decrementing a counter incremented by the undone activity) reversed to the extent possible; `Create`-based objects use `Delete` rather than `Undo` as their inverse.
This typed-inverse pattern is a working precedent for correction propagation: it is the closest existing standard to a graph event that says "this specific prior statement is retracted" rather than merely "the page changed."

The precedent is qualified by a documented, current implementation problem rather than a merely theoretical one.
The W3C specification repository itself carries an open issue asking the working group to clarify how `Delete` should unwind side effects — [w3c/activitypub#472, "Clarify 'Delete' activity re unwinding side effects"](https://github.com/w3c/activitypub/issues/472) — meaning the inverse-activity semantics this study cites as precedent are not fully closed even in the reference specification.
At the deployment layer, the Fedify ActivityPub framework's issue tracker documents a concrete failure mode that was live in production: activities relating to the same object could be delivered out of order across federated servers, so that a `Delete` for a post could arrive before the `Create` it targets, producing a "zombie post" that persists after its author deleted it — [fedify-dev/fedify#536, "Activities can be delivered out of order, causing federation issues"](https://github.com/fedify-dev/fedify/issues/536), opened 25 January 2026 and closed as completed 27 January 2026 after an `orderingKey` mechanism landed to guarantee per-object delivery order.
The failure mode is therefore verified as documented and fixed, not as an open problem: it stands as evidence that the delivery-ordering hazard is real enough to have surfaced and required a dedicated ordering mechanism, not as a currently unresolved gap in ActivityPub deployments generally — a distinction this study did not draw carefully enough in an earlier pass.
This is a documented production-system report, not a peer-reviewed measurement study, and is cited at that tier.
A 2019 measurement paper, Raman et al., ["Challenges in the Decentralised Web: The Mastodon Case"](https://arxiv.org/pdf/1909.05801) (ACM IMC 2019), establishes that federation-scale consistency problems in the Mastodon/ActivityPub ecosystem predate the 2022–2023 growth wave rather than originating with it; a specific peer-reviewed measurement of delivery/consistency behavior in the post-2023 fediverse growth period was not located in this pass and is marked **[UNVERIFIED]**.

## 3. Linked Data Event Streams: an append-only log, honestly not a W3C or IETF standard

Linked Data Event Streams (LDES) is a specification maintained by SEMIC (the European Commission's Semantic Interoperability Community, under the Interoperable Europe programme), at [github.com/SEMICeu/LinkedDataEventStreams](https://github.com/SEMICeu/LinkedDataEventStreams), with the rendered specification at [semiceu.github.io/LinkedDataEventStreams](https://semiceu.github.io/LinkedDataEventStreams/) and program description at the [Interoperable Europe Portal](https://interoperable-europe.ec.europa.eu/collection/semic-support-centre/linked-data-event-streams-ldes).
The specification itself is SEMIC's, not Flanders's: Flanders's contribution is the separate open-source OpenLDES tooling ecosystem — an LDES Client and an LDES Server built under Digital Flanders's VSDS (Vlaamse Smart Data Space) project — that implements the SEMIC spec rather than authoring it; the two should not be conflated when citing this as precedent.
Its actual standards status, reported honestly rather than inflated: it is a government-consortium technical specification with a released 1.0.0 version and an open-source reference implementation (OpenLDES), not a W3C Recommendation, not a W3C Note, and not an IETF RFC — it has not gone through either standards body's process.
Its content model is directly relevant regardless of formal status: an LDES stream is an append-only collection of immutable members, each representing a linked-data version, which is structurally the event-log pattern bet one's claim-state lifecycle would need to be replayed from — but the specification's authority rests on SEMIC/EU government adoption, not on W3C or IETF ratification, and that distinction should not be blurred in citing it as precedent.

## 4. Atom and Feed Paging and Archiving: the replayable-archive pattern

Atom is specified in RFC 4287, "The Atom Syndication Format," edited by M. Nottingham and R. Sayre, published December 2005 as an IETF Proposed Standard — [rfc-editor.org/rfc/rfc4287](https://www.rfc-editor.org/rfc/rfc4287.html).
RFC 5005, "Feed Paging and Archiving," by M. Nottingham, published September 2007 as an IETF Standards Track document, extends Atom with three feed types: paged (piecemeal access without stability guarantees), archived (a set of documents that can be combined to *reconstruct* a logical feed's entries without loss), and complete — [datatracker.ietf.org/doc/html/rfc5005](https://datatracker.ietf.org/doc/html/rfc5005).
The archived-feed type is the load-bearing pattern for this program: it is a specified, IETF-track method for guaranteeing that a consumer who was offline can replay every entry — including, in principle, every correction event — without gaps, which is precisely the guarantee WebSub's live push does not provide on its own.

## 5. Memento (RFC 7089): time-negotiated access to prior resource states

RFC 7089, "HTTP Framework for Time-Based Access to Resource States — Memento," by H. Van de Sompel, M. Nelson, and R. Sanderson, was published December 2013 as an IETF Informational document (not Standards Track) — [rfc-editor.org/rfc/rfc7089](https://www.rfc-editor.org/rfc/rfc7089.html).
Memento defines datetime negotiation (an extension of HTTP content negotiation keyed on a preferred datetime rather than a preferred representation) and TimeMaps (lists enumerating URIs of prior states, called Mementos, of a given resource).
For correction propagation, Memento supplies the piece none of the syndication protocols above provide on their own: a standard way to ask "what did this claim's state look like at time T," independent of whether the current live representation still shows that state — which is exactly what a consumer auditing a correction history needs.

## 6. Link rot, reference rot, and why non-delivery is the design target

Klein, Van de Sompel, et al., "Scholarly Context Not Found: One in Five Articles Suffers from Reference Rot," *PLOS ONE* 9(12):e115253, published 26 December 2014 — [DOI 10.1371/journal.pone.0115253](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0115253) — examined over a million web references extracted from over 3.5 million articles (1997–2012) and found one in five articles affected by reference rot (the union of link rot, where the URI resolves to nothing, and content drift, where it resolves to something other than what was cited).
Zittrain, Albert, and Lessig, "Perma: Scoping and Addressing the Problem of Link and Reference Rot in Legal Citations," *Harvard Law Review Forum* vol. 127 (2014) — [harvardlawreview.org/forum/vol-127](https://harvardlawreview.org/forum/vol-127/perma-scoping-and-addressing-the-problem-of-link-and-reference-rot-in-legal-citations/) — found more than 70% of URLs cited in sampled law-journal articles no longer produced the originally cited content, and roughly 50% of URLs cited in U.S. Supreme Court opinions suffered the same fate; this is the citation the study instructions named, and it verifies at the tier and figures reported.
Jones, Van de Sompel, Shankar, Klein, Tobin, and Grover, "Scholarly Context Adrift: Three out of Four URI References Lead to Changed Content," *PLOS ONE* 11(12):e0167475 (2016) — [DOI 10.1371/journal.pone.0167475](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0167475) — found that as much as 75% of referenced content had changed to some degree within three years, and Jones, Klein, and Van de Sompel followed with "Robustifying Links To Combat Reference Rot," *Code4Lib Journal* Issue 50 (10 February 2021) — [journal.code4lib.org/articles/15509](https://journal.code4lib.org/articles/15509) — which formalizes the Robust Links approach: proactively taking a Memento-compatible archival snapshot at citation time and decorating the link with both the live URI and the archived-snapshot URI, so the reference survives even if the live target rots.
Read together with the program note's citation of Wood & Porter against Nyhan & Reifler on the (non-replicating) backfire effect, this literature converges on the same design instruction the program note already draws: corrections fail by *not arriving* — silently rotting, drifting, or never propagating to downstream copies — not by backfiring on contact, so correction-propagation infrastructure should be built and evaluated against the non-delivery failure mode.

## 7. Cache purge and invalidation at CDN scale — practitioner tier

CDN cache-invalidation engineering is documented at the practitioner tier, not the peer-reviewed tier, and is marked as such here.
Fastly's purge model documents instant purging (immediate removal so content refreshes from origin on next request), surrogate-key purging (tagging responses with a `Surrogate-Key` header so a single purge call invalidates every object sharing a tag, up to 256 keys per bulk call), and "soft" purge (marking an object stale rather than removing it, to avoid a thundering-herd of origin requests) — [Fastly Purging API reference](https://www.fastly.com/documentation/reference/api/purging/) and [Purging with surrogate keys](https://www.fastly.com/documentation/guides/full-site-delivery/purging/purging-with-surrogate-keys/).
This is directly relevant engineering precedent for correction propagation at the CDN edge — a corrected claim's cached representation must be invalidated network-wide before a consumer can be said to have received the correction — but it is vendor documentation of a production system, not an independently reviewed source, and should be weighted accordingly against the RFC- and W3C-tier sources above.

## 8. Mapping to the program's three bets

See the program synthesis at [The Web News Media Research Program](../../../../../../../../../../content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-web-news-media-research-program.md).

**Bet 2, correction propagation, is this study's direct target.**
The program note names four requirements — push, addressed activities, replayable archives, and version access — and this study locates a verified, standards-track or documented-production candidate for each: WebSub supplies push notification of change (§1); ActivityPub's `Update`/`Delete`/`Undo` triad supplies a typed-activity precedent for addressing *what* changed, qualified by a documented (and since-fixed) ordering failure at deployment (§2); RFC 5005 archived feeds and, at a lower standards tier, LDES append-only streams supply the replayable-archive pattern so no correction is lost to a missed push (§3–4); RFC 7089 Memento supplies version-negotiated access to a claim's prior state (§5).

**Bet 1, claim-state and correction semantics, is touched but not solved by this literature.**
LDES's immutable-member model and Memento's TimeMap model both presuppose that *something* already has a well-defined prior state to version — neither protocol defines what a claim-state lifecycle transition (asserted → corroborated → contested → corrected → retracted) actually is. That definitional work remains bet 1's, not this study's.

**Bet 3, per-claim conformance, is not addressed by any protocol surveyed here.**
WebSub, ActivityPub, Atom/RFC 5005, and LDES all operate at the feed, page, or activity level; none carries a conformance or certification predicate scoped to an individual claim inside a document. This confirms, from the engineering side, the same gap the program note reports from the standards-mapping side.

**The unassembled combination is the opening.**
No system located in this pass combines all four pieces — push delivery, typed correction semantics, a replayable gap-free archive, and version-negotiated historical access — into a single substrate purpose-built for news corrections. WebSub pushes but is semantically mute; ActivityPub is semantically typed but has documented delivery-ordering hazards at the deployment layer and no archival replay guarantee; RFC 5005 and LDES replay but are pull-based, not push; Memento retrieves a prior state but does not itself propagate the fact that a new one exists. Assembling those four into one correction-propagation substrate — rather than inventing a fifth protocol — is the concrete engineering shape of the program's second bet.

## Gaps carried forward

- No peer-reviewed measurement of ActivityPub/fediverse delivery or consistency behavior specific to the post-2023 growth period was located; the 2019 Raman et al. IMC study and the January 2026 Fedify issue tracker report (opened and closed within the same week, as a fixed bug rather than an open finding) are the nearest verified sources, at different tiers, and the gap between them is marked **[UNVERIFIED]**.
- LDES's status as a non-W3C, non-IETF specification means any component built on it inherits a lighter-weight standards guarantee than the RFC- or W3C Recommendation-tier protocols in this study; this should be weighed explicitly if LDES is chosen over RFC 5005 for the archive layer.
- The W3C's own ActivityPub issue tracker shows `Delete` side-effect semantics as not fully resolved even in the reference specification (§2); a correction-propagation design that leans on `Delete`/`Undo` as its typed-event vocabulary inherits that open question rather than a closed one.
- This study did not evaluate nanopublications, RDF-star, or any bet-1 claim-state vocabulary candidate — that literature is scoped to a separate study per the section README's division of labor.
- CDN purge engineering (§7) is cited at practitioner tier only; no peer-reviewed measurement of purge propagation latency or failure rate at multi-CDN scale was sought in this pass.

## Verification note

Verified 2026-08-22.
17 load-bearing citations checked directly against primary sources: W3C TR pages and W3C News for WebSub, ActivityStreams 2.0, and ActivityPub; the RFC Editor and IETF Datatracker for RFC 4287, RFC 5005, and RFC 7089; the GitHub API for w3c/activitypub#472 and fedify-dev/fedify#536; arXiv for Raman et al. 2019; the SEMICeu GitHub repository, the rendered LDES specification, and the Interoperable Europe Portal for LDES; PLOS ONE for Klein et al. 2014 and Jones et al. 2016; the Code4Lib Journal for Jones, Klein & Van de Sompel 2021; and web search corroborating the Zittrain, Albert & Lessig 2014 Harvard Law Review Forum figures and the PubSubHubbub-to-WebSub rename and authorship.
4 corrected.
(1) The Fedify issue #536 delivery-ordering bug was reported as a live, "currently tracked" or "current" problem in this note and in the ActivityPub glossary term.
The primary source shows it was opened 25 January 2026 and closed as completed two days later, once an `orderingKey` mechanism landed to fix it, so both files now describe it as a documented-and-fixed bug rather than an open one, and the Gaps section's stray "2024–2025" date for the issue tracker is corrected to January 2026.
(2) LDES was described as a "Flanders/SEMIC" specification "under its Flanders-linked open-source program," which conflates SEMIC's authorship of the specification with Digital Flanders's separate VSDS project, which builds the open-source OpenLDES tooling (an LDES Client and Server) that implements, but did not author, the spec.
Corrected in the note's frontmatter, §3, and the LDES glossary term.
(3) Klein et al. 2014 was reported as examining "roughly 400,000 articles," when the paper's own abstract states the references were extracted from "over 3.5 million articles."
Corrected in §6 and the link-rot glossary term.
(4) The Jones et al. 2016 "Scholarly Context Adrift" citation lacked the markdown-linked primary source the study's stated method requires for every load-bearing claim.
A DOI link (10.1371/journal.pone.0167475) was added in §6 and the link-rot glossary term.
1 claim remains marked **[UNVERIFIED]**: no peer-reviewed measurement of ActivityPub/fediverse delivery or consistency behavior specific to the post-2023 growth period was located in this pass either, so that marker stands as originally drafted, now read against a Fedify report whose own currency has been corrected above.
