---
title: "Note on the Feral Foraging Business and the Gather App"
description: "A public-sources teardown of Feral Foraging, LLC and its app Gather finds a creator-economy content-to-app funnel where the founder's ~510K-YouTube-subscriber audience is the moat and the app's deliberate no-AI-photo-ID, human-curated positioning ('Powered only by Human Intelligence,' a 'Not planned' verdict on photo-ID feature requests) is the product differentiator against iNaturalist/Seek/PictureThis, while the Google Play install count (10K+, an internal 12,282) against that ~510K subscriber base and a 151-paid-patron Patreon base implies a funnel that converts only a low single-digit percentage of top-of-funnel reach into paying app users."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-feral-foraging-business-and-the-gather-app
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["feral-foraging", "gather-app", "foraging", "creator-economy", "competitive-intelligence", "content-to-app-funnel", "plant-identification", "app-store-teardown", "no-ai-positioning", "falling-fruit"]
tags: ["draft", "notes", "teardown"]
---

# Note on the Feral Foraging Business and the Gather App

This is an applied competitive-intelligence teardown of Feral Foraging,
LLC and its flagship product, the mobile app **Gather: The Foraging
App**, built entirely from two prior research passes over public
sources (App Store/Google Play listings and reviews, the app's privacy
policy, its Featurebase roadmap/help center, and its social channels).
Method: read the store listings, page-data JSON, and social-channel
pages directly where fetchable, cross-checked figures across at least
two fetches where they diverged, and flagged every figure that came
from a single indirect source (a search-engine knowledge panel, an
internal Play Store data field, a self-disclosure on a privacy-policy
page) rather than a direct, checkable primary read. **Verification
honesty statement**: the company's own marketing site,
feralforaging.com, was unreachable throughout both research passes —
every page fetched (home, /about/, /blog/, /calendar/) returned a live
HTTP 500 with a visible WordPress PHP stack trace (`substr()` TypeError
in the WP Rocket Cloudflare plugin, `Cloudflare.php:496`), confirmed by
raw curl rather than a fetch-tool artifact. That means every claim
below that would normally be sourced to the company's own "About" page
or on-site shop/course listings is instead sourced to app-store
listings, the app's own privacy policy, third-party social pages, or
search-engine-indexed snippets of the unreachable site — and is marked
accordingly. Nothing below is asserted from a source this teardown
could not point to.

## 1. What Feral Foraging is and how it makes money

Feral Foraging is a foraging-education creator brand — YouTube videos,
TikTok/Instagram short-form plant-ID content, a Patreon page, and a
biweekly email newsletter ("The Forager's Digest") — that has been
building toward a single monetized product: **Gather**, a subscription
mobile app. The company's own Patreon page states this explicitly:
Jesse (the founder) "encourages supporters to subscribe to the Gather
app as the primary way to support the work," i.e. Patreon is being
de-emphasized in favor of app-subscription revenue by the founder's own
stated framing.
([Patreon about](https://www.patreon.com/FeralForaging/about))

The product lineage is legible from the company's own Patreon
description: **Patreon content → an "Interactive Forager's Calendar"
and a "Foraging Knowledgebase" (free website tools) → Gather (the
native app, now the flagship product)**. The two web tools are
described as having fed into or evolved into the app's underlying data
model.
([Patreon about](https://www.patreon.com/FeralForaging/about))

Revenue lines identified in public sources:

| Product | Price | Verification |
|---|---|---|
| Gather app subscription | Monthly $6.99–$7.99 (two figures observed across fetches of the same listing); Annual $49.99–$59.99 (two figures observed); 14-day free trial | Confirmed live on both stores; exact canonical figure not resolved — see §2 |
| Patreon membership | Entry tier from $5/month; "Wild" tier at $8/month (down from a prior $10/month) | Confirmed on Patreon page |
| Patreon shop | Nav link exists | **Unverified** — specific SKUs/prices not retrievable |
| Affiliate/referral program | A Gather deep link carries `pid=affiliate_program`, `c=FERAL`, `shortlink=FERAL` — AppsFlyer-style tracking | Link structure confirmed; no public signup page or commission terms found |
| Ebooks / paid courses / merch on feralforaging.com | Not confirmed | Site unreachable throughout research; only Patreon-hosted downloadable guides could be confirmed |

No investor funding, acquisition, or revenue disclosure of any kind
was found in public sources for either the content brand or the app.
([App Store](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362), [Google Play](https://play.google.com/store/apps/details?id=com.feralforaging.gather))

**Business entity (self-disclosed, registry-unverified):** the Gather
app's own privacy policy discloses the controlling entity for GDPR/CCPA
purposes as **Feral Foraging, LLC**, an Alabama, United States entity
based in Huntsville (the full mailing address is on the privacy policy
itself; per this section's privacy posture the street address is not
reproduced here), with support contact `support@gatherapp.co`
(a second source also surfaced `hello@gatherapp.co`). The Apple App
Store listing independently confirms the developer of record as "Feral
Foraging, LLC," which corroborates the entity name. Neither pass
performed a direct lookup against Alabama's Secretary of State business
registry, so the LLC's formal registration status should be read as
**plausible but not registry-verified** — it is a company disclosing
its own record on its own privacy policy, nothing more, nothing less.
([gatherapp.co/privacy](https://gatherapp.co/privacy), [App Store listing](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362))

## 2. Gather: feature set and the no-AI-ID positioning

Gather is a location- and season-tailored digital field guide for wild
edible and medicinal plants and mushrooms, covering the contiguous
United States and Canada. Its central design choice, stated repeatedly
in the app's own materials, is that it is **not** an AI or
photo-recognition plant-ID tool: it generates a species list
dynamically from the user's location and the current month rather than
presenting one static database, and it explicitly declines to identify
what a user is looking at for them.
([App Store](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362), [Google Play](https://play.google.com/store/apps/details?id=com.feralforaging.gather))

Confirmed feature list, with dates where known:

- **Species profiles** — description, taxonomy, cautions,
  gathering/processing technique, habitat, and historical/medicinal use
  (the medicinal-use section is a completed roadmap item).
- **Lookalikes comparison guide** — a purpose-built side-by-side photo
  comparison for every dangerous-lookalike pair (wild carrot vs. poison
  hemlock, elderberry vs. water hemlock, chanterelle vs.
  jack-o'-lantern) — the app's signature safety feature and the one
  most singled out by reviewers ("Finally! Thorough, helpful +
  lookalikes!").
- **Interactive range maps** per species — added during 2025 per
  aggregated update history.
- **Seasonality / peak-harvest push notifications**, location-tailored.
- **Personal foraging journal** — free for all users including
  non-subscribers; auto-detects date/location from photos; map view;
  sortable/filterable. Major free-tier journal launch dated
  **December 2, 2025**.
- **Universal species catalog** — view all species regardless of
  current location (completed roadmap item).
- **"Travel Mode"** — a documented help-center topic implying the app
  can regenerate a location-specific list for a location other than
  home.
- **Native/invasive species filtering.**
- **Offline access** — high-resolution images cached for offline field
  use per the Play Store listing.
- **Fuzzy search** and **quick location-switching from the home
  screen** — added in **v1.6.0** (the app's current version as of this
  research, last updated August 11, year not disclosed in the listing
  snippet but presumably 2026 given proximity to the research date).
- **No image-recognition/AI plant ID** — a deliberate omission, stated
  in the developer's own FAQ: "at this time, we do not" offer species
  image recognition.
- A user's **feature request for plant-ID-via-photo-upload was marked
  "Not planned"** by the developer on the app's public Featurebase
  roadmap — the clearest single artifact of the no-AI-ID stance being
  an active product decision rather than a mere absence.
- **No in-app social/community layer** — community lives outside the
  app, via a Discord server ("Gather: Foraging App Community") and a
  Facebook group.
- **Falling Fruit integration is a planned, unshipped roadmap item**
  ("Incorporating falling fruit into the app," 13 votes as of research)
  — Falling Fruit (a separate 501(c)3 nonprofit's crowdsourced global
  map of 1.4M+ foraging locations) is treated by the roadmap framing as
  a **data source to absorb**, not a rival to beat.

([App Store](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362), [Google Play](https://play.google.com/store/apps/details?id=com.feralforaging.gather), [gatherapp.co](https://gatherapp.co/), [Featurebase roadmap](https://gather.featurebase.app), [Featurebase: does this app identify plants?](https://gather.featurebase.app/articles/6245744-does-this-app-identify-plants-and-mushrooms-for-me), [Featurebase: plant-ID request](https://gather.featurebase.app/p/plant-id), [fallingfruit.org](https://fallingfruit.org/))

The marketing tagline the founder uses directly in promotional content
is **"Powered only by Human Intelligence"** — explicit anti-AI-content
positioning, used as a differentiation hook in TikTok promo material.
Combined with the "Not planned" verdict on photo-ID and the FAQ's own
framing ("No app, no matter how accurate, can identify wild species
*for* you... Never consume anything without being 100% confident of
its identity!"), this is a coherent, deliberately maintained
positioning choice rather than an accidental feature gap: Gather is
built and marketed for foragers who already roughly know what they are
looking at or want to learn what grows nearby, explicitly not as an
answer to "what species is this?"
([TikTok](https://www.tiktok.com/@feralforaging/video/7610858702953843981), [Featurebase](https://gather.featurebase.app/articles/6245744-does-this-app-identify-plants-and-mushrooms-for-me))

## 3. Pricing and the no-lifetime-tier stance

- Free download; the foraging journal and (per store-review context)
  poisonous-species pages are free regardless of subscription.
- The full regional species catalog and lookalikes guide require a
  paid subscription, with a 14-day free trial.
- Subscription pricing is inconsistent across fetches of the same
  listings: Monthly observed at both $6.99 and $7.99; Annual observed
  at both $49.99 and $59.99; Google Play's own in-app-purchase
  price-range field shows "$6.49 – $59.99 per item." This is most
  likely Apple/Google localized or promotional pricing display, not a
  real discrepancy, but the exact current canonical price was **not
  pinned down with certainty** in either research pass.
- **No lifetime/one-time-purchase tier exists.** A dedicated FAQ
  article — "Why doesn't Gather offer a Lifetime Subscription Tier
  with a One-Time Payment Option?" — exists specifically to answer this
  recurring request; its full rationale text could not be retrieved by
  either research pass, so the developer's exact stated reasoning is
  **unverified**, though the article's mere existence confirms the
  no-lifetime-tier decision is a deliberate, defended policy rather
  than an oversight.
- Payment is processed entirely through native Apple/Google in-app
  purchase systems; no third-party payment processor is named in the
  privacy policy.

([App Store](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362), [Google Play page data, retrieved 2026-08-22](https://play.google.com/store/apps/details?id=com.feralforaging.gather), [Featurebase FAQ collection](https://gather.featurebase.app/help/collections/0262849-frequently-asked-questions))

## 4. Store metrics and the funnel-conversion story

| Metric | Value | Verification |
|---|---|---|
| App Store rating | 4.8/5 from 145 ratings | Confirmed, small sample — early-stage app |
| Google Play rating | 4.28/5 from 141 ratings | From the page's structured `aggregateRating` JSON-LD, retrieved 2026-08-22 |
| Google Play installs | "10K+" band; internal precise figure surfaced in page data: **12,282** | Play Store display band plus an internal page-data field — **not a public API figure**, treat precise number as internal/unverified for external citation |
| YouTube subscribers (@FeralForaging) | ~510,000, ~340 videos | **Search-engine-knowledge-panel sourced only** — direct fetch of the channel page could not confirm the number; treat as approximate/unverified |
| TikTok followers | 179.8K, 2.2M total likes | Confirmed on platform |
| Instagram followers | ~142K–145K (two slightly different reads) | Confirmed on platform |
| Facebook likes | ~273,000 | Confirmed on platform |
| Patreon members / paid patrons | 6,381 total members / **151 paid patrons** | Confirmed on Patreon's own about page |

The install figure and the subscriber figure, read together, tell the
funnel-conversion story: an app with roughly **10,000+ Google Play
installs (12,282 internal)** sits underneath a creator audience of
**~510,000 YouTube subscribers** plus ~180K TikTok, ~145K Instagram,
and ~273K Facebook followers — a combined cross-platform top-of-funnel
reach in the high hundreds of thousands to low millions once overlap is
ignored. Even taking the install figure and the subscriber figure each
at face value with their respective caveats, Play Store installs are
roughly **2% of the YouTube subscriber count alone**, before counting
any of the other channels. The Patreon numbers corroborate the same
shape independently: 151 paid patrons against 6,381 total Patreon
"members" is itself only a ~2.4% paid-conversion rate off Patreon
specifically. Read together, both numbers point the same direction —
this is a business whose monetized-product conversion rate off its
free content audience is low-single-digit-percent by any of the
measures available, consistent with the founder's own stated pivot
(Patreon is now framed as legacy/secondary; the app is framed as "the
primary way to support the work"). None of the underlying figures in
this comparison are independently audited; each carries the specific
caveat noted in its source row above, and the 2% figure is this
teardown's own arithmetic on unverified inputs, not a disclosed
statistic.
([Patreon about](https://www.patreon.com/FeralForaging/about), [Google Play page data](https://play.google.com/store/apps/details?id=com.feralforaging.gather), [YouTube](https://www.youtube.com/@FeralForaging))

Update cadence: a review from ~May 2026 references app version 1.4.4;
combined with roadmap items (range maps, medicinal-use sections, the
journal, native/invasive filters) landing across late 2025–2026 and the
most recent observed update (August 10, 2026, "Fixes corner cases of
overlapping lookalikes details resolution"), this indicates a frequent,
roughly monthly-scale incremental release cadence. The earliest
version-history timestamp in Play Store page data corresponds to
July 18, 2025, consistent with a 2025 launch — treated as approximate.
([Google Play page data](https://play.google.com/store/apps/details?id=com.feralforaging.gather), [Featurebase roadmap](https://gather.featurebase.app))

## 5. Channel footprint

| Channel | Reach | Funnel role |
|---|---|---|
| YouTube (@FeralForaging) | ~510K subs (unverified, see §4), ~340 videos | Long-form "video essay" top-of-funnel content per the channel's own self-description |
| TikTok (@feralforaging) | 179.8K followers, 2.2M total likes | Short vertical plant-ID/lookalike content; mid-tier per-video engagement relative to follower count |
| Instagram (@feralforaging) | ~145K followers, 571 following | Bio reads "Foraging education for all 🌱 Download my foraging app 👇" with a direct tracked link — the bio's primary CTA is the app itself |
| Facebook (@feralforaging) | ~273K likes | Page description not retrievable |
| Patreon (feralforaging) | 6,381 members / 151 paid | Explicitly de-emphasized by the founder in favor of app subscriptions |
| Discord | "Gather: Foraging App Community" server exists | Branded around the app product, not the general content brand — community infrastructure rebuilt around the product |
| Newsletter | "The Forager's Digest," biweekly, sent via feralforaging.com's own list (not Substack) | Mid-funnel nurture |
| X/Twitter (@feralforaging) | Exists; data not retrievable (fetch blocked) | Unverified |

Direct, explicit funnel mechanics observed: the Instagram bio's app
link; TikTok captions routing viewers to the "Foraging Knowledgebase"
which "connects to my Interactive Forager's Calendar" (legacy free
tools now positioned as feeders into the paid app); Patreon's own
about-page language redirecting supporters to the app subscription as
"the primary way to support the work"; and an affiliate-tagged app
link (`pid=affiliate_program`, `c=FERAL`) suggesting a formal
affiliate/referral system, likely for cross-promotion with other
foraging creators, though no public signup page or commission terms
were found.
([Instagram](https://www.instagram.com/feralforaging/), [TikTok](https://www.tiktok.com/@feralforaging/video/7402257474620804394), [Patreon about](https://www.patreon.com/FeralForaging/about), [tracked link](https://gatherapp.co/?af_dp=gather%3A%2F%2F&af_xp=custom&c=FERAL&deep_link_value=FERAL&pid=affiliate_program&shortlink=FERAL&source_caller=ui))

## 6. What users praise and complain about

**Praise**, drawn from App Store/Google Play reviews:

- Depth of species profiles: "so thorough... including fruit, leaf &
  flower descriptions and season," "packed full of knowledge."
- Reduces beginner intimidation: "makes foraging feel way less
  intimidating," "10/10."
- The lookalikes feature specifically: "Finally! Thorough, helpful +
  lookalikes!"
- Seasonal-timing reminders solving a real pain point: "Game
  Changer... makes tracking foraging windows so much easier."
- Support for an independent developer by name: "Jesse did it for
  me!...Support small developers making things you care about!"

**Complaints** — the dominant recurring theme on both platforms is the
subscription pricing/gating model, not safety or accuracy:

- A Google Play reviewer read other reviews, discovered "you can't
  EVEN USE THE APP without paying for the subscription (after the free
  trial)," and deleted it unopened, saying they would pay "even
  something as high as $20" for a one-time purchase instead.
- "$7.99 [monthly] or $60 a year is out of sight. Maybe a $40 one time
  purchase."
- A 3-star App Store review ("Can't delete account") flags both the
  $60/year cost and an account-deletion bug.
- Aggregated search results confirm the subscription-vs-one-time-payment
  friction is the single most repeated negative, alongside a perception
  that the paywall is not made clear enough pre-install.
- The developer has publicly responded that the subscription
  requirement is disclosed in the app description/screenshots and is
  "not trying to hide it," and has partly addressed price sensitivity
  by making the journal and poisonous-species pages free regardless of
  subscription tier.
- No safety/accuracy complaints (misidentification incidents) turned up
  in the retrieved review sample. One roadmap item — a user-reported
  native-range correction for redbud in Ontario, Canada — was marked
  "Not planned" by the developer, a single data point on a data-accuracy
  report not acted on at time of research, not a pattern.
- No Reddit r/foraging threads specifically discussing Gather were
  located via search in either research pass — a genuine research gap,
  not evidence of absence.

([App Store reviews](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362?see-all=reviews&platform=iphone), [Google Play page data](https://play.google.com/store/apps/details?id=com.feralforaging.gather), [Featurebase roadmap](https://gather.featurebase.app))

## 7. Data-source model: expert-authored, Falling Fruit as a planned absorption

No public documentation names an exact scientific/institutional data
source (e.g. USDA PLANTS, GBIF, a named herbarium or taxonomic
authority) for species profiles or range maps in either the app's
materials or its privacy policy — a genuine transparency gap given the
safety-critical nature of foraging content (toxic lookalikes). What
the public record does support is that content is **expert/human-
authored rather than crowdsourced or AI-generated**:

- The founder's own marketing tagline, "Powered only by Human
  Intelligence," is used directly in promotional content.
- Founder **Jesse Akozbek** (spelling inconsistent across sources —
  "Akozbek" on Apple Podcasts/YouTube, "Akosbek" on one podcast title;
  not resolved) appears to be the primary content author/curator; an
  App Store reviewer directly credits him by first name.
- The confirmed absence of AI/crowdsourced photo-recognition reinforces
  that content is presented as curated rather than automatically
  aggregated.
- The Ontario redbud range-correction request sitting on the roadmap
  marked "Not planned" implies species/range data is maintained on the
  internal team's own cycle, not live-edited by the community.

Unverified in both research passes: whether range maps derive from a
specific GIS/botanical dataset, whether content undergoes outside
botanist/mycologist review, and whether a formal editorial or
fact-checking process exists at all. This absence of any published
sourcing/methodology or credentialed-reviewer statement is worth
flagging explicitly rather than assuming benignly, given what is at
stake in a wrong lookalike call.

**Falling Fruit** — a separate 501(c)3 nonprofit's crowdsourced global
map of 1.4M+ foraging locations, built from user submissions plus
scraped public data — is a *location map*, structurally different from
Gather's species reference. Gather has no crowdsourced-map layer of its
own; "Incorporating falling fruit into the app" sits on the public
roadmap as a **planned, unshipped** item with 13 votes. The framing
(absorb, not compete) is the clearest public signal of how Gather's
team positions data-source partnerships generally: license or ingest an
external structured dataset rather than open the app itself to
crowdsourced editing, consistent with the human-curated, no-AI, no-
community-layer product philosophy documented throughout this note.
([Featurebase roadmap](https://gather.featurebase.app), [fallingfruit.org](https://fallingfruit.org/))

## 8. Positioning vs. named competitors

Gather's own help content draws an explicit line between "identification
apps" and itself: "No app, no matter how accurate, can identify wild
species *for* you... Never consume anything without being 100%
confident of its identity!" It goes further and explicitly recommends
one of the apps it does not compete with:

- **iNaturalist** — Gather's own help content calls it "free, powerful,
  and has by far the best community compared to the others,"
  positioning it as complementary rather than a rival. iNaturalist is
  developed by the California Academy of Sciences and National
  Geographic Society and is crowdsourced/community-verified — the
  structural opposite of Gather's expert-authored, no-community-layer
  model.
- **Seek (by iNaturalist)** — third-party framing positions it as
  simple, private, offline-capable, free, family-friendly camera ID, a
  different use case than Gather's structured seasonal reference.
- **PictureThis** — third-party framing: "a botanist in your pocket,"
  AI photo-match against ~10,000 species. Since Gather does no photo ID
  at all, the two are largely non-overlapping in practice (ID app vs.
  planning/safety reference), not head-to-head competitors.
- **Wild Edibles app** — appears in third-party "best foraging apps"
  roundups alongside iNaturalist/PictureThis, with no direct
  Feral-Foraging-vs-Wild-Edibles comparison language found. Notably,
  Gather was **absent** from at least one third-party roundup (The
  Takeout) that covered iNaturalist, PictureThis, and Wild Edibles —
  suggesting limited penetration into general food-media "best apps"
  coverage as of this research.

([Featurebase: does this app identify plants?](https://gather.featurebase.app/articles/6245744-does-this-app-identify-plants-and-mushrooms-for-me), [The Takeout](https://www.thetakeout.com/foraging-apps-mushrooms-leeks-poisonous-1848610115/))

## 9. Technical observations from the privacy policy

From the app's own privacy policy (fetched directly from
gatherapp.co, unlike the parent marketing site):

- **Analytics:** Firebase (Google).
- **Payments:** native Apple App Store / Google Play in-app purchases;
  no third-party payment processor named.
- **Location:** the Google Places API.
- **Push notifications:** OneSignal.
- **Social login options listed:** Google, Facebook, Instagram,
  Twitter, LinkedIn.
- **Data collected:** email, name, postal address, IP address, device
  identifiers, diagnostic/usage data, location (with permission),
  camera/photo library access (with permission), payment metadata (not
  stored locally).
- No dedicated mapping/basemap provider is named beyond the Google
  Places API reference for location lookups — which service renders
  the actual range-map basemaps is unverified.
- No public API, SDK, or developer documentation was found; no GitHub
  presence or open-source components were located.

([gatherapp.co/privacy](https://gatherapp.co/privacy))

## 10. The business-model reading

Taken together, sections 1–9 support one coherent reading: Feral
Foraging is a **creator-economy content-to-app funnel**, structurally
distinct from a venture-funded app business or a scientific-institution
product. The founder's personal audience — built over years of
YouTube/TikTok/Instagram plant-ID content and Patreon-supported free
tools — is the moat, not a proprietary dataset, a network effect, or a
crowdsourced community (Gather deliberately has none of the latter).
The product decisions read as consistent expressions of that model
rather than independent choices:

- **No AI photo-ID, ever** ("Not planned") because the founder's
  differentiated asset is his own curated expertise, not a
  commodity computer-vision model any competitor could license; "Powered
  only by Human Intelligence" is simultaneously a safety claim, a brand
  claim, and a moat claim.
- **No lifetime tier** because recurring subscription revenue, not a
  one-time sale, is what a small creator-led team needs to fund
  continuous content-adjacent product work (range-map updates, new
  lookalike pairs, seasonal notification tuning) — the FAQ page
  defending this choice exists precisely because it cuts against
  what price-sensitive reviewers want.
- **Falling Fruit as an absorption target, not a rival** because the
  founder's team is small and content-first; licensing/ingesting an
  external structured dataset extends the product's coverage without
  requiring the community-moderation infrastructure a crowdsourced
  layer of its own would demand — infrastructure a two-post-per-month
  content creator's team is not resourced to run.
- **Community pushed to Discord/Facebook rather than built in-app**
  for the same small-team reason: community management is expensive,
  and the app's own value proposition (curated reference, not social
  feed) does not need it.

The store-metrics-vs-subscriber-count gap in §4 is this reading's
central piece of evidence: a top-of-funnel reach in the hundreds of
thousands converts to an app install base still in the low tens of
thousands, and Patreon's own paid-conversion rate (151 of 6,381
members, ~2.4%) shows the same low-single-digit-percent conversion
shape independently. That is not necessarily a failure signal — a
freemium content-creator app converting a low single-digit percentage
of a passive social-media audience into any kind of paying relationship
is a familiar creator-economy pattern, not obviously an outlier — but
it is the shape of the business this teardown's public sources
support, and it should be read as such rather than assumed to be a
larger or more diversified operation than the evidence shows.

## Sources

- [App Store — Gather: The Foraging App](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362)
- [App Store — reviews](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362?see-all=reviews&platform=iphone)
- [Google Play — Gather](https://play.google.com/store/apps/details?id=com.feralforaging.gather)
- [gatherapp.co](https://gatherapp.co/)
- [gatherapp.co/privacy](https://gatherapp.co/privacy)
- [Gather Featurebase — roadmap](https://gather.featurebase.app)
- [Gather Featurebase — "Does this app identify plants and mushrooms for me?"](https://gather.featurebase.app/articles/6245744-does-this-app-identify-plants-and-mushrooms-for-me)
- [Gather Featurebase — plant-ID feature request ("Not planned")](https://gather.featurebase.app/p/plant-id)
- [Gather Featurebase — FAQ collection](https://gather.featurebase.app/help/collections/0262849-frequently-asked-questions)
- [Gather Featurebase — "great guide" post](https://gather.featurebase.app/p/great-guide)
- [Gather Featurebase — changelog](https://gather.featurebase.app/changelog)
- [feralforaging.com/about/ (unreachable, HTTP 500)](https://feralforaging.com/about/)
- [Patreon — feralforaging](https://www.patreon.com/feralforaging)
- [Patreon — FeralForaging about page](https://www.patreon.com/FeralForaging/about)
- [Patreon — FeralForaging shop (unverified contents)](https://www.patreon.com/FeralForaging/shop)
- [YouTube — @FeralForaging](https://www.youtube.com/@FeralForaging)
- [TikTok — @feralforaging](https://www.tiktok.com/@feralforaging)
- [TikTok — "Powered only by Human Intelligence" video](https://www.tiktok.com/@feralforaging/video/7610858702953843981)
- [TikTok — Knowledgebase/Calendar funnel caption](https://www.tiktok.com/@feralforaging/video/7402257474620804394)
- [Instagram — @feralforaging](https://www.instagram.com/feralforaging/)
- [Facebook — feralforaging](https://www.facebook.com/feralforaging/)
- [Facebook — Gather app community group](https://www.facebook.com/groups/gatherforagingappcommunity/)
- [X/Twitter — @feralforaging (unverified, fetch blocked)](https://x.com/feralforaging)
- [Discord — Gather: Foraging App Community](https://discord.com/invite/feral-foraging-online-education-948237916491100170)
- [Falling Fruit](https://fallingfruit.org/)
- [The Takeout — foraging apps roundup](https://www.thetakeout.com/foraging-apps-mushrooms-leeks-poisonous-1848610115/)
- [Gather affiliate-tagged tracked link](https://gatherapp.co/?af_dp=gather%3A%2F%2F&af_xp=custom&c=FERAL&deep_link_value=FERAL&pid=affiliate_program&shortlink=FERAL&source_caller=ui)

## Gaps carried forward from the underlying research

- feralforaging.com was unreachable throughout research (live HTTP 500
  WordPress PHP fatal error on every page fetched); all on-site claims
  above are second-hand via search-engine snippets, not a direct read.
- The founder's surname spelling ("Akozbek" vs. "Akosbek") is
  unresolved across sources.
- The founder's reported "Canadian electrical engineer" background is
  single-sourced from a search-engine summary, not a primary bio page,
  and is not repeated as fact above beyond that framing.
- The YouTube subscriber count (~510K) is search-knowledge-panel
  sourced only, not confirmed by a direct page fetch.
- The exact founding date of the Feral Foraging brand is not
  established; a 2020 blog post implies the educator/brand predates
  2021 but could not itself be fetched to confirm (403 error).
- Patreon shop SKUs/prices, and X/Twitter follower count and content,
  were not retrievable in either research pass.
- Alabama LLC registration was not cross-checked against a state
  business registry — only the company's own privacy-policy
  self-disclosure was available.
- No revenue, funding, or install-count figures beyond the Play
  Store's own "10K+" band (and its internal 12,282 page-data field)
  are publicly disclosed anywhere found; Apple never publishes iOS
  install counts.
- The exact canonical current subscription price could not be
  conclusively resolved between the two observed price pairs.
- The "Why no lifetime subscription" FAQ article's full rationale text
  could not be retrieved by either research pass.
- No named scientific/institutional data source for species profiles
  or range maps was found; "expert/human-authored" rests on the app's
  own self-positioning plus reviewer-inferred authorship, not an
  independently confirmed editorial/scientific-review process.
