---

title: "Bounce Rate"
description: "Bounce rate is the percentage of sessions in which the visitor views only a single page before leaving the site. A \"bounce\" is a visit with no second interaction — no click to another page, no form submission, no event that the analytics system records as engagement."
date-created: 2026-03-29T00:00:00
aliases:
  - "bounce rate"
  - "bounce"
keywords:
  - business
  - web
  - metrics
defines:
  - "Bounce rate"
  - "bounce"
part-of: business/theories/web/terms
---

Bounce rate is the percentage of sessions in which the visitor views only a single page before leaving the site. A "bounce" is a visit with no second interaction — no click to another page, no form submission, no event that the analytics system records as engagement.

$$\text{Bounce Rate} = \frac{\text{Single-page sessions}}{\text{Total sessions}} \times 100$$

Bounce rate is widely tracked but frequently misinterpreted. A high bounce rate is not inherently bad. If a visitor searches "what temperature to roast broccoli," lands on a recipe page, reads "425 degrees for 20 minutes," and leaves, that is a bounce — but the page fulfilled the visitor's need perfectly. Conversely, a low bounce rate is not inherently good: if visitors are clicking through multiple pages because they cannot find what they are looking for, high engagement metrics mask a poor user experience.

The metric's usefulness depends on context. For pages designed to drive further action — a homepage, a category page, a landing page with a call to action — a high bounce rate signals failure. Visitors are arriving and leaving without doing what the page was designed to encourage. For terminal content pages — a blog post, a reference article, a recipe — bounce rate is less meaningful, and **time on page** or **scroll depth** are better indicators of whether the content served its purpose.

Google Analytics 4 (GA4), which replaced Universal Analytics in 2023, effectively deprecated bounce rate in favor of **engagement rate** — the percentage of sessions that lasted longer than 10 seconds, had a conversion event, or had two or more pageviews. Engagement rate = 100% - bounce rate, but with the 10-second threshold added, making it a more nuanced measure. A visitor who reads an article for three minutes and leaves is no longer counted as a bounce in GA4 — they are an engaged session.

For [web monetization](./web-monetization.md), bounce rate matters primarily through its effect on ad revenue: a single-page session generates ad impressions on only one page, while a multi-page session generates impressions on each page visited. Reducing bounce rate by encouraging visitors to read a second article (through related content recommendations, internal linking, or series structures) directly increases [pageviews](./pageview.md) per session and therefore ad revenue per visit — without requiring any additional traffic.


---

<!-- source: _archive/discipline-intake/business/domains/web/terms/bounce-rate.md -->

## Imported source: _archive/discipline-intake/business/domains/web/terms/bounce-rate.md

---
title: "Bounce Rate"
date-created: 2026-03-29T00:00:00
type: term
aliases:
  - "bounce rate"
  - "bounce"
tags:
  - Business
  - Web
  - Metrics
defines:
  - "Bounce rate"
  - "bounce"
part-of: business/domains/web/terms
---

Bounce rate is the percentage of sessions in which the visitor views only a single page before leaving the site. A "bounce" is a visit with no second interaction — no click to another page, no form submission, no event that the analytics system records as engagement.

$$\text{Bounce Rate} = \frac{\text{Single-page sessions}}{\text{Total sessions}} \times 100$$

Bounce rate is widely tracked but frequently misinterpreted. A high bounce rate is not inherently bad. If a visitor searches "what temperature to roast broccoli," lands on a recipe page, reads "425 degrees for 20 minutes," and leaves, that is a bounce — but the page fulfilled the visitor's need perfectly. Conversely, a low bounce rate is not inherently good: if visitors are clicking through multiple pages because they cannot find what they are looking for, high engagement metrics mask a poor user experience.

The metric's usefulness depends on context. For pages designed to drive further action — a homepage, a category page, a landing page with a call to action — a high bounce rate signals failure. Visitors are arriving and leaving without doing what the page was designed to encourage. For terminal content pages — a blog post, a reference article, a recipe — bounce rate is less meaningful, and **time on page** or **scroll depth** are better indicators of whether the content served its purpose.

Google Analytics 4 (GA4), which replaced Universal Analytics in 2023, effectively deprecated bounce rate in favor of **engagement rate** — the percentage of sessions that lasted longer than 10 seconds, had a conversion event, or had two or more pageviews. Engagement rate = 100% - bounce rate, but with the 10-second threshold added, making it a more nuanced measure. A visitor who reads an article for three minutes and leaves is no longer counted as a bounce in GA4 — they are an engaged session.

For [web monetization](./web-monetization.md), bounce rate matters primarily through its effect on ad revenue: a single-page session generates ad impressions on only one page, while a multi-page session generates impressions on each page visited. Reducing bounce rate by encouraging visitors to read a second article (through related content recommendations, internal linking, or series structures) directly increases [pageviews](./pageview.md) per session and therefore ad revenue per visit — without requiring any additional traffic.

## Related terms

- [Pageview](./pageview.md) — the unit of attention; a bounce is a session with only one pageview
- [Organic traffic](./organic-traffic.md) — the traffic source with characteristically high bounce rates due to search intent satisfaction
- [Conversion rate](./conversion-rate.md) — bounce rate's behavioral inverse; bouncing visitors do not convert
- [Revenue per mille](./revenue-per-mille.md) — the metric depressed by high bounce rates through reduced pages-per-session
