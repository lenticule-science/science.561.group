# Competitive Intelligence Services Section

This section holds the discipline of researching real businesses, their
products, and the public personas of the people who run them — from
public sources only — and producing dated, provenance-declared,
URL-cited profile documents about them. It is a peer of
[`business-research-services-section`](../business-research-services-section)
and [`strategy-services-section`](../strategy-services-section) under
`business-services-section`, not a subsection of either.

## What this section is for

A competitive-intelligence document in this section is a **profile of
something that actually exists in the world right now**: a company, an
app, a founder, a content channel, a pricing page, a support forum. The
method is open-source research (Kahaner & Hibbert's phrase for the
discipline, see the
[`competitive-intelligence`](./content/text/glossary/terms/competitive-intelligence.md)
term) applied to a specific subject and written up so that a reader —
human or agent — can act on it: what does this product do, what does it
cost, what do its users complain about, who runs it, and how credible is
each claim in the writeup. Every document is dated, states its method,
carries real URLs for its load-bearing claims, and marks what it could
not verify as unverified rather than smoothing it into fact.

## Where the pattern comes from

The document shape this section uses — headline findings, per-subject
profiles built from app-store listings and review-aggregator and forum
links, a feature/claim table, evidenced weaknesses, and a closing
synthesis — did not originate here. It is the **market-teardown**
pattern established by Lenticule Science's game-sciences program (Ilinx
Research) for its own board- and video-game competitive research, most
fully worked out in the
[Weiqi Market Teardown](../../../../../agent-services-section/services/play-services-section/services/game-science-services-section/services/board-games-services-section/services/weiqi-services-section/content/text/documents/articles/notes/weiqi-market-teardown.md),
which built per-app profiles (play/bots/tsumego/lessons/review/
monetization dimensions, documented complaints with cited forum-thread
URLs, direct App Store/Google Play/review-aggregator links) into a
feature-parity checklist and a net-positioning synthesis for a
browser-first weiqi platform. This section generalizes that pattern from
games to businesses generally, and adds the one dimension a game
teardown does not usually need: the public persona of the person running
the thing being profiled (see
[`founder-public-persona`](./content/text/glossary/terms/founder-public-persona.md)).
The [`market-teardown`](./content/text/glossary/terms/market-teardown.md)
term names the pattern itself and traces this lineage in full.

## Why this is not `business-research-services-section`

`business-research-services-section` exists and is fully occupied by a
different, deliberately narrow charter: it is the research-production
back office for one specific "modern business curriculum" product line,
manufacturing citation-grounded evidence packets for named curriculum
lessons that must be piped downstream into NotebookLM explainer content
and a public YouTube release. Its `validateResearchDraft` schema hard-
requires every citation to be a `primary-*`-kind, `https://`-sourced,
peer-reviewed-style source with a named author and publication year, and
its `privacy.classification` is hardcoded to `"public-synthesis"` with
`personalData: "none-intentionally-included"` in every manifest it has
ever admitted — the section's entire design assumes there is no
identifiable person in the research it produces.

Competitive intelligence about a real business and its founder cannot
run through that schema without breaking it. Its evidence is App Store
listings, Featurebase roadmap boards, TikTok captions, Patreon "about"
pages, podcast guest appearances, and privacy-policy self-disclosures —
none of which are `primary-*` sources in the academic-citation sense
`business-research`'s validator requires — and its subject is, by
design, an identifiable real person, which `business-research`'s
schema explicitly does not contemplate carrying. Forcing this work
through `business-research`'s validator would mean either weakening the
evidentiary bar that section's curriculum pipeline depends on, or
building a second, parallel schema inside the same directory — at which
point it is this section, wearing another section's name. So this
section exists to do, structurally and evidentially, what
`business-research-services-section` was never built to do: profile a
live company and the public identity of the person behind it, sourced
from the open web, with its own privacy posture from the start rather
than one retrofitted onto a "no personal data" assumption.

## What belongs here

- App/product teardowns: what a product does, its pricing and store
  presence, ratings and reviews, documented user complaints with cited
  URLs, and positioning against named competitors.
- Business/channel profiles: entity and legal-page facts, channel
  footprint and follower counts (labeled with their confidence and
  source), business-model and monetization-funnel analysis.
- Founder and operator public-persona research: verified real-world
  identity, a primary-source-grounded public bio timeline, and analysis
  of how the person's public persona functions as a business asset
  (trust mechanism, distribution channel, differentiator, single-point-
  of-failure risk).
- Method notes describing and refining how this research is done.

What does not belong here: private personal information about anyone,
research that is not grounded in public sources, or documents that
assert a claim without the URL that supports it. See the posture below.

## Privacy and consent posture

This section researches real, named, identifiable people — founders,
operators, executives — as part of profiling the businesses they run.
That is a real obligation, not a formality, and it governs every
document this section produces:

- **Public sources only.** Every fact comes from something the subject
  or a third party made publicly accessible — their own app-store
  listing, their own social bio, their own podcast appearance, their
  own privacy policy, independent press or forum coverage. Nothing in
  this section is sourced from a private database, a breach, a
  paywalled people-search service, or any non-public record.
- **Professional/public persona only.** Research here is scoped to a
  person's public-facing role as a founder or operator of the business
  being profiled: their stated background, their public bio, how they
  present the business, how they build trust with an audience. It does
  not extend to their private life beyond what is needed to understand
  the business.
- **No private personal information, even when discoverable.** Home
  addresses, family details, personal relationships, and non-public
  contact information are out of scope for this section's documents
  even where a research pass happens to surface them. When a research
  pass turns up something like a residential address on a privacy-
  policy page or a birthplace in a scraped bio snippet, the house
  practice — demonstrated in this section's founding applications — is
  to name the omission in a Gaps section rather than publish the
  detail: "excluded because it may be a home address and is out of
  scope," "deliberately minimized... not business-relevant." That
  practice is binding here, not merely precedent.
- **Uncertainty carried as flags, never laundered.** Where identity,
  a claimed credential, a follower count, or a biographical detail
  could not be verified against a primary source, the document says so
  explicitly — confidence levels, "unverified," "search-index only,
  direct fetch failed" — rather than presenting a secondhand or
  aggregated claim as settled fact. A document that cannot verify a
  detail says it cannot verify it.
- **Corrections honored on request.** If a subject of a profile in this
  section, or someone authorized to speak for them, identifies an error
  or asks for something removed, that request is honored: the document
  is corrected or the disputed material is removed, and the correction
  is dated. Nothing in this section's charter treats a published profile
  as immutable in the way `business-research-services-section`'s
  content-addressed admissions are.
- **Real named people are written about with the care owed to a
  colleague who may someday read the file.** The subject of a profile
  in this section is a working person, not a case study to be picked
  apart. The standard this section holds itself to is: write nothing
  about a real person here that would be unfair, unkind, or
  unwelcome to read if they found it themselves — even where the
  business analysis calls for pointed, critical, or skeptical framing
  of the business itself.

## Sources

- [Weiqi Market Teardown](../../../../../agent-services-section/services/play-services-section/services/game-science-services-section/services/board-games-services-section/services/weiqi-services-section/content/text/documents/articles/notes/weiqi-market-teardown.md) — the pattern this section's document shape is modeled on.
