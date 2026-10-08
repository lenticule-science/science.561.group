---
name: "App Store Intelligence"
date-created: 2026-08-22
aliases:
  - "app store intelligence"
  - "app-store intelligence"
  - "store intelligence"
  - "review mining"
description: "App-store intelligence treats a mobile app's App Store/Google Play listing, its structured rating and review data, third-party negative-review aggregators, and its public roadmap/feedback board (e.g. Featurebase, Canny) as a coherent, citable evidence class for competitive research — demonstrated in this section's own teardown of the Gather foraging app, which pulled confirmed feature lists, a documented pricing dispute, and an unactioned data-correction request directly from these sources."
component-of: competitive-intelligence
instance-of: evidence-class
---

App-store intelligence is the practice of treating an app's presence on its distribution platforms — not just its marketing site — as primary evidence for competitive research. A store listing, its review stream, and its public feedback/roadmap board are largely produced or moderated by the business itself or by its users in the open, which makes them unusually rich, current, and citable sources compared to a marketing page's curated claims.

## What the store surface actually yields

**The listing itself** is a structured, dated, versioned public record: exact feature descriptions, platform requirements, category and age rating, developer/publisher of record (useful for confirming the entity behind an app independent of its marketing brand name), and version-history/update-cadence data. Google Play's page data in particular exposes structured fields — an `aggregateRating` block, an install-count band, in-app-purchase price ranges, and per-version update notes — that let a researcher pin down facts (a rating, an install-count band, a price range) more precisely than prose review summaries allow.

**Ratings and reviews** are the direct voice of paying users, and mining them for recurring complaints — not just an average star rating — is where the evidentiary value concentrates. In the house's own teardown of the Gather foraging app, individually-quoted App Store and Google Play reviews established that the dominant, repeated complaint was the subscription-versus-one-time-purchase pricing model (one reviewer proposing a $40 one-time purchase, another saying they would pay "even something as high as $20" for one), while confirming the *absence* of any safety/accuracy complaint pattern in the sample retrieved — a negative finding that is itself evidence, reported as such rather than omitted.

**Third-party review aggregators** (e.g. `appgrooves.com`'s negative-review views, Trustpilot) surface curated complaint clusters faster than reading raw review streams, and were used across this house's Weiqi Market Teardown to source per-app complaint patterns with direct links.

**Public roadmap and feedback boards** (Featurebase, Canny, and similar SaaS feedback-and-changelog tools) are a distinct and often-overlooked evidence class: they expose, in the business's own words, which user-requested features are shipped, planned, or explicitly declined ("not planned"), with vote counts as a rough popularity signal. In the Gather teardown, the app's Featurebase board directly evidenced a completed feature (a free-tier foraging journal, shipped December 2, 2025), a declined feature request (photo-based plant ID, marked "Not planned" — confirming a deliberate, stated product-positioning choice rather than a technical gap), and an unactioned user-submitted data correction (a species range-accuracy report left unresolved at time of research) — each a specific, citable, dated data point a marketing page would never disclose.

## Evidence grading

Not everything on a store surface carries equal weight. This section's practice, established in its founding applications, distinguishes:

- **Store-measured** — figures the platform itself computes and displays (rating, rating count, an install-count band, a price-range field) — high confidence, but still dated and subject to promotional/regional variation (the Gather teardown found two different price pairs across fetches and reported both rather than picking one).
- **Self-disclosed** — claims the developer makes in listing copy, a linked privacy policy, or a feedback-board response — treated as the business's own primary statement, but not independently verified against a third-party registry unless that check was actually done.
- **User-generated** — individual reviews, forum threads, and roadmap votes — high value for surfacing complaints and demand signals, but reported as "a review states..." rather than generalized into "users believe..." without a stated sample size.
- **Search-index-only** — a figure or claim that appeared only in a search-engine summary and could not be confirmed by a direct fetch of the source page — explicitly flagged as approximate/unverified rather than presented at the same confidence as a direct read.

## Sources

- Product teardown of Gather: The Foraging App, this section's founding application of the method — sourced via [App Store](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362), [App Store reviews](https://apps.apple.com/us/app/gather-the-foraging-app/id6746694362?see-all=reviews&platform=iphone), [Google Play](https://play.google.com/store/apps/details?id=com.feralforaging.gather), and the app's own [Featurebase roadmap and help center](https://gather.featurebase.app).
- [AppGrooves negative-review view, BadukPop example](https://appgrooves.com/app/badukpop-go-weiqi-game-by-badukpop-go-coreplane-inc/negative) — as used in the Weiqi Market Teardown.
- [GoMagic on Trustpilot](https://www.trustpilot.com/review/gomagic.org) — a review-aggregator source used the same way.
- [Featurebase — In-App Feedback: How to Collect User Feedback](https://www.featurebase.app/blog/in-app-feedback) — background on the roadmap/feedback-board product category.
