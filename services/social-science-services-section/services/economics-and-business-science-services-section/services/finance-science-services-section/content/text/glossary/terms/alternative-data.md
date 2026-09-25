---
name: "Alternative Data"
date-created: 2026-09-05
aliases:
  - "alternative data"
  - "alt data"
description: "Data sources outside traditional financial statements and prices, used to generate trading signals before the same information appears in conventional sources."
references: {}
---

**Alternative data** is any data source used for investment research that falls outside traditional financial statements, prices, and volumes — commonly cited categories include satellite and aerial imagery (counting cars in retailer parking lots, monitoring crop conditions, tracking shipping and storage), aggregated and anonymized credit-card or point-of-sale transaction data, web-scraped pricing, hiring, or review data, social-media sentiment, app usage and download statistics, and shipping or logistics tracking data.

The economic rationale funds cite for paying to acquire and process alternative data is that it can reveal a company's actual business performance before that performance appears in a quarterly filing or is otherwise priced by the market — turning a wait for scheduled disclosure into an earlier, if noisier, read on the same underlying fact. This is the same logic [post-earnings-announcement-drift](./post-earnings-announcement-drift.md) exploits after a filing already exists, applied instead to construct an estimate ahead of one.

Alternative data brings its own version of the challenges in [alpha-research](./alpha-research.md) and [point-in-time-data](./point-in-time-data.md) in sharper form: a novel dataset has typically not been vetted by years of public use the way prices and filings have, its historical coverage is often short or inconsistently backfilled (raising exactly the look-ahead risk described there when a vendor's "historical" file was in fact reconstructed later), and because it is expensive and not universally available, an edge found in it can itself have a capacity ceiling ([strategy-capacity](./strategy-capacity.md)) set by how many funds have licensed the same feed rather than by market liquidity alone.
