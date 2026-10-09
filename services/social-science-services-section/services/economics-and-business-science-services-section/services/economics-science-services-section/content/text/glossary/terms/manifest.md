---
name: "Manifest"
description: "The itemized SKU, quantity, and condition list a liquidator publishes for a lot of goods before it is sold — the document whose fast, accurate reading is the entire tradeable edge in liquidation-pallet arbitrage."
domain: economics
component-of: arbitrage
enables: sell-through-rate
date-created: 2026-08-28
date-modified: 2026-08-28
---

A manifest is the itemized list a liquidator publishes alongside a pallet or truckload lot before it is auctioned: product name, SKU or UPC, quantity, and a condition grade (new, like-new, damaged customer return, salvage) for each line.
A "manifested" lot carries this document; an "unmanifested" or "mystery" lot does not, and sells at a steeper discount precisely because the buyer is pricing pure uncertainty rather than a knowable set of items — the reason authorized platforms like B-Stock, Direct Liquidation, and BULQ foreground manifested listings, and the reason unusually cheap unmanifested lots outside those platforms are a common scam vector, per [the goods-arbitrage-mechanism survey](../../../../../../../../../../data/records/2026-08-28-goods-arbitrage-mechanism/goods-arbitrage-survey.md).

Reading a manifest well means converting each line item into a current resale-market price estimate, summing across the lot, subtracting expected non-sellable shrinkage (by grade: roughly 10-20% of a new/shelf-pull lot, 20-45% of a returns lot, 40-60% of a salvage lot, per the same record), subtracting selling fees, shipping, and labor, and arriving at a maximum defensible bid before the auction closes.
Doing this across dozens or hundreds of line items, faster and more accurately than rival bidders, is the entire tradeable edge in this market — which is also exactly why a class of AI-branded manifest-analysis tools (Liquidata AI, Pallet Analyzer Pro, Loadest AI, per the same record) already exists to sell that reading speed as a subscription product to bidders, rather than requiring every bidder to build the skill themselves.
This is the detail that makes manifest-reading the one part of liquidation-pallet arbitrage that does not strictly require becoming a capitalized, registered bidder: the manifest is a public or semi-public document once a lot is listed, and analyzing it is a service that can be sold to the bidder who does take possession of the goods, discussed further in [the note on goods arbitrage and the capital gate](../../documents/articles/notes/2026/08/28/2026-08-28-note-on-goods-arbitrage-and-the-capital-gate.md).

A manifest's accuracy is itself variable and is part of what a skilled reader prices in: condition grades are self-reported by the liquidator, quantities can be wrong, and a lot's true [sell-through rate](./sell-through-rate.md) depends on how honestly the manifest described what is actually in the box, which no amount of fast reading can correct for in advance.
