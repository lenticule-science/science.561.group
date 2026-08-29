---
title: "Inventory Risk"
description: "The risk that purchased goods do not sell at the assumed price, within the assumed time, or at all, while capital stays tied up and holding costs accrue regardless — the structural feature that separates goods arbitrage from near-riskless financial arbitrage."
defines: Inventory Risk
domain: economics
bounds: arbitrage
measured-by: sell-through-rate
date-created: 2026-08-28
date-modified: 2026-08-28
---

Inventory risk is the risk that purchased goods do not sell at the price the buyer assumed, do not sell within the time the buyer assumed, or do not sell at all — while the capital spent to acquire them stays tied up (an opportunity cost) and holding costs continue to accrue regardless of whether a sale ever happens.
It is the structural feature that most separates goods arbitrage from textbook financial arbitrage: a delta-neutral trade's two legs settle close to simultaneously, so risk is mostly about the two legs staying matched, while a goods-arbitrage trade's second leg (the resale) can lag the first (the purchase) by days, months, or — per the expired-domain figures in [the goods-arbitrage-mechanism survey](../../../../../../../../../../data/records/2026-08-28-goods-arbitrage-mechanism/goods-arbitrage-survey.md) — years, or may simply never happen.

Inventory risk takes a different concrete form in each variant surveyed there.
For liquidation pallets, unsold items must eventually be re-liquidated at a further markdown or written off outright, and the [manifest](./manifest.md)'s stated condition grade is only an estimate of what the [sell-through rate](./sell-through-rate.md) will actually be once the box is opened.
For expired domains, the holding cost is small and explicit — roughly $10-20/year in registrar renewal fees — but compounds for as long as the domain sits unsold, and the same record's sell-through figure (roughly 2.4%/year of an average portfolio) implies a realistic expectation of multiple unpaid years before, or instead of, a sale.
For retail and online arbitrage, unsold inventory shipped into a fulfillment center can incur its own storage costs over time, a mechanic well known in the Amazon FBA seller literature though not independently re-sourced in this pass (**[UNVERIFIED]**), on top of the risk that a listing is suspended or a category is closed to the seller entirely before the inventory sells at all.
Error fares carry close to no inventory risk in the same sense, because the "good" (a booked seat) is either honored or refunded in full rather than left to find a buyer — which is also part of why error-fare capture does not fit the same [arbitrage](./arbitrage.md) risk profile as the other variants, discussed in [the note on goods arbitrage and the capital gate](../../documents/articles/notes/2026/08/28/2026-08-28-note-on-goods-arbitrage-and-the-capital-gate.md).

Inventory risk is why "the spread looks profitable" is never a sufficient reason to commit capital to a goods-arbitrage trade on its own: the spread is a snapshot, and inventory risk is a statement about what happens between the purchase and whatever [sell-through rate](./sell-through-rate.md) is eventually realized, which is where a nominally profitable trade actually loses money in practice.
