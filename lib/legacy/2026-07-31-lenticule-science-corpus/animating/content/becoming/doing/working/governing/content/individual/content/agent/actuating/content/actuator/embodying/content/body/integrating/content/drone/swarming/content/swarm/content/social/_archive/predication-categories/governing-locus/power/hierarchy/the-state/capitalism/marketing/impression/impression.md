---

title: "Impression"
description: "An impression is a single instance of an advertisement being loaded and displayed to a user. It is the fundamental unit of measurement in digital advertising — the atomic event that the entire [programmatic advertising](./programmatic-advertising.md) system is built to produce and count."
date-created: 2026-03-29T00:00:00
aliases:
  - "impression"
  - "ad impression"
  - "impressions"
keywords:
  - business
  - web
  - advertising
  - metrics
defines:
  - "Impression"
  - "ad impression"
part-of: business/theories/web/terms
---

An impression is a single instance of an advertisement being loaded and displayed to a user.
It is the fundamental unit of measurement in digital advertising — the atomic event that the entire [programmatic advertising](./programmatic-advertising.md) system is built to produce and count.

One [pageview](./pageview.md) typically generates multiple impressions, because most web pages contain multiple ad slots.
A page with a leaderboard banner at the top, two in-content ads, and a sidebar ad generates four impressions per pageview.
This is why CPM (cost per mille — the price an advertiser pays per 1,000 impressions) and [RPM](./revenue-per-mille.md) (revenue per 1,000 pageviews) are different metrics: RPM captures the total revenue from all impressions on a page, while CPM prices each impression individually.

The definition of "displayed" has been a source of ongoing industry dispute.
The original standard counted an impression when the ad server delivered the ad — regardless of whether the user ever saw it.
An ad loaded at the bottom of a page that the user never scrolled to was counted as an impression.
The **viewability** standard, established by the Media Rating Council and adopted by the Interactive Advertising Bureau (IAB), tightened this: a display ad impression counts as "viewable" only if at least 50% of the ad's pixels are in the browser viewport for at least one continuous second.
For video ads, the threshold is 50% of pixels visible for at least two continuous seconds.

Viewability rates across the web average roughly 50-60%, meaning that 40-50% of "served" impressions are never actually seen by the user.
This discrepancy is a persistent source of tension between advertisers (who want to pay only for viewed ads) and publishers (who have less control over user scrolling behavior than the metric implies). **Viewable CPM** (vCPM) pricing — where advertisers pay only for viewable impressions — shifts the risk to the publisher and incentivizes ad placement optimization: positioning ads where users will actually see them, using lazy loading to defer ads until they enter the viewport, and using sticky ad formats that remain visible as the user scrolls.

For publishers, the actionable insight is that not all impressions are equal.
An impression in the first screen of content (above the fold) earns 2-5x the CPM of an impression below the fold.
A viewable impression earns more than a non-viewable one.
And an impression served to a user with high commercial intent (someone reading a product review) earns more than one served to a user reading general interest content — because the advertiser's expected return on that impression is higher.
