---
title: "Arbitrage"
description: "Buying a good in one market or moment where it is underpriced and selling it in another where its price is higher, capturing the price gap as profit without adding value to the good itself."
defines: Arbitrage
domain: economics
exploits: price-dispersion
requires: manifest
bounded-by: inventory-risk
measured-by: sell-through-rate
date-created: 2026-08-28
date-modified: 2026-08-28
---

Arbitrage is the practice of buying a good where it is priced low and selling the same good where it is priced high, capturing the gap as profit.
In its textbook form — simultaneous purchase and sale of an identical financial instrument on two venues — arbitrage is close to risk-free: the trade is instantaneous, both legs are certain, and the only cost is transaction fees.
That textbook case exists in this glossary already in its financial-instrument form: [funding-rate arbitrage](../../../../../finance-services-section/content/text/glossary/terms/funding-rate-arbitrage.md) holds a spot position against a perpetual future to collect a funding payment, and the finance section's glossary carries the wider family of delta-neutral and basis-trade constructions this term does not restate.

Goods arbitrage — arbitrage on physical or digital *things* rather than financial instruments — differs from the textbook case in one structural way that determines nearly everything else about its economics: the two legs are almost never simultaneous.
A liquidation pallet, an expired domain, a retail item bought at one store to resell online, or a captured error fare all require the buyer to take possession first and find a buyer second, with real time — hours to years — passing in between.
That gap is where [inventory risk](./inventory-risk.md) enters: the good may not sell at the assumed price, may not sell within the assumed time, or may not sell at all, and holding costs (storage, shipping, renewal fees) accrue regardless.
The fraction of acquired inventory that does eventually sell is its [sell-through rate](./sell-through-rate.md), and the gap the arbitrageur is exploiting in the first place is [price dispersion](./price-dispersion.md) — the same good carrying different prices across sellers, markets, or time, even after quality is held constant.

**Reading the mispricing is itself the exploitable skill, and it has an artifact.**
In organized liquidation markets specifically, the seller publishes a [manifest](./manifest.md) — an itemized list of a lot's contents — and the entire edge in that market consists of reading the manifest faster and more accurately than rival bidders, converting a list of SKUs and conditions into a defensible maximum bid before the auction closes.
This is the closest goods arbitrage comes to a genuinely capital-light variant: a bidder still needs capital to buy the lot, but the manifest-reading step itself is a separable service that can, in principle, be sold to bidders rather than acted on directly — a distinction worked through in full, with current 2026 pricing, sell-through figures by category, and the specific business-registration and equipment gates that bind different variants of this mechanism independently of capital, in [the note on goods arbitrage and the capital gate](../../documents/articles/notes/2026/08/28/2026-08-28-note-on-goods-arbitrage-and-the-capital-gate.md) and its source record, [the goods-arbitrage-mechanism survey](../../../../../../../../../../data/records/2026-08-28-goods-arbitrage-mechanism/goods-arbitrage-survey.md).

Arbitrage is bounded by two forces working against the arbitrageur: [inventory risk](./inventory-risk.md), the chance the second leg fails or underperforms, and market self-correction — the more successfully arbitrageurs exploit a price gap, the more their own buying and selling pressure closes it, which is the classical mechanism by which arbitrage is said to make markets more efficient even as it becomes less profitable to keep doing.
