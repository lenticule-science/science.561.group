---
title: "Advertising Revenue on the Web"
type: curriculum-lesson
authors:
  - claude-opus-4-6
date-created: 2026-03-29T00:00:00
keywords:
  - business
  - web
  - advertising
teaches:
  - "How web advertising generates revenue"
  - "Ad network tiers and requirements"
  - "Optimizing ad revenue without degrading user experience"
requires:
  - ./web-revenue-models.md
  - ../terms/programmatic-advertising.md
  - ../terms/revenue-per-mille.md
description: After completing this lesson, you'll be able to explain how programmatic advertising generates revenue for publishers, distinguish between ad network tiers and their requirements, identify the levers that increase ad revenue, and…
---

After completing this lesson, you'll be able to explain how programmatic advertising generates revenue for publishers, distinguish between ad network tiers and their requirements, identify the levers that increase ad revenue, and recognize the tradeoffs between ad density and user experience.

## How a pageview becomes revenue

When a visitor loads a page with ad slots, the following happens in roughly 200 milliseconds:

1. The page's ad code contacts the publisher's ad server (e.g., Google Ad Manager).
2. The ad server runs a **header bidding** auction (if configured) — sending bid requests simultaneously to multiple ad exchanges and SSPs.
3. Each exchange runs its own real-time auction among advertisers whose targeting criteria match this visitor and this page.
4. The winning bid from header bidding competes against Google AdSense/Ad Exchange's bid.
5. The highest overall bidder's ad creative is loaded into the ad slot.
6. The publisher earns the winning bid price (minus platform fees).

This process repeats for each ad slot on the page. A page with five ad units runs five parallel auctions. The revenue from a single pageview is the sum of all winning bids across all ad units on that page.

## Ad network tiers

Not all ad networks are equal. They differ in who can join, how they optimize, and what RPMs they deliver.

**Tier 1: Google AdSense (no minimum traffic)**
AdSense is the entry point. Any site with original content can apply. Google serves ads and takes roughly 32% of display ad revenue and 49% of search ad revenue. RPMs are typically the lowest of any network — $1-5 for general content — because AdSense runs a single auction (Google's own) without the competitive pressure of header bidding.

**Tier 2: Mid-market networks (10,000-50,000 sessions/month)**
Networks like Ezoic (10,000 sessions minimum) offer automated ad placement testing and header bidding integration. They improve on AdSense RPMs by 30-100% through machine-learning optimization of ad placement, size, and density. RPMs typically reach $5-15 for general content.

**Tier 3: Premium networks (50,000-100,000+ sessions/month)**
Mediavine (50,000 sessions), Raptive (formerly AdThrive, 100,000 pageviews), and Playwire run sophisticated header bidding setups, enforce content quality standards that attract premium advertisers, and provide dedicated account management. RPMs of $15-40+ are common. These networks take 25-35% of revenue but deliver substantially higher gross revenue than lower tiers.

**Tier 4: Direct sales (varies)**
Large publishers with recognizable brands sell ad inventory directly to advertisers, bypassing programmatic auctions entirely. A direct-sold sponsorship of a popular newsletter might yield an effective RPM of $50-100+. This requires a sales team or strong inbound demand from advertisers.

The practical implication: a publisher's path through these tiers is a function of traffic growth. Start with AdSense, graduate to Ezoic or a similar mid-tier network when traffic supports it, and move to Mediavine or Raptive when eligible. Each transition roughly doubles RPM, so the same traffic produces progressively more revenue.

## The levers of ad revenue

Ad revenue is the product of three variables:

$$\text{Ad Revenue} = \text{Pageviews} \times \text{Ads per Page} \times \text{Average CPM}$$

Each variable can be increased:

**Increasing pageviews** is the most straightforward lever — more content, better [SEO](../../../../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/seo.md), higher publication frequency. It is also the slowest, since organic traffic growth typically takes months.

**Increasing ads per page** provides immediate revenue gains but has sharply diminishing returns. The first ad unit on a page earns the most (it is the most visible). Each additional unit earns less because it occupies less valuable screen real estate and competes with the other units for advertiser spend. Beyond 4-6 ad units per page, the revenue gain from additional units is typically offset by negative user experience effects — slower page load times, increased [bounce rate](../../../../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/bounce-rate.md), and lower pages-per-session as visitors leave rather than navigate to a second page.

**Increasing average CPM** is the most sustainable lever. It responds to:
- **Audience geography**: U.S. and UK audiences command CPMs 3-10x higher than audiences in India, Southeast Asia, or Africa, because advertiser budgets are concentrated in high-GDP markets.
- **Content niche**: Finance, insurance, legal, B2B software, and health content attract high-CPM advertisers because the products being advertised have high customer lifetime values.
- **Ad viewability**: Ads that are actually seen (loaded within the viewport, not below an unscrolled fold) earn more than ads that load but are never scrolled to. Lazy-loading ads so they only request bids when they enter the viewport improves viewability metrics.
- **Page speed**: Faster pages have higher ad viewability (ads load before the visitor leaves) and better engagement metrics, both of which increase CPMs over time.
- **Ad format**: Video ads, sticky sidebar ads, and interstitial ads command higher CPMs than standard display banners, but they also degrade user experience more aggressively.

## The density-experience tradeoff

Every ad on a page extracts a cost from the reader — visual clutter, slower loading, interrupted reading flow. The publisher's optimization problem is finding the density that maximizes total revenue, not per-page revenue. If adding a fifth ad to each page increases per-page revenue by 8% but causes 15% of visitors to leave instead of reading a second article, total session revenue decreases.

Premium ad networks like Mediavine handle this optimization automatically, using machine learning to test different layouts and densities per page. But the publisher retains control over the ceiling — the maximum number of ad units allowed. A reasonable starting point for content-focused sites is:
- 1 ad above the fold (before the first scroll)
- 2-3 ads within the body content, spaced at natural breaks
- 1 sticky sidebar ad (desktop only)
- 0-1 anchor/sticky ad at the bottom of the viewport (mobile)

## Worked example

A food blog publishes 300 recipe posts. It receives 400,000 monthly pageviews, 70% from U.S.-based organic search. It currently uses Google AdSense with 3 ad units per page, earning $2,800/month (RPM of $7).

**Step 1: Upgrade to Mediavine.** The site exceeds the 50,000-session threshold (400,000 pageviews / ~1.5 pages per session = ~267,000 sessions). Mediavine's optimized ad stack and header bidding should increase RPM to roughly $18-25 for food content with a U.S.-majority audience. At $20 RPM: 400,000 × ($20/1,000) = $8,000/month — a 186% increase.

**Step 2: Improve pages-per-session.** The site's average is 1.5 pages/session. Adding a prominent "Related recipes" section and improving internal linking could raise this to 2.0 pages/session. If unique sessions stay constant at 267,000, pageviews increase to 534,000. Revenue: 534,000 × ($20/1,000) = $10,680/month.

**Step 3: Publish 10 new posts targeting high-CPM queries.** Posts like "best stand mixers for home baking" and "kitchen organization systems" attract food-adjacent audiences with higher commercial intent. If these 10 posts average 3,000 pageviews/month each and earn $35 RPM (higher due to commercial intent), they add 30,000 × ($35/1,000) = $1,050/month.

**Combined result:** $11,730/month, up from $2,800 — a 4.2x increase with no fundamental change in content approach.

## Self-check exercises

**Exercise 1**: A technology blog earns an $8 RPM from AdSense on 100,000 monthly pageviews. It is not eligible for Mediavine (it has 55,000 sessions, but Mediavine requires primarily English content and the site is bilingual). What is the next-best option for increasing ad RPM?

<details>
<summary>Answer</summary>

Apply to Ezoic, which accepts sites with 10,000+ monthly sessions and has no language restrictions. Ezoic's header bidding and automated ad testing should increase RPM to $12-18 for tech content with adequate traffic. At $15 RPM, revenue would increase from $800/month to $1,500/month. Alternatively, implement header bidding independently using a tool like Prebid.js, though this requires technical setup and ongoing maintenance.

</details>

**Exercise 2**: A publisher notices that their mobile RPM ($6) is much lower than their desktop RPM ($22), and 75% of traffic is mobile. What are two likely causes and two possible responses?

<details>
<summary>Answer</summary>

**Causes:** (1) Mobile screens have less ad real estate — fewer ad units fit without overwhelming the page, so fewer auctions run per pageview. (2) Mobile ad viewability is often lower because users scroll quickly past ad units, reducing CPMs.

**Responses:** (1) Implement a mobile anchor ad (a sticky ad unit at the bottom of the screen that remains visible as the user scrolls) — these have high viewability and typically add $2-4 to mobile RPM. (2) Optimize mobile page speed — faster loading increases ad viewability and engagement metrics, both of which improve CPMs. If page load time exceeds 3 seconds on mobile, reducing it is likely the highest-leverage intervention.

</details>

## What comes next

This lesson covered advertising as a revenue model. Advertising is the simplest model to implement but has the lowest revenue ceiling per visitor. The [subscription and membership lesson](./subscription-and-membership-models.md) covers models that generate more revenue per reader but require deeper audience relationships and editorial commitment.
